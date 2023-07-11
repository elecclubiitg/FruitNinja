`timescale 1ns / 1ps

module M(
	input [9:0]x,y,x0,y0,
	input en,
	output disp
);

	wire [2:0] x_diff,y_diff;
	wire check;
	
	assign x_diff = x[5:3] - x0[5:3];
	assign y_diff = y[5:3] - y0[5:3];	
	
	assign check = (x>x0 && y>y0 && x < (x0 + 10'b0000101000) && y < (y0 + 10'b0000101000))?(~x_diff[0]&~x_diff[1])|(~x_diff[0]&y_diff[1]&~y_diff[0])|(x_diff[0]&~y_diff[1]&y_diff[0]):0;

    assign disp = check&en;
		
endmodule