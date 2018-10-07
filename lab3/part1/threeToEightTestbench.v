`timescale 1ns / 1ps

module threeToEightTestBench(
);
    reg [2:0] S;
    wire [7:0] D;
    reg [0:0]enable = 1;
    integer k;
    
    threeToEight DUT (.enable(enable), .S(S), .D(D));   
    
    initial
    begin
      S = 0; 
	for (k=0; k < 8; k=k+1)
	         #5 S=k;
	#10;
    end
    
endmodule
