module register_bank();

	

	wire [31:0] r00_D, r01_D, r02_D, r03_D, 
				r04_D, r05_D, r06_D, r07_D,
				r08_D, r09_D, r10_D, r11_D,
				r12_D, r13_D, r14_D, r15_D;

	wire        r00_h_D, r01_h_D, r02_h_D, r03_h_D, 
		        r04_h_D, r05_h_D, r06_h_D, r07_h_D, 
		        r08_h_D, r09_h_D, r10_h_D, r11_h_D, 
		        r12_h_D, r13_h_D, r14_h_D, r15_h_D;


	wire [31:0] r00_Q, r01_Q, r02_Q, r03_Q, 
				r04_Q, r05_Q, r06_Q, r07_Q,
				r08_Q, r09_Q, r10_Q, r11_Q,
				r12_Q, r13_Q, r14_Q, r15_Q;

	wire        r00_h_Q, r01_h_Q, r02_h_Q, r03_h_Q, 
		        r04_h_Q, r05_h_Q, r06_h_Q, r07_h_Q, 
		        r08_h_Q, r09_h_Q, r10_h_Q, r11_h_Q, 
		        r12_h_Q, r13_h_Q, r14_h_Q, r15_h_Q;

	register r00 (r00_D, r00_h_D, CLK, EN, Reset, r00_Q, r00_h_Q);
	register r01 (r01_D, r01_h_D, CLK, EN, Reset, r01_Q, r01_h_Q);
	register r02 (r02_D, r02_h_D, CLK, EN, Reset, r02_Q, r02_h_Q);
	register r03 (r03_D, r03_h_D, CLK, EN, Reset, r03_Q, r03_h_Q);
	register r04 (r04_D, r04_h_D, CLK, EN, Reset, r04_Q, r04_h_Q);
	register r05 (r05_D, r05_h_D, CLK, EN, Reset, r05_Q, r05_h_Q);
	register r06 (r06_D, r06_h_D, CLK, EN, Reset, r06_Q, r06_h_Q);
	register r07 (r07_D, r07_h_D, CLK, EN, Reset, r07_Q, r07_h_Q);
	register r08 (r08_D, r08_h_D, CLK, EN, Reset, r08_Q, r08_h_Q);
	register r09 (r09_D, r09_h_D, CLK, EN, Reset, r09_Q, r09_h_Q);
	register r10 (r10_D, r10_h_D, CLK, EN, Reset, r10_Q, r10_h_Q);
	register r11 (r11_D, r11_h_D, CLK, EN, Reset, r11_Q, r11_h_Q);
	register r12 (r12_D, r12_h_D, CLK, EN, Reset, r12_Q, r12_h_Q);
	register r13 (r13_D, r13_h_D, CLK, EN, Reset, r13_Q, r13_h_Q);
	register r14 (r14_D, r14_h_D, CLK, EN, Reset, r14_Q, r14_h_Q);
	register r15 (r15_D, r15_h_D, CLK, EN, Reset, r15_Q, r15_h_Q);


endmodule

// #TODO How to solve the problem of writing to two reg at once