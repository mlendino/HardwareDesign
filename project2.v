`timescale 1ns / 1ps

module project2(
 A, 
 B, 
 C, 
 D,
 F);


input wire[0:0]A;
input wire[0:0]B;
input wire[0:0]C;
input wire[0:0]D;
output wire[0:0]F;

wire wire1;
wire wire2;

and(wire1,A,B);
or(wire2,C,D);
and(F,wire1,wire2);

endmodule
