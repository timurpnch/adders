import os
import sys
from pathlib import Path
from constants import BITWIDTH


opt_arg = sys.argv[1] if len(sys.argv) > 1 else None

if not opt_arg:
    dir_in = f'bitwidth_{BITWIDTH}_output'
else:
    dir_in = f'{opt_arg}_{BITWIDTH}_output'


liberty_path = '/home/timur/adders/asap7/asap7sc7p5t_SIMPLE_SEQ.lib'
sta_path = '/home/timur/adders/cudd-3.0.0/OpenSTA/app/sta'
top_name = 'adder'


for fname in sorted(Path(dir_in).glob('*.v')):

    if 'inter' in str(fname):
        continue

    out_fname = Path(str(fname).replace('netlist', 'sta')).with_suffix('.log')
    out_fname = Path(str(out_fname).replace('aig', 'sta')).with_suffix('.log')

    print(out_fname)

    sta_cmd = f'read_liberty {liberty_path}\nread_verilog {fname}\nlink_design {top_name}\nreport_checks -unconstrained > {out_fname}\nexit'

    with open('cmd.opensta', 'w') as fout:
        fout.write(sta_cmd)

    cmd = f'{sta_path} cmd.opensta'
    os.system(cmd)

Path('cmd.opensta').unlink()
