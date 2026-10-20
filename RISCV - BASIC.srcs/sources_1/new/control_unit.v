`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2026 22:52:52
// Design Name: 
// Module Name: control_unit
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

module control_unit(
    input  [6:0] Opcode,
    output reg ALUSrc,
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg MemWrite,
    output reg regwrite,
    output reg [1:0] ALUOp
);

    always @(*) begin
        casex(Opcode)
        7'b0110011: begin // R TYPE instruction
            ALUSrc = 0;
            MemToReg = 0;
            regwrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            ALUOp = 2'b10;
        end

        7'b0000011: begin // Load Word
            ALUSrc = 1;
            MemToReg = 1;
            regwrite = 1;
            MemRead = 1;
            MemWrite = 0;
            Branch = 0;
            ALUOp = 2'b00;
        end

        7'b0100011: begin // Store Word
            ALUSrc = 1;
            MemToReg = 0;
            regwrite = 0;
            MemWrite = 1;
            MemRead = 0;
            Branch = 0;
            ALUOp = 2'b00;
        end

        7'b1100011 : begin // Branch Equal condition
            ALUSrc = 0;
            MemToReg = 0;
            regwrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 1;
            ALUOp = 2'b01;
        end

        default: begin
            ALUSrc   = 0;
            MemToReg = 0;
            regwrite = 0;
            MemRead  = 0;
            MemWrite = 0;
            Branch   = 0;
            ALUOp    = 2'b00;
        end


        // CURRENTLY this completes the datapath but at later I need to implement other I Type, 
        // Other Branch ( BNE , BLT) , Jumps(JAL , JALR) , Upper Immediates (LUI , AUIPC)
        // ALUOp 00: ADD 01:SUB 10: funct3/funct7 11: Not used (Reserved)

        endcase
    end

endmodule
