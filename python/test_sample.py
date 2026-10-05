import numpy as np
from factor_analyzer import FactorAnalyzer
import subprocess
import json
import os

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_DIR = os.path.dirname(SCRIPT_DIR)

os.chdir(SCRIPT_DIR)

np.random.seed(42)
data = np.random.randn(100, 5).tolist()
data_np = np.array(data)

print("=== SVD U, S, V Comparison ===\n")

X_std = (data_np - data_np.mean(axis=0)) / data_np.std(axis=0, ddof=0)
U_np, S_np, Vt_np = np.linalg.svd(X_std, full_matrices=False)
V_np = Vt_np.T

result = subprocess.run(
    ["node", "-e", f"""
const asc = require('{PROJECT_DIR}/dist/factor.cjs');
const data = {json.dumps(data)};
const {{ svd }} = asc;

const m = data.length;
const n = data[0].length;
const means = [];
const stds = [];
for (let j = 0; j < n; j++) {{
  let sum = 0;
  for (let i = 0; i < m; i++) sum += data[i][j];
  means.push(sum / m);
}}
for (let j = 0; j < n; j++) {{
  let sumSq = 0;
  for (let i = 0; i < m; i++) {{
    const diff = data[i][j] - means[j];
    sumSq += diff * diff;
  }}
  stds.push(Math.sqrt(sumSq / m) || 1);
}}
const X = data.map(row => row.map((v, j) => (v - means[j]) / stds[j]));
const result = svd(X);
console.log(JSON.stringify({{U: result.U, S: result.S, V: result.V}}));
"""],
    capture_output=True,
    text=True
)

as_svd = json.loads(result.stdout)
as_U = np.array(as_svd["U"])
as_S = np.array(as_svd["S"])
as_V = np.array(as_svd["V"])

print("NumPy U (first 3 rows, rounded to 4 decimals):")
print(np.round(U_np[:3], 4))
print("\nAssemblyScript U (first 3 rows, rounded to 4 decimals):")
print(np.round(as_U[:3], 4))
print("\nNumPy U max diff:", np.max(np.abs(U_np - as_U)))

print("\n" + "="*50)
print("\nNumPy S:")
print(np.round(S_np, 4))
print("\nAssemblyScript S:")
print(np.round(as_S, 4))
print("\nNumPy S max diff:", np.max(np.abs(S_np - as_S)))

print("\n" + "="*50)
print("\nNumPy V (rounded to 4 decimals):")
print(np.round(V_np, 4))
print("\nAssemblyScript V (rounded to 4 decimals):")
print(np.round(as_V, 4))
print("\nNumPy V max diff:", np.max(np.abs(V_np - as_V)))

print("\n" + "="*50)
print("\n=== Factor Loadings Comparison ===\n")

fa = FactorAnalyzer(n_factors=5, rotation=None, method="principal", svd_method="lapack")
fa.fit(data_np)

result = subprocess.run(
    ["node", "-e", f"""
const asc = require('{PROJECT_DIR}/dist/factor.cjs');
const data = {json.dumps(data)};
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

print("NumPy/FactorAnalyzer Loadings:")
print(np.round(fa.loadings_, 4))
print("\nAssemblyScript Loadings:")
print(np.round(as_loadings, 4))
print("\nLoadings match:", np.allclose(fa.loadings_, as_loadings, atol=1e-10))

print("\n" + "="*50)
print("\n=== Factor Scores Comparison ===\n")

np_scores = X_std @ V_np
print(np.round(np_scores[:5], 4))
print("\nAssemblyScript Scores (first 5 rows):")
print(np.round(as_scores[:5], 4))
print("\nNote: Scores may have sign differences due to sign alignment in loadings")

print("\n" + "="*50)
print("\n=== Variance Explained Comparison ===\n")

np_variance = np.sum(fa.loadings_ ** 2, axis=0) / 5
print("NumPy/FactorAnalyzer Variance:")
print(np.round(np_variance, 4))
print("\nAssemblyScript Variance:")
print(np.round(as_variance, 4))
print("\nVariance match:", np.allclose(np_variance, as_variance, atol=1e-10))
