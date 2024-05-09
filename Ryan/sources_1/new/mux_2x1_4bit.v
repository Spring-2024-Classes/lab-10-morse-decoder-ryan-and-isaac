`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2024 01:14:16 AM
// Design Name: 
// Module Name: mux_2x1_4bit
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


module mux_2x1_4bit(
input [3:0]Q0,
input [3:0]Q1,
input S,
output [3:0]O
    );
    
    assign O = S ? Q1 : Q0;
endmodule
