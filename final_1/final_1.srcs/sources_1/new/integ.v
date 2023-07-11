`timescale 1ns / 1ps

module integ(
output [7:0] en,
output [6:0] dig,
output [11:0] RGB,
output reg dp=1,
output h_sync, v_sync,
input clock, on, pause, res, a1p, a1n, a2p, a2n, rst, med, hard, xhard
);
wire ck, clk, ac1, ac2, ac3, v_disp, h_disp, fr1, fr2, fr3, cur, rs1, rs2, rs3, go, max, fr,
on2, on3, d1, d2, d3, cong, over, numdisp,missdisp;
wire [1:0] level, levelf;
wire [10:0] xf1, yf1, xf2, yf2, xf3, yf3, xp;
wire [9:0] yp, xc, yc, score;
wire [7:0] missed;
wire [4:0] x01, theta1, x02, theta2, x03, theta3;
wire [3:0] x_joy, y_joy;
wire [11:0] fruit1_color,fruit2_color,fruit3_color;

clk_40M genck(.clk_out1(ck), .clk_in1(clock));
scoreck corek(ck, 0, sck);
disp_sync syncpix(ck, 1'b0, v_sync, h_sync, v_disp, h_disp, yp, xp);

assign on3= on &  ~res;

joystick_ADC converter(x_joy, y_joy, rst, ck, a1p, a1n, a2p, a2n);

rng_1 xgen1(x01, rs1, 1'b0, ck, on3);
rng_5 thetagen1(theta1, rs1, 1'b0, ck, on3);
rng_16 xgen2(x02, rs2, 1'b0, ck, on3);
rng_20 thetagen2(theta2, rs2, 1'b0, ck, on3);
rng_25 xgen3(x03, rs3, 1'b0, ck, on3);
rng_28 thetagen3(theta3, rs3, 1'b0, ck, on3);

assign clk= v_disp & (~pause);

coord fruit1(xf1, yf1, ac1, x01, theta1, ck, clk, med, hard, xhard, rs1, on3);
coord fruit2(xf2, yf2, ac2, x02, theta2, ck, clk, med, hard, xhard, rs2, on3);
coord fruit3(xf3, yf3, ac3, x03, theta3, ck, clk, med, hard, xhard, rs3, on3);
cursor_update cursor(xc, yc, x_joy, y_joy, ck, clk, on3);
bold_cur crck(xc, yc, xp[9:0], yp, on3, cur);
curs_in_frt ch1(xf1[9:0], yf1[9:0], xc, yc, {x01[3], x01[0]}, ac1, ck, d1);
curs_in_frt ch2(xf2[9:0], yf2[9:0], xc, yc, {x02[3], x02[0]}, ac2, ck, d2);
curs_in_frt ch3(xf3[9:0], yf3[9:0], xc, yc, {x03[3], x03[0]}, ac3, ck, d3);
control main(score, missed, level, rs1, rs2, rs3, go, max, d1, d2, d3, ac1, ac2, ac3,
 on3, ck, clk);

fruit_check fruitdisp1(xf1[9:0], yf1[9:0], xp[9:0], yp, {x01[3], x01[0]}, ac1, ck, 
fruit1_color);
fruit_check fruitdisp2(xf2[9:0], yf2[9:0], xp[9:0], yp, {x02[3], x02[0]}, ac2, ck, 
fruit2_color);
fruit_check fruitdisp3(xf3[9:0], yf3[9:0], xp[9:0], yp, {x03[3], x03[0]}, ac3, ck, 
fruit3_color);

score_display sd(score, xp[9:0], yp, on, numdisp);
misses ms(missed, xp[9:0], yp, on, missdisp);

assign levelf= level+1;
assign on2= on | pause | res;

diggen numgen(en, dig, on2, sck, ck, levelf, missed, score);
game_over gotext(xp[9:0], yp, on2, over);
congrats maxtext(xp[9:0], yp, on2, cong);

wire numberdisp;
assign numberdisp = numdisp|missdisp;
wire go_en;
assign go_en = ~max&go;

color_display to_display(fruit1_color, fruit2_color, fruit3_color, cur, numberdisp, over, cong, go_en, max, v_disp,
h_disp, on, ck, med, hard, xhard, RGB);

endmodule