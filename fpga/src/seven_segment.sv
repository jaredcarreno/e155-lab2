/*
Author: Jared Carreno
Email: jcarreno@hmc.edu
Date: 9/8/2025
Purpose: The seven_segment module accepts a 4-bit input and encodes each input (ranging from 0x0 to 0xF) to an individual segment on a seven-segment display
*/

module seven_segment(input logic [3:0] s,
					 output logic [6:0] seg);
					 
// seg = 0, on
// seg = 1, off

logic clk;

always_comb begin
	case(s)
		4'h0: seg = 7'b1000000;
		4'h1: seg = 7'b1111001;
		4'h2: seg = 7'b0100100;
		4'h3: seg = 7'b0110000;
		4'h4: seg = 7'b0011001;
		4'h5: seg = 7'b0010010;
		4'h6: seg = 7'b0000010;
		4'h7: seg = 7'b1111000;
		4'h8: seg = 7'b0000000;
		4'h9: seg = 7'b0011000;
		4'hA: seg = 7'b0001000;
		4'hB: seg = 7'b0000011;
		4'hC: seg = 7'b1000110;
		4'hD: seg = 7'b0100001;
		4'hE: seg = 7'b0000110;
		4'hF: seg = 7'b0001110;
		
		default: seg = 7'b1111111;
	endcase
end

endmodule