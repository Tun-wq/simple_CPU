module con_signal(
	input wire mova, movb, movc, add, sub, and1, not1, rsr, rsl, jmp, jz, z, jc, c, in1, out1, nop, halt, sm,
	input wire [7:0] ir,
	output reg [1:0] reg_ra, reg_wa, madd,
	output reg [3:0] alu_s,
	output reg pc_ld, pc_inc, reg_we, ram_xl, ram_dl, alu_m, shi_fbus, shi_flbus, shi_frbus, ir_ld, cf_en, zf_en, sm_en, in_en, out_en
);

always @(mova or movb or movc or add or sub or and1 or not1 or rsr or rsl or jmp or jz or z or jc or c or in1 or out1 or nop or halt or sm) begin
	{pc_ld, pc_inc, reg_we, ram_xl, ram_dl, alu_m, shi_fbus, shi_flbus, shi_frbus, ir_ld, cf_en, zf_en, sm_en, in_en, out_en} =  0;
	alu_s = ir[7:4];
	reg_ra = ir[1:0];
	reg_wa = ir[3:2];
	madd[1] = movb;
	madd[0] = movc;
	pc_ld = jmp | (jc && c) | (jz & z); // 装载进计数器
	pc_inc = (~sm) | (jc & (~c)) | (jz & (~z)); // 计数器加一
	reg_we = ~(mova | movc | add | sub | and1 | not1 | rsr | rsl | in1); // 装载进通用寄存器
	ram_xl = movb; // 写入RAM
	ram_dl = (~sm) | movc | jmp | (jc & c) | (jz & z); //从RAM中读取
	alu_m = add | sub | and1 | not1 | rsr | rsl | out1;
	shi_fbus = mova | movb | add | sub | and1 | not1 | out1;
	shi_flbus = rsl;
	shi_frbus = rsr;
	ir_ld = ~sm;
	cf_en = add | sub | rsr | rsl; // 当执行这些操作时，有cf需要返回，所以需要cf的使能信号使cf开启
	zf_en = add | sub; //
	sm_en = ~halt; // 停机后不能再取指令，sm无意义
	in_en = in1;
	out_en = out1;

end
endmodule