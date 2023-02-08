const std = @import("std");
const net = std.net;
const StreamServer = std.net.StreamServer;
const http = std.http;
const uri = std.Uri;

pub fn main() !void {
    const localhost = try net.Address.parseIp4("127.0.0.1", 8080);
    var server = net.StreamServer.init(.{});
    defer server.deinit();
    try server.listen(localhost);

    const S = struct {
        fn clientFn(server_address: net.Address) !void {
            const socket = try net.tcpConnectToAddress(server_address);
            defer socket.close();

            _ = try socket.writer().writeAll("Hello world!");
        }
    };

    const t = try std.Thread.spawn(.{}, S.clientFn, .{server.listen_address});
    defer t.join();

    var client = try server.accept();
    defer client.stream.close();

    var buf: [16]u8 = undefined;
    const n = try client.stream.read(buf[0..]);
    std.debug.print("server running at port 8080\n", .{});
    while (true) {
        if (n == 0) break;
    }
    //var connection : StreamServer.Connection = .{
    //    .stream = client.stream,
    //    .address = client.address,
    //};
    //const scheme = [_]u8 { 'h', 't', 't', 'p' };
    //var url : uri = .{
    //    .scheme = &scheme,
    //    .user= "shikhar",
    //    .password = "password",
    //    .host = "localhost",
    //    .port = 8080,
    //    .fragment = "fragment",
    //    .query = "query",
    //    .path = "/",
    //};
    //var options : client.Request.Options = .{};
    //std.debug.print("request: {s}", .{options});

    //var request = http.Request.request(&connection, &url);
    //var response = net.Response.response(&connection, &url);
    //std.print("request: {s}", .{request});
    //std.print("response: {s}", .{response});

}
