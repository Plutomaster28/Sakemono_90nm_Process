// Simple 8-bit counter to test Sakemono 90nm PDK
// This design will validate basic synthesis, placement, and routing

module counter (
    input wire clk,
    input wire rst_n,
    input wire enable,
    output reg [7:0] count,
    output wire overflow
);

    // Counter logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 8'b0;
        end else if (enable) begin
            count <= count + 1'b1;
        end
    end

    // Overflow detection
    assign overflow = (count == 8'hFF) && enable;

endmodule