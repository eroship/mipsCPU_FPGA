module myShow(clk, num1, num2, num3, num4, posDecode, numberDecode);
input clk;
input [3:0] num1;
input [3:0] num2;
input [3:0] num3;
input [3:0] num4;

output reg [3:0]posDecode; //控制每个数码管的亮灭
output reg [6:0]numberDecode; //7448译码后控制每个数码管的信号

reg[1:0] posNumber;//二进制数表示的点亮的位置
reg[3:0] numberNumber;//二进制数表示显示数

initial
begin
	posDecode = 0;
	numberDecode = 0;
	
	posNumber = 0;
	numberNumber = 0;
end


always@(posedge clk)
begin
	case(posNumber)
	2'd0:
	begin
		posDecode = 4'b0001;
		numberNumber = num1;
		posNumber = 2'd1;
	end
	
	2'd1:
	begin
		posDecode = 4'b0010;
		numberNumber = num2;
		posNumber = 2'd2;
	end
	
	2'd2:
	begin
		posDecode = 4'b0100;
		numberNumber = num3;
		posNumber = 2'd3;
	end
	
	2'd3:
	begin
		posDecode = 4'b1000;
		numberNumber = num4;
		posNumber = 2'd0;
	end
	
	default:
	begin
		posDecode = 4'b0000;
		numberNumber = 4'b0000;
		posNumber = 2'd0;
	end
	endcase
	
	
	case(numberNumber)
		4'b0000: numberDecode = 7'b0111111; // 0
		4'b0001: numberDecode = 7'b0000110; // 1
		4'b0010: numberDecode = 7'b1011011; // 2
		4'b0011: numberDecode = 7'b1001111; // 3
		4'b0100: numberDecode = 7'b1100110; // 4
		4'b0101: numberDecode = 7'b1101101; // 5
		4'b0110: numberDecode = 7'b1111101; // 6
		4'b0111: numberDecode = 7'b0000111; // 7
		4'b1000: numberDecode = 7'b1111111; // 8
		4'b1001: numberDecode = 7'b1101111; // 9
		4'b1010: numberDecode = 7'b1110111; // A
		4'b1011: numberDecode = 7'b1111100; // b
		4'b1100: numberDecode = 7'b0111001; // c
		4'b1101: numberDecode = 7'b1011110; // d
		4'b1110: numberDecode = 7'b1111001; // E
		4'b1111: numberDecode = 7'b1110001; // F
		default: numberDecode = 7'b0000000;	
	endcase
	
	
end

endmodule