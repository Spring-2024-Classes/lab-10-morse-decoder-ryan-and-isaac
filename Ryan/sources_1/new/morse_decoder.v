`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2024 01:40:48 AM
// Design Name: 
// Module Name: morse_decoder
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


module morse_decoder(input clk, input b, output reg dot, output reg dash, output reg lg, output reg wg);

    parameter IDLE = 0, DOT = 1, DASH = 2, LETTER_GAP = 3, WORD_GAP = 4;

    reg [2:0] state = IDLE;
    reg [2:0] next_state;
    reg [23:0] time_counter;


    parameter unit = 5_000_000; // 50 ms in clock cycles from 100 Mhz
    parameter dot_t = 1 * unit; //dot
    parameter dash_t = 3 * unit; //dash
    parameter lg_t = 3 * unit; //gap
    parameter wg_t = 7 * unit; //gap

    always @(posedge clk) begin
        dot = 0; // Reset outputs
        dash = 0;
        lg = 0;
        wg = 0;


        case (state)
            IDLE: begin
                time_counter = 0;
                if (b) begin
                    next_state = DOT;
                end else begin
                    next_state = IDLE;
                end
            end
            
            DOT: begin
                time_counter = time_counter + 1;
                if (!b) begin
                    if (time_counter >= dot_t) begin
                        dot = 1;
                        next_state = IDLE;
                    end
                end else if (time_counter >= dash_t) begin
                    next_state = DASH;
                end
            end
            
            DASH: begin
                time_counter = time_counter + 1;
                if (!b) begin
                    if (time_counter >= dash_t) begin
                        dash = 1;
                        next_state = IDLE;
                    end
                end
            end
            
            LETTER_GAP: begin
                time_counter = time_counter + 1;
                if (time_counter >= lg_t) begin
                    lg = 1;
                    next_state = IDLE;
                end
            end
            
            WORD_GAP: begin
                time_counter = time_counter + 1;
                if (time_counter >= wg_t) begin
                    wg = 1;
                    next_state = IDLE;
                end
            end
            
            default: begin
                next_state = IDLE;
            end
        endcase

        state = next_state;
    end
    
endmodule