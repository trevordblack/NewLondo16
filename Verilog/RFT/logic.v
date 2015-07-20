module logic(valueC, valueA, logic_control, value_out)
// It is assumed that the logic funcitonal block will be off when not in use
	input [31:0] valueC, valueA;
	input [2:0] logic_control;
	// control is same as from decode, is inst[2:0]
	output reg [31:0] value_out;

	always @ (*) begin
		case(logic_control)
			3'b010: value_out = valueC | valueA;
			3'b011: value_out = valueC | (~valueA);
			3'b100: value_out = valueC & valueA;
			3'b101: value_out = valueC & (~valueA);
			3'b110: value_out = ~valueA;
			3'b111: value_out = ~(valueA ^ valueC);
			default: value_out = 32'b0;
		endcase
	end
	
endmodule