module register_file (
    input clk,
    input rf_en,
    input [4:0] rs1, rs2, rd,
    input [31:0] write_data,
    output [31:0] reg_data1, reg_data2
);
    reg [31:0] registers [31:0];

    // Read Logic
    assign reg_data1 = (rs1 == 5'b0) ? 32'b0 : registers[rs1];
    assign reg_data2 = (rs2 == 5'b0) ? 32'b0 : registers[rs2];

    // Write Logic
    always @(posedge clk) begin
        if (rf_en && rd != 5'b0) begin
            registers[rd] <= write_data;
        end
    end
endmodule