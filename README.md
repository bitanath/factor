## factor-js

Factor analysis (principal factor analysis) and SVD in pure JavaScript and WebAssembly.
Written in pure [AssemblyScript](https://www.assemblyscript.org) a superset of Typescript.

Given a table of observations, `factor()` reduces correlated variables to a handful of
latent **factors**, tells you how much variance each one explains, and gives you per-row
**factor scores** you can feed into downstream models. `svd()` exposes the underlying
singular value decomposition if you want it directly.

- Runs in **Node and the browser**, with ESM, CommonJS and a UMD global build.
- Ships **bundled TypeScript types**.
- Optional **WASM** backend (AssemblyScript) for browser workloads.
- Results match the Python references ([factor-analyzer](https://pypi.org/project/factor-analyzer/), NumPy) and the SVD from [pca-js](https://www.npmjs.com/package/pca-js).

## Install

```bash
npm install factor-js
```

## Quickstart

**Node / Bun (ESM)**

```js
import { factor, svd } from "factor-js";
```

**Node (CommonJS)**

```js
const { factor, svd } = require("factor-js");
```

**Browser (ESM, via jsDelivr)**

```html
<script type="module">
  import { factor } from "https://cdn.jsdelivr.net/npm/factor-js@1.0.4/+esm";
</script>
```

**Browser (global)**

```html
<script src="https://cdn.jsdelivr.net/npm/factor-js@1.0.4/dist/factor.js"></script>
<script>
  // window.Factor.factor(...), window.Factor.svd(...)
</script>
```

**WASM (Assembly script source)**

```js
import { factor } from "factor-js/wasm";
```

## A worked example, with actual results

The repo bundles a real dataset: `tests/data.csv`, **405 responses × 40 self-report
variables** (mood, body, senses, cognition, social feelings), each rated on a −3…3 scale.
Rows are observations, columns are variables.

```js
import { readFileSync } from "node:fs";
import { factor } from "factor-js";

const rows = readFileSync("tests/data.csv", "utf8").trim().split("\n");
const names = rows[0].split(",");
const data = rows.slice(1).map((r) => r.split(",").map(Number));

const { loadings, variance, scores } = factor(data);
const nVars = names.length;

// Eigenvalue = variance * number of variables (Kaiser criterion: keep eigenvalue > 1)
console.log("Factor  Explained  Eigenvalue  Cumulative");
let cumulative = 0;
variance.slice(0, 4).forEach((v, i) => {
  cumulative += v;
  console.log(
    `F${i + 1}`.padEnd(7),
    `${(v * 100).toFixed(2)}%`.padStart(9),
    (v * nVars).toFixed(2).padStart(10),
    `${(cumulative * 100).toFixed(2)}%`.padStart(11)
  );
});

// The variables with the strongest loading on each of the first three factors
for (let f = 0; f < 3; f++) {
  const top = names
    .map((name, i) => ({ name, loading: loadings[i][f] }))
    .sort((a, b) => Math.abs(b.loading) - Math.abs(a.loading))
    .slice(0, 6);
  console.log(`\nFactor ${f + 1}:`);
  top.forEach((t) => console.log(`  ${t.name.padEnd(14)} ${t.loading >= 0 ? "+" : ""}${t.loading.toFixed(3)}`));
}
```

That prints:

```text
Factor  Explained  Eigenvalue  Cumulative
F1         41.99%      16.80      41.99%
F2         13.85%       5.54      55.84%
F3          9.32%       3.73      65.16%
F4          2.72%       1.09      67.88%

Factor 1:
  joy            +0.856
  happy          +0.851
  pleasure       +0.827
  love           +0.822
  angry          +0.811
  nauseated      +0.808

Factor 2:
  computations   +0.829
  recognizing    +0.798
  remembering    +0.722
  reasoning      +0.630
  hungry         -0.610
  communicating  +0.589

Factor 3:
  seeing         +0.638
  temperature    +0.607
  odors          +0.542
  sounds         +0.502
  embarrassed    -0.491
  guilt          -0.410
```

So you can probably name the factors as `feelings` or `emotions` for the first, `logic` or `thinking` for the second and `sensory` or 

## Interpreting the return values

| Field      | Shape              | Meaning                                               |
|------------|--------------------|-------------------------------------------------------|
| `loadings` | `nVars × nFactors` | Correlation of each **variable** with each **factor** |
| `variance` | `nFactors`         | Share of total variance explained (sums to 1)         |
| `scores`   | `nObs × nFactors`  | Per-**observation** factor scores                     |


Eigenvalues are `variance.map(v => v * nVars)`. Factor directions are sign-corrected so each
factor's loadings sum to a positive value.


## JavaScript or WASM?

`svd()`/`factor()` do the same math in both builds, and produce **bit-identical** results
(the test suite cross-checks them). Which is faster depends on the engine:

- **JavaScriptCore / browsers:** WASM is the better default, especially for the larger,
  more complex cases.
- **Node / V8:** V8's JIT is extremely good at warm numeric loops, and WASM starts to lose on
  large workloads. Both are fast; pick JS for simplicity.

Median time per call (lower is better; `WASM/JS < 1×` means WASM wins):

**Benchmark - Directional non scientific**

| Test               | Size     | JS      | WASM     | WASM/JS |
|--------------------|----------|---------|----------|---------|
| SVD                | 100×10   | 1.76ms  | 0.28ms   | 0.16×   |
| SVD                | 1000×20  | 2.17ms  | 4.80ms   | 2.21×   |
| SVD                | 1000×100 | 54.43ms | 104.44ms | 1.92×   |
| Factor (real data) | 405×40   | 4.95ms  | 8.84ms   | 1.79×   |
| Factor (random)    | 1000×40  | 13.23ms | 22.78ms  | 1.72×   |


Reproduce with `npm run bench`. The WASM backend uses the
AssemblyScript `minimal` runtime and flat row-major buffers for the optimization.

## API

### `factor(data: number[][]): FactorResult`

Principal factor analysis on a row-major matrix. Columns are standardised internally.

- `data` — observations × variables, `rows >= columns`.
- Returns `{ loadings, scores, variance }` as above.
- Throws `Need more rows than columns` if `rows < columns`.

### `svd(A: number[][]): { U, S, V }`

Singular value decomposition via `A ≈ U · diag(S) · Vᵀ`.

- `A` — `rows × columns`, `rows >= columns`.
- `U` is `rows × columns`, `S` has length `columns`, `V` is `columns × columns`.
- Throws `Need more rows than columns` if `rows < columns`.

`factor()` standardises its input first, so you do **not** need to center or scale `data`
yourself. `svd()` operates on exactly the matrix you give it.

## Building and testing

NOTE: TSConfig errors -> You may get tsconfig errors when initially cloning the repo.
Post build you may get TSConfig deprecation errors, it is recommended to ignore them.
This is because we cross-build from AssemblyScript (not Typescript) and thus have to use portable code.
Build should only produce warnings no errors unless something has breaking changes in dev dependencies (unlikely).

```bash
npm install
npm run build:all   # asc -> core/*.wasm, tsc + rollup -> dist/*
npm test            # JS-vs-WASM parity across random, edge and real-data cases
npm run bench       # JS-vs-WASM benchmark (run under node or bun)
```

The tests are generated with AI assistance and cross-check against NumPy and
`factor-analyzer`. The Python side lives in `python/`:

```bash
python -m venv venv && source venv/bin/activate
pip install -r python/requirements.txt
python python/test_sample.py   # random sample
python python/test_data.py     # tests/data.csv
```

## License

GPL-3.0-only. This work derives from [pca-js](https://www.npmjs.com/package/pca-js).
