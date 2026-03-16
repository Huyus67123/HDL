module mux_2to1(x,y,s,m);
	input x,y,s;
	output m;
	wire ns, f1, f2;
	not 		g1(ns,s);
	and #5 	g2(f1,x,ns);
	and #5	g3(f2,y,s);
	or  #5	g4(m,f1,f2);
endmodule
