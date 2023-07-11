module game_over(
	input [9:0]x,y,
	input en,
	output disp
);
    
    wire dispg,dispa,dispm,dispe1,dispo,dispv,dispe2,dispr;
    
	G letterg(x,y,10'd320,10'd256,en,dispg); 
    A lettera(x,y,10'd360,10'd256,en,dispa);
    M letterm(x,y,10'd400,10'd256,en,dispm);  
    E lettere1(x,y,10'd448,10'd256,en,dispe1); 
    O lettero(x,y,10'd320,10'd304,en,dispo);    
    V letterv(x,y,10'd360,10'd304,en,dispv);    
    E lettere2(x,y,10'd408,10'd304,en,dispe2);    
    R letterr(x,y,10'd448,10'd304,en,dispr); 
   
   assign disp = dispg|dispa|dispm|dispe1|dispv|dispo|dispe2|dispr;
         
endmodule