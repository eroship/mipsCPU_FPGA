module regFile(clk, reset, regDist, regWrite, inst, dataWrite, rsdata, rtdata);
input clk;
input reset;
input regDist;
input regWrite;
input[31:0] inst; //在寄存器内部解码指令，产生rs，rt，rd的地址
input[31:0] dataWrite;

output[31:0] rsdata; 
output[31:0] rtdata;

wire[4:0] addrWrite;
assign addrWrite = regDist?inst[15:11]:inst[20:16];
//如果regdist=1，写rd，否则写rt

reg[31:0] regHeap[0:31];
integer i;

initial
begin
	for(i = 0; i < 32; i = i + 1)
		regHeap[i] = 0;
end
 
assign rsdata = (inst[25:21] == 5'b00000)?32'b0:regHeap[inst[25:21]];
assign rtdata = (inst[20:16] == 5'b00000)?32'b0:regHeap[inst[20:16]];


always@(posedge clk)
begin
	if(!reset && regWrite)
		regHeap[addrWrite] = dataWrite;
	else if(reset)
	begin
		for(i = 0; i < 32; i = i + 1)
			regHeap[i] = 0;
	end
end

endmodule