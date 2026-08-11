module parking_lot_controller #(
    parameter CAPACITY = 8
)(
    input  wire       clk,
    input  wire       reset,
    input  wire       entry,
    input  wire       exit,
    output reg [3:0]  count,
    output wire       full
);

    assign full = (count == CAPACITY);

    always @(posedge clk) begin
        if (reset) begin
            count <= 4'd0;
        end
        else begin
            case ({entry, exit})

                2'b10: begin
                    // Vehicle entering
                    if (count < CAPACITY)
                        count <= count + 1'b1;
                end

                2'b01: begin
                    // Vehicle exiting
                    if (count > 0)
                        count <= count - 1'b1;
                end

                2'b11: begin
                    // Entry and exit together
                    count <= count;
                end

                default: begin
                    count <= count;
                end

            endcase
        end
    end

endmodule