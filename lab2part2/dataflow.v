`timescale 1ns / 1ps
    
module mux_dataflow(
    A,
    B,
    C,
    S);
    
    input wire[1:0]A;
    input wire[1:0]B;
    input wire[0:0]S;
    output wire[1:0]C;
   // assign #3 C = S ? A : B;
    assign #3 C[0] = (A[0] & ~S) | (B[0] & S);
    assign #3 C[1] = (A[1] & ~S) | (B[1] & S);
    
endmodule

