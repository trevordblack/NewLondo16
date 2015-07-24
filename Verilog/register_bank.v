module register_bank(
	input wire [31:0] r00_D,
	input wire [31:0] r01_D,
	input wire [31:0] r02_D,
	input wire [31:0] r03_D,
	input wire [31:0] r04_D,
	input wire [31:0] r05_D,
	input wire [31:0] r06_D,
	input wire [31:0] r07_D,
	input wire [31:0] r08_D,
	input wire [31:0] r09_D,
	input wire [31:0] r10_D,
	input wire [31:0] r11_D,
	input wire [31:0] r12_D,
	input wire [31:0] r13_D,
	input wire [31:0] r14_D,
	input wire [31:0] r15_D,
	input wire [15:0] hold_D,

	output wire [31:0] r00_Q,
	output wire [31:0] r01_Q,
	output wire [31:0] r02_Q,
	output wire [31:0] r03_Q,
	output wire [31:0] r04_Q,
	output wire [31:0] r05_Q,
	output wire [31:0] r06_Q,
	output wire [31:0] r07_Q,
	output wire [31:0] r08_Q,
	output wire [31:0] r09_Q,
	output wire [31:0] r10_Q,
	output wire [31:0] r11_Q,
	output wire [31:0] r12_Q,
	output wire [31:0] r13_Q,
	output wire [31:0] r14_Q,
	output wire [31:0] r15_Q,
 	output wire [15:0] hold_Q,

 	input wire CLK,
 	input wire EN,
 	input wire Reset
 );

	register r00 (r00_D, hold_D[00], CLK, EN, Reset, r00_Q, hold_Q[00]);
	register r01 (r01_D, hold_D[01], CLK, EN, Reset, r01_Q, hold_Q[01]);
	register r02 (r02_D, hold_D[02], CLK, EN, Reset, r02_Q, hold_Q[02]);
	register r03 (r03_D, hold_D[03], CLK, EN, Reset, r03_Q, hold_Q[03]);
	register r04 (r04_D, hold_D[04], CLK, EN, Reset, r04_Q, hold_Q[04]);
	register r05 (r05_D, hold_D[05], CLK, EN, Reset, r05_Q, hold_Q[05]);
	register r06 (r06_D, hold_D[06], CLK, EN, Reset, r06_Q, hold_Q[06]);
	register r07 (r07_D, hold_D[07], CLK, EN, Reset, r07_Q, hold_Q[07]);
	register r08 (r08_D, hold_D[08], CLK, EN, Reset, r08_Q, hold_Q[08]);
	register r09 (r09_D, hold_D[09], CLK, EN, Reset, r09_Q, hold_Q[09]);
	register r10 (r10_D, hold_D[10], CLK, EN, Reset, r10_Q, hold_Q[10]);
	register r11 (r11_D, hold_D[11], CLK, EN, Reset, r11_Q, hold_Q[11]);
	register r12 (r12_D, hold_D[12], CLK, EN, Reset, r12_Q, hold_Q[12]);
	register r13 (r13_D, hold_D[13], CLK, EN, Reset, r13_Q, hold_Q[13]);
	register r14 (r14_D, hold_D[14], CLK, EN, Reset, r14_Q, hold_Q[14]);
	register r15 (r15_D, hold_D[15], CLK, EN, Reset, r15_Q, hold_Q[15]);

endmodule

// #TODO How to solve the problem of writing to two reg at once