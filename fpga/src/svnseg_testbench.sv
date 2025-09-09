/*
Author: Jared Carreno
Email: jcarreno@hmc.edu
Date: 9/8/2025
Purpose: This module was created to test the functionality of the seven_segment module. Using testvectors, various values
of s and their outputs are compared to the expected value, seg_expected.
*/


module svnseg_testbench();

	logic clk;
	logic reset;
	
	logic [3:0] s;
	logic [6:0] seg;
	logic [6:0] seg_expected;
	
	logic [31:0] vectornum, errors;
	logic [10:0] testvectors[10000:0];
	
	
//// Instantiate device under test (DUT)
	seven_segment dut(s, seg);
	
//extract clock
	//assign clk = dut.clk;
	
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
		$readmemb("seven.tv", testvectors);
		
		vectornum = 0;
		errors = 0;
		
		reset = 0; #22;
		reset = 1;
	end
	 
always @(posedge clk)
	begin
		#1;
		{s, seg_expected} = testvectors[vectornum];
	end
	
always @(negedge clk)
	if (reset) begin
		if(seg !== seg_expected) begin
			$display("Error: inputs %b", {s});
			$display("outputs = %b (%b expected)", seg, seg_expected);
			errors = errors + 1;
		end
		
		vectornum = vectornum + 1;
		if (testvectors[vectornum] === 11'bx) begin
			$display("%d tests are completed with %d errors", vectornum, errors);
			
			$stop;
		end
	end
endmodule
			
			
			
			