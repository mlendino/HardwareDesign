`timescale 1ns / 1ps


module ROMmultiply(
    ROM_output,
    ROM_input);
    
    input[3:0]ROM_input;
    output[3:0]ROM_output;
    //defining 16x4 ROM, making a ROM with 4 bit address, 
    //2 inputs, 2 bits each, output will be the two inputs multiplied
    reg[3:0]ROM[15:0];
    //reading ROM content at the address ROM_input
    assign ROM_output = ROM[ROM_input];
    //load ROM content from ROMdata.txt file
    //whatever we put in this file will be what the FPGA puts in the ROM
    //since we are doing two bit by two bit multiplication, the largest
    //number we achieve with two bits is 3 so the we need only go to 9
    //after multiplication
    //$readmemb("data_bin_file", memory_identifier, begin_address, end_address);
    initial $readmemb("ROMdata.txt",ROM,0,15);
    
endmodule
