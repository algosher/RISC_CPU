`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2026 12:23:47 PM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter   #(parameter SIZE=`SIZE)
                        (input clk,
                        input rst,
                        input load,
                        input inc_pc,
                        input [SIZE-1:0]in_data,
                       output reg [SIZE-1:0]pc);
        always @(posedge clk) begin
            if(rst) pc<=0;
            else if(load) pc<=in_data;
            else if(inc_pc) pc<=pc+1'b1;
        end
endmodule
