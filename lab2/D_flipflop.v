module D_flipflop(
    input CLK, Reset, D,
    output reg Q
);

    always @(posedge CLK or negedge Reset) begin
        if (!Reset) begin
            Q <= 1'b0; 
        end else begin
            Q <= D;  
        end
    end

endmodule