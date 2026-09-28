`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 20:26:10
// Design Name: 
// Module Name: alu
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



module alu(
        input [31:0] a,
        input [31:0] b,
        input [3:0] alu_control, 
        output reg [31:0] alu_result,
        output reg zero
    );
    
    
    // INTIALIZATION
    
    
    
    always @(*) begin
        casex(alu_control)
            4'b0000 : alu_result = a + b;
            4'b0001 : alu_result = a - b;
            4'b0010 : alu_result = a & b;
            4'b0011 : alu_result = a | b;
            4'b0100 : alu_result = a ^ b;
            4'b0101 : alu_result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;
            4'b0110 : alu_result = (a < b) ? 32'd1 : 32'd0;
            4'b0111 : alu_result = a << b[4:0];
            4'b1000 : alu_result = a >> b[4:0];
            4'b1001 : alu_result = $signed(a) >>> b[4:0];
            4'b1010 : alu_result = b;
            
        endcase
    end
endmodule
