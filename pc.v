module pc(clk, pc_ld, pc_inc, a, add);
	input wire clk, pc_ld, pc_inc;
	input wire [7:0] a;
	output reg [7:0] add;

always @(negedge clk) begin
	if (pc_inc & ~pc_ld) begin
		add <= add + 8'b00000001;
	end
	else if (~pc_inc & pc_ld) begin
		add <= a;
	end
end

endmodule