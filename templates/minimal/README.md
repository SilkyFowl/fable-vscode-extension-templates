# Fable VsCode Minimal Extension

This is a small Fable VsCode Extension project so you can easily get started and add your own code progressively.

## Requirements

* [dotnet SDK](https://www.microsoft.com/net/download/core) 6.0 or higher
* [node.js](https://nodejs.org)
* Visual Studio Code with [Ionide](http://ionide.io/)

## Usage

<!--#if (packageManeger == "npm") -->
Run `npm install` to install dependencies.

To test, run `npm start` and then in VS Code click F5.

For publishing, edit the package.json with your publishing data and then run: `npm run pack` to create the package.

<!--#elseif (packageManeger == "yarn") -->
Run `yarn install` to install dependencies.

To test, run `yarn start` and then in VS Code click F5.

For publishing, edit the package.json with your publishing data and then run: `yarn run pack` to create the package.

<!--#elseif (packageManeger == "pnpm") -->
Run `pnpm install` to install dependencies.

To test, run `pnpm start` and then in VS Code click F5.

For publishing, edit the package.json with your publishing data and then run: `pnpm run pack` to create the package.

<!--#endif -->
