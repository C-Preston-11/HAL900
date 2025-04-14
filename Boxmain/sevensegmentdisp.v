//7-SEGMENT DISPLAY

module sevensegmentdisp(input switch1,
    output [6:0] ss0, ss1, ss2, ss3, ss4, ss5 //outputs to drive seven segment displays         
);                
	 
	 

assign ss5 = switch1 ? 7'b0010010:7'b0001001;   //assign 7seg display 5 to 'H' if low 'S' if high
assign ss4 = switch1 ? 7'b0000111:7'b0001000;	 //assign 7seg display 4 to 'A' if low 'T' if high
assign ss3 = switch1 ? 7'b1000000:7'b1000111;	 //assign 7seg display 3 to 'L' if low 'O' if high
assign ss2 = switch1 ? 7'b0001100:7'b0011000; 	//assign 7seg display 2 to '9' if low 'P' if high
assign ss1 = switch1 ? 7'b1111111:7'b1000000;	 //assign 7seg display 1 to '0' if low blank if high
assign ss0 = switch1 ? 7'b1111111:7'b1000000;	 //assign 7seg display 0 to '0' if low blank if high


endmodule