`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2021 12:39:44
// Design Name: 
// Module Name: shift_reg
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


module shift_reg
#(parameter le=128)(
input fsr_in,
input clk ,
input en ,
output reg [le-1:0] chal
    );
    always @(posedge clk)
        begin
        if(en)
            chal = chal << 1;
            chal[0] = fsr_in;
        end
endmodule
