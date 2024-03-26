//测试功能完整性
`timescale 1ns/1ns
module tb();
	reg[31:0]	A,B;
	reg		sys_clk,sys_rst_n;	
	initial
	begin
		sys_clk	<=1'b0;
		sys_rst_n<=1'b0;
		A        <= 'b0;
		#80
		sys_rst_n<=1'b1;
		A <='h7;
		#20
		A<='b0;
		
	end
	
	always	#10	sys_clk=~sys_clk;

	always@(posedge sys_clk)begin
		if(!sys_rst_n)
			B <= 'b0;
		else 
			B <= A;
	end
endmodule