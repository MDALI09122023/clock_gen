module clock_divider (
    input wire clk_in,      // 256 MHz input clock
    input wire reset,       // Asynchronous reset
    output reg clk_out      // 1 MHz output clock
);

    reg [7:0] counter;      // 8-bit counter (log2(256) = 8)

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 8'b0;    // Reset the counter to 0
            clk_out <= 1'b0;    // Reset the output clock
        end else if (counter == 8'd127) begin
            counter <= 8'b0;    // Reset the counter when 128 cycles are reached
            clk_out <= ~clk_out; // Toggle the output clock
        end else begin
            counter <= counter + 1; // Increment the counter
        end
    end

endmodule
