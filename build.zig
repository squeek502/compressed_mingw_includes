const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("compressed_mingw_includes", .{
        .source_file = .{ .path = "compressed_mingw_includes.zig" },
    });
}
