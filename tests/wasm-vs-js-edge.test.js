import path from 'path';

const PROJECT_DIR = path.dirname(path.dirname(process.argv[1]));

console.log("=== Edge Case Tests: WASM vs JS ===\n");

async function runTests() {
  const WASM_PATH = `${PROJECT_DIR}/core/release.js`;
  const JS_PATH = `${PROJECT_DIR}/dist/factor.mjs`;
  
  
  const jsModule = await import(JS_PATH);
  const jsSvd = jsModule.svd;
  const jsFactor = jsModule.factor;
  
  const wasmModule = await import(`${WASM_PATH}`);
  const wasmSvd = wasmModule.svd;
  const wasmFactor = wasmModule.factor;
  
  let passed = 0;
  let failed = 0;
  
  function test(name, jsVal, wasmVal, tolerance = 1e-10) {
    let maxDiff = 0;
    
    if (Array.isArray(jsVal) && Array.isArray(wasmVal)) {
      const jsFlat = jsVal.flat();
      const wasmFlat = wasmVal.flat();
      for (let i = 0; i < jsFlat.length; i++) {
        const diff = Math.abs(jsFlat[i] - wasmFlat[i]);
        if (diff > maxDiff) maxDiff = diff;
      }
    } else if (typeof jsVal === 'number' && typeof wasmVal === 'number') {
      maxDiff = Math.abs(jsVal - wasmVal);
    }
    
    const result = maxDiff < tolerance;
    if (result) {
      console.log(`✓ ${name}: PASS (max diff: ${maxDiff.toExponential(4)})`);
      passed++;
    } else {
      console.log(`✗ ${name}: FAIL (max diff: ${maxDiff.toExponential(4)})`);
      failed++;
    }
  }
  
  console.log("--- Small Data (3x3) ---");
  const smallData = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
  test("Small SVD S", jsSvd(smallData).S, wasmSvd(smallData).S);
  test("Small factor loadings", jsFactor(smallData).loadings, wasmFactor(smallData).loadings);
  test("Small variance", jsFactor(smallData).variance, wasmFactor(smallData).variance);
  
  console.log("\n--- Single Row (1x5) ---");
  const singleRow = [[1, 2, 3, 4, 5]];
  try {
    jsSvd(singleRow);
    console.log("✗ Single row: FAIL (should have thrown)");
    failed++;
  } catch (e) {
    console.log("✓ Single row: PASS (correctly throws error)");
    passed++;
  }
  
  console.log("\n--- Wide Matrix (10x3) ---");
  const wideData = Array.from({length: 10}, () => Array.from({length: 3}, () => Math.random()));
  test("Wide SVD S", jsSvd(wideData).S, wasmSvd(wideData).S);
  test("Wide factor", jsFactor(wideData).loadings, wasmFactor(wideData).loadings);
  
  console.log("\n--- Tall Matrix (50x10) ---");
  const tallData = Array.from({length: 50}, () => Array.from({length: 10}, () => Math.random() * 100));
  test("Tall SVD S", jsSvd(tallData).S, wasmSvd(tallData).S);
  test("Tall factor", jsFactor(tallData).loadings, wasmFactor(tallData).loadings);
  
  console.log("\n--- Uniform Data (all same values) ---");
  const uniformData = Array.from({length: 5}, () => Array.from({length: 5}, () => 1.0));
  const jsUniform = jsSvd(uniformData);
  const wasmUniform = wasmSvd(uniformData);
  test("Uniform SVD S", jsUniform.S, wasmUniform.S);
  
  console.log("\n--- Zeros ---");
  const zeros = [[0, 0, 0], [0, 0, 0]];
  try {
    jsSvd(zeros);
    console.log("✗ Zeros: FAIL (should have thrown)");
    failed++;
  } catch (e) {
    console.log("✓ Zeros: PASS (correctly throws error)");
    passed++;
  }
  
  console.log("\n--- Large Random Data (1000x20) ---");
  const largeData = Array.from({length: 1000}, () => Array.from({length: 20}, () => Math.random() * 100));
  
  const jsStart = process.hrtime.bigint();
  const jsLargeResult = jsSvd(largeData);
  const jsEnd = process.hrtime.bigint();
  const jsTime = Number(jsEnd - jsStart) / 1e6;
  
  const wasmStart = process.hrtime.bigint();
  const wasmLargeResult = wasmSvd(largeData);
  const wasmEnd = process.hrtime.bigint();
  const wasmTime = Number(wasmEnd - wasmStart) / 1e6;
  
  test("Large SVD S", jsLargeResult.S, wasmLargeResult.S);
  
  console.log(`\nPerformance (1000x20 SVD):`);
  console.log(`  JS: ${jsTime.toFixed(2)}ms`);
  console.log(`  WASM: ${wasmTime.toFixed(2)}ms`);
  
  console.log("\n=== Summary ===");
  console.log(`Passed: ${passed}`);
  console.log(`Failed: ${failed}`);
  console.log(`Total: ${passed + failed}`);
  
  if (failed > 0) {
    process.exit(1);
  }
}

runTests().catch(err => {
  console.error("Test failed:", err);
  process.exit(1);
});
