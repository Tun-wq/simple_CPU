module ir(clk, ir_ld, d, ir);
	input wire clk, ir_ld;
	input wire [7:0] d;
	output reg [7:0] ir;

always @(negedge clk) begin
	if (ir_ld) begin
		ir <= d;
	end
end
endmodule