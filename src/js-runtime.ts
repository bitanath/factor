// AssemblyScript emits calls to `unchecked(...)` to elide bounds checks in the
// WASM build. When the same source is transpiled to JavaScript by `tsc`, that
// helper is not defined, so provide the identity implementation (this is exactly
// what assemblyscript/std/portable provides). The WASM build never loads this
// file -- `asc` compiles src/index.ts, not this entry.
const g = globalThis as any;
if (typeof g.unchecked !== "function") {
  g.unchecked = (value: any) => value;
}
