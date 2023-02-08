const std = @import("std");
const Builder = std.build.Builder;

pub fn build(b: *std.build.Builder) void {
    const exe = b.addExecutable(.{
        .name = "ziging",
        .root_source_file = Builder.FileSource{
            .path = "src/main.zig",
        },
    });
    exe.install();
}