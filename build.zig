const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("ba-fetch", "src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);

    exe.addPackage(.{ .name = "zfetch", .path = .{ .path = "lib/zfetch/src/main.zig" }, .dependencies = dependencies });

    exe.install();
}

const dependencies = &[_]std.build.Pkg{
    .{
        .name = "hzzp",
        .path = .{ .path = "lib/hzzp/src/main.zig" },
    },
    .{
        .name = "iguanaTLS",
        .path = .{ .path = "lib/iguanaTLS/src/main.zig" },
    },
    .{
        .name = "network",
        .path = .{ .path = "lib/zig-network/network.zig" },
    },
    .{
        .name = "uri",
        .path = .{ .path = "lib/zig-uri/uri.zig" },
    },
};
