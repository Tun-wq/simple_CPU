module mux3_1(a, b, c, madd, y);
	input wire [7:0] a, b, c;
	input wire [1:0] madd;
	output reg [7:0] y;

always @(madd) begin
	y = 8'bxxxxxxxx;
	if (madd[1:0] == 2'b00) begin
		y = a;
	end
	else if (madd[1:0] == 2'b01) begin
		y = b;
	end
	else if (madd[1:0] == 2'b10) begin
		y = c;
	end
	
end
endmodule