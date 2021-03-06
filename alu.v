module alu(m, s, a, b, t, cf, zf);
	input wire m;
	input wire [3:0] s;
	input wire [7:0] a, b;
	output reg [7:0] t;
	output reg cf, zf;
	reg [8:0] temp;

always @(m or s or a or b) begin
	t = 8'b00000000;
	cf = 1'b0;
	zf = 1'b0;
	temp = 1'b0;
	if (m == 1'b0 && s[3:0] == 4'b1100) begin
		t = a;	
	end
	else if (m == 1'b1) begin
		if (s[3:0] == 4'b1010 || s[3:0] == 4'b0100) begin
			t = b;
		end
		else if (s[3:0] == 4'b0101) begin
			t = ~b;
		end
		else if (s[3:0] == 4'b1011) begin
			t = a & b;
		end
		else if (s[3:0] == 4'b0110) begin
			t = b - a;
			if (t == 8'b00000000) begin
				zf = 1;
			end
			else begin
				zf = 0;
			end
			temp = b - a;
			cf = temp[8];
		end
		else if (s[3:0] == 4'b1001) begin
			t = a + b;
			if (t == 8'b00000000) begin
				zf = 1;
			end
			else begin
				zf = 0;
			end
			temp = a + b;
			cf = temp[8];
		end
	end
end
endmodule