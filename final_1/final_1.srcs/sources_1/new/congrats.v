`timescale 1ns / 1ps

module congrats(
	input [9:0]x,y,
	input en,
	output disp
);
    
    wire dispc,dispo,dispn,dispg,dispr,dispa,dispt,disps;
    
	C letterc(x,y,10'd240,10'd280,en,dispc);
    O lettero(x,y,10'd280,10'd280,en,dispo);
    N lettern(x,y,10'd320,10'd280,en,dispn);  
    G letterg(x,y,10'd368,10'd280,en,dispg); 
    R letterr(x,y,10'd408,10'd280,en,dispr);    
    A lettera(x,y,10'd448,10'd280,en,dispa);    
    T lettert(x,y,10'd488,10'd280,en,dispt);    
    S letters(x,y,10'd536,10'd280,en,disps); 
   
   assign disp = dispc|dispo|dispn|dispg|dispr|dispa|dispt|disps;
         
endmodule