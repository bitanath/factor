import fs from 'fs';
import path from 'path';

const PROJECT_DIR = path.dirname(path.dirname(process.argv[1]));

console.log("=== WASM vs JS Comparison with data.csv ===\n");

async function runTests() {
  const WASM_PATH = `${PROJECT_DIR}/core/release.js`;
  const JS_PATH = `${PROJECT_DIR}/dist/factor.mjs`;
  
  // Load JS implementation
  const jsModule = await import(JS_PATH);
  const jsSvd = jsModule.svd;
  const jsFactor = jsModule.factor;
  
  // Load WASM implementation
  const wasmModule = await import(`${WASM_PATH}`);
  const wasmSvd = wasmModule.svd;
  const wasmFactor = wasmModule.factor;
  
  // Load data.csv
  const csvPath = `${PROJECT_DIR}/tests/data.csv`;
  const csvContent = fs.readFileSync(csvPath, 'utf8');
  const lines = csvContent.trim().split('\n');
  
  // Parse CSV (use all columns including header)
  const data = lines.slice(1).map(row => {
    const cols = row.split(',');
    return cols.map(Number);
  });
  
  console.log(`Data shape: ${data.length} rows x ${data[0].length} columns\n`);
  
  console.log("=== Test 1: Factor Analysis (n_factors=9) ===");
  
  const jsResult = jsFactor(data);
  const wasmResult = wasmFactor(data);
  
  console.log("JS Factor loadings (first 3 rows, first 3 cols):");
  console.log(jsResult.loadings.slice(0, 3).map(row => row.slice(0, 3).map(n => n.toFixed(4))));
  
  console.log("\nWASM Factor loadings (first 3 rows, first 3 cols):");
  console.log(wasmResult.loadings.slice(0, 3).map(row => row.slice(0, 3).map(n => n.toFixed(4))));
  
  // Compare all loadings
  let maxLoadingDiff = 0;
  for (let i = 0; i < jsResult.loadings.length; i++) {
    for (let j = 0; j < jsResult.loadings[i].length; j++) {
      const diff = Math.abs(jsResult.loadings[i][j] - wasmResult.loadings[i][j]);
      if (diff > maxLoadingDiff) maxLoadingDiff = diff;
    }
  }
  
  console.log("\n=== Test 2: Variance Explained ===");
  console.log("JS Variance:", jsResult.variance.map(v => v.toFixed(4)));
  console.log("WASM Variance:", wasmResult.variance.map(v => v.toFixed(4)));
  
  let maxVarDiff = 0;
  for (let i = 0; i < jsResult.variance.length; i++) {
    const diff = Math.abs(jsResult.variance[i] - wasmResult.variance[i]);
    if (diff > maxVarDiff) maxVarDiff = diff;
  }
  
  console.log("\n=== Test 3: SVD Singular Values ===");
  
  // Standardize data manually for SVD comparison
  const m = data.length;
  const n = data[0].length;
  
  const means = [];
  const stds = [];
  
  for (let j = 0; j < n; j++) {
    let sum = 0;
    for (let i = 0; i < m; i++) sum += data[i][j];
    means.push(sum / m);
  }
  
  for (let j = 0; j < n; j++) {
    let sumSq = 0;
    for (let i = 0; i < m; i++) {
      const diff = data[i][j] - means[j];
      sumSq += diff * diff;
    }
    stds.push(Math.sqrt(sumSq / m) || 1);
  }
  
  const standardized = data.map(row => row.map((v, j) => (v - means[j]) / stds[j]));
  
  const jsSvdResult = jsSvd(standardized);
  const wasmSvdResult = wasmSvd(standardized);
  
  console.log("JS SVD S (first 5):", jsSvdResult.S.slice(0, 5).map(s => s.toFixed(4)));
  console.log("WASM SVD S (first 5):", wasmSvdResult.S.slice(0, 5).map(s => s.toFixed(4)));
  
  let maxSDiff = 0;
  for (let i = 0; i < jsSvdResult.S.length; i++) {
    const diff = Math.abs(jsSvdResult.S[i] - wasmSvdResult.S[i]);
    if (diff > maxSDiff) maxSDiff = diff;
  }
  
  console.log("\n=== Test 4: Factor Scores (first 3 rows) ===");
  console.log("JS Scores:");
  console.log(jsResult.scores.slice(0, 3).map(row => row.map(n => n.toFixed(4))));
  
  console.log("\nWASM Scores:");
  console.log(wasmResult.scores.slice(0, 3).map(row => row.map(n => n.toFixed(4))));
  
  let maxScoreDiff = 0;
  for (let i = 0; i < jsResult.scores.length; i++) {
    for (let j = 0; j < jsResult.scores[i].length; j++) {
      const diff = Math.abs(jsResult.scores[i][j] - wasmResult.scores[i][j]);
      if (diff > maxScoreDiff) maxScoreDiff = diff;
    }
  }
  
  console.log("\n=== Test 5: Performance Comparison ===");
  
  // Warm up
  jsFactor(data);
  wasmFactor(data);
  
  const jsStart = process.hrtime.bigint();
  for (let i = 0; i < 10; i++) jsFactor(data);
  const jsEnd = process.hrtime.bigint();
  const jsTime = Number(jsEnd - jsStart) / 1e6 / 10;
  
  const wasmStart = process.hrtime.bigint();
  for (let i = 0; i < 10; i++) wasmFactor(data);
  const wasmEnd = process.hrtime.bigint();
  const wasmTime = Number(wasmEnd - wasmStart) / 1e6 / 10;
  
  console.log(`JS Factor (${data.length}x${data[0].length}, avg of 10 runs): ${jsTime.toFixed(2)}ms`);
  console.log(`WASM Factor (${data.length}x${data[0].length}, avg of 10 runs): ${wasmTime.toFixed(2)}ms`);
  console.log(`WASM speedup: ${(jsTime / wasmTime).toFixed(2)}x`);
  
  console.log("\n=== Summary ===");
  console.log("Factor loadings match:", maxLoadingDiff < 1e-10 ? "PASS" : "FAIL", `(max diff: ${maxLoadingDiff.toExponential(4)})`);
  console.log("Variance match:", maxVarDiff < 1e-10 ? "PASS" : "FAIL", `(max diff: ${maxVarDiff.toExponential(4)})`);
  console.log("SVD S values match:", maxSDiff < 1e-10 ? "PASS" : "FAIL", `(max diff: ${maxSDiff.toExponential(4)})`);
  console.log("Factor scores match:", maxScoreDiff < 1e-10 ? "PASS" : "FAIL", `(max diff: ${maxScoreDiff.toExponential(4)})`);
}

runTests().catch(err => {
  console.error("Test failed:", err);
  process.exit(1);
});
