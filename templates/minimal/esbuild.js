#!/usr/bin/env node
const yargs = require('yargs');
const { build } = require('esbuild')

const argv = yargs
    .option('watch', {
        alias: 'w',
        description: 'Switch watch mode',
        type: 'boolean',
    })
    .help()
    .alias('help', 'h')
    .argv;

build({
    entryPoints: {
        extension: 'build/Extension.js'
    },
    bundle: true,
    format: 'cjs',
    outdir: 'dist',
    external: ['vscode'],
    platform: 'node',
    sourcemap: true,
    watch: argv.watch
}).catch(() => process.exit(1))