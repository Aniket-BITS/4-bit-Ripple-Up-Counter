`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2025 20:03:23
// Design Name: 
// Module Name: four_bit_ripple_up_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module four_bit_ripple_up_counter(q,qbar,clk,reset);
    output [3:0] q,qbar;
    input clk,reset;
    T_FF t0(q[0],qbar[0],clk,reset);
    T_FF t1(q[1],qbar[1],qbar[0],reset);
    T_FF t2(q[2],qbar[2],qbar[1],reset);
    T_FF t3(q[3],qbar[3],qbar[2],reset);
endmodule
module T_FF(q,qbar,clk,reset);
    output reg q;
    output qbar;
    input clk,reset;
    always@(posedge reset or posedge clk)
    begin
        if (reset)
            q <=1'b0;
        else
            q <= ~q;
    end
    assign qbar = ~q;
endmodule
