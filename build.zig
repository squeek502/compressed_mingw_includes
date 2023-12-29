const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    b.addModule("compressed_mingw_includes", .{
        .source_file = .{ .path = "compressed_mingw_includes.zig" },
    });
}
