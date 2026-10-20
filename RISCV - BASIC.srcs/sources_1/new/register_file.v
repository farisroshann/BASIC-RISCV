`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2026 13:56:47
// Design Name: 
// Module Name: register_file
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


module register_file(
        input [4:0] rs1,
        input [4:0] rs2,
        input [4:0] rd,
        input clk,
        input rst,
        input regwrite,
        input   [31:0] write_data,
        output  [31:0] read_data1,
        output  [31:0] read_data2
    );
    
    reg [31:0] Registers [31:0];  //32 32bit Registers
    integer k;

    // asynchronous read whereas synchronous write ( STANDARD riscv architecture)
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            for(k=0; k < 32 ; k=k+1) begin
                Registers[k] <= 32'b00;
            end      
        end
        
        else if (regwrite && rd != 0) begin   // X0 is always wired to 0
            Registers[rd] <= write_data;
        end
    end   
    
    assign read_data1 = Registers[rs1];
    assign read_data2 = Registers[rs2];
endmodule
