//测试功能完整性
`timescale 1ns/1ns
module tb_booth_ctrl();
	reg[31:0]	A,B;
	reg[31:0]	A_r,B_r;
	reg[31:0]	A_r1,B_r1;
	reg[31:0]	A_r2,B_r2;
	reg valid_i,ready_i;
	reg		sys_clk,sys_rst_n;

	wire[63:0]res;
	wire	ready_o,valid_o;
	
	parameter	MAX_NUM = 32'hffff_ffff;
	parameter	TEST_NUM = 10000;
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
	end
	
	always	#10	sys_clk=~sys_clk;
	always	#20	A = $random() % MAX_NUM;
	always	#20	B = $random() % MAX_NUM;
	always@(posedge sys_clk)begin
		if(!sys_rst_n)begin
			A_r <= 'b0;
			B_r <= 'b0;
			A_r1<= 'b0;
			B_r1<= 'b0;
			A_r2<= 'b0;
			B_r2<= 'b0;		
		end
		else	begin
			A_r <= A;
			B_r <= B;
			A_r1<= A_r;
			B_r1<= B_r;
			A_r2<= A_r1;
			B_r2<= B_r1;	
		end
	end
	
	wire	signed[63:0]  res_ref = $signed(A_r2)*$signed(B_r2);
	reg	[20:0]	num_correct=0;
	reg	[20:0]	num_error=0;
	reg	[20:0]	i=0;
	always@(posedge sys_clk)begin
		i<=i+1'b1;
		if(i==TEST_NUM)begin
			$display("Accuracy:%d / %d = %d%%",num_correct-3,i-4,(num_correct-3)*100/(i-4));
			$finish;
		end
		else begin
			$write("[%d]:%d * %d = %d ,ref: %d ",i-3,$signed(A_r),$signed(B_r),$signed(res),res_ref);
			if(res_ref==res)begin
				$display("PASS");
				num_correct<=num_correct+1'b1;
			end
			else begin
				$display("FAIL");
				num_error<=num_error+1'b1;
			end
		end
	end
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