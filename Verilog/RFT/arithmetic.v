module arithmetic(value1, value2, arith_control, shift_hex, value_out, flags, EN);
// It is assumed that the logic funcitonal block will be off when not in use
	input [31:0] value1, value2;
	input [2:0] arith_control;
	// arith_control is same as from decode
	/* arith_control:
	 * 3'b000: DEFUALT
	 * 3'b001: 
	 * 3'b010: 3add
	 * 3'b011: 3sub
	 * 3'b100: asl
	 * 3'b101: asr
	 * 3'b110: 2uadd
	 * 3'b111: 2usub
	 */
	input [3:0] shift_hex;
	// Hex values are used in shifts
	// This is simply the inst[3:0] carried through
	output reg [31:0] value_out;
	output [1:0] flags;

	input EN;

	always @ (*) begin
		case(arith_control)
			3'b010: value_out = add_sub_out;
			3'b011: value_out = add_sub_out;
			3'b100: value_out = asl_out;
			3'b101: value_out = asr_out;
			3'b110: value_out = add_sub_out;
			3'b111: value_out = add_sub_out;
			default: value_out = 32'b0;
		endcase
	end

	wire [31:0] add_sub_out;
	wire [31:0] asl_out;
	wire [31:0] asr_out;

	add_sub add_0(value1, value2, arith_control[2], add_sub_out, EN, flags[1], flags[0]);
	asl asl_0(value1, value2, shift_hex, asl_out, EN);
	asr asr_0(value1, value2, shift_hex, asr_out, EN);
	
endmodule