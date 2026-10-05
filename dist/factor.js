(function (global, factory) {
    typeof exports === 'object' && typeof module !== 'undefined' ? factory(exports) :
    typeof define === 'function' && define.amd ? define(['exports'], factory) :
    (global = typeof globalThis !== 'undefined' ? globalThis : global || self, factory(global.Factor = {}));
})(this, (function (exports) { 'use strict';

    // AssemblyScript emits calls to `unchecked(...)` to elide bounds checks in the
    // WASM build. When the same source is transpiled to JavaScript by `tsc`, that
    // helper is not defined, so provide the identity implementation (this is exactly
    // what assemblyscript/std/portable provides). The WASM build never loads this
    // file -- `asc` compiles src/index.ts, not this entry.
    const g = globalThis;
    if (typeof g.unchecked !== "function") {
        g.unchecked = (value) => value;
    }

    /** Flatten a row-major matrix into a contiguous row-major buffer. */
    function flatten(m) {
        const rows = m.length;
        const cols = rows > 0 ? m[0].length : 0;
        const out = new Array(rows * cols);
        for (let i = 0; i < rows; i++) {
            const row = m[i];
            for (let j = 0; j < cols; j++) {
                out[i * cols + j] = row[j];
            }
        }
        return out;
    }
    /** Reshape a contiguous row-major buffer into a `rows` x `cols` matrix. */
    function reshape(flat, rows, cols) {
        const out = new Array(rows);
        for (let i = 0; i < rows; i++) {
            const row = new Array(cols);
            for (let j = 0; j < cols; j++) {
                row[j] = flat[i * cols + j];
            }
            out[i] = row;
        }
        return out;
    }
    /** Copy a contiguous buffer. */
    function copyFlat(a) {
        const out = new Array(a.length);
        for (let i = 0; i < a.length; i++) {
            out[i] = unchecked(a[i]);
        }
        return out;
    }
    /** Allocate a zero-filled buffer. */
    function zeros(n) {
        const out = new Array(n);
        for (let i = 0; i < n; i++) {
            out[i] = 0.0;
        }
        return out;
    }

    class SVDResult {
        U;
        S;
        V;
    }
    function pythag(a, b, epsilon) {
        const absA = a < 0.0 ? -a : a;
        const absB = b < 0.0 ? -b : b;
        if (absA > absB) {
            return absA * Math.sqrt(1.0 + (b * b / a / a));
        }
        else if (absB <= epsilon) {
            return absA;
        }
        return absB * Math.sqrt(1.0 + (a * a / b / b));
    }
    /**
     * Numerically identical to the original nested-array implementation, but keeps
     * `u` (m x n) and `v` (n x n) in flat row-major buffers so hot loops can elide
     * bounds checks with `unchecked(...)`.
     */
    function svdFlat(A, m, n) {
        let temp = 0.0;
        let prec = 1.0;
        for (let p = 0; p < 52; p++) {
            prec *= 0.5;
        }
        const tolerance = 1.0e-64 / prec;
        const itmax = 50;
        let c = 0.0;
        let i = 0;
        let j = 0;
        let k = 0;
        let l = 0;
        const u = copyFlat(A);
        const e = zeros(n);
        const q = zeros(n);
        const v = zeros(n * n);
        const epsilon = tolerance;
        let f = 0.0;
        let g = 0.0;
        let h = 0.0;
        let x = 0.0;
        let y = 0.0;
        let z = 0.0;
        let s = 0.0;
        for (i = 0; i < n; i++) {
            e[i] = g;
            s = 0.0;
            l = i + 1;
            for (j = i; j < m; j++) {
                unchecked(s = s + u[j * n + i] * u[j * n + i]);
            }
            if (s <= tolerance) {
                g = 0.0;
            }
            else {
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
            }
            else {
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
            }
            else {
                for (j = i; j < m; j++) {
                    unchecked(u[j * n + i] = 0.0);
                }
            }
            unchecked(u[i * n + i] = u[i * n + i] + 1.0);
        }
        prec = prec * x;
        for (k = n - 1; k >= 0; k--) {
            for (let iteration = 0; iteration < itmax; iteration++) {
                let test_convergence = false;
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
                    let l1 = l - 1;
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
                }
                else {
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
    function svd(A) {
        const m = A.length;
        if (m === 0) {
            throw new Error("u[0] is null");
        }
        const row0 = A[0];
        if (!row0) {
            throw new Error("u[0] is null");
        }
        const n = row0.length;
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

    class FactorResult {
        loadings;
        scores;
        variance;
    }
    function correlation(x, y) {
        const n = x.length;
        let sumX = 0.0;
        let sumY = 0.0;
        let sumXY = 0.0;
        let sumX2 = 0.0;
        let sumY2 = 0.0;
        for (let i = 0; i < n; i++) {
            unchecked(sumX = sumX + x[i]);
            unchecked(sumY = sumY + y[i]);
            unchecked(sumXY = sumXY + x[i] * y[i]);
            unchecked(sumX2 = sumX2 + x[i] * x[i]);
            unchecked(sumY2 = sumY2 + y[i] * y[i]);
        }
        const numerator = n * sumXY - sumX * sumY;
        const denominator = Math.sqrt((n * sumX2 - sumX * sumX) * (n * sumY2 - sumY * sumY));
        if (denominator == 0.0) {
            return 0.0;
        }
        return numerator / denominator;
    }
    function factor(data) {
        const m = data.length;
        const row0 = data[0];
        if (!row0) {
            throw new Error("u[0] is null");
        }
        const n = row0.length;
        // Flatten once; all heavy work happens on contiguous buffers.
        const input = flatten(data);
        const means = new Array(n);
        const stds = new Array(n);
        for (let j = 0; j < n; j++) {
            let sum = 0.0;
            for (let i = 0; i < m; i++) {
                unchecked(sum = sum + input[i * n + j]);
            }
            means[j] = sum / m;
        }
        for (let j = 0; j < n; j++) {
            let sumSq = 0.0;
            for (let i = 0; i < m; i++) {
                const diff = unchecked(input[i * n + j]) - means[j];
                unchecked(sumSq = sumSq + diff * diff);
            }
            stds[j] = Math.sqrt(sumSq / m);
            if (stds[j] == 0.0) {
                stds[j] = 1.0;
            }
        }
        const standardized = new Array(m * n);
        for (let i = 0; i < m; i++) {
            for (let j = 0; j < n; j++) {
                unchecked(standardized[i * n + j] = (input[i * n + j] - means[j]) / stds[j]);
            }
        }
        const result = svdFlat(standardized, m, n);
        const V = result.V; // n x n, row-major
        // Factor scores = standardized * V (equivalent to U * S given U*S*Vt = X and Vt*V = I).
        const factorScores = new Array(m * n);
        for (let i = 0; i < m; i++) {
            for (let j = 0; j < n; j++) {
                let sum = 0.0;
                for (let k = 0; k < n; k++) {
                    unchecked(sum = sum + standardized[i * n + k] * V[k * n + j]);
                }
                factorScores[i * n + j] = sum;
            }
        }
        // Loadings are the correlation of each variable with each factor. Reuse two
        // scratch columns instead of allocating per (var, factor) pair.
        const loadings = new Array(n * n);
        const variableCol = new Array(m);
        const factorCol = new Array(m);
        for (let varIdx = 0; varIdx < n; varIdx++) {
            for (let i = 0; i < m; i++) {
                variableCol[i] = unchecked(standardized[i * n + varIdx]);
            }
            for (let factorIdx = 0; factorIdx < n; factorIdx++) {
                for (let i = 0; i < m; i++) {
                    factorCol[i] = unchecked(factorScores[i * n + factorIdx]);
                }
                loadings[varIdx * n + factorIdx] = correlation(variableCol, factorCol);
            }
        }
        const signs = new Array(n);
        for (let j = 0; j < n; j++) {
            let sum = 0.0;
            for (let i = 0; i < n; i++) {
                unchecked(sum = sum + loadings[i * n + j]);
            }
            if (Math.abs(sum) < 1e-10) {
                signs[j] = 1.0;
            }
            else {
                signs[j] = sum < 0.0 ? -1 : 1.0;
            }
        }
        for (let j = 0; j < n; j++) {
            for (let i = 0; i < n; i++) {
                unchecked(loadings[i * n + j] = loadings[i * n + j] * signs[j]);
            }
            for (let i = 0; i < m; i++) {
                unchecked(factorScores[i * n + j] = factorScores[i * n + j] * signs[j]);
            }
        }
        const variance = new Array(n);
        for (let j = 0; j < n; j++) {
            let sumSq = 0.0;
            for (let i = 0; i < n; i++) {
                unchecked(sumSq = sumSq + loadings[i * n + j] * loadings[i * n + j]);
            }
            variance[j] = sumSq / n;
        }
        return {
            loadings: reshape(loadings, n, n),
            scores: reshape(factorScores, m, n),
            variance: variance
        };
    }

    exports.FactorResult = FactorResult;
    exports.SVDResult = SVDResult;
    exports.factor = factor;
    exports.svd = svd;

}));
//# sourceMappingURL=factor.js.map
