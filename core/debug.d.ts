/** Exported memory */
export declare const memory: WebAssembly.Memory;
/**
 * src/factor/factor
 * @param data `~lib/array/Array<~lib/array/Array<f64>>`
 * @returns `src/factor/FactorResult`
 */
export declare function factor(data: Array<Array<number>>): __Record6<never>;
/**
 * src/svd/svd
 * @param A `~lib/array/Array<~lib/array/Array<f64>>`
 * @returns `src/svd/SVDResult`
 */
export declare function svd(A: Array<Array<number>>): __Record8<never>;
/** src/factor/FactorResult */
declare interface __Record6<TOmittable> {
  /** @type `~lib/array/Array<~lib/array/Array<f64>>` */
  loadings: Array<Array<number>>;
  /** @type `~lib/array/Array<~lib/array/Array<f64>>` */
  scores: Array<Array<number>>;
  /** @type `~lib/array/Array<f64>` */
  variance: Array<number>;
}
/** src/svd/SVDResult */
declare interface __Record8<TOmittable> {
  /** @type `~lib/array/Array<~lib/array/Array<f64>>` */
  U: Array<Array<number>>;
  /** @type `~lib/array/Array<f64>` */
  S: Array<number>;
  /** @type `~lib/array/Array<~lib/array/Array<f64>>` */
  V: Array<Array<number>>;
}
