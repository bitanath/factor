import { Matrix, Vector, flatten, reshape } from "./mm";
import { svdFlat } from "./svd";

export class FactorResult {
  loadings!: Matrix;
  scores!: Matrix;
  variance!: Vector;
}

function correlation(x: f64[], y: f64[]): f64 {
  const n: i32 = x.length;
  let sumX: f64 = 0.0;
  let sumY: f64 = 0.0;
  let sumXY: f64 = 0.0;
  let sumX2: f64 = 0.0;
  let sumY2: f64 = 0.0;

  for (let i: i32 = 0; i < n; i++) {
    unchecked(sumX = sumX + x[i]);
    unchecked(sumY = sumY + y[i]);
    unchecked(sumXY = sumXY + x[i] * y[i]);
    unchecked(sumX2 = sumX2 + x[i] * x[i]);
    unchecked(sumY2 = sumY2 + y[i] * y[i]);
  }

  const numerator: f64 = <f64>n * sumXY - sumX * sumY;
  const denominator: f64 = Math.sqrt((<f64>n * sumX2 - sumX * sumX) * (<f64>n * sumY2 - sumY * sumY));

  if (denominator == 0.0) {
    return 0.0;
  }
  return numerator / denominator;
}

export function factor(data: Matrix): FactorResult {
  const m: i32 = data.length;

  const row0 = data[0];
  if (!row0) {
    throw new Error("u[0] is null");
  }
  const n: i32 = row0.length;

  // Flatten once; all heavy work happens on contiguous buffers.
  const input: f64[] = flatten(data);

  const means = new Array<f64>(n);
  const stds = new Array<f64>(n);

  for (let j: i32 = 0; j < n; j++) {
    let sum: f64 = 0.0;
    for (let i: i32 = 0; i < m; i++) {
      unchecked(sum = sum + input[i * n + j]);
    }
    means[j] = sum / <f64>m;
  }

  for (let j: i32 = 0; j < n; j++) {
    let sumSq: f64 = 0.0;
    for (let i: i32 = 0; i < m; i++) {
      const diff: f64 = unchecked(input[i * n + j]) - means[j];
      unchecked(sumSq = sumSq + diff * diff);
    }
    stds[j] = Math.sqrt(sumSq / <f64>m);
    if (stds[j] == 0.0) {
      stds[j] = 1.0;
    }
  }

  const standardized = new Array<f64>(m * n);
  for (let i: i32 = 0; i < m; i++) {
    for (let j: i32 = 0; j < n; j++) {
      unchecked(standardized[i * n + j] = (input[i * n + j] - means[j]) / stds[j]);
    }
  }

  const result = svdFlat(standardized, m, n);
  const V: f64[] = result.V; // n x n, row-major

  // Factor scores = standardized * V (equivalent to U * S given U*S*Vt = X and Vt*V = I).
  const factorScores = new Array<f64>(m * n);
  for (let i: i32 = 0; i < m; i++) {
    for (let j: i32 = 0; j < n; j++) {
      let sum: f64 = 0.0;
      for (let k: i32 = 0; k < n; k++) {
        unchecked(sum = sum + standardized[i * n + k] * V[k * n + j]);
      }
      factorScores[i * n + j] = sum;
    }
  }

  // Loadings are the correlation of each variable with each factor. Reuse two
  // scratch columns instead of allocating per (var, factor) pair.
  const loadings = new Array<f64>(n * n);
  const variableCol = new Array<f64>(m);
  const factorCol = new Array<f64>(m);

  for (let varIdx: i32 = 0; varIdx < n; varIdx++) {
    for (let i: i32 = 0; i < m; i++) {
      variableCol[i] = unchecked(standardized[i * n + varIdx]);
    }

    for (let factorIdx: i32 = 0; factorIdx < n; factorIdx++) {
      for (let i: i32 = 0; i < m; i++) {
        factorCol[i] = unchecked(factorScores[i * n + factorIdx]);
      }
      loadings[varIdx * n + factorIdx] = correlation(variableCol, factorCol);
    }
  }

  const signs = new Array<f64>(n);
  for (let j: i32 = 0; j < n; j++) {
    let sum: f64 = 0.0;
    for (let i: i32 = 0; i < n; i++) {
      unchecked(sum = sum + loadings[i * n + j]);
    }
    if (Math.abs(sum) < 1e-10) {
      signs[j] = 1.0;
    } else {
      signs[j] = sum < 0.0 ? -1.0 : 1.0;
    }
  }

  for (let j: i32 = 0; j < n; j++) {
    for (let i: i32 = 0; i < n; i++) {
      unchecked(loadings[i * n + j] = loadings[i * n + j] * signs[j]);
    }
    for (let i: i32 = 0; i < m; i++) {
      unchecked(factorScores[i * n + j] = factorScores[i * n + j] * signs[j]);
    }
  }

  const variance = new Array<f64>(n);
  for (let j: i32 = 0; j < n; j++) {
    let sumSq: f64 = 0.0;
    for (let i: i32 = 0; i < n; i++) {
      unchecked(sumSq = sumSq + loadings[i * n + j] * loadings[i * n + j]);
    }
    variance[j] = sumSq / <f64>n;
  }

  return {
    loadings: reshape(loadings, n, n),
    scores: reshape(factorScores, m, n),
    variance: variance
  };
}
