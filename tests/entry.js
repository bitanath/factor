import { execSync } from 'child_process';
import fs from 'fs';
import path from 'path';

const PROJECT_DIR = path.dirname(path.dirname(process.argv[1]));
const TESTS_DIR = path.join(PROJECT_DIR, 'tests');

console.log("=== AssemblyScript Matrix Computation Test Suite ===\n");

const testFiles = fs.readdirSync(TESTS_DIR)
  .filter(f => f.endsWith('.test.js'))
  .sort();

console.log(`Found ${testFiles.length} test files:\n`);
testFiles.forEach((file, i) => {
  console.log(`  ${i + 1}. ${file}`);
});
console.log();

for (const testFile of testFiles) {
  const testPath = path.join(TESTS_DIR, testFile);
  console.log(`\n${'='.repeat(60)}`);
  console.log(`Running: ${testFile}`);
  console.log('='.repeat(60));
  
  try {
    execSync(`node "${testPath}"`, { 
      cwd: PROJECT_DIR,
      stdio: 'inherit'
    });
  } catch (err) {
    console.error(`\nTest ${testFile} failed with exit code ${err.status}`);
    process.exit(err.status || 1);
  }
}

console.log(`\n${'='.repeat(60)}`);
console.log("All tests passed!");
console.log('='.repeat(60));
