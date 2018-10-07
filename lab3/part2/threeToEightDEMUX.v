`timescale 1ns / 1ps

module threeToEightDEMUX(
    g1,
    g2a,
    g2b,
    S,
    D);
    
    input wire[0:0]g1;
    input wire[0:0]g2a;
    input wire[0:0]g2b;
    input wire[2:0]S;
    wire enable;
    wire [7:0]H;
    output wire[7:0]D;
    
assign enable = g1 &~g2a & ~g2b;
assign D = ~H;
threeToEight one(enable,S,H);
 
endmodule
