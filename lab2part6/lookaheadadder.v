`timescale 1ns / 1ps

module lookaheadadder(
    a0,
    a1,
    a2,
    a3,
    b0,
    b1,
    b2,
    b3,
    cout,
    s0,
    s1,
    s2,
    s3);
    
    input wire a0,a1,a2,a3,b0,b1,b2,b3;
    wire c0,c1,c2;
    output wire cout,s0,s1,s2,s3;
    
    assign c0 = (a0 & b0) | ((a0 | b0) & 0);
    assign c1 = (a1 & b1) | ((a1 | b1) & c0);
    assign c2 = (a2 & b2) | ((a2 | b2) & c1);
    assign cout = (a2 & b2) | ((a2 | b2) & c2);
    
    lookahead fa1(a0,b0,0,s0);
    lookahead fa2(a1,b1,c0,s1);
    lookahead fa3(a2,b2,c1,s2);
    lookahead fa4(a3,b3,c2,s3);
    
endmodule
