`timescale 1ns / 1ps

module num_disp(
	input [9:0]x,y,x0,y0,
	input en,
    input [3:0]select,
	output disp
);

	wire [1:0] x_diff;
	wire [2:0] y_diff;
	wire check0,check1,check2,check3,check4,check5,check6,check7,check8,check9,check;

	assign x_diff = x[3:2] - x0[3:2];
	assign y_diff = y[4:2] - y0[4:2];	
	
	assign check0 = (x>=x0 && y>=y0 && x < (x0 + 10'd12) && y < (y0 + 10'd20))?(~x_diff[0])|(~y_diff[1]&~y_diff[0]):0; //done
    assign check1 = (x>=x0 && y>=y0 && x < (x0 + 10'd12) && y < (y0 + 10'd20))?(~x_diff[0]&x_diff[1]):0;                //done
    assign check2 = (x>=x0 && y>=y0 && x < (x0 + 10'd12) && y < (y0 + 10'd20))?(~x_diff[0]&~x_diff[1]&y_diff[1])|(x_diff[1]&~y_diff[1])|~y_diff[0]:0;   //done
    assign check3 = (x>=x0 && y>=y0 && x < (x0 + 10'd12) && y < (y0 + 10'd20))?(~x_diff[0]&x_diff[1])|~y_diff[0]:0;     //done
    assign check4 = (x>=x0 && y>=y0 && x < (x0 + 10'd12) && y < (y0 + 10'd20))?(x_diff[1])|(y_diff[1]&~y_diff[0])|(~x_diff[0]&~y_diff[2]&~y_diff[1]):0; //done
    assign check5 = (x>=x0 && y>=y0 && x < (x0 + 10'd12) && y < (y0 + 10'd20))?(~x_diff[0]&~x_diff[1]&~y_diff[1])|(x_diff[1]&y_diff[1])|~y_diff[0]:0;   //done
    assign check6 = (x>=x0 && y>=y0 && x < (x0 + 10'd12) && y < (y0 + 10'd20))?(~x_diff[0]&~x_diff[1])|(~x_diff[0]&y_diff[1])|~y_diff[0]:0;             //done
    assign check7 = (x>=x0 && y>=y0 && x < (x0 + 10'd12) && y < (y0 + 10'd20))?(~x_diff[0]&x_diff[1])|(~y_diff[2]&~y_diff[1]&~y_diff[0]):0; //done
    assign check8 = (x>=x0 && y>=y0 && x < (x0 + 10'd12) && y < (y0 + 10'd20))?(~x_diff[0])|~y_diff[0]:0;               //done
    assign check9 = (x>=x0 && y>=y0 && x < (x0 + 10'd12) && y < (y0 + 10'd20))?(~x_diff[0]&~y_diff[2]&~y_diff[1])|(~y_diff[2]&~y_diff[0])|x_diff[1]:0;  //done
    
    assign check = (check0&~select[3]&~select[2]&~select[1]&~select[0])|(check1&~select[3]&~select[2]&~select[1]&select[0])|(check2&~select[3]&~select[2]&select[1]&~select[0])|(check3&~select[3]&~select[2]&select[1]&select[0])|(check4&~select[3]&select[2]&~select[1]&~select[0])|(check5&~select[3]&select[2]&~select[1]&select[0])|(check6&~select[3]&select[2]&select[1]&~select[0])|(check7&~select[3]&select[2]&select[1]&select[0])|(check8&select[3]&~select[2]&~select[1]&~select[0])|(check9&select[3]&~select[2]&~select[1]&select[0]);
    
    assign disp = check&en;
endmodule

