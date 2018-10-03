`timescale 1ns / 1ps

module ripple(
    a,
    b,
    cin,
    s,
    cout);
    
    input wire[0:0]a;
    input wire[0:0]b;
    input wire[0:0]cin;
    output wire[0:0]s;
    output wire[0:0]cout;
   //one bit adder using dataflow modeling
   assign s = (a ^ b) ^ cin;
   assign cout = ((a ^ b) & cin) | (a & b);
    
endmodule
