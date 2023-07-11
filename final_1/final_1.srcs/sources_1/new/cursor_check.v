`timescale 1ns / 1ps

module cursor_check(
	input [9:0] x0, y0, x, y,
	input en,
	output check
);

	wire [9:0]w1;
  wire [9:0]w2;
  wire [9:0]w3;
  wire [9:0]w4;
  wire w5,w6;
	wire [9:0]w7;
  wire [9:0]w8;
  wire w9;
	
	assign w1 = (x0 < 10'b0000001000)?10'b0000000000:x0 - 10'b0000001000;
	assign w2 = (y0 < 10'b0000001000)?10'b0000000000:y0 - 10'b0000001000;
	assign w3 = x0 + 10'b0000001000;
	assign w4 = y0 + 10'b0000001000;
	
	assign w7 = (x>x0)?x-x0:x0-x;
	assign w8 = (y>y0)?y-y0:y0-y;
	assign w9 = w7==w8;
	
	assign w5 = (x>w1)&&(x<w3);
	assign w6 = (y>w2)&&(y<w4);
	
	assign check = w5&&w6&&w9&&en;	

endmodule