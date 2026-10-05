import { Matrix, Vector, copyFlat, flatten, reshape, zeros } from "./mm";

export class SVDResult {
  U!: Matrix;
  S!: Vector;
  V!: Matrix;
}

export class FlatSVD {
  U!: f64[];
  S!: f64[];
  V!: f64[];
}

function pythag(a: f64, b: f64, epsilon: f64): f64 {
  const absA: f64 = a < 0.0 ? -a : a;
  const absB: f64 = b < 0.0 ? -b : b;

  if (absA > absB) {
    return absA * Math.sqrt(1.0 + (b * b / a / a));
  } else if (absB <= epsilon) {
    return absA;
  }

  return absB * Math.sqrt(1.0 + (a * a / b / b));
}

export function svdFlat(A: f64[], m: i32, n: i32): FlatSVD {
  let temp: f64 = 0.0;
  let prec: f64 = 1.0;
  for (let p: i32 = 0; p < 52; p++) {
    prec *= 0.5;
  }
  const tolerance: f64 = 1.0e-64 / prec;
  const itmax: i32 = 50;
  let c: f64 = 0.0;
  let i: i32 = 0;
  let j: i32 = 0;
  let k: i32 = 0;
  let l: i32 = 0;

  const u: f64[] = copyFlat(A);

  const e: f64[] = zeros(n);
  const q: f64[] = zeros(n);

  const v: f64[] = zeros(n * n);
  const epsilon: f64 = tolerance;

  let f: f64 = 0.0;
  let g: f64 = 0.0;
  let h: f64 = 0.0;
  let x: f64 = 0.0;
  let y: f64 = 0.0;
  let z: f64 = 0.0;
  let s: f64 = 0.0;

  for (i = 0; i < n; i++) {
    e[i] = g;
    s = 0.0;
    l = i + 1;

    for (j = i; j < m; j++) {
      unchecked(s = s + u[j * n + i] * u[j * n + i]);
    }

    if (s <= tolerance) {
      g = 0.0;
    } else {
      f = unchecked(u[i * n + i]);
      g = Math.sqrt(s);

      if (f > epsilon) {
        g = -g;
      }

      h = f * g - s;
      unchecked(u[i * n + i] = f - g);

      for (j = l; j < n; j++) {
        s = 0.0;
        for (k = i; k < m; k++) {
          unchecked(s = s + u[k * n + i] * u[k * n + j]);
        }
        f = s / h;
        for (k = i; k < m; k++) {
          unchecked(u[k * n + j] = u[k * n + j] + f * u[k * n + i]);
        }
      }
    }

    q[i] = g;
    s = 0.0;

    for (j = l; j < n; j++) {
      unchecked(s = s + u[i * n + j] * u[i * n + j]);
    }

    if (s <= tolerance) {
      g = 0.0;
    } else {
      f = unchecked(u[i * n + i + 1]);
      g = Math.sqrt(s);

      if (f > epsilon) {
        g = -g;
      }

      h = f * g - s;
      unchecked(u[i * n + i + 1] = f - g);

      for (j = l; j < n; j++) {
        unchecked(e[j] = u[i * n + j] / h);
      }

      for (j = l; j < m; j++) {
        s = 0.0;
        for (k = l; k < n; k++) {
          unchecked(s = s + u[j * n + k] * u[i * n + k]);
        }

        for (k = l; k < n; k++) {
          unchecked(u[j * n + k] = u[j * n + k] + s * e[k]);
        }
      }
    }

    y = (q[i] < 0.0 ? -q[i] : q[i]) + (e[i] < 0.0 ? -e[i] : e[i]);
    if (y > x) {
      x = y;
    }
  }

  for (i = n - 1; i >= 0; i--) {
    if ((g < 0.0 ? -g : g) > epsilon) {
      h = g * unchecked(u[i * n + i + 1]);
      for (j = l; j < n; j++) {
        unchecked(v[j * n + i] = u[i * n + j] / h);
      }

      for (j = l; j < n; j++) {
        s = 0.0;
        for (k = l; k < n; k++) {
          unchecked(s = s + u[i * n + k] * v[k * n + j]);
        }
        for (k = l; k < n; k++) {
          unchecked(v[k * n + j] = v[k * n + j] + s * v[k * n + i]);
        }
      }
    }

    for (j = l; j < n; j++) {
      unchecked(v[i * n + j] = 0.0);
      unchecked(v[j * n + i] = 0.0);
    }

    unchecked(v[i * n + i] = 1.0);
    g = e[i];
    l = i;
  }

  for (i = n - 1; i >= 0; i--) {
    l = i + 1;
    g = q[i];

    for (j = l; j < n; j++) {
      unchecked(u[i * n + j] = 0.0);
    }

    if ((g < 0.0 ? -g : g) > epsilon) {
      h = unchecked(u[i * n + i]) * g;
      for (j = l; j < n; j++) {
        s = 0.0;
        for (k = l; k < m; k++) {
          unchecked(s = s + u[k * n + i] * u[k * n + j]);
        }
        f = s / h;
        for (k = i; k < m; k++) {
          unchecked(u[k * n + j] = u[k * n + j] + f * u[k * n + i]);
        }
      }

      for (j = i; j < m; j++) {
        unchecked(u[j * n + i] = u[j * n + i] / g);
      }
    } else {
      for (j = i; j < m; j++) {
        unchecked(u[j * n + i] = 0.0);
      }
    }

    unchecked(u[i * n + i] = u[i * n + i] + 1.0);
  }

  prec = prec * x;

  for (k = n - 1; k >= 0; k--) {
    for (let iteration: i32 = 0; iteration < itmax; iteration++) {
      let test_convergence: bool = false;

      for (l = k; l >= 0; l--) {
        if ((e[l] < 0.0 ? -e[l] : e[l]) <= prec) {
          test_convergence = true;
          break;
        }
        if ((q[l - 1] < 0.0 ? -q[l - 1] : q[l - 1]) <= prec) {
          break;
        }
      }

      if (!test_convergence) {
        c = 0.0;
        s = 1.0;
        let l1: i32 = l - 1;

        for (i = l; i < k + 1; i++) {
          f = s * e[i];
          e[i] = c * e[i];

          if ((f < 0.0 ? -f : f) <= prec) {
            break;
          }

          g = q[i];
          h = pythag(f, g, epsilon);
          q[i] = h;
          c = g / h;
          s = -f / h;

          for (j = 0; j < m; j++) {
            y = unchecked(u[j * n + l1]);
            z = unchecked(u[j * n + i]);
            unchecked(u[j * n + l1] = y * c + z * s);
            unchecked(u[j * n + i] = -y * s + z * c);
          }
        }
      }

      z = q[k];

      if (l == k) {
        if (z < 0.0) {
          q[k] = -z;
          for (j = 0; j < n; j++) {
            unchecked(v[j * n + k] = -v[j * n + k]);
          }
        }
        break;
      }

      if (iteration >= itmax - 1) {
        throw new Error("no convergence");
      }

      x = q[l];
      y = q[k - 1];
      g = e[k - 1];
      h = e[k];
      f = ((y - z) * (y + z) + (g - h) * (g + h)) / (2.0 * h * y);
      g = pythag(f, 1.0, epsilon);

      if (f < 0.0) {
        f = ((x - z) * (x + z) + h * (y / (f - g) - h)) / x;
      } else {
        f = ((x - z) * (x + z) + h * (y / (f + g) - h)) / x;
      }

      c = 1.0;
      s = 1.0;

      for (i = l + 1; i < k + 1; i++) {
        g = e[i];
        y = q[i];
        h = s * g;
        g = c * g;
        z = pythag(f, h, epsilon);
        e[i - 1] = z;
        c = f / z;
        s = h / z;
        f = x * c + g * s;
        g = -x * s + g * c;
        h = y * s;
        y = y * c;

        for (j = 0; j < n; j++) {
          x = unchecked(v[j * n + i - 1]);
          z = unchecked(v[j * n + i]);
          unchecked(v[j * n + i - 1] = x * c + z * s);
          unchecked(v[j * n + i] = -x * s + z * c);
        }

        z = pythag(f, h, epsilon);
        q[i - 1] = z;
        c = f / z;
        s = h / z;
        f = c * g + s * y;
        x = -s * g + c * y;

        for (j = 0; j < m; j++) {
          y = unchecked(u[j * n + i - 1]);
          z = unchecked(u[j * n + i]);
          unchecked(u[j * n + i - 1] = y * c + z * s);
          unchecked(u[j * n + i] = -y * s + z * c);
        }
      }

      e[l] = 0.0;
      e[k] = f;
      q[k] = x;
    }
  }

  for (i = 0; i < n; i++) {
    if (q[i] < prec) {
      q[i] = 0.0;
    }
  }

  for (i = 0; i < n; i++) {
    for (j = i - 1; j >= 0; j--) {
      if (q[j] < q[i]) {
        c = q[j];
        q[j] = q[i];
        q[i] = c;

        for (k = 0; k < m; k++) {
          temp = unchecked(u[k * n + i]);
          unchecked(u[k * n + i] = u[k * n + j]);
          unchecked(u[k * n + j] = temp);
        }

        for (k = 0; k < n; k++) {
          temp = unchecked(v[k * n + i]);
          unchecked(v[k * n + i] = v[k * n + j]);
          unchecked(v[k * n + j] = temp);
        }

        i = j;
      }
    }
  }

  return {
    U: u,
    S: q,
    V: v
  };
}

export function svd(A: Matrix): SVDResult {
  const m: i32 = A.length;
  if (m === 0) {
    throw new Error("u[0] is null");
  }

  const row0 = A[0];
  if (!row0) {
    throw new Error("u[0] is null");
  }

  const n: i32 = row0.length;

  if (m < n) {
    throw new Error("Need more rows than columns");
  }

  const result = svdFlat(flatten(A), m, n);

  return {
    U: reshape(result.U, m, n),
    S: result.S,
    V: reshape(result.V, n, n)
  };
}
