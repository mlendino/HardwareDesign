`timescale 1ns / 1ps

module lookahead(
    a,
    b,
    cin,
    s);
    
    input wire[0:0]a;
    input wire[0:0]b;
    input wire[0:0]cin;
    output wire[0:0]s;
   //one bit adder using dataflow modeling
   assign s = (a ^ b) ^ cin;
   
endmodule
