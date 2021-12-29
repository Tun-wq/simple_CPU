module sm(clk, sm_en, sm);
	input wire clk, sm_en;
	output reg sm;

always @(negedge clk) begin
	if (sm_en) begin
		sm <= ~sm;
	end
end
endmodule