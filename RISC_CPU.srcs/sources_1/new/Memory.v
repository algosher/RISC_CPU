`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2026 08:54:14 PM
// Design Name: 
// Module Name: Memory
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
module Memory   #(parameter SIZEDATA=`SIZE,
                parameter SIZEADD=10)
                (input[SIZEADD-1:0] address,
                inout [SIZEDATA-1:0] data,
                input rd,
                input wr,
                input clk );
                reg [SIZEDATA-1:0] memory [0:(1<<SIZEADD)-1];
        always @(posedge clk) begin
            if(wr) memory[address]<=data;
        end
        assign data = rd ?  memory[address]: 32'bz;
endmodule
