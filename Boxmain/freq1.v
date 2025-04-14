//Frequency division to convert 50MHz clock to 50kHz

module freqdiv(input in,output reg out);

reg [8:0] counter;      //9-bit counter = 512 MAX VALUES

always @(posedge in) 
	if (counter < 500)   //Every 500 clock cycles switch output
begin
	counter <= counter + 1;
	end
else
	begin
	counter <= 0;       
	out <= ~out;         //50KHz Clock output (square wave)
	end
endmodule