from openai import OpenAI
import re
from typing import List, Tuple, Optional

from constants import BITWIDTH, OPENAI_API_KEY


class SPCRNode:
    def __init__(self, index: int, connected_nodes: Tuple[Optional[int], Optional[int]], left_bound: int,
                 right_bound: int):
        self.index = index
        self.connected_nodes = connected_nodes
        self.left_bound = left_bound
        self.right_bound = right_bound

    def is_input_node(self) -> bool:
        return self.connected_nodes == (None, None)

    def __repr__(self):
        return (f"SPCRNode(index={self.index}, connected_nodes={self.connected_nodes}, "
                f"range=[{self.left_bound}:{self.right_bound}])")


def is_valid_prefix_node(left_node: SPCRNode, right_node: SPCRNode, new_node: SPCRNode) -> Tuple[bool, str]:
    if right_node.left_bound != left_node.right_bound + 1:
        return False, (
            f"Invalid adjacency: right_node.left_bound ({right_node.left_bound}) != "
            f"left_node.right_bound + 1 ({left_node.right_bound + 1})"
        )
    if new_node.left_bound != left_node.left_bound or new_node.right_bound != right_node.right_bound:
        return False, (
            f"Range mismatch: new_node range [{new_node.left_bound}:{new_node.right_bound}] "
            f"!= combined range [{left_node.left_bound}:{right_node.right_bound}]"
        )
    return True, ""


def validate_spcr(nodes: List[SPCRNode]) -> bool:
    for node in nodes:
        if not node.is_input_node():
            left_idx, right_idx = node.connected_nodes
            left_node = next((n for n in nodes if n.index == left_idx), None)
            right_node = next((n for n in nodes if n.index == right_idx), None)
            if left_node is None or right_node is None:
                return False
            valid, _ = is_valid_prefix_node(left_node, right_node, node)
            if not valid:
                return False
    n = max(node.right_bound for node in nodes) + 1
    covered_right_bounds = set()
    for node in nodes:
        if node.left_bound == 0:
            covered_right_bounds.add(node.right_bound)
    expected = set(range(n))
    return covered_right_bounds == expected


def find_lacking_ranges(nodes: List[SPCRNode], bit_width: int) -> List[Tuple[int, int]]:
    covered = set()
    for node in nodes:
        if node.left_bound == 0:
            covered.add(node.right_bound)
    lacking = []
    for i in range(bit_width):
        if i not in covered:
            lacking.append((0, i))
    return lacking


def format_spcr_prompt_with_feedback(partial_spcr: List[SPCRNode], lacking_ranges: List[Tuple[int, int]],
                                     bit_width: int,
                                     max_index: int, feedback: str) -> str:
    prompt = f"Bit-width: {bit_width}\n\n"
    prompt += "Current partial SPCR nodes:\n"
    for node in partial_spcr:
        prompt += (
            f"{node.index}: connectedNodes={node.connected_nodes}, range=[{node.left_bound}:{node.right_bound}], "
            f"left_bound={node.left_bound}, right_bound={node.right_bound}.\n")
    prompt += "\nLacking bit ranges that need to be covered:\n"
    for lb, rb in lacking_ranges:
        prompt += f"[{lb}:{rb}]\n"
    prompt += (
        f"\nAdditional instructions:\n"
        f"- Assign new node indices starting from {max_index + 1} and increment by 1.\n"
        "- Each new prefix node combines exactly two predecessor nodes whose bit ranges are contiguous.\n"
        "- The left bound of the right predecessor must be exactly one more than the right bound of the left predecessor (k = j + 1).\n"
        "- The new node's bit range must exactly cover the combined ranges of its two predecessors.\n"
        "- Do NOT generate nodes that already exist or duplicate existing nodes.\n"
        f"- Input nodes have indices from 0 to {bit_width - 1} and connectedNodes=(None, None). Do NOT generate input nodes.\n"
        "- Output only the minimal set of new prefix nodes needed to cover all lacking bit ranges.\n"
        "- Generate nodes strictly in ascending order of their indices.\n"
        "- Each new node may only reference predecessor nodes that already exist in the partial circuit or have been listed earlier in this response.\n"
        "- For each new node, provide only this exact format (one node per line):\n"
        "index: connectedNodes=(left_node_index, right_node_index), range=[left_bound:right_bound], left_bound=left_bound, right_bound=right_bound.\n"
        "Example of a valid prefix node:\n"
        "4: connectedNodes=(0, 1), range=[0:1], left_bound=0, right_bound=1.\n"
        "\nInvalid examples (do NOT generate):\n"
        "1: connectedNodes=(0, 2), range=[0:2], left_bound=0, right_bound=2.  # right_node.left_bound != left_node.right_bound + 1\n"
        "3: connectedNodes=(0, 3), range=[0:3], left_bound=0, right_bound=3.  # same reason\n"
        "5: connectedNodes=(1, 2), range=[0:3], left_bound=0, right_bound=3.  # range does not match combined predecessor ranges\n"
        "Please strictly follow these rules."
    )
    if feedback:
        prompt += f"\n\nNote for you:\n{feedback}\n"
    prompt += "\nPlease provide the list of new prefix nodes accordingly."
    return prompt


def parse_spcr_nodes_from_text(text: str) -> List[SPCRNode]:
    nodes = []
    pattern = re.compile(
        r"(\d+):\s*connectedNodes=\((None|\d+),\s*(None|\d+)\),\s*range=\[(\d+):(\d+)\],\s*left_bound=(\d+),\s*right_bound=(\d+)"
    )
    for line in text.strip().splitlines():
        match = pattern.match(line.strip())
        if match:
            idx = int(match.group(1))
            left_node = None if match.group(2) == "None" else int(match.group(2))
            right_node = None if match.group(3) == "None" else int(match.group(3))
            left_bound = int(match.group(4))
            right_bound = int(match.group(5))
            lb = int(match.group(6))
            rb = int(match.group(7))
            if left_bound == lb and right_bound == rb:
                nodes.append(SPCRNode(idx, (left_node, right_node), left_bound, right_bound))
    return nodes


def iterative_spcr_synthesis_with_dse(bit_width: int, openai_api_key: str, max_iterations=10) -> List[SPCRNode]:
    client = OpenAI(
        api_key=openai_api_key,
        base_url="https://api.proxyapi.ru/openai/v1",
    )

    partial_spcr = [SPCRNode(i, (None, None), i, i) for i in range(bit_width)]
    max_index = max(node.index for node in partial_spcr)

    for iteration in range(max_iterations):
        print(f"\nIteration {iteration + 1}")
        if validate_spcr(partial_spcr):
            print("SPCR is valid, synthesis completed.")
            return partial_spcr

        lacking_ranges = find_lacking_ranges(partial_spcr, bit_width)
        print(f"Lacking bit ranges: {lacking_ranges}")

        prompt = format_spcr_prompt_with_feedback(partial_spcr, lacking_ranges, bit_width, max_index, feedback="")
        print("Sending request to LLM...")

        response = client.chat.completions.create(
            model="gpt-4.1-mini",
            messages=[
                {
                    "role": "user",
                    "content": prompt
                }
            ],
            max_tokens=700,
            temperature=0.0
        )
        output_text = response.choices[0].message.content
        print("LLM response:")
        print(output_text)

        new_nodes = parse_spcr_nodes_from_text(output_text)
        print(f"New nodes received: {len(new_nodes)}")

        if not new_nodes:
            print("No valid new nodes generated, stopping synthesis.")
            break

        # Append only unique new nodes with index > max_index
        for node in new_nodes:
            if node.index > max_index and all(n.index != node.index for n in partial_spcr):
                partial_spcr.append(node)
                max_index = max(max_index, node.index)

    print("Max iterations reached or no new nodes available.")
    return partial_spcr


def spcr_to_verilog(spcr_nodes: List[SPCRNode], bit_width: int, module_name="adder") -> str:
    lines = []
    lines.append(f"module {module_name} #(parameter WIDTH = {bit_width}) (")
    lines.append(f"    input  [WIDTH-1:0] a,")
    lines.append(f"    input  [WIDTH-1:0] b,")
    lines.append(f"    output [WIDTH-1:0] s,")
    lines.append(f"    output cout")
    lines.append(");")
    lines.append("")

    # Declare p and g for input bits
    for i in range(bit_width):
        lines.append(f"wire p_{i} = a[{i}] ^ b[{i}];")
        lines.append(f"wire g_{i} = a[{i}] & b[{i}];")
    lines.append("")

    # Declare p_node and g_node for internal nodes
    internal_nodes = [node for node in spcr_nodes if not node.is_input_node()]
    for node in internal_nodes:
        lines.append(f"wire p_{node.index};")
        lines.append(f"wire g_{node.index};")
    lines.append("")

    # Define p_node and g_node for internal nodes
    for node in internal_nodes:
        left_idx, right_idx = node.connected_nodes
        lines.append(f"assign p_{node.index} = p_{left_idx} & p_{right_idx};")
        lines.append(f"assign g_{node.index} = g_{right_idx} | (p_{right_idx} & g_{left_idx});")
    lines.append("")

    lines.append("wire c_0 = 0;")
    for i in range(1, bit_width + 1):
        covering_nodes = [node for node in spcr_nodes if node.left_bound == 0 and node.right_bound == i - 1]
        if not covering_nodes:
            lines.append(f"wire c_{i} = g_{i - 1} | (p_{i - 1} & c_{i - 1});")
        else:
            node = covering_nodes[0]
            lines.append(f"wire c_{i} = g_{node.index} | (p_{node.index} & c_0);")
    lines.append("")

    for i in range(bit_width):
        lines.append(f"assign s[{i}] = p_{i} ^ c_{i};")
    lines.append(f"assign cout = c_{bit_width};")
    lines.append("")
    lines.append("endmodule")
    return "\n".join(lines)


if __name__ == "__main__":
    bit_width = BITWIDTH
    openai_api_key = OPENAI_API_KEY
    verilog_filename = f"llm_bitwidth_{bit_width}/llm_adder_{bit_width}.v"
    spcr_nodes = iterative_spcr_synthesis_with_dse(bit_width, openai_api_key)
    verilog_code = spcr_to_verilog(spcr_nodes, bit_width)

    with open(verilog_filename, "w") as f:
        f.write(verilog_code)
