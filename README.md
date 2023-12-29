compressed_mingw_includes
-------------------------

An attempt at exposing a maximally compressed set of MinGW headers (via `@embedFile` of a `.tar.zst` compressed with zstandard level 19) as a Zig module.

The only intention here is to be able to embed a full set of MinGW headers with standalone builds of [`resinator`](https://github.com/squeek502/resinator).

## Building

Running

```
./build.sh
```

will download MinGW, build the header files, compress them, and then create a Zig module-ready `.tar.gz` at `build/compressed_mingw_includes.tar.gz`.

## Usage

The `.tar.gz` gotten from building then needs to be hosted (see Releases), in which case it can be included in your `build.zig.zon` file like so:

```zig
// TODO
```
