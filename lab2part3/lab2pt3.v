`timescale 1ns / 1ps

module lab2pt3(
    A,
    B,
    C,
    S);
    
input wire[1:0]A;
input wire[1:0]B;
input wire[0:0]S;
output reg[1:0]C;
    
always @(A or B or S)
begin
    if(S==0)
        C = A;
    else
        C = B;
end 
       
endmodule
