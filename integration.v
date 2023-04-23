`timescale 1ns / 1ps

module integ(
output [7:0] en,
output [6:0] dig,
output [11:0] RGB,
output reg dp=1,
output h_sync, v_sync,
input clock, on, pause, res, 
input [3:0] x_joy, y_joy
);
wire ck, clk, ac1, ac2, ac3, v_disp, h_disp, fr1, fr2, fr3, cur, rs1, rs2, rs3, go, max, fr, 
R, G, G2, B, B2, sck, on2, on3, d1, d2, d3, cong, over;
wire [1:0] level, levelf;
wire [10:0] xf1, yf1, xf2, yf2, xf3, yf3, xp;
wire [9:0] yp, xc, yc, score;
wire [7:0] missed;
wire [4:0] x01, theta1, x02, theta2, x03, theta3;

clk_40M genck(ck, clock);
scoreck corek(ck, 0, sck);
disp_sync syncpix(ck, 1'b0, v_sync, h_sync, v_disp, h_disp, yp, xp);

assign on3= on &  ~res;

rng_1 xgen1(x01, rs1, 1'b0, ck, on3);
rng_5 thetagen1(theta1, rs1, 1'b0, ck, on3);
rng_16 xgen2(x02, rs2, 1'b0, ck, on3);
rng_20 thetagen2(theta2, rs2, 1'b0, ck, on3);
rng_25 xgen3(x03, rs3, 1'b0, ck, on3);
rng_28 thetagen3(theta3, rs3, 1'b0, ck, on3);

assign clk= v_disp & (~pause);

coord fruit1(xf1, yf1, ac1, x01, theta1, ck, clk, rs1, on3);
coord fruit2(xf2, yf2, ac2, x02, theta2, ck, clk, rs2, on3);
coord fruit3(xf3, yf3, ac3, x03, theta3, ck, clk, rs3, on3);
square_check sq1(xf1[9:0], yf1[9:0], xp[9:0], yp, ac1, fr1);
square_check sq2(xf2[9:0], yf2[9:0], xp[9:0], yp, ac2, fr2);
square_check sq3(xf3[9:0], yf3[9:0], xp[9:0], yp, ac3, fr3);
cursor_update cursor(xc, yc, x_joy, y_joy, ck, clk, on3);
bold_cur crck(xc, yc, xp[9:0], yp, on3, cur);
square_check ch1(xf1[9:0], yf1[9:0], xc, yc, ac1, d1);
square_check ch2(xf2[9:0], yf2[9:0], xc, yc, ac2, d2);
square_check ch3(xf3[9:0], yf3[9:0], xc, yc, ac3, d3);
control main(score, missed, level, rs1, rs2, rs3, go, max, d1, d2, d3, ac1, ac2, ac3,
 on3, ck, clk);

assign levelf= level+1;
assign on2= on | pause | res;

diggen numgen(en, dig, on2, sck, ck, levelf, missed, score);
game_over gotext(xp[9:0], yp, on2, over);
congrats maxtext(xp[9:0], yp, on2, cong);

assign fr= fr1|fr2|fr3;
assign R= ((fr&~cur&~go&~pause)|(go&~max)|(max&cong))&v_disp&h_disp&on;
assign G= ((~fr&~cur&~go)|res|(go&~max&over)|(max&cong))&v_disp&h_disp&on;
assign G2= ((go&~max&over)|(max&cong))&v_disp&h_disp&on;
assign B= (max|(go&~max&over))&v_disp&h_disp&on;
assign B2= ((go&~max&over)|(max&cong))&v_disp&h_disp&on;

assign RGB[11]= R;
assign RGB[10]= R;
assign RGB[9]= R;
assign RGB[8]= R;
assign RGB[7]= G;
assign RGB[6]= G2;
assign RGB[5]= G2;
assign RGB[4]= G;
assign RGB[3]= B;
assign RGB[2]= B2;
assign RGB[1]= B2;
assign RGB[0]= B; 

endmodule
