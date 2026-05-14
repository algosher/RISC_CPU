`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2026 08:31:49 PM
// Design Name: 
// Module Name: Register
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
module Register     #(parameter SIZE=`SIZE)
                    (input [SIZE-1:0]in,
                    input rst,
                    input clk,
                    input load,
                    output reg [SIZE-1:0] out_data);
        always @(posedge clk) begin
            if(rst) out_data <= 0;
            else if(load) out_data <= in;
        end   
endmodule
