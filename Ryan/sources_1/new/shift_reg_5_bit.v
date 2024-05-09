`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 06:47:35 AM
// Design Name: 
// Module Name: shift_reg_5_bit
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


module shift_reg_5_bit(input clk, input shift, input reset_n, input data_in, output data_out, output reg [4:0] shift_reg);


reg prev_shift; 


always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        shift_reg <= 5'b00000;
        prev_shift <= 0;
    end else begin
        if (shift && !prev_shift) begin
            shift_reg <= {shift_reg[3:0], data_in};
        end
        prev_shift <= shift;
    end
end

assign data_out = shift_reg[4];

endmodule