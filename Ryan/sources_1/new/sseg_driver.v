`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2024 05:02:44 PM
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
input [5:0] I0, I1, I2, I3, I4, I5, I6, I7,
output DP,
output [6:0] sseg,
output [7:0]AN
    );
    wire [2:0] x; //AN pre-mux
    reg [5:0]D_out; // input for sseg
    wire sseg_I_switch;
    
    wire high = 1'b1;
    wire low = 0'b0;
    always @* begin
          case (x)
            3'b000: D_out = I0;
            3'b001: D_out = I1;
            3'b010: D_out = I2;
            3'b011: D_out = I3;
            3'b100: D_out = I4;
            3'b101: D_out = I5;
            3'b110: D_out = I6;
            3'b111: D_out = I7;
            default: D_out = 6'b000000;
          endcase
        end
    
    timer_parameter #(.FINAL_VALUE(125000)) timer_param(.clk(clk),.enable(high),.reset_n(high),.done(sseg_I_switch));
    udl_counter #(.BITS(3)) sseg_switch(.clk(clk),.enable(sseg_I_switch),.D(3'b000),.Q(x),.reset_n(high),.up(high), .load(low));
    first_sseg_driver_test sseg_formatter(.x(x),.num(D_out),.AN(AN),.sseg(sseg),.DP(DP));
endmodule
