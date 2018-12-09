`timescale 1ns / 1ps

module exptest();

reg aclk;
reg ivalid;
reg [31:0] idata;
wire ovalid;
wire [31:0] odata;

floating_point_0 DUT (
     .aclk(aclk),                                // input wire aclk
     .s_axis_a_tvalid(ivalid),  // input wire s_axis_phase_tvalid
     .s_axis_a_tdata(idata),    // input wire [31 : 0] s_axis_phase_tdata
     .m_axis_result_tvalid(ovalid),    // output wire m_axis_dout_tvalid
     .m_axis_result_tdata(odata)      // output wire [31 : 0] m_axis_dout_tdata
   );  
   initial 
        begin
        aclk = 0;
        idata = 0;
        ivalid = 0;
        repeat(12)
            #5 aclk = ~aclk;
        //this is simulating e^(766/26) because vbe is about 766 mV in example
        ivalid = 1; idata = 32'h0x41ebb13b;  //32'h3f800000; this is 1
        #5
        aclk = ~aclk;
        #5 aclk = ~aclk;
        ivalid = 0;
        forever #5 aclk = ~aclk;
   end
endmodule
