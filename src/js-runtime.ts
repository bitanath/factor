// FIXME: tsc output calls AssemblyScript's `unchecked()` builtin — shim it.
const g = globalThis as any;
if (typeof g.unchecked !== "function") {
  g.unchecked = (value: any) => value;
}
