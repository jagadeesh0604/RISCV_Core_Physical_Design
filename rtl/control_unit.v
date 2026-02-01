module control_unit (
    input [6:0] opcode,
    output reg reg_write, alu_src, mem_to_reg, mem_read, mem_write, branch,
    output reg [1:0] alu_op
);
    always @(*) begin
        case (opcode)
            7'b0110011: begin // R-type
                reg_write = 1; alu_src = 0; alu_op = 2'b10;
                mem_read = 0; mem_write = 0; mem_to_reg = 0; branch = 0;
            end
            7'b0010011: begin // I-type (ADDI)
                reg_write = 1; alu_src = 1; alu_op = 2'b00;
                mem_read = 0; mem_write = 0; mem_to_reg = 0; branch = 0;
            end
            default: begin // Prevents unintended latches
                reg_write = 0; alu_src = 0; alu_op = 2'b00;
                mem_read = 0; mem_write = 0; mem_to_reg = 0; branch = 0;
            end
        endcase
    end
endmodule