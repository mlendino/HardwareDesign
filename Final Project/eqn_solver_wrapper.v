`timescale 1ns / 1ps


module eqn_solver_wrapper(
    input data,
    input data_in_enable,
    input load_clk,
    output reg data_out,
    output data_out_ready,
    input data_out_query,
    input clk
    );
    
    reg [9:0] i;
    reg [9:0] i_1;
    reg start;
    reg [319:0] data_reg; 
    
    wire [63:0] Vbe_final;
    wire [63:0] Ic_final;
    
    eqn_solver eqn_s(
        data_reg[63:0],
        data_reg[127:64],
        data_reg[191:128],
        data_reg[255:192],
        data_reg[319:256],
        start,
        clk,
        Vbe_final,
        Ic_final,
        data_out_ready
        );
    
    initial begin
        i = 0;
        i_1 = 0;
        start = 0;
    end
    
    always @(posedge load_clk) begin
        if(data_in_enable) begin
            data_reg[i] = data;
            i = i + 1;
        end
        
        else begin
            i = 0;
        end
        
        if(i == 320) begin
            start = 1;
        end
    end
    
    always @(posedge data_out_query) begin
        if(i_1 < 64)
            data_out = Vbe_final[i_1];
        else if(i_1 < 128)
            data_out = Ic_final[i_1-64];
        else
            data_out = 0;
            
        i_1 = i_1 + 1;
    end
    
endmodule
