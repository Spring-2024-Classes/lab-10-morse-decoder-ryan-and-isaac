`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 07:20:29 AM
// Design Name: 
// Module Name: shift_reg
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



module shift_reg 
(
  input wire clk, 
  input wire reset, 
  input wire data_in, 
  input wire enable,
  output reg [4:0] data_out 
); 
 

always @(posedge clk or posedge reset) begin 
  if (reset) begin 
    data_out <= 5'b00000; 
  end 
  else if(enable) begin 
      data_out <= {data_out[3:0], data_in}; 
    end 
end 
 
endmodule 