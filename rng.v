`timescale 1ns / 1ps

module rng(
output [6:0] dig,
output [7:0] an,
input new, reset, ck, on
);
reg [4:0] num=5'd1;
reg [4:0] ctr=0, seed=5'd1, mult=5'd5, inc=5'd7;
reg prevnew=0, prevres=0;
wire ck2, ck3;

clk_wiz_0 clkgen(
ck2, ck3, ck 
);

always@(posedge ck2)
begin
if(on)begin
if(!prevres && reset)begin
{num, seed, mult, inc, ctr}={5'd1, 5'd1, 5'd5, 5'd7, 5'd0};
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
else begin
{num, seed, mult, inc, ctr}={5'd1, 5'd1, 5'd5, 5'd7, 5'd0};
end
prevres= reset;
prevnew= new;
end

seg convert(dig, an, num, ck3);

endmodule
