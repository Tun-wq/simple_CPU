module mux2_1(in_en, in, bus, i);
	input wire in_en;
	input wire [7:0] in, bus;
	output reg [7:0] i;

always @(in, bus, in_en) begin
	i = 8'bxxxxxxxx;
	if (in_en == 1) begin
		i = in;		
	end
	else begin
		i = bus;
	end
end
endmodule