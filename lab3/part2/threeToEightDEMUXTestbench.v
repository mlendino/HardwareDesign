`timescale 1ns / 1ps
//assume testbench works and use it to test everything else, looking at the output
//when you look at the output, D, in the waveform, youll notice that it acts according
//to the truth table, once the G's are 1 0 0, then it starts decoding, before then its 
//all 1's
module threeToEightDEMUXTestbench(  );
    reg [2:0] S;
    reg g1, g2a, g2b;
    wire [7:0] D;
    integer k;
    threeToEightDEMUX DUT (.g1(g1), .g2a(g2a), .g2b(g2b), .S(S), .D(D));   
    initial
    begin
      S = 0; g1 = 0; g2a = 1; g2b = 1;
	for (k=0; k < 8; k=k+1)
		#5 S=k;
	#10;
      S = 0; g1 = 1; g2a = 0; g2b = 1;
	for (k=0; k < 8; k=k+1)
		#5 S=k;
	#10;
      S = 0; g1 = 0; g2a = 1; g2b = 0;
	for (k=0; k < 8; k=k+1)
		#5 S=k;
	#10;
      S = 0; g1 = 1; g2a = 0; g2b = 0;
	for (k=0; k < 8; k=k+1)
		#5 S=k;
	#10;
    end
endmodule
