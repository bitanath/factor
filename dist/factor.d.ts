type Matrix = number[][];
type Vector = number[];

declare class FactorResult {
    loadings: Matrix;
    scores: Matrix;
    variance: Vector;
}
declare function factor(data: Matrix): FactorResult;

declare class SVDResult {
    U: Matrix;
    S: Vector;
    V: Matrix;
}
declare function svd(A: Matrix): SVDResult;

export { FactorResult, SVDResult, factor, svd };
