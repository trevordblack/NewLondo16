module register_bank();
// It is assumed that the register bank is NEVER POWERED DOWN.


	input CLK, EN, Reset;
	input [4:0] get_control;
	//   sgl for 3 operations 5'b10000
	//   sgl for loadhex      5'b01000
	//   sgl for move         5'b00100
	//   sgl for not          5'b00010
	//   sgl for 2 operations 5'b00001
	//   DEFAULT (NO OP)      5'b00000

  	input [3:0] get_opndC, get_opndA, get_opndB;

	input put_request;
	input [3:0] put_opndC;
	input [31:0] value_opnd3;
	
	output reg [31:0] value_opnd1, value_opnd2;

	output reg register_hold_flag; 
		// flagged high when a hold register is written to
		// The following instruction is a no op

	reg [3:0] get_opnd1, get_opnd2;
	// #TODO account for register holds on fetch!!!!
	always @ (*) begin
		if (get_control[4]) begin
			get_opnd1 = get_opndA;
			get_opnd2 = get_opndB;
		end 
		else begin if (get_control[3]) begin
			get_opnd1 = 4'bX;
			get_opnd2 = 4'bX;
		end
		else begin if (get_control[2] | get_control[1]) begin
			get_opnd1 = get_opndA;
			get_opnd2 = 4'bX;
		end
		else begin if (get_control[0]) begin
			get_opnd1 = get_opndC;
			get_opnd2 = get_opndA;
		end
		else begin
			get_opnd1 = 4'bX;
			get_opnd2 = 4'bX;
		end
	end

	reg hold_get_opnd1, hold_get_opnd2;
	wire collapsed_control_1 = (get_control[4] | get_control[2] | get_control[1] | get_control[0]);
	wire collapsed_control_2 = (get_control[4] | get_control[0]);
	always @ (*) begin
		case(get_opnd1)
			4'b0000: hold_get_opnd1 = r00_h_Q & collapsed_control_1;
			4'b0001: hold_get_opnd1 = r01_h_Q & collapsed_control_1;
			4'b0010: hold_get_opnd1 = r02_h_Q & collapsed_control_1;
			4'b0011: hold_get_opnd1 = r03_h_Q & collapsed_control_1;
			4'b0100: hold_get_opnd1 = r04_h_Q & collapsed_control_1;
			4'b0101: hold_get_opnd1 = r05_h_Q & collapsed_control_1;
			4'b0110: hold_get_opnd1 = r06_h_Q & collapsed_control_1;
			4'b0111: hold_get_opnd1 = r07_h_Q & collapsed_control_1;
			4'b1000: hold_get_opnd1 = r08_h_Q & collapsed_control_1;
			4'b1001: hold_get_opnd1 = r09_h_Q & collapsed_control_1;
			4'b1010: hold_get_opnd1 = r10_h_Q & collapsed_control_1;
			4'b1011: hold_get_opnd1 = r11_h_Q & collapsed_control_1;
			4'b1100: hold_get_opnd1 = r12_h_Q & collapsed_control_1;
			4'b1101: hold_get_opnd1 = r13_h_Q & collapsed_control_1;
			4'b1110: hold_get_opnd1 = r14_h_Q & collapsed_control_1;
			4'b1111: hold_get_opnd1 = r15_h_Q & collapsed_control_1;
		endcase

		case(get_opnd2)
			4'b0000: hold_get_opnd2 = r00_h_Q & collapsed_control_2;
			4'b0001: hold_get_opnd2 = r01_h_Q & collapsed_control_2;
			4'b0010: hold_get_opnd2 = r02_h_Q & collapsed_control_2;
			4'b0011: hold_get_opnd2 = r03_h_Q & collapsed_control_2;
			4'b0100: hold_get_opnd2 = r04_h_Q & collapsed_control_2;
			4'b0101: hold_get_opnd2 = r05_h_Q & collapsed_control_2;
			4'b0110: hold_get_opnd2 = r06_h_Q & collapsed_control_2;
			4'b0111: hold_get_opnd2 = r07_h_Q & collapsed_control_2;
			4'b1000: hold_get_opnd2 = r08_h_Q & collapsed_control_2;
			4'b1001: hold_get_opnd2 = r09_h_Q & collapsed_control_2;
			4'b1010: hold_get_opnd2 = r10_h_Q & collapsed_control_2;
			4'b1011: hold_get_opnd2 = r11_h_Q & collapsed_control_2;
			4'b1100: hold_get_opnd2 = r12_h_Q & collapsed_control_2;
			4'b1101: hold_get_opnd2 = r13_h_Q & collapsed_control_2;
			4'b1110: hold_get_opnd2 = r14_h_Q & collapsed_control_2;
			4'b1111: hold_get_opnd2 = r15_h_Q & collapsed_control_2;
		endcase
	end
	
	always @ (posedge CLK or negedge Reset) begin
		if(~Reset) begin
			register_hold_flag <= 1'b0;
		end
		else begin
			register_hold_flag <= hold_get_opnd1 | hold_get_opnd2;
		end
	end

	always @ (posedge CLK or negedge Reset) begin
		if(~Reset) begin
			value_opnd1 <= 32'b0;
			value_opnd2 <= 32'b0;
		end
		else
			case(get_opnd1)
				4'b0000: value_opnd1 <= r00_Q;
				4'b0001: value_opnd1 <= r01_Q;
				4'b0010: value_opnd1 <= r02_Q;
				4'b0011: value_opnd1 <= r03_Q;
				4'b0100: value_opnd1 <= r04_Q;
				4'b0101: value_opnd1 <= r05_Q;
				4'b0110: value_opnd1 <= r06_Q;
				4'b0111: value_opnd1 <= r07_Q;
				4'b1000: value_opnd1 <= r08_Q;
				4'b1001: value_opnd1 <= r09_Q;
				4'b1010: value_opnd1 <= r10_Q;
				4'b1011: value_opnd1 <= r11_Q;
				4'b1100: value_opnd1 <= r12_Q;
				4'b1101: value_opnd1 <= r13_Q;
				4'b1110: value_opnd1 <= r14_Q;
				4'b1111: value_opnd1 <= r15_Q;
			endcase

			case(get_opnd2)
				4'b0000: value_opnd2 <= r00_Q;
				4'b0001: value_opnd2 <= r01_Q;
				4'b0010: value_opnd2 <= r02_Q;
				4'b0011: value_opnd2 <= r03_Q;
				4'b0100: value_opnd2 <= r04_Q;
				4'b0101: value_opnd2 <= r05_Q;
				4'b0110: value_opnd2 <= r06_Q;
				4'b0111: value_opnd2 <= r07_Q;
				4'b1000: value_opnd2 <= r08_Q;
				4'b1001: value_opnd2 <= r09_Q;
				4'b1010: value_opnd2 <= r10_Q;
				4'b1011: value_opnd2 <= r11_Q;
				4'b1100: value_opnd2 <= r12_Q;
				4'b1101: value_opnd2 <= r13_Q;
				4'b1110: value_opnd2 <= r14_Q;
				4'b1111: value_opnd2 <= r15_Q;
			endcase
		end
	end

	// #TODO solve for move,
	// #TODO solve for write-back on negegde
	always @ (negedge CLK or negedge Reset) begin
		if(~Reset) begin

		end else begin
			if(get_control[2]) begin 
				// for a move instruction
				// This assumes problems with Holds will be solved on posedge
				// This does not check for holding
				case(get_opnd1)
					4'b0000: value_opnd3 <= r00_Q;
					4'b0001: value_opnd3 <= r01_Q;
					4'b0010: value_opnd3 <= r02_Q;
					4'b0011: value_opnd3 <= r03_Q;
					4'b0100: value_opnd3 <= r04_Q;
					4'b0101: value_opnd3 <= r05_Q;
					4'b0110: value_opnd3 <= r06_Q;
					4'b0111: value_opnd3 <= r07_Q;
					4'b1000: value_opnd3 <= r08_Q;
					4'b1001: value_opnd3 <= r09_Q;
					4'b1010: value_opnd3 <= r10_Q;
					4'b1011: value_opnd3 <= r11_Q;
					4'b1100: value_opnd3 <= r12_Q;
					4'b1101: value_opnd3 <= r13_Q;
					4'b1110: value_opnd3 <= r14_Q;
					4'b1111: value_opnd3 <= r15_Q;
				endcase

			end

		end
		// put_opndC = value_opnd3
		// 
	end


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

	// #TODO This will need to be completely rewritten

endmodule