module psw(clk, cf_en, zf_en, cf, zf, c, z);
	input wire clk, cf_en, zf_en, cf, zf;
	output reg c, z;

always @(negedge clk) begin
	if (cf_en) begin
		c <= cf;
	end
	if (zf_en) begin
		z <= zf;
	end
end
endmodule