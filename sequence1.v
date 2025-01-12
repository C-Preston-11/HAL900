//servo movement sequence rough draft (preston carroll)
//Embedded Systems Club
//basic state machine with time delays, producing a sequence of random movements by the servo to give the arm some personality
//not tested 
`timescale 1ms/1ms

module servo_sequence1(
	input clkin, switch, output servout);
	
reg [9:0] counter = 0;
reg [7:0] pulsewidth;
reg [2:0] sequence = 3'b000;
reg [2:0] nsequence = 3'b000;
reg [24:0] halfsecond = 25'd25000000;
reg [24:0] timecount = 0;
reg halfsecondf = 0;

always @(posedge clkin) begin   //progress to next position every half second 
	if (halfsecondf)
	sequence <= nsequence;
end
	
always @(posedge clkin) begin
if(switch)
begin
	if (timecount < halfsecond)
	begin
		timecount <= timecount + 1'b1;
		halfsecondf <= 1'b0;          //flag to detect when half a second has passed
	end
	else
	begin
		halfsecondf <= 1'b1;          //halfsecond confirmed - reset timer
		timecount <= 1'b0;
	end
	end
	end
		
always @(negedge clkin) begin
	case(sequence)
	3'b000: if (!switch) 
			  nsequence = 3'b000;    //stay at starting position until switch if flipped
			  else
			  nsequence = 3'b001;
	3'b001: nsequence = 3'b010;    //start the movement sequence
	3'b010: nsequence = 3'b011;
	3'b011: nsequence = 3'b100;
	3'b100: nsequence = 3'b101;
	3'b101: nsequence = 3'b000;
endcase
end
	
always @(posedge clkin) begin  //switch is engaged begin sequence *Single pole Double throw*
	if (counter < 1000) begin
								 //divide 50kHz signal to 50Hz to drive the servo
	counter <= counter + 1'b1;  //increment counter every clock cycle

	case (sequence)
		3'b000: pulsewidth <= 27;  //this movement can be customized to produce desired result
		3'b001: pulsewidth <= 40; 
		3'b010: pulsewidth <= 40; 
		3'b011: pulsewidth <= 50; 
		3'b100: pulsewidth <= 35; 
		3'b101: pulsewidth <= 57; 
		default: pulsewidth <= 27; //starting position
	endcase
	end
		else 
			counter <= 1'b0;   //reset counter

end
	assign servout = (counter < pulsewidth);
	
	endmodule
		
