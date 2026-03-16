module T_flipflop (
    input CLK, Reset, T,
    output reg Q
);
    always @(posedge CLK or negedge Reset) begin
        if (!Reset) begin
            Q <= 1'b0;      
        end else begin
            if (T) begin
                Q <= ~Q;    
            end else begin
                Q <= Q;    
            end
        end
    end
endmodule