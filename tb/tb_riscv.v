module tb_riscv;
    reg clk;
    reg reset;
    wire [31:0] pc_out;

    // Instance of your Top Module
    riscv_top uut (
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out)
    );

    // Clock Generation (100MHz = 10ns period)
    always #5 clk = ~clk;

    initial begin
        // Setup for Waveform Viewing
        $dumpfile("simulation.vcd"); 
        $dumpvars(0, tb_riscv);

        // Initialize signals
        clk = 0;
        reset = 1;      // Start with reset ACTIVE
        #20 reset = 0;  // Release reset after 2 cycles

        // Let it run for 200ns so you can see the results clearly
        #200;

        $display("Simulation Finished. PC reached: %h", pc_out);
        $finish;
    end
endmodule