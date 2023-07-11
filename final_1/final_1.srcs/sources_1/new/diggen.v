`timescale 1ns / 1ps

module diggen(
output reg [7:0] en=8'b11111111,
output [6:0] dig,
input on, ck, sysck,
input [1:0] level,
input [7:0] missed,
input [9:0] score
);
reg [3:0] out=0;
reg [2:0] state=0;
reg prevck=0;

assign dig[0] = (((~out[3] & ~out[2] & ~out[1] & out[0]) | (out[2] & ~out[1] & ~out[0])) & on) | ~on;
assign dig[1] = (((out[2] & ~out[1] & out[0]) | (out[2] & out[1] & ~out[0])) & on) | ~on;
assign dig[2] = (~out[2] & out[1] & ~out[0] & on) | ~on;
assign dig[3] = (((~out[2] & ~out[1] & out[0]) | (out[2] & ~out[1] & ~out[0]) | (out[2] & out[1] & out[0])) & on) | ~on;
assign dig[4] = (((out[0]) | (out[2] & ~out[1])) & on) | ~on;
assign dig[5] = (((~out[3] & ~out[2] & out[0]) | (~out[2] & out[1]) | (out[1] & out[0])) & on) | ~on;
assign dig[6] = (((~out[3] & ~out[2] & ~out[1]) | (out[2] & out[1] & out[0])) & on) | ~on;

always@(posedge sysck)
begin
if(!prevck && ck)
if(on)
begin
if(state!=5)
state<= state+1;
else
state<=0;
case(state)
0:begin
en[7:0]<= 8'b11111110;
out<= score%10;
end
1:begin
en[7:0]<= 8'b11111101;
out<= (score/10)%10;
end
2:begin 
en[7:0]<= 8'b11111011;
out<= (score/100)%10;
end
3:begin 
en[7:0]<= 8'b11101111;
out<= level;
end
4:begin 
en[7:0]<= 8'b10111111;
out<= missed%10;
end
5:begin 
en[7:0]<= 8'b01111111;
out<= (missed/10)%10;
end
endcase
end
else {state, en[7:0], out}<=15'b000111111110000;
prevck<=ck;
end

endmodule