const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("compressed_mingw_includes", .{
        .root_source_file = b.path("compressed_mingw_includes.zig"),
    });
}
