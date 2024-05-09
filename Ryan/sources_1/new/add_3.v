`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2024 01:12:54 AM
// Design Name: 
// Module Name: add_3
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


module add_3(
input [3:0]A,
output [3:0]S
    );
wire [3:0]pass;
wire [3:0]add;
wire over4 = (A>4);

wire [3:0]fcheck;
wire [3:0] no = 4'bxxxx;
wire over9 = (A>12);

assign pass = A;
assign add = A + 3;

mux_2x1_4bit selectover4(pass,add,over4,fcheck);
mux_2x1_4bit selectover9(fcheck,no,over9,S);
    
endmodule
