`timescale 1ns / 1ps

module control(
output reg [9:0] score=0,
output reg [7:0] missed=0,
output reg [1:0] level=0, 
output reg rs1=0, rs2=0, rs3=0, go=0, max=0,
input d1, d2, d3, ac1, ac2, ac3, on, clk, chk
);
reg l1=0, prevchk=0;
reg [3:0] state=0;
parameter level0max=19, level1max=59, level2max=119;
parameter level0miss=3, level1miss=15, level2miss=31;

always@(posedge clk)
begin
if(on)
begin
if(!go)
begin
if(!prevchk && chk)
begin
if(state==0)
begin
if(ac1) begin
if(d1) begin
if(score==level0max) begin
state<=5'd2;
level<=level+1;
end
else
state<=5'd1;
score<=score+1;
end end
else begin
if(!l1) begin
l1<=1;
state<=5'd1;
end
else
if(missed==level0miss)
state<=5'd15;
else begin
state<=5'd1;
missed<=missed+1;
end end 
end
else if(state==5'd1) 
begin
if(rs1)
if(score<=level0max)
state<=5'd0;
else if(score<=level1max)
state<=5'd3;
else
state<=5'd9;
rs1<=~rs1;
end
else if(state==5'd2) 
begin
if(!rs1)
begin
rs1<=1'b1;
rs2<=1'b0;
end
else if(!rs2)
rs2<=1'b1;
else begin
{rs1,rs2}<=2'b00;
if(score<=level1max)
state<=5'd3;
else
state<=5'd9;
end 
end
else if(state==5'd15)
go<=1;
else if(state==5'd3)
begin
if(ac1) begin
if(d1) begin
if(ac2) begin
if(d2) begin
if(score==level1max-1||score==level1max) begin
state<=5'd7;
level<=level+1;
end
else
state<=5'd2;
score<=score+2;
end
else begin
if(score==level1max) begin
state<=5'd11;
level<=level+1;
end
else
state<=5'd1;
score<=score+1;
end end
else begin
if(missed==level1miss)
state<=5'd15;
else
if(score==level1max) begin
state<=5'd7;
level<=level+1;
end
else
state<=5'd2;
missed<=missed+1;
score<=score+1;
end end
else begin
if(ac2) begin
if(d2) begin
if(score==level1max) begin
state<=5'd6;
level<=level+1;
end
else
state<=5'd5;
score<=score+1;
end end
else begin
if(missed==level1miss)
state<=5'd15;
else
state<=5'd5;
missed<=missed+1;
end end end
else begin
if(missed==level1miss)
state<=5'd15;
else begin
if(ac2) begin
if(d2) begin
if(score==level1max) begin
state<=5'd7;
level<=level+1;
end
else
state<=5'd2;
missed<=missed+1;
score<=score+1;
end
else begin
state<=5'd1;
missed<=missed+1;
end end
else begin
if(missed==level1miss-1)
state<=5'd15;
else
state<=5'd2;
missed<=missed+2;
end end end 
end
else if(state==5'd5)
begin
if(rs2) begin
if(score<=level1max)
state<=5'd3;
else
state<=5'd9;
rs2<=0;
end
else
rs2<=1;
end
else if(state==5'd6)
begin
if(!rs2)
rs2<=1;
else
if(!rs3)
rs3<=1;
else begin
{rs2,rs3}<=0;
state<=5'd9;
end 
end
else if(state==5'd7)
begin
if(!rs1)
rs1<=1'b1;
else
if(!rs2)
rs2<=1'b1;
else
if(!rs3)
rs3<=1'b1;
else
begin
{rs1,rs2,rs3}<=0;
state<=5'd9;
end 
end
else if(state==5'd11)
if(!rs1)
rs1<=1'b1;
else
if(!rs3)
rs3<=1'b1;
else begin
{rs1,rs3}<=0;
state<=5'd9;
end
else if(state==5'd9) 
begin
if(ac1) begin
if(d1) begin
if(ac2) begin
if(d2) begin
if(ac3) begin
if(d3) begin
if(score<=level2max-3)
state<=5'd7;
else
state<=5'd14;
score<=score+3;
end
else begin
if(score<=level2max-2)
state<=5'd2;
else
state<=5'd14;
score<=score+2;
end end
else begin
if(missed==level2miss)
state<=5'd15;
else begin
if(score<=level2max-2)
state<=5'd7;
else
state<=5'd14;
score<=score+2;
missed<=missed+1;
end end end
else begin
if(ac3) begin
if(d3) begin
if(score<=level2max-2)
state<=5'd11;
else
state<=5'd14;
score<=score+2;
end
else begin
if(score==level2max)
state<=5'd14;
else
state<=5'd1;
score<=score+1;
end end
else begin
if(missed==level2miss)
state<=5'd15;
else begin
if(score==level2max)
state<=5'd14;
else
state<=5'd11;
score<=score+1;
missed<=missed+1;
end end end end
else begin
if(missed==level2miss)
state<=5'd15;
else begin
if(ac3) begin
if(d3) begin
if(score>level2max-2)
state<=5'd14;
else
state<=5'd7;
score<=score+2;
missed<=missed+1;
end
else begin
if(score==level2max)
state<=5'd14;
else
state<=5'd2;
score<=score+1;
missed<=missed+1;
end end 
else begin
if(missed==level2miss-1) begin
state<=5'd15;
missed<=missed+1;
end
else begin
if(score==level2max)
state<=5'd14;
else
state<=5'd7;
score<=score+1;
missed<=missed+2;
end end end end end
else
begin
if(ac2) begin
if(d2) begin
if(ac3) begin
if(d3) begin
if(score>level2max-2)
state<=5'd14;
else
state<=5'd6;
score<=score+2;
end
else begin
if(score==level2max)
state<=5'd14;
else
state<=5'd5;
score<=score+1;
end end
else begin
if(missed==level2miss)
state<=5'd15;
else begin
if(score==level2max)
state<=5'd14;
else
state<=5'd6;
score<=score+1;
missed<=missed+1;
end end end
else begin
if(ac3) begin
if(d3) begin
if(score==level2max)
state<=5'd14;
else
state<=5'd13;
score<=score+1;
end end
else begin
if(missed==level2miss)
state<=5'd15;
else
state<=5'd13;
missed<=missed+1;
end end end
else begin
if(missed==level2miss)
state<=5'd15;
else begin
if(ac3) begin
if(d3) begin
if(score==level2max)
state<=5'd14;
else
state<=5'd6;
score<=score+1;
missed<=missed+1;
end
else begin
state<=5'd5;
missed<=missed+1;
end end
else begin
if(missed==level2miss-1) begin
state<=5'd15;
missed<=missed+1;
end
else
state<=5'd6;
missed<=missed+2;
end end end end end
else
if(missed==level2miss)
state<=5'd15;
else begin
if(ac2) begin
if(d2) begin
if(ac3) begin
if(d3) begin
if(score<=level2max-2)
state<=5'd7;
else begin
state<=5'd14;
level<=level+1;
end
score<=score+2;
missed<=missed+1;
end
else begin
if(score==level2max)
state<=5'd14;
else
state<=5'd5;
score<=score+1;
missed<=missed+1;
end end
else begin
if(missed==level2miss-1) begin
state<=5'd15;
missed<=missed+1;
end
else begin
if(score==level2max)
state<=5'd14;
else
state<=5'd7;
score<=score+1;
missed<=missed+2;
end end end
else begin
if(ac3) begin
if(d3) begin
if(score==level2max)
state<=5'd14;
else
state<=5'd11;
score<=score+1;
missed<=missed+1;
end
else begin
state<=5'd1;
missed<=missed+1;
end end
else begin
if(missed==level2miss-1) begin
state<=5'd15;
missed<=missed+1;
end
else
state<=5'd11;
missed<=missed+2;
end end end
else begin
if(missed==level2miss-1) begin
state<=5'd15;
missed<=missed+1;
end
else begin
if(ac3) begin
if(d3) begin
if(score==level2max)
state<=5'd14;
else
state<=5'd7;
missed<=missed+2;
score<=score+1;
end
else begin
state<=5'd2;
missed<=missed+2;
end end
else begin
if(missed==level2miss-2) begin
state<=5'd15;
missed<=missed+2;
end
else begin
state<=5'd7;
missed<=missed+3;
end end end end end 
end
else if(state==5'd14)begin
max<=1;
go<=1;
end
else if(state==5'd13)begin
if(!rs3)
rs3<=1;
else begin
rs3<=0;
state<=5'd9;
end
end
end
end
end
else
{score,missed,level,rs1,rs2,rs3,state,l1,go,max}<=0;
prevchk<= chk;
end
endmodule
