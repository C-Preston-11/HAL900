// 2_1 MUX Verilog code
//boxes switch acts as the selector for the MUX.


module mux21 (input d0, d1, select, output out);

assign out = select ? d1:d0;

endmodule

