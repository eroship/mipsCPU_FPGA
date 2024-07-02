/*指令集：
lw：100011
sw: 101011

add：000000 100000
sub: 000000 100010
and: 000000 100100
or: 000000 100101
slt: 000000 101010

j: 000010
beq: 000100

ALUop:
4'b0000: 与
4'b0001: 或
4'b0010: 加
4'b0110: 减
4'b0111: 小于
4'b1100: 或非

*/

module control(inst, regDst, regWrite, ALUsrc, branch, jump, ALUop, memWrite, memRead, memToReg, extOp);
input[31:0] inst;
output regDst;
output regWrite;
output ALUsrc;
output branch;
output jump;
output reg[3:0] ALUop;
output memWrite;
output memRead;
output extOp;
output memToReg;

initial
begin
	ALUop = 0;
end

wire[1:0] ALUoperation;

assign regDst = (inst[31:26] == 6'b000000)?1'b1:1'b0; 
//如果opcode全为0(算术运算)，那么regDst=1(写rd)，否则写rt
assign ALUsrc = (inst[31:26] == 6'b100011 || inst[31:26] == 6'b101011)?1'b1:1'b0;
//opcode为100011或101011时，为lw或者sw，ALU接收的是扩展来的立即数（1）
assign regWrite = (inst[31:26] == 6'b000000 || inst[31:26] == 6'b100011)?1'b1:1'b0;
//opcode为100011（lw）或000000时，需要写寄存器

assign branch = (inst[31:26] == 6'b000100)?1'b1:1'b0;
//opcode=000100时branch

assign jump = (inst[31:26] == 6'b000010)?1'b1:1'b0;

assign memWrite = (inst[31:26] == 6'b101011)?1'b1:1'b0;//sw

assign memRead = (inst[31:26] == 6'b100011)?1'b1:1'b0;//lw

assign extOp = (inst[31:26] == 6'b100011 || inst[31:26] == 6'b101011)?1'b1:1'b0;	
//lw/sw时需要拓展（jump和branch的拓展在PC完成）	

assign memToReg = (inst[31:26] == 6'b100011)?1'b1:1'b0;	
//只有lw要把mem里的东西写到reg里

assign ALUoperation[1] = (inst[31:26] == 6'b000000)?1'b1:1'b0;	//算术逻辑运算
assign ALUoperation[0] = (inst[31:26] == 6'b000100)?1'b1:1'b0;	//branch

always@(inst[5:0] or ALUoperation)
begin
	if(ALUoperation == 2'b00)
		ALUop = 4'b0010; //lw,sw,jump,ALU=add
	else if(ALUoperation == 2'b01)
		ALUop = 4'b0110; //brach, ALU=sub
	else if(ALUoperation == 2'b10)
	begin //如果执行算术逻辑运算，需要考虑funct
		if(inst[5:0] == 6'b100100) //and
			ALUop = 4'b0000;
		else if(inst[5:0] == 6'b100101) //or
			ALUop = 4'b0001;
		else if(inst[5:0] == 6'b100000) //add
			ALUop = 4'b0010;
		else if(inst[5:0] == 6'b100010) //sub
			ALUop = 4'b0110;
		else if(inst[5:0] == 6'b101010) //slt
			ALUop = 4'b0111;
		else 
			ALUop = 4'b1111;
	end
	else
		ALUop = 4'b1111;
end

endmodule
			
	
	
