`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2026 14:27:09
// Design Name: 
// Module Name: Imm_Gen
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


module Imm_Gen(
    input [32:0] instruction,
    output reg [31:0] ImmOut    // NEEDS TO FIX
    );

    
    always @(*) begin
        case(instruction[6:0])  // 6:0 represents the opcode
            7'b0000011 : ImmOut = {{20{instruction[31]}} , instruction[31:20]};  // I TYPE
            7'b0100011 : ImmOut = {{20{instruction[31]}} , instruction[31:25] , instruction[11:7]};  // S TYPE
            7'b1100011 : ImmOut = {{19{instruction[31]}} , instruction[31] , instruction[7] , instruction[30:25] , instruction[11:8] , 1'b0};  
            // J TYPE AND U TYPE INSTRUCTIONS ADD LATER ... LOOK INTO THEORY
                 
        endcase
    end
    
endmodule
