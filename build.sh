#!/bin/bash

set -e

MINGW_VER=11.0.1

mkdir -p build
if ! test -f compressed_mingw_includes.tar.zst; then
	cd build
	BUILD_DIR=$(realpath .)
	wget -nc -O mingw-w64-$MINGW_VER.tar.gz https://github.com/mingw-w64/mingw-w64/archive/refs/tags/v$MINGW_VER.tar.gz
	tar -xzf mingw-w64-$MINGW_VER.tar.gz
	cd mingw-w64-$MINGW_VER
	./configure --prefix="$BUILD_DIR" --without-crt --with-libraries=no --with-tools=no
	make install
	cp COPYING "$BUILD_DIR/LICENSE-MinGW"
	cd "$BUILD_DIR"
	ZSTD_CLEVEL=19 tar --zstd -cf compressed_mingw_includes.tar.zst include/ LICENSE-MinGW
	cp compressed_mingw_includes.tar.zst ..
    cd ..
fi

tar -zcf build/compressed_mingw_includes.tar.gz build.zig build.zig.zon compressed_mingw_includes.zig compressed_mingw_includes.tar.zst