`timescale 1ns / 1ps

module scoreck(
input clk, rst,
output reg sck
);
reg [9:0] v_loc;
reg [8:0] h_loc;

always @(posedge clk) begin    
  
	  if(rst)
	    h_loc <= 9'd1;
	  else if(h_loc >= 9'd264)			
        h_loc <= 9'd1;
      else
        h_loc <= h_loc + 9'd1;
	  //counter for horizontal position.
      
	  if(rst)
		v_loc <= 10'd1;
      else if(h_loc == 9'd264 && v_loc >= 10'd628)			
        v_loc <= 10'd1;
      else if(h_loc == 9'd264)
        v_loc <= v_loc + 10'd1;
      else
        v_loc <= v_loc;
	  
	  if(rst)
		sck <= 1'b1;
      if(v_loc == 10'd600)
		sck <= 1'b0;
      if(v_loc == 10'd628)
		sck <= 1'b1;
		
      end

endmodule
