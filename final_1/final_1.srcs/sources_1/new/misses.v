`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2023 21:49:45
// Design Name: 
// Module Name: score_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module misses(
    input [7:0]missed,
    input [9:0]x,y,
    input en,
    output disp
    );
    
    wire check1,check0,checkm,checki,checks1,checks2,checkextra,ccheck;
    wire [3:0] sel1,sel0;
    assign sel1 = (missed/10)%10;
    assign sel0 = missed%10;
    
    num_disp dig1(
        .x(x),
        .y(y),
        .x0(10'd764),
        .y0(10'd36),
        .en(en),
        .select(sel1),
        .disp(check1)
    );
    
    num_disp dig0(
        .x(x),
        .y(y),
        .x0(10'd780),
        .y0(10'd36),
        .en(en),
        .select(sel0),
        .disp(check0)
    );
    
    num_disp dig_extra(
        .x(x),
        .y(y),
        .x0(10'd748),
        .y0(10'd36),
        .en(en),
        .select(2'b00),
        .disp(checkextra)
    );
    
    Ms letterM(
        .x(x),
        .y(y),
        .x0(10'd632),
        .y0(10'd36),
        .en(en),
        .disp(checkm)
    );
    
    Is letteri(
        .x(x),
        .y(y),
        .x0(10'd656),
        .y0(10'd36),
        .en(en),
        .disp(checki)
    );
    
    Ss letters1(
        .x(x),
        .y(y),
        .x0(10'd664),
        .y0(10'd36),
        .en(en),
        .disp(checks1)
    );
    
    Ss letters2(
        .x(x),
        .y(y),
        .x0(10'd684),
        .y0(10'd36),
        .en(en),
        .disp(checks2)
    );
    
    colon cs(
        .x(x),
        .y(y),
        .x0(10'd704),
        .y0(10'd36),
        .en(en),
        .disp(ccheck)
    );
    
    assign disp = check1|check0|checkm|checki|checks1|checks2|checkextra|ccheck;
endmodule
