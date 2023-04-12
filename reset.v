`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2023 21:36:14
// Design Name: 
// Module Name: reset
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


module reset(
	input [9:0]x,y,
	input en,
	output disp
);
    
    wire dispr,dispe1,disps,dispe2,dispt,dispqu;
    
	R letterr(
	   .x(x),
	   .y(y),
	   .x0(10'd280),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispr)
   );
   
   E lettere1(
	   .x(x),
	   .y(y),
	   .x0(10'd320),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispe1)
   );
   S letters(
	   .x(x),
	   .y(y),
	   .x0(10'd360),
	   .y0(10'd280),
	   .en(en),
	   .disp(disps)
   );
   
   E lettere2(
	   .x(x),
	   .y(y),
	   .x0(10'd400),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispe2)
   );
   
   T lettert(
	   .x(x),
	   .y(y),
	   .x0(10'd440),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispt)
   );
   
   question symbol(
       .x(x),
	   .y(y),
	   .x0(10'd488),
	   .y0(10'd272),
	   .en(en),
	   .disp(dispqu)
   );
   
   assign disp = dispr|dispe1|disps|dispe2|dispt|dispqu;
   
endmodule
