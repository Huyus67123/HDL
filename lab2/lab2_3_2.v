module lab2_3_2(
	input CLK, reset, ena,
	output [6:0]H7,H6,H5,H4,H3,H2,H1,H0
);
	reg [3:0]Q;
	wire n;
	delay_1s (CLK,reset,n);
	always @(posedge CLK or negedge reset) begin
		 if(!reset) begin
			  Q <= 0;
		end
		 else if(n) begin  
			  if(ena) begin
					if(Q == 4'd7) begin
						 Q <= 0;
					end
					else begin
						 Q <= Q + 1;
					end
			  end
		 end
	end

	lab1_b mydecoder(Q[2:0], H7,H6,H5,H4,H3,H2,H1,H0);

endmodule