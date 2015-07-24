module FF(D, CLK, reset, Q);

	input D, CLK, reset;
	output reg Q;


	always @ (posedge CLK or negedge reset) begin
		if(~reset)
			Q <= 1'b0;
		else
			Q <= D;
	end

endmodule