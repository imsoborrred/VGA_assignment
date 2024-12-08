`timescale 1ns / 1ps

module x_counter #(
    parameter n = 8 // Default counter width
) (
    input logic clk,
    input logic reset,
    input logic en,
    input logic com1,
    output logic [n-1:0] count // Parameterized counter width
);

    always_ff @(posedge clk or negedge reset) begin
        if (!reset || com1) begin      
            count <= 0;
        end
        else if (en) begin   
                count <= count + 1;
        end
    end
    
endmodule
