`timescale 1ns / 1ps

module testbenchdataflow;
//defining one register for each input and output rather than the other lab in which we defined one register for each bit
//needs to hold variables over time
reg [1:0] A;
reg [1:0] B;
reg [0:0] S;
wire [1:0] C;
//naming an instance of an object/module/class of type mux_dataflow
mux_dataflow ttul(.A(A), .B(B), .C(C), .S(S));

initial
    begin
      A = 0; B = 0; S = 0;
      #10 A = 1;
      #10 B = 1;
      #10 A = 3; B = 0;
      #10 A = 2; B = 3;
      #10 S = 1;
      #10 A = 1;
      #10 B = 1;
      #10 A = 3; B = 0;
      #10 A = 2; B = 3;
	#20;
    end

endmodule
