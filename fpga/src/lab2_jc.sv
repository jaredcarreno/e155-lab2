/*
Author: Jared Carreno
Email: jcarreno@hmc.edu
Date: 9/8/2025
Purpose: The lab2_jc module accepts two 4-bit inputs, s1 and s2, in order to control 5 independent LEDs and a dual seven segment display. The 5 LEDs serve as a binary representation of the sum of the 
two inputs, s1 and s2. The lab2_jc utilizes a multiplexer module (mux) and a seven segment module (seven_segment) in order to control the segments on each of the displays, with the segments being encoded using
s1 and s2, and the power being time-multiplexed between the two separate displays using the 2-bit enable output.
*/

module lab2_jc(input logic reset, [3:0] s1, s2,   
				output logic [4:0] led, 
				output logic [6:0] seg, 
				output logic [1:0] enable);
logic [3:0] s;
logic clk;

assign led[4:0] =  s1 + s2;

HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));

seven_segment seven1(s, seg);

mux m1(clk, reset, s1, s2, enable, s);

endmodule

//module lab1_jc(input logic reset, [3:0] s,
				//output logic [2:0] led, [6:0] seg);
	
	//logic led_state = 0;
	//logic [24:0] counter = 0;
	//logic clk;
	
	//assign led[0] = s[1] ^ s[0];
	//assign led[1] = s[2] & s[3];
	
	//HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));
	
	////divider
	//always_ff @(posedge clk)
		//begin
			//if(counter == 10000000) begin
				//counter <= 0;
				//led[2] <= ~led[2]; // not because its continuous
			//end
			
			//else if(reset == 0) begin
				//counter <= 0;
				//led[2] <= 0;
			//end
			
			//else begin
				//counter <= counter + 1;
			//end
		//end
		
	//seven_segment s1(s, seg);
	
	
//endmodule