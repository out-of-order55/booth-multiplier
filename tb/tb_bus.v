//测试handshake
`timescale 1ns/1ns
module tb_bus();
	reg[31:0]	A,B;
	reg valid_i,ready_i;
	reg		sys_clk,sys_rst_n;

	wire[63:0]res;
	wire	ready_o,valid_o;
	
	parameter	MAX_NUM = 32'hffff_ffff;
	
	initial
	begin
		sys_clk	<=1'b0;
		sys_rst_n<=1'b0;
		valid_i	<= 1'b1;
		ready_i <= 1'b1;
		A <= $random() % MAX_NUM;
		B <= $random() % MAX_NUM;
		#20
		sys_rst_n<=1'b1;
		#20
		ready_i <= 1;
		valid_i <= 0;
		#90
		ready_i <= 0;
		valid_i <= 1;
		#300
		ready_i <= 1; 
		valid_i <= 0;
	end
	
	always	#10	sys_clk=~sys_clk;
	always	#20	A = $random() % MAX_NUM;
	always	#20	B = $random() % MAX_NUM;
booth_multiplier u_booth_multiplier(
	.clk		(sys_clk),
	.rst_n		(sys_rst_n),
	.data1		(B),
	.data2		(A),
	.valid_i(valid_i),
	.ready_o(ready_o),
	.ready_i(ready_i),
	.valid_o(valid_o),
	.res(res)
);
endmodule