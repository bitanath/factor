import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const PROJECT_DIR = path.dirname(path.dirname(fileURLToPath(import.meta.url)));

const js = await import(path.join(PROJECT_DIR, "dist/factor.mjs"));
const wasm = await import(path.join(PROJECT_DIR, "core/release.js"));

/** Deterministic PRNG so the benchmark is reproducible. */
function mulberry32(seed) {
  return function () {
    seed |= 0;
    seed = (seed + 0x6d2b79f5) | 0;
    let t = Math.imul(seed ^ (seed >>> 15), 1 | seed);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

function randomMatrix(rand, rows, cols) {
  return Array.from({ length: rows }, () =>
    Array.from({ length: cols }, () => rand() * 100 - 50)
  );
}

function median(values) {
  const sorted = [...values].sort((a, b) => a - b);
  return sorted[Math.floor(sorted.length / 2)];
}

function bench(fn, { runs = 9, warmup = 3 } = {}) {
  for (let i = 0; i < warmup; i++) fn();
  const samples = [];
  for (let i = 0; i < runs; i++) {
    const t0 = process.hrtime.bigint();
    fn();
    samples.push(Number(process.hrtime.bigint() - t0) / 1e6);
  }
  return median(samples);
}

function fmt(ms) {
  return ms.toFixed(2);
}

function row(label, data, jsFn, wasmFn) {
  const jsMs = bench(() => jsFn());
  const wasmMs = bench(() => wasmFn());
  const ratio = wasmMs / jsMs;
  return {
    label,
    size: data,
    jsMs,
    wasmMs,
    ratio,
    text: `| ${label} | ${data} | ${fmt(jsMs)}ms | ${fmt(wasmMs)}ms | ${ratio.toFixed(2)}x |`,
  };
}

const rand = mulberry32(42);
const runtime = process.versions.bun ? `Bun ${process.versions.bun}` : `Node ${process.versions.node}`;

console.log(`Runtime: ${runtime}`);
console.log("Variant: JS (portable) vs WASM (release, runtime=minimal)\n");

console.log("### SVD\n");
console.log("| Test | Data Size | JS Time | WASM Time | WASM/JS |");
console.log("|------|-----------|---------|-----------|---------|");
for (const [rows, cols] of [
  [100, 10],
  [1000, 20],
  [1000, 100],
]) {
  const X = randomMatrix(rand, rows, cols);
  console.log(row("SVD", `${rows}x${cols}`, () => js.svd(X), () => wasm.svd(X)).text);
}

const csv = fs
  .readFileSync(path.join(PROJECT_DIR, "tests/data.csv"), "utf8")
  .trim()
  .split("\n");
const data = csv.slice(1).map((line) => line.split(",").map(Number));

console.log("\n### Factor\n");
console.log("| Test | Data Size | JS Time | WASM Time | WASM/JS |");
console.log("|------|-----------|---------|-----------|---------|");
console.log(
  row(
    "Factor (real data)",
    `${data.length}x${data[0].length}`,
    () => js.factor(data),
    () => wasm.factor(data)
  ).text
);
{
  const X = randomMatrix(rand, 1000, 40);
  console.log(
    row("Factor (random)", "1000x40", () => js.factor(X), () => wasm.factor(X)).text
  );
}

// Correctness cross-check
const jr = js.factor(data);
const wr = wasm.factor(data);
let maxDiff = 0;
for (let i = 0; i < jr.loadings.length; i++) {
  for (let j = 0; j < jr.loadings[i].length; j++) {
    maxDiff = Math.max(maxDiff, Math.abs(jr.loadings[i][j] - wr.loadings[i][j]));
  }
}
for (let i = 0; i < jr.variance.length; i++) {
  maxDiff = Math.max(maxDiff, Math.abs(jr.variance[i] - wr.variance[i]));
}
console.log(`\nJS/WASM max difference on real data: ${maxDiff.toExponential(2)}`);
