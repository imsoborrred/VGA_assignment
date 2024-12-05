`timescale 1ns / 1ps

module controller(  

    input logic clk,
    input logic reset,
    input logic in_bit,
    input logic f,
    output logic s,
    output logic en_counter
    
    );
        
    typedef enum logic [1:0] {
    IDLE,
    draw,
    black
    } state_t;
    state_t current_state, next_state;
// reset    
always_ff@(posedge clk or negedge reset)begin 
    if(~reset)
      current_state <= IDLE ;
    else
         current_state <= next_state ;
    end
// next state logic 
always_comb begin 
    case(current_state)
    IDLE : next_state = in_bit ? draw : black;    
    draw : next_state = f ? IDLE : draw; 
    black:  next_state = f ? IDLE : black;   
    default: next_state = IDLE;
    endcase;

    end
  
  // output logic   
always_comb begin 
    case(current_state)
    IDLE : en_counter=0;
    draw : begin
           en_counter=1;
           s = 0 ;
           end
           
    black: begin
           en_counter=1;
           s = 1;
           end
           
   
    endcase
    end
    
endmodule
