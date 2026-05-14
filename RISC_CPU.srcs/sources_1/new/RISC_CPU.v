`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2026 08:43:50 PM
// Design Name: 
// Module Name: RISC_CPU
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

module RISC_CPU (
    input clk,
    input rst,
    output halt 
);

    wire [31:0] data_bus;        
    wire [31:0] pc_out;         
    wire [31:0] ir_out;          
    wire [31:0] ac_out;       
    wire [31:0] alu_out;         
    wire [31:0] address_mux_out; 

    wire sel, rd, wr, ld_ir, ld_ac, ld_pc, inc_pc, data_e;

    wire is_zero;
    wire [2:0] opcode;

    assign opcode = ir_out[31:29]; 
    assign data_bus = data_e ? ac_out : 32'bz;
    Controller ctrl_unit (
        .clk(clk),
        .rst(rst),
        .Opcode(opcode),
        .is_zero(is_zero),
        .sel(sel),
        .rd(rd),
        .ld_ir(ld_ir),
        .halt(halt),
        .inc_pc(inc_pc),
        .ld_ac(ld_ac),
        .ld_pc(ld_pc),
        .wr(wr),
        .data_e(data_e)
    );

    ProgramCounter pc_unit (
        .clk(clk),
        .rst(rst),
        .load(ld_pc),
        .inc_pc(inc_pc),
        .in_data(data_bus), 
        .pc(pc_out)
    );

    AddressMUX addr_mux_unit (
        .sel(sel),
        .ir(ir_out),
        .pc(pc_out),
        .mux(address_mux_out)
    );
   
    Memory mem_unit (
        .clk(clk),
        .rd(rd),
        .wr(wr),
        .address(address_mux_out[9:0]), 
        .data(data_bus) 
    );
 
    Register ir_reg (
        .clk(clk),
        .rst(rst),
        .load(ld_ir),
        .in(data_bus), 
        .out_data(ir_out)
    );

    Register ac_reg (
        .clk(clk),
        .rst(rst),
        .load(ld_ac),
        .in(alu_out), 
        .out_data(ac_out)
    );

    ALU alu_unit (
        .Opcode(opcode),
        .inA(ac_out),   
        .inB(data_bus), 
        .out(alu_out),
        .is_zero(is_zero)
    );
endmodule