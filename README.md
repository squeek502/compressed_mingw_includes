compressed_mingw_includes
-------------------------

An attempt at exposing a maximally compressed set of MinGW includes (via `@embedFile` of a `.tar.zst` compressed with zstandard level 19) as a Zig module. For context, the includes are ~69MiB uncompressed and ~6MiB compressed.

The only intention here is to be able to embed a full set of MinGW includes in standalone builds of [resinator](https://github.com/squeek502/resinator) that can be extracted on-demand.

## Building

Running

```
./build.sh
```

will download MinGW, build the header files, compress them, and then create a Zig module-ready `.tar.gz` at `build/compressed_mingw_includes.tar.gz`.

## Usage

The `.tar.gz` then needs to be hosted (see [Releases](https://github.com/squeek502/compressed_mingw_includes/releases)), in which case it can be included in your `build.zig.zon`/`build.zig` file like so:

```zig
.{
    // ...
    .dependencies = .{
        .compressed_mingw_includes = .{
            .url = "https://github.com/squeek502/compressed_mingw_includes/releases/download/1.0.2/compressed_mingw_includes.tar",
            .hash = "12209b760f6780e143f9cde540487494292aaf07c08b49ac5f58f8339307a733db3e",
        },
    },
    // ...
}
```

```zig
    // ...
    const compressed_mingw_includes = b.dependency("compressed_mingw_includes", .{});
    const compressed_mingw_includes_module = compressed_mingw_includes.module("compressed_mingw_includes");
    // ...
```
