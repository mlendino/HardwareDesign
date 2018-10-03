`timescale 1ns / 1ps


module ripplecarryadder(
    a0,
    a1,
    a2,
    a3,
    b0,
    b1,
    b2,
    b3,
    s0,
    s1,
    s2,
    s3,
    cout);
    //not carrying anything in to the first added, also ran out of input switches, so im grounding the first cin
    input wire a0,a1,a2,a3,b0,b1,b2,b3;
    wire c1, c2, c3;
    output wire cout,s0,s1,s2,s3;
    
    ripple fa0(a0,b0,0,s0,c1);
    ripple fa1(a1,b1,c1,s1,c2);
    ripple fa2(a2,b2,c2,s2,c3);
    ripple fa3(a3,b3,c3,s3,cout);
    
endmodule
