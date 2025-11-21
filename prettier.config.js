/**
 * @see https://prettier.io/docs/configuration
 * @type {import("prettier").Config}
 */

import { resolve } from 'node:path'

const config = {
  plugins: [
    '@prettier/plugin-xml/src/plugin.js',
    '@prettier/plugin-php/src/index.mjs',
  ].map((plugin) => resolve(import.meta.dirname, './node_modules/', plugin)),
  semi: false,
  singleQuote: true,
  xmlWhitespaceSensitivity: 'ignore',
}

export default config
