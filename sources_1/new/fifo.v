module fifo(
    input clk,
    input we,
    input re,
    input [7:0] din,
    output reg [7:0] dout,
    output empty,
    output full
);

parameter FIFO_DEPTH = 16;  
parameter ADDR_WIDTH = 4;  

reg [7:0] fifo_mem[FIFO_DEPTH-1:0];
reg [ADDR_WIDTH-1:0] w_ptr, r_ptr; 
reg [ADDR_WIDTH:0] count;       


assign empty = (count == 0);
assign full = (count == FIFO_DEPTH);

always @(posedge clk) begin
   
    if (we && !full) begin
        fifo_mem[w_ptr] <= din;
        w_ptr <= w_ptr + 1;
        count <= count + 1;
    end

  
    if (re && !empty) begin
        dout <= fifo_mem[r_ptr];
        r_ptr <= r_ptr + 1;
        count <= count - 1;
    end
end


initial begin
    w_ptr = 0;
    r_ptr = 0;
    count = 0;
end

endmodule