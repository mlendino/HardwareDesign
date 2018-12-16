`timescale 1ns / 1ps

module eqn_solver(
    input [63:0] Beta,
    input [63:0] I_s,
    input [63:0] Rthev,
    input [63:0] Vt,
    input [63:0] Vthev,
    input enable,
    input clk,
    output reg [63:0] Vbe_final,
    output reg [63:0] Ic_final,
    output reg output_valid
    );
    
    
     //internal control variables
           reg aclk;
           reg [63:0] step;
           reg step_valid;      
           reg [63:0] Ic;
           wire [63:0] Ic_out;
           wire Ic_out_valid;
           
           wire [63:0] error;
           wire error_valid;
           
           reg [63:0] Ic_temp;
           
           wire [7:0] add_operation;
           wire add_op_valid;
           reg Ic_valid;
           
           reg div_control;
           wire div_valid;
           wire [63:0] step_next;
           
           wire [7:0] end_condition;
           reg vbe_control;
           wire [63:0] Vbe;
           wire Vbe_valid;
           
           reg [12:0] i;
           wire gt_valid;
           
           localparam await_input = 0;
           localparam calc_start = 1;
           localparam calc_wait = 2;
           localparam set_output = 3;
           localparam done = 4;
           
           reg [3:0] state;
       
           design_1_wrapper DUT(Beta,
               I_s,
               Ic,
               Rthev,
               Vt,
               Vthev,
               clk,
               Ic_valid,
               error,
               error_valid);
               
           add_sub fp_0 (
                 .aclk(clk),                                        // input wire aclk
                 .s_axis_a_tvalid(Ic_valid),                  // input wire s_axis_a_tvalid
                 .s_axis_a_tdata(Ic),                    // input wire [63 : 0] s_axis_a_tdata
                 .s_axis_b_tvalid(step_valid),                  // input wire s_axis_b_tvalid
                 .s_axis_b_tdata(step),                    // input wire [63 : 0] s_axis_b_tdata
                 .s_axis_operation_tvalid(add_op_valid),  // input wire s_axis_operation_tvalid
                 .s_axis_operation_tdata(add_operation),    // input wire [7 : 0] s_axis_operation_tdata ,add is 0, subtract is 1
                 .m_axis_result_tvalid(Ic_out_valid),        // output wire m_axis_result_tvalid
                 .m_axis_result_tdata(Ic_out)          // output wire [63 : 0] m_axis_result_tdata
               );
           greater_then fp_1 (
                 .aclk(clk),                                  // input wire aclk
                 .s_axis_a_tvalid(error_valid),            // input wire s_axis_a_tvalid
                 .s_axis_a_tdata(error),              // input wire [63 : 0] s_axis_a_tdata
                 .s_axis_b_tvalid(1'b1),            // input wire s_axis_b_tvalid
                 .s_axis_b_tdata(64'b0),              // input wire [63 : 0] s_axis_b_tdata
                 .m_axis_result_tvalid(add_op_valid),  // output wire m_axis_result_tvalid
                 .m_axis_result_tdata(add_operation)    // output wire [7 : 0] m_axis_result_tdata
               );
               
           div div1 (
                 .aclk(clk),                                  // input wire aclk
                 .s_axis_a_tvalid(step_valid),            // input wire s_axis_a_tvalid
                 .s_axis_a_tdata(step),              // input wire [63 : 0] s_axis_a_tdata
                 .s_axis_b_tvalid(div_control),            // input wire s_axis_b_tvalid
                 .s_axis_b_tdata(64'b0_10000000000_0000000000000000000000000000000000000000000000000000),              // input wire [63 : 0] s_axis_b_tdata
                 .m_axis_result_tvalid(div_valid),  // output wire m_axis_result_tvalid
                 .m_axis_result_tdata(step_next)    // output wire [63 : 0] m_axis_result_tdata
               );
           greater_then fp_2 (
                 .aclk(clk),                                  // input wire aclk
                 .s_axis_a_tvalid(step_valid),            // input wire s_axis_a_tvalid
                 .s_axis_a_tdata(step),              // input wire [63 : 0] s_axis_a_tdata
                 .s_axis_b_tvalid(1'b1),            // input wire s_axis_b_tvalid
                 .s_axis_b_tdata(64'b0_01111010111_0001100101111001100110000001001011011110101000010001),              // input wire [63 : 0] s_axis_b_tdata
                 .m_axis_result_tvalid(gt_valid),   
                 .m_axis_result_tdata(end_condition)    // output wire [7 : 0] m_axis_result_tdata
               );
               
               
           Vbe_calculator vbe_calc (
               Beta,
               Ic,
               Rthev,
               Vthev,
               clk,
               vbe_control,
               Vbe,
               Vbe_valid
           );
           
           
           initial begin
                 state = await_input;
           end
           
           always @ (posedge clk) begin
                case(state)
                    calc_start: begin
                        step_valid = 1;
                        div_control = 0;
                        step = 64'b0_01111111111_0000000000000000000000000000000000000000000000000000;
                        Ic =     64'b0_01111101011_0000110001101111011110100000101101011110110110001101;
                        Ic_valid = 1;
                        state = calc_wait;
                    end
                    
                    calc_wait: begin
                        if(Ic_out_valid & error_valid) begin
                            Ic = Ic_out;
                            Ic_valid = 0;
                            div_control = 1;
                        end
                        
                        if(div_valid) begin
                            step = step_next;
                            div_control = 0;
                            Ic_valid = 1;
                        end
                        
                        if(!end_condition & gt_valid) begin
                            vbe_control = 1;
                            state = set_output;
                        end
                    end
                    
                    set_output: begin
                        if(Vbe_valid) begin
                            Vbe_final = Vbe;
                            Ic_final = Ic;
                            output_valid = 1;
                            state = done;
                        end
                    end
                    
                    done: begin
                        
                    end
                    
                    
                    await_input: begin
                           output_valid = 0;
                           vbe_control = 0;
                                            
                          if(enable) begin
                             state = calc_start;
                        end
                    
                    end
                    
                    default: begin
                        output_valid = 0;
                        vbe_control = 0;
                        
                        if(enable)
                            state = calc_start;
                    end
                endcase
           end
           
           /*
           always @ (posedge start) begin
               aclk = 0;
               
               
               begin: break_block
               
               repeat(1999) begin
               
               repeat(7) begin
                   #5 aclk = 1;
                   #5 aclk = 0;
               end
               
   
               //comparison
               repeat (2) begin 
                    #5 aclk = 1;
                    #5 aclk = 0;
               end
               //comparison complete
               
               //addition/subtraction
               #5 aclk = 1;
               #5 aclk = 0;
               
               #5 Ic_temp = Ic_out;
               #5 Ic_valid = 0;
               
               #5 aclk = 1;
               #5 aclk = 0;
   
               #5 Ic = Ic_temp;
               #5 Ic_valid = 1;
               
               #5 step_valid = 0;
               #5 div_control = 1;
               
               #5 aclk = 1;
               #5 aclk = 0;
               
               #5 step = step_next;
               div_control = 0;
               #5 step_valid = 1;
               
               #5 aclk = 1;
               #5 aclk = 0;
               
               if(!end_condition[0])
                    disable break_block;
                 
               end
               end           
               
               //compute vbe
               vbe_control = 1;
               repeat (3) begin
               #5 aclk = 1;
               #5 aclk = 0;
               Vbe_final = Vbe;
               Ic_final = Ic;
               output_valid = 1;
               end
           end
           */

endmodule
