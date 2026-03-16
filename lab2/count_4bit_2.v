module count_4bit_2(
    input Ena, CLK, Reset,
    output reg [3:0] Q 
);
    always @(posedge CLK or negedge Reset) begin
        if (!Reset) begin
            Q <= 4'b0000; 
        end else if (Ena) begin
            Q <= Q + 1'b1;
        end
    end
endmodule
	
