module D_flipflop(
    input CLK, Clean, D,
    output reg Q,
    output Qn
);
    assign Qn = ~Q;

    always @(posedge CLK or posedge Clean) begin
        if (Clean) begin
            Q <= 1'b0;
        end else begin
            Q <= D;
        end
    end

endmodule