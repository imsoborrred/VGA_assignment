`timescale 1ns / 1ps

module drawing(
input logic clk,
input logic reset,
input logic BTNC,
input logic BTNU,
input logic s_color,
input logic en_counter,
output logic f,
output logic y_reset,    
//counter output    
output logic [7:0]x,
output logic [6:0]y,
output logic [2:0]color
    );
//wire f ;    
//controller
controller fsm(  

    .clk(clk),
    .reset(reset),
    .BTNC(BTNC),
    .BTNU(BTNU),
    .f(f),
    .y_reset(y_reset),
    .s(s_color),
    .en_counter(en_counter)

    );    
    
//comprator output
//logic comb1;
//logic comb2;
//logic comb3;
//counter C1    
logic com1,com2;


x_counter c1(
    .clk(clk),
    .reset(reset),
    .en(en_counter),
    .com1(com1),
    .count(x)
);

//logic [7:0]compp;
assign com1 = (x==159);
assign com2 = (x==159);


//assign compp = (x>159);
// comp 1
//comparator comparator_inst1(
//     .number(x),
//     .match(159), //8'b10011111 //159
//     .comp_out(comb1)
     
//    );

   assign f = (x==159 & y==119) ;
//   assign y_reset = (y==119) ;
   logic f_ff; // delated f
   always @(posedge clk, negedge reset)
   begin 
    if(~reset) f_ff <= 0;
    else f_ff <= f;
   end
   
   //counter C2   
n_counter c2(
    .clk(clk),
    .reset(reset),
    .y_reset(y_reset),
    .en(com2),
    .count(y)
);        
// comp 2
//comparator comparator_inst2(
//     .number(y),
//     .match(119), //8'01110111 //119
//     .comp_out(comb2)
     
//    );     
// comp 3
//comparator comparator_inst3(
//     .number(comb1),
//     .match(comb2), //8'01110111
//     .comp_out(comb3)  
//    );
//assign f  = comb1 & comb2;
// mux to draw black or color
mux_2_1 m1(
   .a(y[2:0]),   
   .b(3'b000),   
   .s(s_color),             
   .f(color)
);     
    
endmodule
