# UglifyJS2.js for Windows

A standalone portable version of the [UglifyJS2](http://lisperator.net/uglifyjs/) command-line JavaScript compressor/minifier that will run on Windows with no other dependencies.

Consists of a standalone version of [Node.js](http://nodejs.org/) and the bare minimum UglifyJS2.js files.


## Install Method 1

Either clone the repository and run `build.cmd` to build **UglifyJS2.js for Windows** yourself. You must have [NPM](https://npmjs.org/) installed on your computer to do that. This build script
will automatically download latest versions of Node.js and UglifyJS2 directly from their repositories.


## Install Method 2

Or just **[download and extract the release ZIP](https://github.com/dhlavaty/uglifyjs2-windows/releases)** and invoke `uglifyjs2.cmd` as detailed below.


## Usage

Basic usage:

    uglifyjs2.cmd  path\input.js -o path\output.js

Compress and Mangle multiple javascript files:

    uglifyjs2.cmd  path\input1.js path\input2.js -o path\output.js -c -m

For full usage (or visit [https://github.com/mishoo/UglifyJS2](https://github.com/mishoo/UglifyJS2) ):

    uglifyjs2.cmd  -h


## Author

This project was heavily inspired by [LESS.js for Windows](https://github.com/duncansmart/less.js-windows) project by [Duncan Smart](https://github.com/duncansmart) so thanx for that.