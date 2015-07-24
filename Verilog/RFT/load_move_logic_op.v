module load_move_logic_op (
	input wire [0:0] control,
	input wire [31:0] value1,
	input wire [31:0] value2,

	output reg [31:0] value_out
	output reg done
 );
	
	wire logic_value_out;
	assign logic_control = control[0:0];
	//assign logic_EN = ;
	logic logic0 (value1, value2, logic_control, logic_value_out, logic_EN);

	always @ (*) begin
		if (control[0] == 1'b1) begin
			value_out = value1;
			done = 1'b1;
		end else if (control[1] == 1'b1) begin
			value_out = value1;
			done = 1'b1;
		end else if (control[2] == 1'b1) begin
			value_out = logic_value_out;
			done = 1'b1;
		end else begin
			value_out = 32'bZ;
			done = 1'b0;
		end
	end

endmodule



// #TODO Update control and all proceding to work properly
// #TODO control signal to differentiate between load, move, logic
// #TODO control signals to specify which logic ops