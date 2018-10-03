`timescale 1ns / 1ps

module testbenchripple;

reg[0:0]a; 
reg[0:0]b;
reg[0:0]cin;
wire[0:0]cout;
wire[0:0]s;

    ripple DUT (.a(a), .b(b), .cin(cin), .cout(cout), .s(s));

initial
    begin
     a = 0; b = 0; cin = 0;
	#10 a = 1;
	#10 b = 1; a = 0;
	#10 a = 1;
	#10 cin = 1; a = 0; b = 0;
	#10 a = 1;
	#10 b = 1; a = 0;
	#10 a = 1;
	#10;
    end
   
endmodule
