`timescale 1ns / 1ps



module threeToEight(
enable,
S,
D);

input wire[2:0]S;
input wire[0:0]enable;
output wire[7:0]D;

assign D[0] = (~S[2] & ~S[1] & ~S[0]) & enable;
assign D[1] = (~S[2] & ~S[1] & S[0]) & enable;
assign D[2] = (~S[2] & S[1] & ~S[0]) & enable;
assign D[3] = (~S[2] & S[1] & S[0]) & enable;
assign D[4] = (S[2] & ~S[1] & ~S[0]) & enable;
assign D[5] = (S[2] & ~S[1] & S[0]) & enable;
assign D[6] = (S[2] & S[1] & ~S[0]) & enable;
assign D[7] = (S[2] & S[1] & S[0]) & enable;

endmodule
