`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2026 19:39:39
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [31:0] read_address,
    input [31:0] Write_data,
    output [31:0] MemData_Out
   );
   integer k;
   reg [31:0] Data_Memory[63:0]; // only using the 0-6 bits

   always @(posedge clk or posedge reset) begin
        if(reset) begin
            for(k = 0; k < 64 ; k = k + 1) begin
                Data_Memory[k] <= 32'b00;
            end   
        end
        else if(MemWrite) begin
            Data_Memory[read_address[7:2]] <= Write_data; // Word Indexing instead of normal bit indexing
        end
    end  

    assign MemData_Out = (MemRead) ? Data_Memory[read_address[7:2]] : 32'b00;

endmodule
