`timescale 1ns / 1ps

module coord(
output reg signed [10:0] x_coord, y_coord,
output reg act,
input [4:0] xin, theta,
input sysck, coordck, reset, on
);
reg ac=0;
reg signed [31:0] xt=0, yt1=0, yt2=0;
reg signed [15:0] t_curr=0;
reg signed [31:0] cos=0, sin=0;
reg signed [10:0] x_sto=0;
reg prevres=0, prevck=0;
integer i=0;

always@(posedge sysck) begin
if(on)
begin
if(!prevres && reset)
begin
x_sto= xin*11'd16;
x_sto= x_sto+11'd144;
{t_curr,y_coord,xt,yt1,yt2}=0;
ac=1;
x_coord=x_sto;
sin[0] = (~theta[3] & ~theta[2]) | (~theta[4] & theta[3] & theta[2]) | (theta[4] & ~theta[3]) | (~theta[4] & ~theta[2] & theta[0]) | (~theta[4] & ~theta[2] & theta[1]) | (theta[3] & theta[2] & theta[0]) | (theta[3] & theta[2] & theta[1]);
sin[1] = (~theta[4] & theta[2]) | (theta[3] & ~theta[2]) | (theta[4] & ~theta[3]) | (theta[3] & ~theta[1] & ~theta[0]);
sin[2] = 1'b1;
cos[0] = (~theta[4] & ~theta[2] & ~theta[1]) | (~theta[3] & theta[2] & theta[1] & theta[0]) | (~theta[4] & theta[3] & ~theta[1]) | (theta[4] & ~theta[3] & theta[2] & ~theta[1] & ~theta[0]) | (theta[3] & ~theta[2] & ~theta[1]) | (~theta[4] & ~theta[3] & ~theta[2] & ~theta[0]) | (~theta[4] & theta[3] & theta[2] & ~theta[0]) | (theta[4] & ~theta[3] & ~theta[2] & theta[1]) | (theta[4] & theta[3] & theta[2] & theta[1]);
cos[1] = (~theta[4] & ~theta[3] & theta[2] & theta[1] & theta[0]) | (~theta[4] & theta[3] & ~theta[2]) | (theta[4] & ~theta[3] & ~theta[2] & theta[1]) | (theta[4] & ~theta[3] & theta[2] & ~theta[1]) | (theta[4] & theta[3] & theta[2] & theta[1]) | (theta[4] & ~theta[3] & theta[1] & ~theta[0]);
cos[2] = (~theta[4] & ~theta[3] & ~theta[2]) | (~theta[4] & ~theta[3] & ~theta[1]) | (~theta[4] & ~theta[3] & ~theta[0]) | (theta[4] & ~theta[3] & theta[1]) | (theta[4] & theta[2] & ~theta[1]) | (theta[4] & theta[3] & ~theta[2]);
for(i=3;i<32;i=i+1)
begin
cos[i]= theta>16;
sin[i]= 0;
end
end
else if(!prevck && coordck)
begin
if(ac)
begin
t_curr=t_curr+1;
xt= cos*t_curr;
xt= xt/32'd4;
yt1= sin*t_curr;
yt1= yt1/32'd4;
yt2= t_curr*t_curr;
yt2= yt2/32'd720;
x_coord= x_sto+xt;
y_coord= yt1-yt2;
if(x_coord>10'd800||y_coord>10'd1023)
begin
{x_coord,y_coord,t_curr,cos,sin,x_sto,ac,xt,yt1,yt2}=0;
end
end
else
{x_coord,y_coord}=0;
end
end
else
begin
{t_curr,cos,sin,x_sto,x_coord,y_coord,ac,xt,yt1,yt2}<=0;
end
prevres=reset;
prevck=coordck;
act=ac;
end

endmodule
