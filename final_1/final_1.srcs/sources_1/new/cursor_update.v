`timescale 1ns / 1ps

module cursor_update(
output reg [9:0] x_curr=10'd400, y_curr=10'd300,
input [3:0] x_joy, y_joy,
input clock, upd, on
);
reg prevupd=0;

always@(posedge clock)
begin
if(on)
begin
if(!prevupd && upd)
begin
if(x_joy>4'd7)
begin
if(10'd800-x_curr<x_joy-4'd8)
x_curr<= 10'd800;
else
x_curr<= x_curr+x_joy-4'd8;
end
else
if(x_curr<4'd8-x_joy)
x_curr<=0;
else
x_curr<= x_curr+x_joy-4'd8;

if(y_joy>4'd7)
begin
if(10'd600-y_curr<y_joy-4'd8)
y_curr<= 10'd600;
else
y_curr<= y_curr+y_joy-4'd8;
end
else
if(y_curr<4'd8-y_joy)
y_curr<=0;
else
y_curr<= y_curr+y_joy-4'd8;
end
end
else
{x_curr,y_curr}<={10'd400,10'd300};
prevupd<=upd;
end

endmodule