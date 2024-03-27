`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 12:01:36 PM
// Design Name: 
// Module Name: morse_uart
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


module morse_uart
 (
     input clk, input b, input read,
     output [7:0] AN,
     output [6:0] sseg,
     output DP,
     output empty 
    );
    
    morse_decoder_2 test_morse
   (
        .clk(clk), 
        .reset_n(1'b1),
        .b(b),
        .dot(dot),
        .dash(dash),
        .lg(lg),
        .wg(wg)
   );
   
   xor (xorOut, dot, dash); 
   assign orOut = lg | wg;
   wire [4:0] symbol;
   wire [2:0] symbol_count;

   
   shift_reg shift_register
   (
        .data_in(dash),  //shift
        .clk(clk),
        .enable(xorOut), //enable
        .reset(orOut),
        .data_out(symbol)
   );
   
   udl_counter_2 #(.BITS(3)) count_device 
    (
         .clk(clk),
         .enable(xorOut),
         .D(3'b000),
         .Q(symbol_count),
         .reset_n(orOut),
         .up(1'b1), 
        .load(symbol_count==5)

    );
    
   wire [7:0] I0,I1,Input_addr,Rom_out,Fifo_out;
   assign I0 = {symbol_count,symbol};
   assign I1 = 8'b11100000;
   assign Input_addr = wg ? I1: I0;
   
   d_flip_flop dflop
   (
       .D(wg),
       .clk(clk),
       .Q(wg_delayed)
   );
   
   synch_rom romread
   (
        .clk(clk),
        .addr(Input_addr),
        .data(Rom_out)
   
   );
   
   assign write_enable = ~full & (lg | wg | wg_delayed);
   
   
    moore_edge_detector ED0(
        .clk(clk),
        .reset_n(1'b1),
        .level(read),
        .p_edge(read_pedge),
        .n_edge(read_nedge),
        ._edge(read_edge)
    );
   
   
   fifo buffer_fifo
   (
        .clk(clk),
        .we(write_enable),
        .re(read_pedge),
        .din(Rom_out),
        .dout(Fifo_out),
        .empty(empty),
        .full(full)
   );
   
  
       
   sseg_driver display
        (
        
            .clk(clk),
            .mux_in0({symbol_count>=1,3'b000,symbol[0],1'b1}),
            .mux_in1({symbol_count>=2,3'b000,symbol[1],1'b1}),
            .mux_in2({symbol_count>=3,3'b000,symbol[2],1'b1}),
            .mux_in3({symbol_count>=4,3'b000,symbol[3],1'b1}),
            .mux_in4({symbol_count>=5,3'b000,symbol[4],1'b1}),
            .mux_in5(6'b000001),
            .mux_in6({1'b1,Fifo_out[3:0],1'b1}),
            .mux_in7({1'b1,Fifo_out[7:4],1'b1}),
            .AN(AN),
            .sseg(sseg),
            .DP(DP)

        );
   
   
   
    
    
    
endmodule