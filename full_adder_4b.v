/*
======================================================= 
        FULL-ADDER-4B
=======================================================
Description:
    This is a 4-bit adder using 1 half-adder
    and 3 full-adders.

Design Engineer:
    AG D. Evangelista

Date:
    7 May 2026
------------------------------------------------------*/

module half_adder(a, b, sum, carry);
	input a, b;
	output reg sum, carry;
	
	always @(a,	b) begin
		case({a, b})
			2'b00: {carry, sum} = 2'b00;
			2'b01: {carry, sum} = 2'b01;
			2'b10: {carry, sum} = 2'b01;
			2'b11: {carry, sum} = 2'b10;
			default: {carry, sum} = 2'b00;
		endcase
	end
endmodule

module full_adder(a, b, cin, sum, cout);
	input a, b, cin;
	output reg cout, sum;
	
	always @(a, b, cin) begin
		case({a, b, cin})
			3'd0: {cout, sum} = 2'b00;
			3'd1: {cout, sum} = 2'b01;
			3'd2: {cout, sum} = 2'b01;
			3'd3: {cout, sum} = 2'b10;
			3'd4: {cout, sum} = 2'b01;
			3'd5: {cout, sum} = 2'b10;
			3'd6: {cout, sum} = 2'b10;
			3'd7: {cout, sum} = 2'b11;
			default: {cout, sum} = 2'b00;
		endcase
	end
endmodule

module full_adder_2b(a, b, c);
	input [1:0] 	a, b;
	output [2:0] 	c;
	wire 				w;
	
	
	//half_adder
	
	half_adder ha(
	.sum	(c[0]), 
	.carry(w), 
	.a		(a[0]), 
	.b		(b[0])
	);
	
	full_adder fa(
	.sum	(c[1]),
	.cout	(c[2]),
	.a		(a[1]),
	.b		(b[1]),
	.cin	(w)
	);
endmodule

module full_adder_4b(a, b, c);
	input [3:0] a, b;
	output [4:0] c;
	wire [2:0] w;
	
	half_adder ha(
	.sum	(c[0]), 
	.carry(w[0]), 
	.a		(a[0]), 
	.b		(b[0])
	);
	
	full_adder fa1(
	.sum	(c[1]),
	.cout	(w[1]),
	.a		(a[1]),
	.b		(b[1]),
	.cin	(w[0])
	);
	
	full_adder fa2(
	.sum	(c[2]),
	.cout	(w[2]),
	.a		(a[2]),
	.b		(b[2]),
	.cin	(w[1])
	);
	
	full_adder fa3(
	.sum	(c[3]),
	.cout	(c[4]),
	.a		(a[3]),
	.b		(b[3]),
	.cin	(w[2])
	);

endmodule