`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2021 12:15:40
// Design Name: 
// Module Name: d_ff
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


module flipflop ( 
input Df , Cf ,
output Qf 
) ;

wire Qm ;
d_latch master ( Df , ~ Cf , Qm ) ;
d_latch slave ( Qm , Cf , Qf ) ;
endmodule


module d_latch(
input D ,
input C ,
output Q
) ;

wire R , S , Qn ;
wire R_g , S_g  /* synthesis keep */;

assign S = D ;
assign R = ~ D ;
and ( R_g , R , C ) ;
and ( S_g , S , C ) ;
nor (Q , R_g , Qn ) ;
nor ( Qn , S_g , Q ) ;
endmodule
