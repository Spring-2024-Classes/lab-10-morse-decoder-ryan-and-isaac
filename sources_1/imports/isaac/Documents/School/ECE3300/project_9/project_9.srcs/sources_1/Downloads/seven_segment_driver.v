`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 03:49:50 PM
// Design Name: 
// Module Name: sseg_driver
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


module sseg_driver(
        
        input clk,
        input [5:0] mux_in0,
        input [5:0] mux_in1,
        input [5:0] mux_in2,
        input [5:0] mux_in3,
        input [5:0] mux_in4,
        input [5:0] mux_in5,
        input [5:0] mux_in6,
        input [5:0] mux_in7,
        output [7:0] AN,
        output [6:0] sseg,
        output DP
    
    );
    
    wire [2:0] active_display_3bit;
    
    reg [5:0] muxcalc;
        always @* begin
          case (active_display_3bit)
            3'b000: muxcalc = mux_in0;
            3'b001: muxcalc = mux_in1;
            3'b010: muxcalc = mux_in2;
            3'b011: muxcalc = mux_in3;
            3'b100: muxcalc = mux_in4;
            3'b101: muxcalc = mux_in5;
            3'b110: muxcalc = mux_in6;
            3'b111: muxcalc = mux_in7;
            default: muxcalc = 6'b001000; // Default value for invalid select
          endcase
        end

    timer_parameter #(.FINAL_VALUE(250000)) timer_param
    (
        .clk(clk),
        .enable(1'b1),
        .reset_n(1'b1),
        .done(timer_to_counter_enable)
    
    );
    
    udl_counter #(.BITS(8)) count_device
    (
         .clk(clk),
         .enable(timer_to_counter_enable),
         .D(3'b000),
         .Q(active_display_3bit),
         .reset_n(1'b1),
         .up(1'b1), 
        .load(1'b0)

    );
    
    first_sseg_driver sseg_base
    (
    
        .active_digit(active_display_3bit),
        .num(muxcalc),
        .AN(AN),
        .sseg_out(sseg),
        .DP(DP) 

    );
    
    
    
endmodule
