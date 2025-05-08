import re
import json
from fast_pareto import is_pareto_front
from pathlib import Path
import numpy as np
import pandas as pd



def get_abc_estimate(fname):
    area = None
    delay = None
    with open(fname) as fin:
        for line in fin:
            if 'ABC: WireLoad' in line:
                numbers = re.findall(r"[-+]?[.]?[\d]+(?:,\d\d\d)*[\.]?\d*(?:[eE][-+]?\d+)?", line)
                area = float(numbers[-4])
                delay = float(numbers[-2])

    return area, delay


def get_sta_delay(fname):
    with open(fname) as fin:
        for line in fin:
            if 'data arrival time' in line:
                numbers = re.findall(r"[-+]?[.]?[\d]+(?:,\d\d\d)*[\.]?\d*(?:[eE][-+]?\d+)?", line)
                delay = float(numbers[0])
    return delay


def get_yosys_area(fname):
    with open(fname) as f:
        d = json.load(f)
        area = float(d['design']['area'])
    return area


def get_params(fname):
    with open(fname) as f:
        p = f.readline()
        p = p.strip().split(' ')
        return p


def get_pareto_points(dataframe):
    points = dataframe[['area', 'delay']]
    is_pareto = is_pareto_front(points)
    pareto_front = dataframe[is_pareto]
    return pareto_front


def get_points(dir_name):
    def get_type(x):
        type = str(Path(x).stem)
        return type

    areas = []
    features = []
    delays = []
    names = []
    blifs = []

    for k in range(10000000000):

        abc_file = f'{dir_name}/abc_{k}.log'
        sta_file = f'{dir_name}/sta_{k}.log'
        yosys_file = f'{dir_name}/yosys_{k}.json'
        params_file = f'{dir_name}/params_{k}.log'
        blif_file = f'{dir_name}/blif_{k}.log'

        try:
            abc_area, abc_delay = get_abc_estimate(abc_file)
            yosys_area = get_yosys_area(yosys_file)
            sta_delay = get_sta_delay(sta_file)
            params = get_params(params_file)
            areas.append(yosys_area)
            features.append(params)
            delays.append(sta_delay)
            names.append(params_file)
            blifs.append(blif_file)
        except:
            break

    features = np.array(features)

    df = pd.DataFrame(features, columns=['name', 'synth', 'abc_script'])
    df = df.astype({'synth': 'int32', 'abc_script': 'int32'})
    df['area'] = areas
    df['name'] = names
    df['delay'] = delays
    df['type'] = df.name.map(get_type)
    df['blif'] = blifs

    return df
