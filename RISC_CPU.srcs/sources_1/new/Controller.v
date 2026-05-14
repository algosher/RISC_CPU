`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2026 09:50:44 AM
// Design Name: 
// Module Name: Controller
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
module Controller   #(parameter SIZE=`SIZE)
                    (input clk,
                    input rst,
                    input [2:0] Opcode,
                    input is_zero,
                    output reg sel,rd,ld_ir,halt,inc_pc,ld_ac,ld_pc,wr,data_e);
       reg [2:0] count=3'b000;  
       always @(posedge clk) begin              
            if(rst) begin 
                count<=3'b000;
                sel <= 1'b1;
                rd <= 1'b0;
                ld_ir <= 1'b0;
                halt <= 1'b0;
                inc_pc <= 1'b0;
                ld_ac <= 1'b0;
                ld_pc <= 1'b0;
                wr <= 1'b0;
                data_e <= 1'b0;
            end
            else begin
                case(count) 
                    3'b000: begin
                        sel <= 1'b1;
                        rd <= 1'b0;
                        ld_ir <= 1'b0;
                        halt <= 1'b0;
                        inc_pc <= 1'b0;
                        ld_ac <= 1'b0;
                        ld_pc <= 1'b0;
                        wr <= 1'b0;
                        data_e <= 1'b0;
                    end
                    3'b001: begin
                        sel <= 1'b1;
                        rd <= 1'b1;
                        ld_ir <= 1'b0;
                        halt <= 1'b0;
                        inc_pc <= 1'b0;
                        ld_ac <= 1'b0;
                        ld_pc <= 1'b0;
                        wr <= 1'b0;
                        data_e <= 1'b0; 
                    end
                    3'b010: begin
                        sel <= 1'b1;
                        rd <= 1'b1;
                        ld_ir <= 1'b1;
                        halt <= 1'b0;
                        inc_pc <= 1'b0;
                        ld_ac <= 1'b0;
                        ld_pc <= 1'b0;
                        wr <= 1'b0;
                        data_e <= 1'b0;
                    end
                    3'b011: begin
                        sel <= 1'b1;
                        rd <= 1'b1;
                        ld_ir <= 1'b1;
                        halt <= 1'b0;
                        inc_pc <= 1'b0;
                        ld_ac <= 1'b0;
                        ld_pc <= 1'b0;
                        wr <= 1'b0;
                        data_e <= 1'b0;
                    end
                    3'b100: begin
                        sel <= 1'b0;
                        rd <= 1'b0;
                        ld_ir <= 1'b0;
                        if(Opcode==`HLT) halt <= 1'b1; else halt<=1'b0;
                        inc_pc <= 1'b1;
                        ld_ac <= 1'b0;
                        ld_pc <= 1'b0;
                        wr <= 1'b0;
                        data_e <= 1'b0;
                    end
                    3'b101: begin
                        sel <= 1'b0;
                        if(Opcode==`ADD || Opcode==`AND || Opcode==`XOR || Opcode==`LDA) rd <= 1'b1; else rd <= 1'b0;
                        ld_ir <= 1'b0;
                        halt <= 1'b0;
                        inc_pc <= 1'b0;
                        ld_ac <= 1'b0;
                        ld_pc <= 1'b0;
                        wr <= 1'b0;
                        data_e <= 1'b0; 
                    end
                    3'b110: begin
                        sel <= 1'b0;
                        if(Opcode==`ADD || Opcode==`AND || Opcode==`XOR || Opcode==`LDA) rd <= 1'b1; else rd <= 1'b0;
                        ld_ir <= 1'b0;
                        halt <= 1'b0;
                        if(Opcode==`SKZ && is_zero) inc_pc <= 1'b1; else inc_pc <= 1'b0;
                        ld_ac <= 1'b0;
                        if(Opcode==`JMP) ld_pc <= 1'b1; else ld_pc <= 1'b0;
                        wr <= 1'b0;
                        if(Opcode==`STO) data_e <= 1'b1; else data_e <= 1'b0;
                    end
                    3'b111: begin
                        sel <= 1'b0;
                        if(Opcode==`ADD || Opcode==`AND || Opcode==`XOR || Opcode==`LDA) rd <= 1'b1; else rd <= 1'b0;
                        ld_ir <= 1'b0;
                        halt <= 1'b0;
                        inc_pc <= 1'b0;
                        if(Opcode==`ADD || Opcode==`AND || Opcode==`XOR || Opcode==`LDA) ld_ac <= 1'b1; else ld_ac <= 1'b0;
                        if(Opcode==`JMP) ld_pc <= 1'b1; else ld_pc <= 1'b0;
                        if(Opcode==`STO) wr <= 1'b1; else wr <= 1'b0;
                        if(Opcode==`STO) data_e <= 1'b1; else data_e <= 1'b0;
                    end
                    default: begin
                        sel <= 1'b1;
                        rd <= 1'b0;
                        ld_ir <= 1'b0;
                        halt <= 1'b0;
                        inc_pc <= 1'b0;
                        ld_ac <= 1'b0;
                        ld_pc <= 1'b0;
                        wr <= 1'b0;
                        data_e <= 1'b0;
                    end
            endcase
            count<=count +1'b1;
            end
       end
endmodule
