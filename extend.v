module extend(imm, out);
input[15:0] imm;
output[31:0] out;

assign out[15:0] = imm;
assign out[31:16] = 16'h0000;

endmodule