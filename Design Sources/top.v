`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2021 13:13:02
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top #( parameter le = 128 )(
input initial_vector,load,clock,en,
output rnd,valid
    );
    wire prim_update_fun;
    wire mux1_to_mux2,mux2_to_sfr,puf_out2;
    wire [le-1:0]chal;
    
    assign prim_update_fun = chal[le-1]^chal[le-3]^chal[le-28]^chal[le-30]^1'b1;
    
    arbiter_puf main_puf(.in_X(clock),.in_Y(clock),.chal(chal),.out_Q1(rnd),.out_Q2(puf_out2));
    
    shift_reg main_reg(.fsr_in(mux2_to_sfr),.clk(clock),.en(en),.chal(chal));
    
    xnor valid_chk(valid,puf_out2,rnd);
    
    mux2x1 mux1(prim_update_fun,puf_out2,valid,mux1_to_mux2);
    mux2x1 mux2(initial_vector,mux1_to_mux2,load,mux2_to_sfr);
    
endmodule
