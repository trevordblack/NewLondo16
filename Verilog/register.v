module register(D, hold_D, CLK, EN, Reset, Q, hold_Q);

	input [31:0] D;
	input hold_D;
	input CLK, EN, Reset;
	output [31:0] Q;
	output hold_Q;

	wire gated_clk = CLK & EN;

	FF32 value (D, gated_clk, Reset, Q);
	FF   hold  (hold_D, gated_clk, Reset, hold_Q);

endmodule