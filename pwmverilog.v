/* EMBEDDED SYSTEMS CLUB
	PWM DESIGN 
	FALL 2023
*/

//verilog code to produce a 50 Hz square wave with varying pulsewidth (duty-cycle) to control the position of servo motor

module pwmbox1 (input clk, output [1:0] out);

reg [9:0] counter = 0;        //initialize counter
reg [1:0] pwmout;             //outputs for signal

always@(posedge clk)        //this block excecutes every positive edge of the input clock signal
begin
	if (counter < 1000)          
		 counter <= counter + 1;          //divide 50kHz clock input signal by 1k to produce a 50Hz signal (Required frequency for servo motor)
	else 
		 counter <= 0;
		 
			if (counter < 57)                //5.7% duty cycle (position required to flip the switch off)
					pwmout[1] <= 1;
			else
					pwmout[1] <= 0;
					
			if (counter < 27)                //2.7% duty cycle (default resting position)
					pwmout[0] <= 1;
			else 
					pwmout[0] <= 0;
end	

assign out[1] = pwmout[1];         //assign the PWM signals to the outputs
assign out[0] = pwmout[0];
	
endmodule