`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2026 13:06:20
// Design Name: 
// Module Name: Instruction__Mem
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


module Instruction__Mem(
    input clk, 
    input rst,
    input [31:0] read_address,
    output reg [31:0] instruction_out
    );
    
    reg [31:0] I_Mem[63:0];
    
    integer i;
    
    always @(posedge clk or posedge rst) begin
         if(rst) begin
            for(i = 0; i < 64; i= i + 1) begin
                I_Mem[i] <= 32'b00;
            end
         end
         else begin
                instruction_out <= I_Mem[read_address]; 
         end
    end
endmodule
