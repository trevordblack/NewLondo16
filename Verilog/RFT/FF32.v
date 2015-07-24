module FF32(D, CLK, Reset, Q);

	input [31:0] D;
	input CLK, Reset;
	output [31:0] Q;

	FF FF00 (D[00], CLK, Reset, Q[00]);
	FF FF01 (D[01], CLK, Reset, Q[01]);
	FF FF02 (D[02], CLK, Reset, Q[02]);
	FF FF03 (D[03], CLK, Reset, Q[03]);
	FF FF04 (D[04], CLK, Reset, Q[04]);
	FF FF05 (D[05], CLK, Reset, Q[05]);
	FF FF06 (D[06], CLK, Reset, Q[06]);
	FF FF07 (D[07], CLK, Reset, Q[07]);
	FF FF08 (D[08], CLK, Reset, Q[08]);
	FF FF09 (D[09], CLK, Reset, Q[09]);
	FF FF10 (D[10], CLK, Reset, Q[10]);
	FF FF11 (D[11], CLK, Reset, Q[11]);
	FF FF12 (D[12], CLK, Reset, Q[12]);
	FF FF13 (D[13], CLK, Reset, Q[13]);
	FF FF14 (D[14], CLK, Reset, Q[14]);
	FF FF15 (D[15], CLK, Reset, Q[15]);
	FF FF16 (D[16], CLK, Reset, Q[16]);
	FF FF17 (D[17], CLK, Reset, Q[17]);
	FF FF18 (D[18], CLK, Reset, Q[18]);
	FF FF19 (D[19], CLK, Reset, Q[19]);
	FF FF20 (D[20], CLK, Reset, Q[20]);
	FF FF21 (D[21], CLK, Reset, Q[21]);
	FF FF22 (D[22], CLK, Reset, Q[22]);
	FF FF23 (D[23], CLK, Reset, Q[23]);
	FF FF24 (D[24], CLK, Reset, Q[24]);
	FF FF25 (D[25], CLK, Reset, Q[25]);
	FF FF26 (D[26], CLK, Reset, Q[26]);
	FF FF27 (D[27], CLK, Reset, Q[27]);
	FF FF28 (D[28], CLK, Reset, Q[28]);
	FF FF29 (D[29], CLK, Reset, Q[29]);
	FF FF30 (D[30], CLK, Reset, Q[30]);
	FF FF31 (D[31], CLK, Reset, Q[31]);

endmodule