`timescale 1ns / 1ps
module rng(
  output reg [4:0] curr_num, stored_increment, stored_modulo,
  output reg [4:0] stored_multiplier,
  output reg start= 1'b0,
  input [4:0] seed, modulo, increment,
  input [4:0] multiplier,
  input clock, reset
);
  
  always@(posedge clock)
    begin
      if(!start)
        start<= ~start;
      curr_num<= ((stored_multiplier*curr_num)+stored_increment)%stored_modulo;
    end
  
  always@(posedge reset, posedge start)
    begin
      stored_increment<= increment;
      stored_multiplier<= multiplier;
      stored_increment<= increment;
      stored_modulo<= modulo;
      curr_num<= seed;
    end
  
endmodule
