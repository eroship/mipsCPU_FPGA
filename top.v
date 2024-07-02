// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.0 Build 156 04/24/2013 SJ Full Version"
// CREATED		"Fri May 07 19:43:45 2021"

//这是用于仿真的文件，器件为auto

module top(
	clk,
	reset,
	regDist,
	ZF,
	CF,
	OF,
	clk_5000HZ,
	branch,
	jump,
	ALUsrc,
	memWrite,
	regWrite,
	memToReg,
	branchTrue,
	clk_instROM,
	ALUop,
	busB,
	inst,
	numberDecode,
	out,
	PC,
	posDecode,
	rsdata,
	rtdata
);


input wire	clk;
input wire	reset;
output wire	regDist;
output wire	ZF;
output wire	CF;
output wire	OF;
output wire	clk_5000HZ;
output wire	branch;
output wire	jump;
output wire	ALUsrc;
output wire	memWrite;
output wire	regWrite;
output wire	memToReg;
output wire	branchTrue;
output wire	clk_instROM;
output wire	[3:0] ALUop;
output wire	[31:0] busB;
output wire	[31:0] inst;
output wire	[6:0] numberDecode;
output wire	[31:0] out;
output wire	[31:0] PC;
output wire	[3:0] posDecode;
output wire	[31:0] rsdata;
output wire	[31:0] rtdata;

wire	[3:0] ALUop_ALTERA_SYNTHESIZED;
wire	ALUsrc_ALTERA_SYNTHESIZED;
wire	branch_ALTERA_SYNTHESIZED;
wire	branchTrue_ALTERA_SYNTHESIZED;
wire	[31:0] busB_ALTERA_SYNTHESIZED;
wire	clk_5000HZ_ALTERA_SYNTHESIZED;
wire	clk_display;
wire	clk_instROM_ALTERA_SYNTHESIZED;
wire	[31:0] dataWrite;
wire	[31:0] eximm;
wire	extOp;
wire	[31:0] inst_ALTERA_SYNTHESIZED;
wire	jump_ALTERA_SYNTHESIZED;
wire	[31:0] memData;
wire	memRead;
wire	memToReg_ALTERA_SYNTHESIZED;
wire	memWrite_ALTERA_SYNTHESIZED;
wire	[31:0] out_ALTERA_SYNTHESIZED;
wire	[31:0] PC_ALTERA_SYNTHESIZED;
wire	regDist_ALTERA_SYNTHESIZED;
wire	regWrite_ALTERA_SYNTHESIZED;
wire	[31:0] rsdata_ALTERA_SYNTHESIZED;
wire	[31:0] rtdata_ALTERA_SYNTHESIZED;
wire	ZF_ALTERA_SYNTHESIZED;





memRAM	b2v_inst1(
	.wren(memWrite_ALTERA_SYNTHESIZED),
	.clock(clk_5000HZ_ALTERA_SYNTHESIZED),
	
	.address(out_ALTERA_SYNTHESIZED[8:2]),
	.data(rtdata_ALTERA_SYNTHESIZED),
	.q(memData));


myShow	b2v_inst10(
	.clk(clk_display),
	.num1(out_ALTERA_SYNTHESIZED[31:28]),
	.num2(out_ALTERA_SYNTHESIZED[23:20]),
	.num3(out_ALTERA_SYNTHESIZED[15:12]),
	.num4(out_ALTERA_SYNTHESIZED[7:4]),
	.numberDecode(numberDecode),
	.posDecode(posDecode));

assign	branchTrue_ALTERA_SYNTHESIZED = ZF_ALTERA_SYNTHESIZED & branch_ALTERA_SYNTHESIZED;


regFile	b2v_inst114514(
	.clk(clk_5000HZ_ALTERA_SYNTHESIZED),
	.reset(reset),
	.regDist(regDist_ALTERA_SYNTHESIZED),
	.regWrite(regWrite_ALTERA_SYNTHESIZED),
	.dataWrite(dataWrite),
	.inst(inst_ALTERA_SYNTHESIZED),
	.rsdata(rsdata_ALTERA_SYNTHESIZED),
	.rtdata(rtdata_ALTERA_SYNTHESIZED));


divider	b2v_inst12(
	.clk(clk),
	.out1(clk_5000HZ_ALTERA_SYNTHESIZED),
	.out2(clk_display));


instROM	b2v_inst1312(
	.clock(clk_instROM_ALTERA_SYNTHESIZED),
	
	.address(PC_ALTERA_SYNTHESIZED[9:2]),
	.q(inst_ALTERA_SYNTHESIZED));


mux_ALUsrc	b2v_inst2(
	.sel(ALUsrc_ALTERA_SYNTHESIZED),
	.data0x(rtdata_ALTERA_SYNTHESIZED),
	.data1x(eximm),
	.result(busB_ALTERA_SYNTHESIZED));


mux_memToReg	b2v_inst3(
	.sel(memToReg_ALTERA_SYNTHESIZED),
	.data0x(out_ALTERA_SYNTHESIZED),
	.data1x(memData),
	.result(dataWrite));


PC	b2v_inst4(
	.clk(clk_5000HZ_ALTERA_SYNTHESIZED),
	.reset(reset),
	.jump(jump_ALTERA_SYNTHESIZED),
	.branch(branchTrue_ALTERA_SYNTHESIZED),
	.instr(inst_ALTERA_SYNTHESIZED),
	.PCout(PC_ALTERA_SYNTHESIZED));


ALU	b2v_inst7(
	.A(rsdata_ALTERA_SYNTHESIZED),
	.B(busB_ALTERA_SYNTHESIZED),
	.control(ALUop_ALTERA_SYNTHESIZED),
	.ZF(ZF_ALTERA_SYNTHESIZED),
	.CF(CF),
	.OF(OF),
	.out(out_ALTERA_SYNTHESIZED));


extend	b2v_inst8(
	.imm(inst_ALTERA_SYNTHESIZED[15:0]),
	.out(eximm));


control	b2v_inst9(
	.inst(inst_ALTERA_SYNTHESIZED),
	.regDst(regDist_ALTERA_SYNTHESIZED),
	.regWrite(regWrite_ALTERA_SYNTHESIZED),
	.ALUsrc(ALUsrc_ALTERA_SYNTHESIZED),
	.branch(branch_ALTERA_SYNTHESIZED),
	.jump(jump_ALTERA_SYNTHESIZED),
	.memWrite(memWrite_ALTERA_SYNTHESIZED),
	
	.memToReg(memToReg_ALTERA_SYNTHESIZED),
	
	.ALUop(ALUop_ALTERA_SYNTHESIZED));


delay	b2v_instdelay(
	.in(clk_5000HZ_ALTERA_SYNTHESIZED),
	.clk(clk),
	.out(clk_instROM_ALTERA_SYNTHESIZED));

assign	regDist = regDist_ALTERA_SYNTHESIZED;
assign	ZF = ZF_ALTERA_SYNTHESIZED;
assign	clk_5000HZ = clk_5000HZ_ALTERA_SYNTHESIZED;
assign	branch = branch_ALTERA_SYNTHESIZED;
assign	jump = jump_ALTERA_SYNTHESIZED;
assign	ALUsrc = ALUsrc_ALTERA_SYNTHESIZED;
assign	memWrite = memWrite_ALTERA_SYNTHESIZED;
assign	regWrite = regWrite_ALTERA_SYNTHESIZED;
assign	memToReg = memToReg_ALTERA_SYNTHESIZED;
assign	branchTrue = branchTrue_ALTERA_SYNTHESIZED;
assign	clk_instROM = clk_instROM_ALTERA_SYNTHESIZED;
assign	ALUop = ALUop_ALTERA_SYNTHESIZED;
assign	busB = busB_ALTERA_SYNTHESIZED;
assign	inst = inst_ALTERA_SYNTHESIZED;
assign	out = out_ALTERA_SYNTHESIZED;
assign	PC = PC_ALTERA_SYNTHESIZED;
assign	rsdata = rsdata_ALTERA_SYNTHESIZED;
assign	rtdata = rtdata_ALTERA_SYNTHESIZED;

endmodule
