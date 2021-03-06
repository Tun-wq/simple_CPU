module reg_group(clk, we, raa, rwba, i, s, d, a_out, b_out, c_out);
	input wire clk, we;
	input wire [1:0] raa, rwba;
	input wire [7:0] i;
	output reg [7:0] s, d, a_out, b_out, c_out;

	reg [7:0] a = 8'b00000000, b = 8'b00000000, c = 8'b10000000;

always @(negedge clk) begin
	if (we == 0) begin
		if (rwba == 2'b00) begin
		a <= i;
		end
		else if (rwba == 2'b01) begin
			b <= i;
		end
		else if (rwba == 2'b10) begin
			c <= i;
		end	
	end
end

always @(raa or rwba or a or b or c) begin
	a_out = a;
	b_out = b;
	c_out = c;
	s = 8'b00000000;
	d = 8'b00000000;
	if (raa == 2'b00) begin
		s = a;
	end
	else if (raa == 2'b01) begin
		s = b;
	end
	else if (raa == 2'b10) begin
		s = c;
	end

	if (rwba == 2'b00) begin
		d = a;
	end
	else if (rwba == 2'b01) begin
		d = b;
	end
	else if (rwba == 2'b10) begin
		d = c;
	end
end
endmodule