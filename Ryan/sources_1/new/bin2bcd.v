`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2024 12:43:01 AM
// Design Name: 
// Module Name: bin2bcd
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

module bin2bcd(
input [7:0]bin,
output [11:0]bcd
    );
    wire zero;
    assign zero = 1'b0;
    //add_3 set 1
    wire [3:0]in1 = {zero,bin[7],bin[6],bin[5]};
    wire [3:0]out1;
    add_3 add1(in1,out1);
    
    //add_3 set 2
    wire [3:0]in2 = {out1[2],out1[1],out1[0],bin[4]};
    wire [3:0]out2;
    add_3 add2(in2,out2);
    
    //add_3 set 3
    wire [3:0]in3 = {out2[2],out2[1],out2[0],bin[3]};
    wire [3:0]out3;
    add_3 add3(in3,out3);
    
    //add_3 set 4
    wire [3:0]in4 = {out3[2],out3[1],out3[0],bin[2]};
    wire [3:0]out4;
    add_3 add4(in4,out4);
    wire [3:0]in5 = {zero,out1[3],out2[3],out3[3]};
    wire [3:0]out5;
    add_3 add5(in5,out5);
    
    //add_3 set 5
    wire [3:0]in6 = {out4[2],out4[1],out4[0],bin[1]};
    wire [3:0]out6;
    add_3 add6(in6,out6);
    wire [3:0]in7 = {out5[2],out5[1],out5[0],out4[3]};
    wire [3:0]out7;
    add_3 add7(in7,out7);
    
    //output assign
    assign bcd = {
    zero,zero,out5[3],out7[3],
    out7[2],out7[1],out7[0],out6[3],
    out6[2],out6[1],out6[0],bin[0]};
    
    
endmodule
