`timescale 1ns / 1ps

 module mux_2_1 # (parameter width = 3)
 (
    input logic [width-1:0] a,   
    input logic [width-1:0] b,   
    input logic s,             
    output logic [width-1:0] f   
);

    always @(*) begin
        if (s)
            f = b;               
        else
            f = a;              
    end

endmodule
//`timescale 1ns / 1ps
//module mux_2_1
//    #(parameter width = 8)
//    (
//    input logic clk,
//    input logic reset,
//    input [width-1:0]  a,
//    input [width-1:0]  b,
//    input  sreg,
//    output logic [width-1:0] f
//    );
    
////    always @ (posedge clk, negedge reset) begin    
//    always @ (*) begin  
//        if (sreg)
//            f = b;
//        else
//            f = a;
//    end
    
//endmodule
/////