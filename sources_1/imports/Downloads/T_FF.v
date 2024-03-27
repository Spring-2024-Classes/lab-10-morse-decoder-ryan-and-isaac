`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2021 12:10:28 PM
// Design Name: 
// Module Name: T_FF
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

module T_FF(
    input clk,
    input T,
    input reset_n,
    output reg Q // Changed to 'reg' to allow procedural assignment
);

    // This is the correct way to initialize 'Q' for simulation purposes.
    // For synthesis, initial blocks may be ignored, and reset should be used instead.
    initial Q = 0; 

    always @(posedge clk or negedge reset_n) begin
        if (~reset_n)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q; // Toggle logic only when T is high
    end

endmodule

