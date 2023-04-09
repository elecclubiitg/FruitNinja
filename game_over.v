module game_over(
	input [9:0]x,y,
	input en,
	output disp
);
    
    wire dispg,dispa,dispm,dispe1,dispo,dispv,dispe2,dispr;
    
	G letterg(
	   .x(x),
	   .y(y),
	   .x0(10'd320),
	   .y0(10'd256),
	   .en(en),
	   .disp(dispg)
   );
	   
    A lettera(
	   .x(x),
	   .y(y),
	   .x0(10'd360),
	   .y0(10'd256),
	   .en(en),
	   .disp(dispa)
   );
   
    M letterm(
	   .x(x),
	   .y(y),
	   .x0(10'd400),
	   .y0(10'd256),
	   .en(en),
	   .disp(dispm)
   );
	   
    E lettere1(
	   .x(x),
	   .y(y),
	   .x0(10'd448),
	   .y0(10'd256),
	   .en(en),
	   .disp(dispe1)
   ); 
   
   O lettero(
	   .x(x),
	   .y(y),
	   .x0(10'd320),
	   .y0(10'd304),
	   .en(en),
	   .disp(dispo)
   );    
   
   V letterv(
	   .x(x),
	   .y(y),
	   .x0(10'd360),
	   .y0(10'd304),
	   .en(en),
	   .disp(dispv)
   );    
   
   E lettere2(
	   .x(x),
	   .y(y),
	   .x0(10'd408),
	   .y0(10'd304),
	   .en(en),
	   .disp(dispe2)
   );    
   
   R letterr(
	   .x(x),
	   .y(y),
	   .x0(10'd448),
	   .y0(10'd304),
	   .en(en),
	   .disp(dispr)
   ); 
   
   assign disp = dispg|dispa|dispm|dispe1|dispv|dispo|dispe2|dispr;
         
endmodule