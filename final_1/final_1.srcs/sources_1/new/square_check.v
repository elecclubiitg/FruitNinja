module square_check(
	input [9:0] x0,
	input [9:0] y0,
	input [9:0] x,
	input [9:0] y,
	input en,
	output check
);

  wire [9:0]w1;
  wire [9:0]w2;
  wire [9:0]w3;
  wire [9:0]w4;
  wire w5,w6;
	
    assign w1 = (x0 < 10'b0000010000)?10'b0000000000:x0 - 10'b0000010000;
    assign w2 = (y0 < 10'b0000010000)?10'b0000000000:y0 - 10'b0000010000;
	assign w3 = x0 + 10'b0000010000;
	assign w4 = y0 + 10'b0000010000;
	
	assign w5 = (x>w1)&&(x<w3);
	assign w6 = (y>w2)&&(y<w4);
	
	assign check = w5&&w6&&en;	

endmodule