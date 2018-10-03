`timescale 1ns / 1ps

module threemux(
    A,
    B,
    D,
    S,
    S1,
    F);
    
    input wire [1:0] A;
    input wire [1:0] B;
    input wire [0:0] S;
    input wire [0:0] S1;
    input wire [1:0] D;
    wire[1:0] C;
    output wire[1:0] F;
//input,output,select
mux_dataflow mux1(.A(A), .B(B), .C(C), .S(S));
//feeding signal B to port A of mux, feeding signal D to port B of mux, .nameofport(nameofconnections)
mux_dataflow mux2(.A(C), .B(D), .C(F), .S(S1));

endmodule

module mux_dataflow(
    A,
    B,
    C,
    S);
    
    input wire[1:0]A;
    input wire[1:0]B;
    input wire[0:0]S;
    output wire[1:0]C;
    
    assign #3 C = S ? A : B;
    
endmodule


