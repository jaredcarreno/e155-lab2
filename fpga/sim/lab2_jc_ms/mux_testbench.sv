/*
Author: Jared Carreno
Email: jcarreno@hmc.edu
Date: 9/8/2025
Purpose: 
*/
`timescale 1ns/1ns
module mux_testbench();
	logic clk;
	logic reset;
	
	logic [1:0] enable;
	logic [7:0] s_counter;
	logic [3:0] s;
	
	mux m1(clk, reset, s_counter[3:0], s_counter[7:4], enable, s);
	
	always
// 'always' statement causes the statements in the block to be 
// continuously re-evaluated.
	begin
 //// Create clock with period of 10 time units. 
// Set the clk signal HIGH(1) for 5 units, LOW(0) for 5 units 
		clk=1; #5; 
		clk=0; #5;
	end
	
	initial
		begin
			reset = 0; #22;
			reset = 1;
		end
		
		always_ff @(posedge clk)
			begin
				if (reset == 0) s_counter <= 0;
				else s_counter <= s_counter + 1;
			end
			
		always_ff @(posedge clk)
			begin
				if (enable[0])
					begin
						assert (s == s_counter[3:0]) else $error("s1 error");
					end
				else if (enable[1])
					begin
						assert (s == s_counter[7:4]) else $error("s2 error");
					end
			end

endmodule