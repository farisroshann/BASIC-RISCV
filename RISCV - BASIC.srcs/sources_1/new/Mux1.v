`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2026 20:03:36
// Design Name: 
// Module Name: Mux1
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


module Mux1(
        input sel,
        input [31:0] A,
        input [31:0] B,
        output [31:0] Data_out

    );

    assign Data_out = (sel == 1'b0) ? B : A;
endmodule
