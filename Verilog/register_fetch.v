module register_fetch (	
	// Bundle the input according to clock-cycle completion time
	// i.e. load_move_logic in 1/2 clock cycle
	//      arithmetic      in ?   clock cycle
	//      slowArithmetic  in ?   clock cycle
	//      memory          in ?   clock cycle

	input wire [31:0] load_move_logic_value,
	input wire load_move_logic_done,
	input wire [31:0] arithmetic_value,
	input wire arithmetic_done,
	input wire [31:0] slowArithmetic_value,
	input wire slowArithmetic_done,
	input wire [31:0] memory_value,
	input wire memory_done,



endmodule

// #TODO how to solve for the memory fetch taking an indeterminate amount of time