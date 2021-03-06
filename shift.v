module shift(fbus, flbus, frbus, a, w, cf);
	input wire fbus, flbus, frbus;
	input wire [7:0] a;
	output reg cf;
	output reg [7:0] w;

always @(fbus or flbus or frbus) begin
	w = 8'bzzzzzzzz;
	cf = 1'b0;
	if (fbus == 1'b1 & flbus == 1'b0 & frbus == 1'b0) begin
		w = a;
		cf = 0;
	end
	else if (fbus == 1'b0 & flbus == 1'b1 & frbus == 1'b0) begin
		w[7:1] = a[6:0];
		w[0] = a[7];
		cf = a[7];
	end
	else if (fbus == 1'b0 & flbus == 1'b0 & frbus == 1'b1) begin
		w[7] = a[0];
		w[6:0] = a[7:1];
		cf = a[0];
	end
end
endmodule