module count_4bit(
    input CLK, ENA, Clear,
    output [3:0] Q
);

	wire t1,t2,t3;

	T_flipflop FF0(CLK,Clear,ENA,Q[0]);

	and g1(t1,Q[0],ENA);
	T_flipflop FF1(CLK,Clear,t1,Q[1]);

	and g2(t2,Q[1],t1);
	T_flipflop FF2(CLK,Clear,t2,Q[2]);

	and g3(t3,Q[2],t2);
	T_flipflop FF3(CLK,Clear,t3,Q[3]);

endmodule