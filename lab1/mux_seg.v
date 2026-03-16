module mux_seg(u,v,w,x,y,s,out);
	input [2:0] u,v,w,x,y,s;
	wire [2:0] m;
	output [6:0] out;
	mux_5to1_3bit(u,v,w,x,y,s,m);
	segment_7(m,out);
endmodule
	