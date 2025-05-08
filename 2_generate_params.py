import numpy as np
import pandas as pd


variants_number = 2000
abc_scripts_number = 8

fname = 'set_of_params.txt'

def generate_choice(size, max_n):
    return np.random.randint(0, max_n, size)

res = []

# hierarchy or synth
p = generate_choice(variants_number, 2)
res.append(p)

# # flatten
# p = generate_choice(variants_number, 2)
# res.append(p)

# abc_script
p = generate_choice(variants_number, abc_scripts_number)
res.append(p)

res = np.vstack(res).T
res = np.unique(res, axis=0)

print(res.shape)

df = pd.DataFrame(data=res)
df.to_csv(fname, header=False, index=False, sep=' ')
