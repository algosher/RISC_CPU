`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2026 01:42:11 PM
// Design Name: 
// Module Name: AddressMUX
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
module AddressMUX   #(parameter SIZE=`SIZE)
                    (input  sel,
                    input [SIZE-1:0 ]ir,
                    input [SIZE-1:0 ]pc, 
                    output[SIZE-1:0] mux );
       assign mux = sel? pc : ir;
endmodule
