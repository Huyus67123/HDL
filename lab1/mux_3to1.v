module mux_3to1(in1,in2,in3,sel,out);
	input in1,in2,in3;
	input [1:0] sel;
	output out;
	assign out = (in1&~sel[0]&~sel[1])|(in2&~sel[0]&sel[1])|(in3&sel[0]&~sel[1]);
endmodule
