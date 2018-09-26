`timescale 1ns / 1ps
//Define testbench module
module testBench;
//inputs (use regs or registers)
reg [3:0] swt;
//outputs use wires
wire F;
integer i;
reg e_output;
//instantiate the device/module under test (DUT)
//assigning input A to register
project2 ttul(.A(swt[3]),.B(swt[2]),.C(swt[1]),.D(swt[0]),.F(F));
//Defome the same module functionality for the expected value computation
function expected_led;
    input [3:0] switch;
    begin
        expected_led = switch[3] & switch[2] & (switch[1] | switch[0]);
    end
endfunction
//Define the stimuli generation and compare with the expected output
//Initial blocks occurs only at once at time zero
initial
begin
    //going from 0 to 16 in binary like ABCD is 0000 and so on... addressing individual bits
    for (i=0; i < 16; i=i+1)
    begin
    //after 50 units of time, set swt to i (changing the input every 50 units of time and then calculate output)
    #50 swt=i;
    //after 10 units of time calculate the output, and output takes in a register
    #10 e_output = expected_led(swt);
    //the $display task will print the message in the simulator console window when the simulation is run
    if (F == e_output)
        $display("LED output matched at %t\n", $time);
    else
        $display("LED output mis-matched at %t, expected %b, actual %b\n", $time, e_output, F);
    end
    
  end
  
endmodule
