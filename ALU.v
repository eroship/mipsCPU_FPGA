module ALU(control, A, B, out, ZF, CF, OF);
	input [3:0]control;
	input [31:0]A;
	input [31:0]B;
	output reg [31:0]out;
	output reg ZF; //零标志
	output reg CF; //进、借位标志，姑且认为是最高位输出的
	output reg OF; //溢出标志
	
	initial
	begin
	out = 0;
	ZF = 1;
	CF = 0;
	OF = 0;
	
	end
	
	always@(control, A, B)
	begin
		case(control)
		4'b0000: //与
		begin
			out = A & B;
			if(out == 0)
				ZF = 1;
			else
				ZF = 0;
			
			CF = 0;
			OF = 0;
		end
		
		4'b0001: //或
		begin
			out = A | B;
			if(out == 0)
				ZF = 1;
			else
				ZF = 0;
			
			CF = 0;
			OF = 0;
		end
			
		4'b0010: //加,通过判断最高位的进位输出输入是否相等判断溢出
		begin
			{CF, out} = A + B;
			OF = (A[31] == B[31])&&(~A[31]==out[31])?1:0;
			
			if(out == 0)
				ZF = 1;
			else
				ZF = 0;
		end
				
		4'b0110: //减
		begin
			{CF, out} = A - B;
			OF = (~A[31] == B[31])&&(~A[31] == out[31])?1:0;
			
			if(out == 0)
				ZF = 1;
			else
				ZF = 0;
		end
		
		4'b0111: //小于
		begin
			case({A[31], B[31]})
			2'b00:
			begin
				if(A < B)
				begin
					out = 1;
					ZF = 0;
				end
				else
				begin
					out = 0;
					ZF = 1;
				end
			end
					
				
			2'b01:
			begin
				out = 0;
				ZF = 1;
			end
			
			2'b10:
			begin
				out = 1;
				ZF = 0;
			end
			
			2'b11:
			begin
				if(A < B)
				begin
					out = 1;
					ZF = 0;
				end
				else
				begin
					out = 0;
					ZF = 1;
				end
			end
			
			default:
			begin
				out = 0;
				ZF = 1;
			end
			
			endcase
			
			CF = 0;
			OF = 0;
			
		end
				
		4'b1100: //或非
		begin
			out = ~(A | B);
			if(out == 0)
				ZF = 1;
			else
				ZF = 0;
			
			CF = 0;
			OF = 0;
		end
		
		default:
		begin
			out = 0;
			ZF = 1;
			OF = 0;
			CF = 0;
		end
		
		endcase
	end
	
endmodule