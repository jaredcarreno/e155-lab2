/*
Author: Jared Carreno
Email: jcarreno@hmc.edu
Date: 9/8/2025
Purpose: The mux module controls which input, s1 or s2, is sent to each inpendent display. This is done through time-multiplexing, which allows for s1 and enable[0], as well as enable[1] and s2, to trigger at
the same time. This allows for the segments controlled by s1 to appear on the display powered by enable[0], while allowing segments controlled by s2 to appear on the display powered by enable[1]. The 18th bit of a 
25-bit counter is utilized to time the power switching between displays at a fast enough rate -- making it appear static to our eyes. A high-speed oscillator (used in lab2_jc) is divided here in order to allow
us to switch at a rate that is fast, but not too fast.
*/

module mux(input logic clk, reset,
		   input logic [3:0] s1, s2,
		   output logic [1:0] enable, 
		   output logic [3:0] s);

logic [24:0] counter = 0;

// divider
always_ff @(posedge clk)
	begin
		if(reset==0) counter <= 0;
		
		else begin
			s = counter[18] ? s1 : s2;
			counter <= counter + 1;
		end
	end
	
assign enable[0] = counter[18]; 
assign enable[1] = ~counter[18];

endmodule