module logic(valueC, valueA, control, value_out, EN);
// It is assumed that the logic funcitonal block will be off when not in use
	input [31:0] valueC, valueA;
	input [2:0] control;
	// control is same as from decode, is inst[2:0]
	output reg [31:0] value_out;

	input wire EN

	always @ (*) begin
		case(control & 3{EN})
			3'b010: value_out = valueC | valueA;
			3'b011: value_out = valueC | (~valueA);
			3'b100: value_out = valueC & valueA;
			3'b101: value_out = valueC & (~valueA);
			3'b110: value_out = ~valueC;
			3'b111: value_out = ~(valueC ^ valueA);
			default: value_out = 32'bZ;
		endcase
	end
	
endmodule