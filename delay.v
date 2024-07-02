module delay(in, clk, out);
input in;
input clk;
output out;
reg [5:0]waiting;

assign out = waiting[5];
//只能延迟半个周期，不能再多了
initial
begin
	waiting = 0;
end


always@(posedge clk)
begin
	waiting = (waiting<<1) + in;
end

endmodule