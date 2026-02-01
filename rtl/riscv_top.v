module riscv_top (
    input clk,
    input reset,
    output [31:0] pc_out
);
    wire [31:0] current_pc, pc_next, instr, reg_data1, reg_data2, alu_result, imm_ext, alu_in2;
    wire [3:0] alu_ctrl_signal;
    wire [1:0] alu_op;
    wire reg_write, alu_src, mem_read, mem_write, mem_to_reg, branch, alu_zero;

    assign pc_next = current_pc + 4;
    assign pc_out = current_pc;

    pc_unit my_pc (.clk(clk), .reset(reset), .pc_next(pc_next), .pc(current_pc));
    instruction_mem my_mem (.addr(current_pc), .instruction(instr));
    imm_gen my_imm (.instr(instr), .imm_ext(imm_ext));

    control_unit my_ctrl (
        .opcode(instr[6:0]), .reg_write(reg_write), .alu_op(alu_op),
        .mem_to_reg(mem_to_reg), .mem_read(mem_read), .mem_write(mem_write),
        .alu_src(alu_src), .branch(branch)
    );

    alu_decoder my_dec (
        .alu_op(alu_op), .funct3(instr[14:12]), .funct7_5(instr[30]),
        .alu_control(alu_ctrl_signal)
    );

    register_file my_rf (
        .clk(clk), .rf_en(reg_write),
        .rs1(instr[19:15]), .rs2(instr[24:20]), .rd(instr[11:7]),
        .write_data(alu_result), .reg_data1(reg_data1), .reg_data2(reg_data2)
    );

    assign alu_in2 = (alu_src) ? imm_ext : reg_data2;

    alu my_alu (
        .a(reg_data1), .b(alu_in2), .alu_control(alu_ctrl_signal),
        .result(alu_result), .zero(alu_zero)
    );
endmodule