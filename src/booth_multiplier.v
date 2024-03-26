module booth_multiplier(
	input			clk,
	input			rst_n,
	input [32:0]	data1,
	input [32:0]	data2,
	//与上一模块交互的handshake
	input			valid_i,
	output			ready_o,
	//与下一模块交互的handshake
	input			ready_i,
	output			valid_o,
	output [63:0] 	res
);
	wire[16:0]        set0;//0
	wire[16:0]        inv;//负数
	wire[16:0]    	  X2;//乘2
	wire[63:0]	pp0	;		
	wire[63:0]	pp1	;		
	wire[63:0]	pp2	;		
	wire[63:0]	pp3	;		
	wire[63:0]	pp4	;		
	wire[63:0]	pp5	;		
	wire[63:0]	pp6	;		
	wire[63:0]	pp7	;		
	wire[63:0]	pp8	;		
	wire[63:0]	pp9	;		
	wire[63:0]	pp10;		
	wire[63:0]	pp11;		
	wire[63:0]	pp12;		
	wire[63:0]	pp13;		
	wire[63:0]	pp14;		
	wire[63:0]	pp15;	
	wire[63:0]	pp16;	
booth_ctrl u_booth_ctrl(
	.A		(data2),
	.set0	(set0),
	.inv	(inv),
	.X2     (X2)
);
wire		ready_r1,valid_r1;
pp_generator u_pp_generator(
	.clk	(clk),
	.rst_n	(rst_n),
	.data_i	(data1),
	.valid_i(valid_i),
	.ready_o(ready_o),
	.ready_i(ready_i),
	.valid_o(valid_o),
	.set0	(set0),	
	.inv	(inv),	
	.X2		(X2),
	.pp0	(pp0),
	.pp1	(pp1),
	.pp2	(pp2),
	.pp3	(pp3),
	.pp4	(pp4),
	.pp5	(pp5),
	.pp6	(pp6),
	.pp7	(pp7),
	.pp8	(pp8),
	.pp9	(pp9),
	.pp10	(pp10),
	.pp11	(pp11),
	.pp12	(pp12),
	.pp13	(pp13),
	.pp14	(pp14),
	.pp15	(pp15),
	.pp16	(pp16)
);
	wire[63:0]	c0_stage1,c1_stage1,c2_stage1,c3_stage1;
	wire[63:0]	s0_stage1,s1_stage1,s2_stage1,s3_stage1;

//stage1
pp_compressor4_2 pp_compressor4_2_s10(
	.i1	(pp0),
	.i2	(pp1),
	.i3	(pp2),
	.i4	(pp3),
	.C	(c0_stage1),
	.S	(s0_stage1)
);
pp_compressor4_2 pp_compressor4_2_s11(
	.i1	(pp4),
	.i2	(pp5),
	.i3	(pp6),
	.i4	(pp7),
	.C	(c1_stage1),
	.S	(s1_stage1)
);
pp_compressor4_2 pp_compressor4_2_s12(
	.i1	(pp8),
	.i2	(pp9),
	.i3	(pp10),
	.i4	(pp11),
	.C	(c2_stage1),
	.S	(s2_stage1)
);
pp_compressor4_2 pp_compressor4_2_s13(
	.i1	(pp12),
	.i2	(pp13),
	.i3	(pp14),
	.i4	(pp15),
	.C	(c3_stage1),
	.S	(s3_stage1)
);


	wire[63:0]	c0_stage2,c1_stage2;
	wire[63:0]	s0_stage2,s1_stage2;

//stage 2
pp_compressor4_2 pp_compressor4_2_s20(
	.i1	(c0_stage1),
	.i2	(s0_stage1),
	.i3	(c1_stage1),
	.i4	(s1_stage1),
	.C	(c0_stage2),
	.S	(s0_stage2)
);
pp_compressor4_2 pp_compressor4_2_s21(
	.i1	(c2_stage1),
	.i2	(s2_stage1),
	.i3	(c3_stage1),
	.i4	(s3_stage1),
	.C	(c1_stage2),
	.S	(s1_stage2)
);

	wire[63:0]	c0_stage3;
	wire[63:0]	s0_stage3;
	wire[63:0]	CLA_res;
//stage3
pp_compressor4_2 pp_compressor4_2_s3(
	.i1	(c0_stage2),
	.i2	(s0_stage2),
	.i3	(c1_stage2),
	.i4	(s1_stage2),
	.C	(c0_stage3),
	.S	(s0_stage3)
);
CLA_64bits CLA_64bits_s4(
	.in1(c0_stage3),
	.in2(s0_stage3),
	.cin(1'b0),
	.res(CLA_res)
);
	assign res = CLA_res+pp16;
endmodule