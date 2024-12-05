`timescale 1ns / 1ps

module comparator(
     input logic [7:0] number,
     input logic [7:0] match,
     output logic comp_out
     
    );
    
    
always_comb begin
    if(number == match) begin
        comp_out = 1;
    end 
    else if (number != 1) begin
        comp_out = 0 ;
    end         
    else begin
        comp_out = 0;
    end
    end
endmodule
