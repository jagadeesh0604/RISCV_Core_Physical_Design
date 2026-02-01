module instruction_mem (
    input [31:0] addr,
    output reg [31:0] instruction
);
    always @(*) begin
        case (addr)
            32'h00000000: instruction = 32'h00500093; // ADDI x1, x0, 5
            32'h00000004: instruction = 32'h00c08113; // ADDI x2, x1, 12
            default:      instruction = 32'h00000013; // NOP
        endcase
    end
endmodule