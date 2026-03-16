module lab1(s,u,v,w,x,y,n1,n2,n3,n4,n0);
	input [2:0]s,u,v,w,x,y;
	wire [2:0]m1,m2,m3,m4,m0;
	output [6:0]n1,n2,n3,n4,n0;
	mux_5to1_3bit(u,v,w,x,y,s,m4);//H E L L O hex4
	mux_5to1_3bit(v,w,x,y,u,s,m3);//E L L O H hex3
	mux_5to1_3bit(w,x,y,u,v,s,m2);//L L O H E hex2
	mux_5to1_3bit(x,y,u,v,w,s,m1);//L O H E L hex1
	mux_5to1_3bit(y,u,v,w,x,s,m0);//O H E L L hex0
	segment_7 (m0,n0);
	segment_7 (m1,n1);
	segment_7 (m2,n2);
	segment_7 (m3,n3);
	segment_7 (m4,n4);
endmodule
