module divider(clk, out1, out2);
input clk;
output reg out1;
output reg out2;
reg[16:0] cnt;


initial
begin
	cnt = 0;
	out1 = 1'b0;
	out2 = 1'b0;
	
end

always@(posedge clk)
begin

	if(cnt % 5000 == 0)
	begin
		out1 = ~out1;
		cnt = cnt + 1;
	end
	else
	begin
		cnt = cnt + 1;
	end
	
	if(cnt == 100000)
	begin
		out2 = ~out2;
		cnt = 0;
	end
	

end
endmodule
	