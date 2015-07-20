module add_sub(value1, value2, control, signedness, value_out, 
	EN, flag_overflow, flag_carry
 );

	input [31:0] value1, value2;
	input control;
	// control:0 will correspond to an add operation
	// control:1 will correspond to a subtract operation
	input signedness;
	// signedness:0 will correspond to signed
	// signedness:1 will correspond to unsigned
	output reg [31:0] value_out;

	input EN;
	output reg flag_overflow;
	output reg flag_carry;

	wire value_2_twoc = (value2 ^ {32{control}});

	wire overflow, value_sum_sign;
	wire [31:0] value_sum;

	assign {overflow, value_sum} = {1'b0, value1} + {1'b0, value_2_twoc} + control;


	// For the immediate future, this is WRONG
	// This does not account for integer overflows
	always @ (*) begin
		value_out = value_sum;
		flag_carry = 1'b0;
		flag_overflow = 1'b0;
	end
	//

endmodule


// #TODO throw out flags on overflows and things