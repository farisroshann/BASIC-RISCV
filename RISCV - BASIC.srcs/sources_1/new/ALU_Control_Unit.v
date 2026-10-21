`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2026 23:30:21
// Design Name: 
// Module Name: ALU_Control_Unit
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


module ALU_Control_Unit(
    input [1:0] ALUOp,
    input [6:0] funct7,
    input [2:0] funct3,
    output  reg [3:0] alu_control
    );

    always @(*) begin
        case(ALUOp)
        2'b00: alu_control = 4'b0000;
        2'b01: alu_control = 4'b0001;
        2'b01: casex({funct7, funct3})
            10'b0000000000: alu_control = 4'b0000; // GO THROUGH TABLE IN TAB
            10'b0100000000: alu_control = 4'b0001;
            10'b0000000111: alu_control = 4'b0010;
            10'b0000000110: alu_control = 4'b0011;
            10'b0000000100: alu_control = 4'b0100;
            10'b0000000010: alu_control = 4'b0101;
            10'b0000000011: alu_control = 4'b0110;
            10'b0000000001: alu_control = 4'b0111;
            10'b0000000101: alu_control = 4'b1000;
            10'b0100000101: alu_control = 4'b1001;
        endcase
        default: alu_control = 4'b0000;
        endcase
    end


endmodule
