export type Matrix = number[][];
export type Vector = number[];

/** Flatten a row-major matrix into a contiguous row-major buffer. */
export function flatten(m: Matrix): f64[] {
  const rows: i32 = m.length;
  const cols: i32 = rows > 0 ? m[0].length : 0;
  const out = new Array<f64>(rows * cols);
  for (let i = 0; i < rows; i++) {
    const row = m[i];
    for (let j = 0; j < cols; j++) {
      out[i * cols + j] = row[j];
    }
  }
  return out;
}

/** Reshape a contiguous row-major buffer into a `rows` x `cols` matrix. */
export function reshape(flat: f64[], rows: i32, cols: i32): Matrix {
  const out = new Array<Array<f64>>(rows);
  for (let i = 0; i < rows; i++) {
    const row = new Array<f64>(cols);
    for (let j = 0; j < cols; j++) {
      row[j] = flat[i * cols + j];
    }
    out[i] = row;
  }
  return out;
}

/** Copy a contiguous buffer. */
export function copyFlat(a: f64[]): f64[] {
  const out = new Array<f64>(a.length);
  for (let i = 0; i < a.length; i++) {
    out[i] = unchecked(a[i]);
  }
  return out;
}

/** Allocate a zero-filled buffer. */
export function zeros(n: i32): f64[] {
  const out = new Array<f64>(n);
  for (let i = 0; i < n; i++) {
    out[i] = 0.0;
  }
  return out;
}
