`timescale 1ns / 0.1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2021 01:33:12 PM
// Design Name: 
// Module Name: morse_decoder_2_tb
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


module morse_decoder_2_tb(
    
    );
    reg clk, b, read;
    wire [7:0] AN;
    wire [6:0] sseg;
    wire DP, empty;
    integer i;
    localparam TIMER_FINAL_VALUE = 5;
    
    morse_test_function uut(
        .clk(clk),
        .b(b),
        .read(read),
        .AN(AN),
        .sseg(sseg),
        .DP(DP),
        .empty(empty)
    );
    
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    localparam DELAY = (TIMER_FINAL_VALUE + 1) * T;
    initial
    begin
        b = 1'b1;
        read = 1'b0;
        
        
           #10;
        b = 1'b0;
        #(1 * DELAY);
        b = 1'b1; 
        #(3 * DELAY);
        
        #10;
        b = 1'b0;
        #(1 * DELAY);
        b = 1'b1;
        
        #(1 * DELAY);
        b = 1'b1; 
        
        
          b = 1'b0;
        #(1 * DELAY);
        b = 1'b1;
        
        #(3 * DELAY);
        
        #10;
        b = 1'b0;
        
        #(4 * DELAY);
        b = 1'b1;
        
           #10;
        b = 1'b0;
        #(1 * DELAY);
        b = 1'b1; 
        
        #10;
        b = 1'b0;
        read = 1;
        b= 1'b1;
        #(7 * DELAY);
        b = 1'b0;
        
         
      
      
                         
        repeat(5) @(negedge clk) $stop;
        
    end
endmodule