`timescale 1ns / 1ps

module bold_cur(
input [9:0] x0, y0, x, y,
input en,
output check
);
wire [9:0] x_inc, x_dec, y_inc, y_dec;
wire ck0, ck1, ck2, ck3, ck4;

assign x_inc= (x0==600)?600:x0+1;
assign y_inc= (y0==800)?800:y0+1;
assign x_dec= (x0==0)?0:x0-1;
assign y_dec= (y0==0)?0:y0-1;

cursor_check xc0(x0, y0, x, y, en, ck0);
cursor_check xc1(x0, y_inc, x, y, en, ck1);
cursor_check xc2(x0, y_dec, x, y, en, ck2);
cursor_check xc3(x_inc, y0, x, y, en, ck3);
cursor_check xc4(x_dec, y0, x, y, en, ck4);

assign check= ck0|ck1|ck2|ck3|ck4;

endmodule
