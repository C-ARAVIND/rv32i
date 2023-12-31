module extend(
input wire [31:7] instr,
input wire [2:0] immsrc,
output reg [31:0] immext
);
    always @(*)
        case(immsrc)
            // R-type (register)
            3'b000: immext <= {{27{instr[24]}}, instr[24:20]};
            // I−type (immediate)
            3'b001: immext <= {{20{instr[31]}}, instr[31:20]};
            // S−type (stores)
            3'b010: immext <= {{20{instr[31]}}, instr[31:25], instr[11:7]};
            // B−type (branches)
            3'b011: immext <= {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
            // U-types
            3'b100: immext <= {{12{instr[31]}}, instr[31:12]};
            // J−type (jump)
            3'b101: immext <= {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
            default: immext <= 32'bx; // undefined
        endcase
endmodule
