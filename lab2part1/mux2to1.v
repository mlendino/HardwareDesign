`timescale 1ns / 1ps

module mux2to1(
 A, 
 B, 
 C,
 Sel);

//want one select otherwise itll be two independent muxes
input wire[1:0]A;
input wire[1:0]B;
input wire[0:0]Sel;
output wire[1:0]C;

wire wire1;
wire wire2;
wire wire3;
wire wire4;
wire wire5;
//two one bit wide 2:1 muxes driven by the same selector
not(wire3,Sel);
//A[0] is taking one bit from the A, which is initialized to be two bits, and sending it to that gate
//similar reasoning for the subsequent lines
and(wire1,A[0],wire3);
and(wire2,Sel,B[0]);
or(C[0],wire1,wire2);

and(wire4,A[1],wire3);
and(wire5,Sel,B[1]);
or(C[1],wire4,wire5);

endmodule
