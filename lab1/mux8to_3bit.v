module mux8to_3bit(
	input  [2:0] d0,d1,d2,d3,d4,d5,d6,d7,
	input  s0,s1,s2,
	output [2:0] y
);

	wire [2:0] w0,w1,w2,w3;
	wire [2:0] w4,w5;

	mux_2to1 m1(d0,d1,s0,w0);
	mux_2to1 m2(d2,d3,s0,w1);
	mux_2to1 m3(d4,d5,s0,w2);
	mux_2to1 m4(d6,d7,s0,w3);

	mux_2to1 m5(w0,w1,s1,w4);
	mux_2to1 m6(w2,w3,s1,w5);

	mux_2to1 m7(w4,w5,s2,y);

endmodule