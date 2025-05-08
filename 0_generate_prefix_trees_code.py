import itertools
import numpy as np
from copy import deepcopy
from pathlib import Path

from constants import BITWIDTH


def write_verilog(file_name, input_bit, cell_map):

    BLACK_CELL = '''module BLACK(gik, pik, gkj, pkj, gij, pij);
    input gik, pik, gkj, pkj;
    output gij, pij;
    assign pij = pik & pkj;
    assign gij = gik | (pik & gkj);
    endmodule
    '''


    GREY_CELL = '''module GREY(gik, pik, gkj, gij);
    input gik, pik, gkj;
    output gij;
    assign gij = gik | (pik & gkj);
    endmodule
    '''

    with open(file_name, "w") as verilog_file:
        verilog_file.write(f"module adder(a, b, s, cout);\n")
        verilog_file.write(f"input [{input_bit - 1}:0] a, b;\n")
        verilog_file.write(f"output [{input_bit - 1}:0] s;\n")
        verilog_file.write(f"output cout;\n")

        wires = set()
        for i in range(input_bit):
            wires.add(f"c{i}")

        for x in range(input_bit - 1, 0, -1):
            last_y = x
            for y in range(x - 1, -1, -1):
                if cell_map[x, y] == 1:
                    assert cell_map[last_y - 1, y] == 1
                    if y == 0:
                        wires.add(f"g{x}_{last_y}")
                        wires.add(f"p{x}_{last_y}")
                        wires.add(f"g{last_y - 1}_{y}")
                    else:
                        wires.add(f"g{x}_{last_y}")
                        wires.add(f"p{x}_{last_y}")
                        wires.add(f"g{last_y - 1}_{y}")
                        wires.add(f"p{last_y - 1}_{y}")
                        wires.add(f"g{x}_{y}")
                        wires.add(f"p{x}_{y}")
                    last_y = y

        for i in range(input_bit):
            wires.add(f"p{i}_{i}")
            wires.add(f"g{i}_{i}")
            wires.add(f"c{x}")
        assert 0 not in wires
        assert "0" not in wires
        verilog_file.write("wire ")

        for i, wire in enumerate(sorted(wires)):
            if i < len(wires) - 1:
                    verilog_file.write(f"{wire}, ")
            else:
                verilog_file.write(f"{wire};\n")
        verilog_file.write("\n")

        for i in range(input_bit):
            verilog_file.write(f'assign p{i}_{i} = a[{i}] ^ b[{i}];\n')
            verilog_file.write(f'assign g{i}_{i} = a[{i}] & b[{i}];\n')
        
        for i in range(1, input_bit):
            verilog_file.write(f'assign g{i}_0 = c{i};\n')

        verilog_file.write('\n')
        for x in range(input_bit - 1, 0, -1):
            last_y = x
            for y in range(x - 1, -1, -1):
                if cell_map[x, y] == 1:
                    assert cell_map[last_y - 1, y] == 1
                    if y == 0: # add grey module
                        verilog_file.write(f'GREY grey{x}(g{x}_{last_y}, p{x}_{last_y}, g{last_y - 1}_{y}, c{x});\n')
                    else:
                        verilog_file.write(f'BLACK black{x}_{y}(g{x}_{last_y}, p{x}_{last_y}, g{last_y - 1}_{y}, p{last_y - 1}_{y}, g{x}_{y}, p{x}_{y});\n')
                    last_y = y

        verilog_file.write('\n')
        verilog_file.write('assign s[0] = a[0] ^ b[0];\n')
        verilog_file.write('assign c0 = g0_0;\n')
        verilog_file.write(f'assign cout = c{input_bit - 1};\n')
        for i in range(1, input_bit):
            verilog_file.write(f'assign s[{i}] = p{i}_{i} ^ c{i - 1};\n')
        verilog_file.write("endmodule")
        verilog_file.write("\n\n")

        verilog_file.write(GREY_CELL)
        verilog_file.write("\n")
        verilog_file.write(BLACK_CELL)
        verilog_file.write("\n")


def get_min_map_from_cell_map(cell_map):

    input_bit = len(cell_map)

    min_map = deepcopy(cell_map)
    for i in range(input_bit):
        min_map[i, i] = 0
        min_map[i, 0] = 0
    return min_map


def legalize(cell_map, min_map):

    input_bit = len(cell_map)

    min_map = deepcopy(cell_map)
    for i in range(input_bit):
        min_map[i, 0] = 0
        min_map[i, i] = 0
    for x in range(input_bit-1, 0, -1):
        last_y = x
        for y in range(x-1, -1, -1):
            if cell_map[x, y] == 1:
                cell_map[last_y-1, y] = 1
                min_map[last_y-1, y] = 0
                last_y = y
    return cell_map, min_map


def update_level_map(cell_map, level_map):
    level_map.fill(0)
    level_map[0, 0] = 1

    input_bit = len(cell_map)

    for x in range(1, input_bit):
        level_map[x, x] = 1
        last_y = x
        for y in range(x-1, -1, -1):
            if cell_map[x, y] == 1:
                level_map[x, y] = max(level_map[x, last_y], level_map[last_y-1, y])+ 1
                last_y = y
    return level_map


n = BITWIDTH

out_dir = f'bitwidth_{n}'
Path(out_dir).mkdir(parents=True, exist_ok=True)
Path(f'bitwidth_{n}_output').mkdir(parents=True, exist_ok=True)

# генерируем индексы, в которых может стоять 0 или 1    
indices = []
for i in range(n):
    for j in range(1, i):
        indices.append((i, j))

# генерируем все возможные матрицы
A = np.eye(n)
A[:, 0] = 1
A
matrices = []
for L in range(len(indices) + 1):
    for subset in itertools.combinations(indices, L):
        M = deepcopy(A)
        for i, j in subset:
            M[i, j] = 1
        matrices.append(M)

print(f'bitwidth {n}, number of matrices {len(matrices)}')

# проверяем эти матрицы
q = []
res_matrices = []
for A in matrices:
    min_map = get_min_map_from_cell_map(A)
    cell_map, min_map = legalize(A, min_map)

    res_matrices.append(cell_map)
    
# уникальные матрицы
res_matrices = np.array(res_matrices)
res_matrices = np.unique(res_matrices, axis=0)
print(res_matrices.shape[0])

# записываем верилог код, матрицы и параметры
for idx, el in enumerate(res_matrices):
    fname = f'{out_dir}/prefix_{idx}.v'
    write_verilog(fname, n, el)

    # рассчитываем глубину и размер
    level_map = np.zeros_like(el)
    level_map = update_level_map(el, level_map)
    level = level_map.max()
    size = el.sum() - n

    # записываем глубину, размер и саму матрицу
    fname_params = f'{out_dir}/prefix_{idx}.log'
    with open(fname_params, 'w') as fout:
        fout.write(f'{int(level)} {int(size)}\n')
        for i in range(n):
            for j in range(n):
                fout.write(f'{int(el[i, j])}')
            fout.write('\n')
        fout.write('\n')
