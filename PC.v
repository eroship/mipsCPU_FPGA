module PC(clk, reset, instr, jump, branch, PCout);
input clk;
input reset;
input [31:0] instr;
input jump;
input branch;

output reg[31:0] PCout;

wire[31:0] jumpAddr;
wire[31:0] branchAddr;

wire[31:0] newPC;
assign newPC = PCout + 4;

wire[3:0] newPChigh;
assign newPChigh = newPC[31:28];

assign jumpAddr = {newPChigh, instr[25:0], 2'b00};
assign branchAddr = {{14{instr[15]}}, instr[15:0], 2'b00};

always@(posedge clk)
begin
	if(!reset)
	begin
		if(jump)
			PCout = jumpAddr;
		else if(branch)
			PCout = PCout + 4 + branchAddr;
		else
			PCout = PCout + 4;
	end
	else
		PCout = 0;
end
endmodule