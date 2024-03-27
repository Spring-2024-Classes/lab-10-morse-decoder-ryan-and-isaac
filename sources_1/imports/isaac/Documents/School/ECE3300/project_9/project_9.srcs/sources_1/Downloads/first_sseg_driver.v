`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 01:55:56 PM
// Design Name: 
// Module Name: first_sseg_driver
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


module first_sseg_driver(
        input [2:0] active_digit,
        input [5:0] num,
        output [7:0]AN,
        output [6:0] sseg_out,
        output DP
    );
        wire [7:0] one_compliment, temp_AN;
        wire [2:0] temp_Active;
        
    //doing this to reverse the order 
    
    assign temp_Active[0] = ~active_digit[0];
    assign temp_Active[1] = ~active_digit[1];
    assign temp_Active[2] = ~active_digit[2];

    decoder_generic decode_3to8
    (
        .w(temp_Active),
        .y(temp_AN),
        .en(num[5])
    
    );
    
    hex2sseg display_driver
    (
        .hex(num[4:1]),
        .sseg(sseg_out)
    );
     assign DP = num[0];
    
    
    //taking ones compliment to to turn all displays off except 1
    generate
        for (genvar i = 0; i < 8; i = i + 1)
            begin
                assign one_compliment[i]  = ~temp_AN[i];
            end
    endgenerate 
    assign  AN = one_compliment;
endmodule
