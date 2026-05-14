`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2026 12:33:47 PM
// Design Name: 
// Module Name: ALU
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
`include "define.vh"
module ALU  #(parameter SIZE=`SIZE)
            ( output reg [SIZE-1:0] out,
            output is_zero,
            input [2:0] Opcode,
            input [SIZE-1:0]inA,
            input [SIZE-1:0]inB);
        assign is_zero = (inA == 0) ? 1'b1 : 1'b0;
        always @(*) begin
            case(Opcode)
                `HLT: out = inA;
                `SKZ: out = inA;
                `ADD: out = inA + inB;
                `AND: out = inA & inB;
                `XOR: out = inA ^ inB;
                `LDA: out = inB;
                `STO: out = inA;
                `JMP: out = inA;
                default:out = 32'd0;
            endcase
        end
endmodule
