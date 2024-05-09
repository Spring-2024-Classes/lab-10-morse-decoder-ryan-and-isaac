`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2024 12:45:25 AM
// Design Name: 
// Module Name: morse_decoder_application
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


module morse_decoder_application(input clk, input reset, input b_button,
    output [6:0]sseg,
    output DP,
    output [7:0]AN
);
    wire b, dot, dash, lg, wg;
    wire high = 1'b1;
    
    wire shift = dot ^ dash;
    wire [4:0] shift_reg;
    wire [2:0]count;
    wire udl_load = (count >= 5);
    
    wire [5:0] I[7:0];
    
    button b_debouncer(.clk(clk), .reset_n(reset), .noisy(b_button), .debounced(b));
    
    morse_decoder decoder(.clk(clk), .b(b), .dot(dot), .dash(dash), .lg(lg), .wg(wg));
    
    shift_reg_5_bit s_reg(.clk(clk), .shift(shift), .reset_n(reset), .data_in(dash), .shift_reg(shift_reg));
    
    udl_counter #(3) shiftcount(.clk(clk), .reset_n(reset), .enable(shift), .up(high), .load(udl_load),.D(3'b000), .Q(count));
    
    display_set(shift_reg[0], shift_reg[1], shift_reg[2], shift_reg[3], shift_reg[4], count, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, I[0], I[1], I[2], I[3], I[4], I[5]);
    
    sseg_driver(.clk(clk), .I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(I[4]), .I5({1'b1,3'b000,1'b1}), .I6({1'b1,3'b000,1'b1}), .I7(I[5]), .DP(DP), .sseg(sseg), .AN(AN));
endmodule
