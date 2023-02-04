`timescale 1ns / 1ps
module seg(
output reg [6:0] dig,
output reg [7:0] an,
input [4:0] num,
input ck
);
wire [3:0] d1, d2;
reg state=0;

function [6:0] cath;
input [3:0] n;
case(n)
0: cath=7'b0000001;
1: cath=7'b1001111;
2: cath=7'b0010010;
3: cath=7'b0000110;
4: cath=7'b1001100;
5: cath=7'b0100100;
6: cath=7'b0100000;
7: cath=7'b0001111;
8: cath=7'b0000000;
9: cath=7'b0001100;
endcase
endfunction

assign d1=num%10;
assign d2=num/10;

always@(posedge ck)
begin
if(!state)
begin
dig<=cath(d1);
an<=8'b11111110;
end
else
begin
dig<=cath(d2);
an<=8'b11111101;
end
state<=state+1;
end

endmodule
