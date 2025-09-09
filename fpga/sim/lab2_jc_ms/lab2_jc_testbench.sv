/*
Author: Jared Carreno
Email: jcarreno@hmc.edu
Date: 9/8/2025
Purpose:
*/
`timescale 1ns/1ns
module lab2_jc_testbench();
	
	logic clk;
	logic reset;
	
	logic [7:0] s_counter;
	logic [1:0] enable;
	logic [6:0] seg;
	logic [4:0] led;
	
	lab2_jc dut(reset, s_counter[3:0], s_counter[7:4], led, seg, enable);
	
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
			
			for(s_counter = 0; s_counter < 8'd255; s_counter++) 
				begin
					assert(led[4:0] == s_counter[3:0] + s_counter[7:4]) else $error("Error in LED sum"); #20;
				end
		end
	
endmodule