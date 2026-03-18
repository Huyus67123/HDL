module count_load(
    input Ena, CLK, Reset,load, 
	 input[3:0]n,
    output reg [3:0] Q 
);
    always @(posedge CLK or negedge Reset) begin
        if (!Reset) begin
            Q <= 4'b0000; 
        end else if (Ena) begin
				if (load) begin
					Q <=n;
				end else if (Q == 4'd9) begin 
						Q<=0;
						end else begin
						Q <= Q + 1'b1;
					end
        end
    end
endmodule