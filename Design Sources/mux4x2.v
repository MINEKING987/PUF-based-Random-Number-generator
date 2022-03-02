`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2021 12:18:51
// Design Name: 
// Module Name: mux4x2
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


module mux4x2 (
input A , B , c ,
output X , Y ) ;

wire xg , yg /* synthesis keep */;

mux2x1 M1 (A , B , c , xg ) ;
mux2x1 M2 (B , A , c , yg ) ;
assign X = xg ;
assign Y = yg ;
endmodule


module mux2x1 (
input j , k , s ,
output m ) ;

wire sg ;
wire jg , kg ;

not ( sg , s ) ;
and ( jg , j , sg ) ;
and ( kg , k , s ) ;
or(m , jg , kg ) ;
endmodule

