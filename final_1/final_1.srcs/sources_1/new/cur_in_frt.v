`timescale 1ns / 1ps

module curs_in_frt(
	input [9:0] x0,		//Centre of Fruit
	input [9:0] y0,		//Centre of Fruit
	input [9:0] x,		//Co-ordinate to be tested
	input [9:0] y,		//Co-ordinate to be tested
	input [1:0] choice,	//Fruit choice
	input en,			//ENABLE
	input clk,			//CLOCK
	output reg ch	    //cursor is in fruit
	
);

	reg [9:0] xt;
	reg [9:0] yt;
	reg [9:0] int_x;
	reg [9:0] int_y;

	always @ (posedge clk)
	begin
	
    int_x = (x > x0) ? x - x0 : x0 - x ;
	int_y = y - y0 + 10'b0000010000 ;
	xt = {1'b0,int_x[9:1]};
	yt = {1'b0,int_y[9:1]};
	
	case (choice)

	2'b00:	//ORANGE
		begin
		case (yt) 
			10'd00 : ch = (xt < 10'd4) ? 1'b1 : 1'b0 ; 
			10'd01 : ch = (xt < 10'd7) ? 1'b1 : 1'b0 ;
			10'd02 : ch = (xt < 10'd9) ? 1'b1 : 1'b0 ; 
			10'd03 : ch = (xt < 10'd11) ? 1'b1 : 1'b0 ;
			10'd04 : ch = (xt < 10'd12) ? 1'b1 : 1'b0 ; 
			10'd05 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ;
			10'd06 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ; 
			10'd07 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ;
			10'd08 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ; 
			10'd09 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ;
			10'd10 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ; 
			10'd11 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ;
			10'd12 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ; 
			10'd13 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ;
			10'd14 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ; 
			10'd15 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ;
			10'd16 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ; 
			10'd17 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ;
			10'd18 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ; 
			10'd19 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ;
			10'd20 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ; 
			10'd21 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ;
			10'd22 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ; 
			10'd23 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ;
			10'd24 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ; 
			10'd25 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ;
			10'd26 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ; 
			10'd27 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ;
			10'd28 : ch = (xt < 10'd12) ? 1'b1 : 1'b0 ; 
			10'd29 : ch = (xt < 10'd11) ? 1'b1 : 1'b0 ;
			10'd30 : ch = (xt < 10'd9) ? 1'b1 : 1'b0 ; 
			10'd31 : ch = (xt < 10'd7) ? 1'b1 : 1'b0 ;
			10'd32 : ch = (xt < 10'd4) ? 1'b1 : 1'b0 ;
			default: ch = 0 ;
		endcase
		end
        //orange case end
	2'b01:	//APPLE
		begin 
		case (yt) 
			10'd00 : ch = (xt == 10'd0) ? 1'b1 : 1'b0 ; 
			10'd01 : ch = (xt == 10'd0) ? 1'b1 : 1'b0 ;
			10'd02 : ch = (xt == 10'd0 || (xt > 10'd4 && xt < 10'd14)) ? 1'b1 : 1'b0 ; 
			10'd03 : ch = (xt == 10'd0 || (xt > 10'd2 && xt < 10'd15)) ? 1'b1 : 1'b0 ;
			10'd04 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ; 
			10'd05 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ;
			10'd06 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ; 
			10'd07 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ;
			10'd08 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ; 
			10'd09 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ;
			10'd10 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ; 
			10'd11 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ;
			10'd12 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ; 
			10'd13 : ch = (xt < 10'd17) ? 1'b1 : 1'b0 ;
			10'd14 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ; 
			10'd15 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ;
			10'd16 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ; 
			10'd17 : ch = (xt < 10'd16) ? 1'b1 : 1'b0 ;
			10'd18 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ; 
			10'd19 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ;
			10'd20 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ; 
			10'd21 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ;
			10'd22 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ; 
			10'd23 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ;
			10'd24 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ; 
			10'd25 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ;
			10'd26 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ; 
			10'd27 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ;
			10'd28 : ch = (xt < 10'd12) ? 1'b1 : 1'b0 ; 
			10'd29 : ch = (xt > 10'd1 && xt < 10'd12) ? 1'b1 : 1'b0 ;
			10'd30 : ch = (xt > 10'd1 && xt < 10'd12) ? 1'b1 : 1'b0 ; 
			10'd31 : ch = (xt > 10'd2 && xt < 10'd11) ? 1'b1 : 1'b0 ;
			10'd32 : ch = (xt > 10'd4 && xt < 10'd10) ? 1'b1 : 1'b0 ; 
			default: ch = 0 ;
		endcase
		end
	    //apple case end
	2'b10:	//POMEGRANATE
		begin 
		case (yt) 
			10'd00 : ch = (xt == 10'd0) ? 1'b1 : 1'b0 ; 
			10'd01 : ch = (xt == 10'd4 || xt < 10'd2) ? 1'b1 : 1'b0 ;
			10'd02 : ch = (xt < 10'd2 || (xt > 10'd2 && xt < 10'd5)) ? 1'b1 : 1'b0 ; 
			10'd03 : ch = (xt < 10'd5) ? 1'b1 : 1'b0 ;
			10'd04 : ch = (xt < 10'd5) ? 1'b1 : 1'b0 ; 
			10'd05 : ch = (xt < 10'd4) ? 1'b1 : 1'b0 ;
			10'd06 : ch = (xt < 10'd4) ? 1'b1 : 1'b0 ; 
			10'd07 : ch = (xt < 10'd5) ? 1'b1 : 1'b0 ;
			10'd08 : ch = (xt < 10'd8) ? 1'b1 : 1'b0 ; 
			10'd09 : ch = (xt < 10'd10) ? 1'b1 : 1'b0 ;
			10'd10 : ch = (xt < 10'd11) ? 1'b1 : 1'b0 ; 
			10'd11 : ch = (xt < 10'd12) ? 1'b1 : 1'b0 ;
			10'd12 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ; 
			10'd13 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ;
			10'd14 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ; 
			10'd15 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ;
			10'd16 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ; 
			10'd17 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ;
			10'd18 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ; 
			10'd19 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ;
			10'd20 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ; 
			10'd21 : ch = (xt < 10'd15) ? 1'b1 : 1'b0 ;
			10'd22 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ; 
			10'd23 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ;
			10'd24 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ; 
			10'd25 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ;
			10'd26 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ; 
			10'd27 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ;
			10'd28 : ch = (xt < 10'd12) ? 1'b1 : 1'b0 ; 
			10'd29 : ch = (xt < 10'd12) ? 1'b1 : 1'b0 ;
			10'd30 : ch = (xt < 10'd11) ? 1'b1 : 1'b0 ; 
			10'd31 : ch = (xt < 10'd9) ? 1'b1 : 1'b0 ;
			10'd32 : ch = (xt < 10'd6) ? 1'b1 : 1'b0 ;
			default: ch = 0 ;
		endcase
		end
        //pomegranate case end
	2'b11:	//PEAR
		begin
		case (yt) 
			10'd00 : ch = (xt == 10'd0) ? 1'b1 : 1'b0 ; 
			10'd01 : ch = (xt == 10'd0) ? 1'b1 : 1'b0 ;
			10'd02 : ch = (xt == 10'd0) ? 1'b1 : 1'b0 ; 
			10'd03 : ch = (xt < 10'd3) ? 1'b1 : 1'b0 ;
			10'd04 : ch = (xt < 10'd5) ? 1'b1 : 1'b0 ; 
			10'd05 : ch = (xt < 10'd6) ? 1'b1 : 1'b0 ;
			10'd06 : ch = (xt < 10'd7) ? 1'b1 : 1'b0 ; 
			10'd07 : ch = (xt < 10'd7) ? 1'b1 : 1'b0 ;
			10'd08 : ch = (xt < 10'd7) ? 1'b1 : 1'b0 ; 
			10'd09 : ch = (xt < 10'd7) ? 1'b1 : 1'b0 ;
			10'd10 : ch = (xt < 10'd8) ? 1'b1 : 1'b0 ; 
			10'd11 : ch = (xt < 10'd8) ? 1'b1 : 1'b0 ;
			10'd12 : ch = (xt < 10'd9) ? 1'b1 : 1'b0 ; 
			10'd13 : ch = (xt < 10'd11) ? 1'b1 : 1'b0 ;
			10'd14 : ch = (xt < 10'd12) ? 1'b1 : 1'b0 ; 
			10'd15 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ;
			10'd16 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ; 
			10'd17 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ;
			10'd18 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ; 
			10'd19 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ;
			10'd20 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ; 
			10'd21 : ch = (xt < 10'd14) ? 1'b1 : 1'b0 ;
			10'd22 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ; 
			10'd23 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ;
			10'd24 : ch = (xt < 10'd13) ? 1'b1 : 1'b0 ; 
			10'd25 : ch = (xt < 10'd12) ? 1'b1 : 1'b0 ;
			10'd26 : ch = (xt < 10'd12) ? 1'b1 : 1'b0 ; 
			10'd27 : ch = (xt < 10'd11) ? 1'b1 : 1'b0 ;
			10'd28 : ch = (xt < 10'd10) ? 1'b1 : 1'b0 ; 
			10'd29 : ch = (xt < 10'd9) ? 1'b1 : 1'b0 ;
			10'd30 : ch = (xt < 10'd7) ? 1'b1 : 1'b0 ; 
			10'd31 : ch = (xt < 10'd5) ? 1'b1 : 1'b0 ;
			10'd32 : ch = (xt < 10'd2) ? 1'b1 : 1'b0 ; 
			default: ch = 0 ;
		endcase
		end
        //pear case end
	endcase
	end   
		
endmodule // FRUIT_CHECK