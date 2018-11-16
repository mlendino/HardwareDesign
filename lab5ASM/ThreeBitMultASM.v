`timescale 1ns / 1ps

module ThreeBitMultASM(
    a,
    b,
    clk,
    c);
    
    input [2:0] a;
    input [2:0] b;
    input clk;
    output reg [5:0] c;
    
    integer n;
    reg [5:0] accumulator;
    
    //initializing output to be all zeros since we have to load in values eventually
    initial 
        begin
        c = 5'b0;
    end
    
    //loading data into shift register, shifting n times, adding into the accumulator
    always @(posedge clk)
    begin 
    n = 0;
    accumulator = 0;
    //ensures we only do 3 bit multiplication
    while(n < 3)
        begin
        //if the bit we are multiplying by is 1, then the accumulator should be whats currently in the accumulator plus a shifted appropriately
        if(b[n] == 1)
            begin
                accumulator = accumulator + (a<<n);
            end
            //increment to go through each bit 
            n = n + 1;
        end 
        //writing the accumulator to output
        c = accumulator;
     end
endmodule
