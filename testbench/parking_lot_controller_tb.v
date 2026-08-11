`timescale 1ns/1ps

module parking_lot_controller_tb;

    reg clk;
    reg reset;
    reg entry;
    reg exit;

    wire [3:0] count;
    wire full;

    parking_lot_controller #(
        .CAPACITY(8)
    ) DUT (
        .clk(clk),
        .reset(reset),
        .entry(entry),
        .exit(exit),
        .count(count),
        .full(full)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("parking_lot.vcd");
        $dumpvars(0, parking_lot_controller_tb);

        // Initial values
        clk   = 0;
        reset = 1;
        entry = 0;
        exit  = 0;

        // Reset
        #10;
        reset = 0;

        // Vehicle 1 enters
        #10 entry = 1;
        #10 entry = 0;

        // Vehicle 2 enters
        #10 entry = 1;
        #10 entry = 0;

        // Vehicle 3 enters
        #10 entry = 1;
        #10 entry = 0;

        // Vehicle exits
        #10 exit = 1;
        #10 exit = 0;

        // Fill remaining spaces
        #10 entry = 1;
        #10 entry = 0;

        #10 entry = 1;
        #10 entry = 0;

        #10 entry = 1;
        #10 entry = 0;

        #10 entry = 1;
        #10 entry = 0;

        #10 entry = 1;
        #10 entry = 0;

        #10 entry = 1;
        #10 entry = 0;

        // Try entering when parking lot is full
        #10 entry = 1;
        #10 entry = 0;

        // Vehicle exits
        #10 exit = 1;
        #10 exit = 0;

        #20;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | Entry=%b Exit=%b | Count=%d | Full=%b",
                 $time, entry, exit, count, full);
    end

endmodule