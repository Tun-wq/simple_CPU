module instruction_decode(en, ir, mova, movb, movc, add, sub, and1, not1, rsr, rsl, jmp, jz, jc, in1, out1, nop, halt);
    input wire en;
    input wire [7:0] ir;
    output reg mova, movb, movc, add, sub, and1, not1, rsr, rsl, jmp, jz, jc, in1, out1, nop, halt;

always @(ir) begin
    {mova, movb, movc, add, sub, and1, not1, rsr, rsl, jmp, jz, jc, in1, out1, nop, halt} = 0;
    if (en) begin
        if (ir[7:4] == 4'b1100) begin
            if (ir[3:2] == 2'b11) begin
                movb = 1;
            end
            else if (ir[1:0] == 2'b11) begin                                     
                movc = 1;
            end
            else begin
                mova = 1;
            end
        end

        else if (ir[7:4] == 4'b1001) begin
            add = 1;
        end

        else if (ir[7:4] == 4'b0110) begin
            sub = 1;
        end

        else if (ir[7:4] == 4'b1011) begin
            and1 = 1;
        end

        else if (ir[7:4] == 4'b0101) begin
            not1 = 1;
        end

        else if (ir[7:4] == 4'b1010) begin
            if (ir[1:0] == 2'b00) begin
                rsr = 1;
            end
            else if (ir[1:0] == 2'b11) begin
                rsl = 1;
            end
        end

        else if (ir[7:4] == 4'b0011) begin
            if (ir[3:0] == 4'b0000) begin
                jmp = 1;
            end
            else if (ir[3:0] == 4'b0001) begin
                jz = 1;
            end
            else if (ir[3:0] == 4'b0010) begin
                jc = 1;
            end
        end

        else if (ir[7:4] == 4'b0010) begin
            in1 = 1;
        end

        else if (ir[7:4] == 4'b0100) begin
            out1 = 1;
        end

        else if (ir[7:0] == 8'b01110000) begin
            nop = 1;
        end

        else if (ir[7:0] == 8'b10000000) begin
            halt = 1;
        end
    end
end
endmodule