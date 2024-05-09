`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2024 04:53:01 PM
// Design Name: 
// Module Name: mux_8x1_nbit
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


module mux_8x1_nbit#(parameter N = 6) (
    input [N - 1: 0] I0, I1, I2, I3, I4, I5, I6, I7,
    input [2:0] s,
    output reg [N - 1: 0] f
    );
    
    always @(I0, I1, I2, I3, I4, I5, I6, I7, s)
    begin
        case(s)
            3'b000: f = I0;
            3'b001: f = I1;
            3'b010: f = I2;
            3'b011: f = I3;
            3'b100: f = I4;
            3'b101: f = I5;
            3'b110: f = I6;
            3'b111: f = I7;
            default: f = 'bx;
        endcase
    end
    
    
    
endmodule
