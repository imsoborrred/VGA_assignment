`timescale 1ns / 1ps

module drawing_tb;

    // Inputs to the DUT
    logic clk;
    logic reset;
    logic BTNC;
    logic BTNU;
    logic s_color;
    logic en_counter;

    // Outputs from the DUT
    logic f;
    logic [7:0] x;
    logic [6:0] y;
    logic [2:0] color;
    //logic com1,compp;

    // Instantiate the DUT
    drawing uut (
        .clk(clk),
        .reset(reset),
        .BTNC(BTNC),
         .BTNU(BTNU),
        .s_color(s_color),
        .en_counter(en_counter),
        .f(f),
        .x(x),
        .y(y),
        .color(color)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period: 10ns
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1'b0;
        BTNC = 1'b0;
        s_color = 1'b0;
        en_counter = 1'b0;

        // Apply reset
        #10 reset = 1'b1; // De-assert reset
        #10 reset = 1'b0; // Assert reset
        #10 reset = 1'b1; // Assert reset

        // Enable counter
        #10 en_counter = 1'b1;

        // Change input bits and observe outputs
        #20 BTNC = 1'b1; BTNU = 0;
        #20 BTNC = 1'b0; BTNU = 0;
        #20 s_color = 1'b1; // Enable color drawing
        #20 s_color = 1'b0; // Disable color drawing

        // Observe counters
        #100;

        // End simulation
        repeat(200)@( negedge clk);
        #200 $stop;
    end

    // Monitor outputs
    initial begin
       // $monitor("Time=%0t | clk=%b | reset=%b | in_bit=%b | s_color=%b | en_counter=%b | f=%b | x=%d | y=%d | color=%b",
       //          $time, clk, reset, in_bit, s_color, en_counter, f, x, y, color);
    end

endmodule
