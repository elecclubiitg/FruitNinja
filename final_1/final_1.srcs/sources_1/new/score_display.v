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


module score_display(
    input [9:0]score,
    input [9:0]x,y,
    input en,
    output disp
    );
    
    wire check1,check2,check3,checks,checkc,checko,checkr,checke,ccheck;
    wire [3:0] sel2,sel1,sel0;
    assign sel2 = (score/100)%10;
    assign sel1 = (score/10)%10;
    assign sel0 = score%10;
    
    num_disp dig2(
        .x(x),
        .y(y),
        .x0(10'd748),
        .y0(10'd8),
        .en(en),
        .select(sel2),
        .disp(check1)
    );
    
    num_disp dig1(
        .x(x),
        .y(y),
        .x0(10'd764),
        .y0(10'd8),
        .en(en),
        .select(sel1),
        .disp(check2)
    );
    
    num_disp dig0(
        .x(x),
        .y(y),
        .x0(10'd780),
        .y0(10'd8),
        .en(en),
        .select(sel0),
        .disp(check3)
    );
    
    Ss letters(
        .x(x),
        .y(y),
        .x0(10'd632),
        .y0(10'd8),
        .en(en),
        .disp(checks)
    );
    
    Cs letterc(
        .x(x),
        .y(y),
        .x0(10'd652),
        .y0(10'd8),
        .en(en),
        .disp(checkc)
    );
    
    Os lettero(
        .x(x),
        .y(y),
        .x0(10'd672),
        .y0(10'd8),
        .en(en),
        .disp(checko)
    );
    
    Rs letterr(
        .x(x),
        .y(y),
        .x0(10'd692),
        .y0(10'd8),
        .en(en),
        .disp(checkr)
    );
    
    Es lettere(
        .x(x),
        .y(y),
        .x0(10'd712),
        .y0(10'd8),
        .en(en),
        .disp(checke)
    );
    
    colon cs(
        .x(x),
        .y(y),
        .x0(10'd732),
        .y0(10'd8),
        .en(en),
        .disp(ccheck)
    );
    
    assign disp = check1|check2|check3|checks|checkc|checko|checkr|checke|ccheck;
endmodule
