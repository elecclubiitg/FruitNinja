`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 23:57:25
// Design Name: 
// Module Name: congrats
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


module congrats(
	input [9:0]x,y,
	input en,
	output disp
);
    
    wire dispc,dispo,dispn,dispg,dispr,dispa,dispt,disps;
    
	C letterc(
	   .x(x),
	   .y(y),
	   .x0(10'd240),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispc)
   );
	   
    O lettero(
	   .x(x),
	   .y(y),
	   .x0(10'd280),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispo)
   );
   
    N lettern(
	   .x(x),
	   .y(y),
	   .x0(10'd320),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispn)
   );
	   
    G letterg(
	   .x(x),
	   .y(y),
	   .x0(10'd368),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispg)
   ); 
   
   R letterr(
	   .x(x),
	   .y(y),
	   .x0(10'd408),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispr)
   );    
   
   A lettera(
	   .x(x),
	   .y(y),
	   .x0(10'd448),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispa)
   );    
   
   T letteret(
	   .x(x),
	   .y(y),
	   .x0(10'd488),
	   .y0(10'd280),
	   .en(en),
	   .disp(dispt)
   );    
   
   S letters(
	   .x(x),
	   .y(y),
	   .x0(10'd536),
	   .y0(10'd280),
	   .en(en),
	   .disp(disps)
   ); 
   
   assign disp = dispc|dispo|dispn|dispg|dispr|dispa|dispt|disps;
         
endmodule
