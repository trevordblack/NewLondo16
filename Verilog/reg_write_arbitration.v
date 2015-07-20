module reg_write_arbitration (





 );
	// This module is effectively a priority encoder
	// A results priority is determined by least number of clock cycles

	// Arbitration is only necessary when two functional blocks try to write
	// to the same register on the same clock cycle
	// This can occur with f'nal blocks of differeing completion clock cycles


endmodule