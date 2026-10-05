import numpy as np
import pandas as pd
from factor_analyzer import FactorAnalyzer
import subprocess
import json
import os

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)

os.chdir(SCRIPT_DIR)

print("=== Testing with data.csv ===\n")

df = pd.read_csv("data.csv")
print(f"Data shape: {df.shape}")
print(f"Number of columns: {df.shape[1]}\n")

data = df.values.tolist()
data_np = df.values

n_factors = min(9, df.shape[1] - 1)
print(f"Using n_factors={n_factors}\n")

print("=== NumPy/FactorAnalyzer Results ===")
fa = FactorAnalyzer(n_factors=n_factors, rotation=None, method="principal", svd_method="lapack")
fa.fit(data_np)
np_loadings = fa.loadings_
print("Factor loadings (rounded to 4 decimals):")
print(np.round(np_loadings, 4))

print("\n=== AssemblyScript Results ===")
data_json = json.dumps(data)
result = subprocess.run(
    ["node", "-e", f"""
const asc = require('{PROJECT_DIR}/dist/factor.cjs');
const data = {data_json};
const {{ factor }} = asc;
const result = factor(data);
console.log(JSON.stringify(result));
"""],
    capture_output=True,
    text=True
)

factor_result = json.loads(result.stdout)
as_loadings = np.array(factor_result["loadings"])
as_scores = np.array(factor_result["scores"])
as_variance = np.array(factor_result["variance"])

print("Factor loadings (rounded to 4 decimals):")
print(np.round(as_loadings, 4))

print("\n=== Comparison ===")
print("Max absolute difference:", np.max(np.abs(np_loadings - as_loadings)))
print("Loadings match:", np.allclose(np_loadings, as_loadings, atol=1e-10))

print("\n=== Variance Explained ===")
np_variance = np.sum(np_loadings ** 2, axis=0) / np_loadings.shape[0]
print("NumPy/FactorAnalyzer:")
print(f"  Variance: {np.round(np_variance, 4)}")
print("\nAssemblyScript:")
print(f"  Variance: {np.round(as_variance, 4)}")
print("\nVariance match:", np.allclose(np_variance, as_variance, atol=1e-10))
