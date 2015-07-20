module asl(value1, value2, shift_hex, value_out, EN);
	input [31:0] value1, value2;
	input [3:0] shift_hex;
	output [31:0] value_out;
	input EN;

	wire or_unary = |value2[31:5];
	wire value2_shrink = value2[4:0];

	wire [4:0] shift_amt = (value2_shrink== 32'b0) ? 
		( {1'b0, shift_hex} + 5'b1) : (value2_shrink + {1'b0, shift_hex});

	assign value_out = (or_unary==1'b1) ? 32'b0 : (
		(shift_amt == 5'b00000) ? value1[31:0] :
		(shift_amt == 5'b00001) ? {value1[30:0], 01'b0 } :
		(shift_amt == 5'b00010) ? {value1[29:0], 02'b0 } :
		(shift_amt == 5'b00011) ? {value1[28:0], 03'b0 } :
		(shift_amt == 5'b00100) ? {value1[27:0], 04'b0 } :
		(shift_amt == 5'b00101) ? {value1[26:0], 05'b0 } :
		(shift_amt == 5'b00110) ? {value1[25:0], 06'b0 } :
		(shift_amt == 5'b00111) ? {value1[24:0], 07'b0 } :
		(shift_amt == 5'b01000) ? {value1[23:0], 08'b0 } :
		(shift_amt == 5'b01001) ? {value1[22:0], 09'b0 } :
		(shift_amt == 5'b01010) ? {value1[21:0], 10'b0 } :
		(shift_amt == 5'b01011) ? {value1[20:0], 11'b0 } :
		(shift_amt == 5'b01100) ? {value1[19:0], 12'b0 } :
		(shift_amt == 5'b01101) ? {value1[18:0], 13'b0 } :
		(shift_amt == 5'b01110) ? {value1[17:0], 14'b0 } :
		(shift_amt == 5'b01111) ? {value1[16:0], 15'b0 } :
		(shift_amt == 5'b10000) ? {value1[15:0], 16'b0 } :
		(shift_amt == 5'b10001) ? {value1[14:0], 17'b0 } :
		(shift_amt == 5'b10010) ? {value1[13:0], 18'b0 } :
		(shift_amt == 5'b10011) ? {value1[12:0], 19'b0 } :
		(shift_amt == 5'b10100) ? {value1[11:0], 20'b0 } :
		(shift_amt == 5'b10101) ? {value1[10:0], 21'b0 } :
		(shift_amt == 5'b10110) ? {value1[09:0], 22'b0 } :
		(shift_amt == 5'b10111) ? {value1[08:0], 23'b0 } :
		(shift_amt == 5'b11000) ? {value1[07:0], 24'b0 } :
		(shift_amt == 5'b11001) ? {value1[06:0], 25'b0 } :
		(shift_amt == 5'b11010) ? {value1[05:0], 26'b0 } :
		(shift_amt == 5'b11011) ? {value1[04:0], 27'b0 } :
		(shift_amt == 5'b11100) ? {value1[03:0], 28'b0 } :
		(shift_amt == 5'b11101) ? {value1[02:0], 29'b0 } :
		(shift_amt == 5'b11110) ? {value1[01:0], 30'b0 } :
		(shift_amt == 5'b11111) ? {value1[00:0], 31'b0 } : 32'b0);
endmodule