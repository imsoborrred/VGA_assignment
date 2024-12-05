`timescale 1ns / 1ps
module fpga_top(
    input wire CLK100MHZ,              // System clock input
    output wire [3:0] VGA_R,     // VGA red channel output
    output wire [3:0] VGA_G,     // VGA green channel output
    output wire [3:0] VGA_B,     // VGA blue channel output
    output wire VGA_HS,          // VGA horizontal sync
    output wire VGA_VS,           // VGA vertical sync
    input wire CPU_RESETN,BTNC,BTNR
    );
        logic clk,plot;
        logic reset_n;
        logic [7:0] x;
        logic [6:0] y;
        logic [2:0] color;
        assign reset_n = CPU_RESETN;
        assign clk = CLK100MHZ;
        
vga_core vga_instance(
    .clk(clk),                        // Clock input
    .resetn(reset_n),                      // resetn signal
    .x(x),                    // X-coordinate (8 bits for 160)
    .y(y),                          // Y-coordinate (7 bits for 120)
    .color(color),                // Pixel color input (3 bits)
    .plot(plot),                       // Write enable
    .VGA_R(VGA_R),                      // VGA red channel
    .VGA_G(VGA_G),                        // VGA green channel
    .VGA_B(VGA_B),                      // VGA blue channel
    .VGA_HS(VGA_HS),                    // Horizontal sync
    .VGA_VS(VGA_VS)                     // Vertical sync
);    
drawing roqi(
    .clk(clk),
    .reset(reset_n),
    .in_bit(BTNC),
    .s_color(),
    .en_counter,
    .f,    
    .x,
    .y,
    .color
);    
endmodule
