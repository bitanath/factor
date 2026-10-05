import { defineConfig } from 'rollup';
import dts from 'rollup-plugin-dts';

export default defineConfig([
  {
    input: 'dist/js/entry.js',
    output: [
      {
        file: 'dist/factor.mjs',
        format: 'es',
        sourcemap: true
      },
      {
        file: 'dist/factor.cjs',
        format: 'cjs',
        exports: 'named',
        sourcemap: true
      },
      {
        file: 'dist/factor.js',
        format: 'umd',
        name: 'Factor',
        exports: 'named',
        sourcemap: true
      }
    ]
  },
  {
    input: 'dist/js/entry.d.ts',
    output: [{ file: 'dist/factor.d.ts', format: 'es' }],
    plugins: [dts()]
  }
]);
