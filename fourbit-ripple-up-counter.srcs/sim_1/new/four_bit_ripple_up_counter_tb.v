`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2025 23:02:15
// Design Name: 
// Module Name: four_bit_ripple_up_counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for 4-bit ripple up counter
// 
// Dependencies: four_bit_ripple_up_counter.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module four_bit_ripple_up_counter_tb;
    reg clk;
    reg reset;
    wire [3:0] q, qbar;

    // Instantiate the Unit Under Test (UUT)
    four_bit_ripple_up_counter uut (
        .q(q),
        .qbar(qbar),
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $dumpfile("ripple_carry_counter_tb.vcd");
        $dumpvars(0, four_bit_ripple_up_counter_tb);

        // Initial reset
        reset = 1'b1;
        #15 reset = 1'b0;  // Release reset
        #180 reset = 1'b1; // Assert reset again
        #20 reset = 1'b0;  // Release reset again

        $display("Test complete.");
        #20 $finish;
    end

    // Monitor values
    initial begin
        $monitor("Time: %0dns | q = %b | clk = %b | reset = %b", $time, q, clk, reset);
    end
endmodule
