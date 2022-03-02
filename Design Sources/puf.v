`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2021 12:22:45
// Design Name: 
// Module Name: puf
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


module arbiter_puf #
( parameter le = 128 )
(
input in_X ,
input in_Y ,
input [ le -1:0] chal ,
output out_Q1,out_Q2 
) ;
wire [ le -1:0] A ;
wire [ le -1:0] B ;
mux4x2 loop0 (. A ( in_X ) ,
. B ( in_Y ) ,
. c ( chal [0]) ,
. X ( A [0]) ,
. Y ( B [0])
) ;
genvar i ;
generate
    for ( i = 1; i < le ; i = i + 1)
    begin : loop
        mux4x2 inst (. A ( A [i -1]) ,
        . B ( B [i -1]) ,
        . c ( chal [ i ]) ,
        . X ( A [ i ]) ,
        . Y ( B [ i ])
        ) ;
    end
endgenerate
flipflop FF1( A [127] , B [127] , out_Q1 ) ;
flipflop FF2( A [127] , B [127] , out_Q2)  ;
endmodule
