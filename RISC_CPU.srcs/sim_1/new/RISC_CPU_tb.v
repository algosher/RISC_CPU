`timescale 1ns / 1ps
`include "define.vh"

module RISC_CPU_tb;

    reg clk;
    reg rst;
    wire halt;

    integer i;

    RISC_CPU dut (
        .clk(clk),
        .rst(rst),
        .halt(halt)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        for (i = 0; i < 1024; i = i + 1) begin
            dut.mem_unit.memory[i] = 32'd0;
        end

        dut.mem_unit.memory[0] = {`LDA, 29'd10};

        dut.mem_unit.memory[1] = {`ADD, 29'd11};

        dut.mem_unit.memory[2] = {`STO, 29'd12};

        dut.mem_unit.memory[3] = {`HLT, 29'd0};

        dut.mem_unit.memory[10] = 32'd5;
        dut.mem_unit.memory[11] = 32'd7;
        dut.mem_unit.memory[12] = 32'd0;

        repeat (3) @(posedge clk);
        rst = 0;

        $display("===== BAT DAU MO PHONG RISC CPU =====");

        wait (halt == 1'b1);

        #20;

        $display("===== KET QUA MO PHONG =====");
        $display("Memory[10] = %0d", dut.mem_unit.memory[10]);
        $display("Memory[11] = %0d", dut.mem_unit.memory[11]);
        $display("Memory[12] = %0d", dut.mem_unit.memory[12]);
        $display("Accumulator = %0d", dut.ac_out);
        $display("PC = %0d", dut.pc_out);

        if (dut.mem_unit.memory[12] == 32'd12) begin
            $display("TEST PASSED: Memory[12] = 12");
        end
        else begin
            $display("TEST FAILED: Memory[12] = %0d", dut.mem_unit.memory[12]);
        end

        $finish;
    end

    initial begin
        #2000;
        $display("TIMEOUT: CPU khong gap lenh HLT");
        $finish;
    end

endmodule