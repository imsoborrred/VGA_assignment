`timescale 1ns / 1ps

module n_counter #(
    parameter n = 8 // Default counter width
) (
    input logic clk,
    input logic reset,
    input logic y_reset,
    input logic en,
    output logic [n-1:0] count // Parameterized counter width
);

//    always_ff @(posedge clk or negedge reset) begin
//        if (!reset)       
//            count <= 0;  
//        else begin   
//             if (en)  
//                count <= count + 1;  
//        end
//    end

    always_ff @(posedge clk or negedge reset) begin
        if (!reset || y_reset) begin      
            count <= 0;
        end
        else if (en) begin   
             
                count <= count + 1;
            
                
        end
    end
    
endmodule
