`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2024 02:49:38 PM
// Design Name: 
// Module Name: display_set
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


module display_set(
input [3:0]bcd,
input [3:0]bcd2,
input [3:0]bcd3,
input [3:0]bcd4,
input [3:0]bcd5,
input [3:0]bcd6,
input dp,
input dp2,
input dp3,
input dp4,
input dp5,
input dp6,
output reg [5:0] I,
output reg [5:0] I2,
output reg [5:0] I3,
output reg [5:0] I4,
output reg [5:0] I5,
output reg [5:0] I6
    );

    always@*begin
        I[0] = dp;
        I[4:1] = bcd;
        I[5] = 1'b1;
        I2[0] = dp2;
        I2[4:1] = bcd2;
        I2[5] = 1'b1;
        I3[0] = dp3;
        I3[4:1] = bcd3;
        I3[5] = 1'b1;
        I3[0] = dp3;
        I3[4:1] = bcd3;
        I4[5] = 1'b1;
        I4[0] = dp4;
        I4[4:1] = bcd4;
        I5[5] = 1'b1;
        I5[0] = dp5;
        I5[4:1] = bcd5;
        I6[5] = 1'b1;
        I6[0] = dp6;
        I6[4:1] = bcd6;


    end
       
    
    
endmodule
