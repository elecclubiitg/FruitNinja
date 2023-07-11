`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2023 22:52:50
// Design Name: 
// Module Name: joystick_ADC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module joystick_ADC(
    output reg [3:0]x,
    output reg [3:0]y,
    input rst,
    input clk,
    input a1p,a1n,
    input a2p,a2n
    );
    
    //wire vp_in,vn_in,alarm_out,eos_out,busy_out;         //wires for unused ports of xadc instance
    wire [6:0]daddr_in;
    wire [4:0]channel_out;
    wire eoc_out; 
    wire drdy_out;
    wire [15:0] do_out;   
    
    xadc_wiz_0 your_instance_name (
      .di_in(16'h0000),              // input wire [15 : 0] di_in//
      .daddr_in(daddr_in),        // input wire [6 : 0] daddr_in//
      .den_in(eoc_out),            // input wire den_in//
      .dwe_in(1'b0),            // input wire dwe_in// dwe: digital write enable
      .drdy_out(drdy_out),        // output wire drdy_out//
      .do_out(do_out),            // output wire [15 : 0] do_out//
      .dclk_in(clk),          // input wire dclk_in //
      .reset_in(rst),        // input wire reset_in//
      .vp_in(1'b0),              // input wire vp_in//
      .vn_in(1'b0),              // input wire vn_in//
      .vauxp3(a1p),            // input wire vauxp3//
      .vauxn3(a1n),            // input wire vauxn3//
      .vauxp10(a2p),          // input wire vauxp10//
      .vauxn10(a2n),          // input wire vauxn10//
      .channel_out(channel_out),  // output wire [4 : 0] channel_out//
      .eoc_out(eoc_out),          // output wire eoc_out//
      .alarm_out(),      // output wire alarm_out//
      .eos_out(),          // output wire eos_out//
      .busy_out()        // output wire busy_out//
    );
    
    assign daddr_in = {2'b00, channel_out};
    
    always @(posedge clk) begin
        if(rst) begin
            x <= 4'h0;
            y <= 4'h0;
        end
        else begin
            if(drdy_out && channel_out == 5'b10011)
                x <= do_out[15:12];
            if(drdy_out && channel_out == 5'b11010)
                y <= do_out[15:12];                
        end
    end
endmodule
