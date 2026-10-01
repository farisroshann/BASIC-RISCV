`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2026 01:47:20
// Design Name: 
// Module Name: program_counter
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


module program_counter( 
        input [31:0] current_pc,
        input clk,
        input rst,
        output reg [31:0] next_pc
    );
    
    always @(posedge clk or posedge rst) begin
        if(rst) next_pc <= 32'd0;
        else next_pc <= current_pc;
    end
endmodule


module pcplus_4(
        input [31:0] current_pc,
        input clk,
        input rst,
        output reg [31:0] next_pc   
     );
     
     always @(posedge clk or posedge rst) begin
        if(rst) next_pc <= 32'd0;
        else next_pc <= current_pc + 4;
     end
endmodule