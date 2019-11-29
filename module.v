module m(input wire [1:0] op, input wire [15:0] i, output wire [15:0] o);
	wire t, t1, t2, t3;
	mux2 mux2_1(1'b0, i[1], op[0], t);
	and2 and2_1(op[1],!op[0], t1); 
	mux2 mux2_1_1(t, i[15], t1, o[0]);
	
	mux2 mux2_2(i[0], i[2], op[0], o[1]);
	mux2 mux2_3(i[1], i[3], op[0], o[2]);
	mux2 mux2_4(i[2], i[4], op[0], o[3]);
	mux2 mux2_5(i[3], i[5], op[0], o[4]);
	mux2 mux2_6(i[4], i[6], op[0], o[5]);
	mux2 mux2_7(i[5], i[7], op[0], o[6]);
	mux2 mux2_8(i[6], i[8], op[0], o[7]);
	mux2 mux2_9(i[7], i[9], op[0], o[8]);
	mux2 mux2_10(i[8], i[10], op[0], o[9]);
	mux2 mux2_11(i[9], i[11], op[0], o[10]);
	mux2 mux2_12(i[10], i[12], op[0], o[11]);
	mux2 mux2_13(i[11], i[13], op[0], o[12]);
	mux2 mux2_14(i[12], i[14], op[0], o[13]);
	mux2 mux2_15(i[13], i[15], op[0], o[14]);

	mux2 mux2_16(i[14], 1'b0, op[0], t2);
	and2 and2_2(op[1], op[0], t3);
	mux2 mux2_16_1(t2, i[0], t3, o[15]);
	

endmodule
