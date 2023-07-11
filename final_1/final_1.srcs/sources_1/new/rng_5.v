`timescale 1ns / 1ps

module rng_5(
output reg [4:0] num=5'd5,
input new, reset, ck, on
);
reg [4:0] ctr=0, seed=5'd5, mult=5'd21, inc=5'd3;
reg prevnew=0, prevres=0;

always@(posedge ck)
begin
if(on)begin
if(!prevres && reset)begin
{num, seed, mult, inc, ctr}={5'd5, 5'd5, 5'd21, 5'd3, 5'd0};
end else if(!prevnew && new) begin
if(ctr==5'd31) begin
ctr=5'd0;
seed=(seed==5'd31)?5'd1:seed+1;
mult=(mult==5'd29)?5'd5:mult+5'd4;
inc[0]=1;
inc[1] = (~seed[4] & ~seed[3]) | (~seed[2] & ~seed[1] & seed[0]) | (~seed[2] & seed[1] & ~seed[0]) | (seed[2] & seed[1] & seed[0]) | (seed[4] & ~seed[2] & ~seed[1]) | (seed[4] & seed[3] & ~seed[1] & seed[0]);
inc[2] = (~seed[4] & ~seed[3] & ~seed[2]) | (seed[4] & ~seed[3] & seed[2]) | (seed[4] & seed[2] & seed[1]) | (~seed[4] & ~seed[3] & ~seed[1] & ~seed[0]) | (seed[3] & ~seed[2] & ~seed[1] & seed[0]) | (~seed[3] & ~seed[2] & seed[1] & seed[0]) | (seed[4] & seed[3] & ~seed[2] & ~seed[0]);
inc[3] = (~seed[4] & ~seed[0]) | (~seed[3] & ~seed[0]) | (~seed[2] & ~seed[0]) | (seed[4] & seed[3] & seed[1]) | (seed[4] & seed[3] & seed[2] & seed[0]);
inc[4] = (~seed[4] & ~seed[3] & seed[1] & seed[0]) | (~seed[4] & ~seed[3] & ~seed[1] & ~seed[0]) | (seed[3] & seed[2] & ~seed[1] & seed[0]) | (seed[3] & seed[1] & ~seed[0]) | (seed[4] & ~seed[1] & seed[0]) | (seed[4] & seed[1] & ~seed[0]) | (seed[4] & seed[3] & seed[2]) | (~seed[4] & ~seed[2] & ~seed[1] & ~seed[0]);
num=seed;
end else begin
ctr=ctr+1;
num=((mult*num)+inc)%6'd32;
end
end
end
else
ctr= 5'd0;
prevres= reset;
prevnew= new;
end

endmodule