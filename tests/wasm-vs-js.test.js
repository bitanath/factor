import { execSync } from 'child_process';
import fs from 'fs';
import path from 'path';

const PROJECT_DIR = path.dirname(path.dirname(process.argv[1]));

console.log("=== AssemblyScript Matrix Computation Test Suite ===\n");

async function runTests() {
  const WASM_PATH = `${PROJECT_DIR}/core/release.js`;
  const JS_PATH = `${PROJECT_DIR}/dist/factor.mjs`;
  
  console.log("Loading implementations...\n");
  

  const jsModule = await import(JS_PATH);
  const jsSvd = jsModule.svd;
  const jsFactor = jsModule.factor;
  
  
  const wasmModule = await import(`${WASM_PATH}`);
  const wasmSvd = wasmModule.svd;
  const wasmFactor = wasmModule.factor;
  
  console.log("JS implementation loaded:", typeof jsSvd === 'function');
  console.log("WASM implementation loaded:", typeof wasmSvd === 'function');
  
  // Test data for no good reason 
  const testData = [
    [1.0, 2.0, 3.0],
    [4.0, 5.0, 6.0],
    [7.0, 8.0, 9.0],
    [10.0, 11.0, 12.0]
  ];
  
  console.log("\n=== Test 1: SVD Computation ===");
  const jsSvdResult = jsSvd(testData);
  const wasmSvdResult = wasmSvd(testData);
  
  console.log("JS SVD S values:", jsSvdResult.S.slice(0, 3).map(n => n.toFixed(4)));
  console.log("WASM SVD S values:", wasmSvdResult.S.slice(0, 3).map(n => n.toFixed(4)));
  
  const maxS = Math.max(...jsSvdResult.S.map((s, i) => Math.abs(s - wasmSvdResult.S[i])));
  console.log("Max difference in S values:", maxS.toExponential(4));
  
  console.log("\n=== Test 2: Factor Computation ===");
  const jsFactorResult = jsFactor(testData);
  const wasmFactorResult = wasmFactor(testData);
  
  console.log("JS Factor loadings (first 2 cols):");
  console.log(jsFactorResult.loadings.map(row => row.slice(0, 2).map(n => n.toFixed(4))));
  
  console.log("WASM Factor loadings (first 2 cols):");
  console.log(wasmFactorResult.loadings.map(row => row.slice(0, 2).map(n => n.toFixed(4))));
  
  const maxLoading = Math.max(...jsFactorResult.loadings.flat().map((l, i) => Math.abs(l - wasmFactorResult.loadings.flat()[i])));
  console.log("Max difference in loadings:", maxLoading.toExponential(4));
  
  console.log("\n=== Test 3: Variance Explained ===");
  console.log("JS Variance:", jsFactorResult.variance.map(v => v.toFixed(4)));
  console.log("WASM Variance:", wasmFactorResult.variance.map(v => v.toFixed(4)));
  
  const maxVar = Math.max(...jsFactorResult.variance.map((v, i) => Math.abs(v - wasmFactorResult.variance[i])));
  console.log("Max difference in variance:", maxVar.toExponential(4));
  
  console.log("\n=== Test 4: Performance Comparison ===");
  
  const largeData = Array.from({length: 100}, () => 
    Array.from({length: 10}, () => Math.random() * 100)
  );
  
  
  jsSvd(largeData);
  wasmSvd(largeData);
  
  
  const jsStart = process.hrtime.bigint();
  for (let i = 0; i < 10; i++) jsSvd(largeData);
  const jsEnd = process.hrtime.bigint();
  const jsTime = Number(jsEnd - jsStart) / 1e6 / 10;
  
  
  const wasmStart = process.hrtime.bigint();
  for (let i = 0; i < 10; i++) wasmSvd(largeData);
  const wasmEnd = process.hrtime.bigint();
  const wasmTime = Number(wasmEnd - wasmStart) / 1e6 / 10;
  
  console.log(`JS SVD (100x10, avg of 10 runs): ${jsTime.toFixed(2)}ms`);
  console.log(`WASM SVD (100x10, avg of 10 runs): ${wasmTime.toFixed(2)}ms`);
  console.log(`WASM speedup: ${(jsTime / wasmTime).toFixed(2)}x`);
  
  console.log("\n=== Summary ===");
  console.log("SVD S values match:", maxS < 1e-10 ? "PASS" : "FAIL");
  console.log("Factor loadings match:", maxLoading < 1e-10 ? "PASS" : "FAIL");
  console.log("Variance match:", maxVar < 1e-10 ? "PASS" : "FAIL");
}

runTests().catch(err => {
  console.error("Test failed:", err);
  process.exit(1);
});
