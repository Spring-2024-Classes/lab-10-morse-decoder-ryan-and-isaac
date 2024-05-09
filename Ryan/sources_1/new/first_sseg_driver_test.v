`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2024 01:55:54 PM
// Design Name: 
// Module Name: first_sseg_driver_test
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


module first_sseg_driver_test(
    input [2:0] x,
    input [5:0] num,
    output [7:0]AN,
    output [6:0] sseg,
    output DP
    );
    wire [7:0] one_comp, pre_comp_AN;
        
        
    decoder_generic decode_3to8(.w(x),.y(pre_comp_AN),.en(num[5]));
    hex2sseg display_driver(.hex(num[4:1]),.sseg(sseg));
    assign DP = num[0];
    
    generate
        for (genvar i = 0; i < 8; i = i + 1)
            begin
                assign one_comp[i]  = ~pre_comp_AN[i];
            end
    endgenerate 
    assign  AN = one_comp;
    
endmodule
