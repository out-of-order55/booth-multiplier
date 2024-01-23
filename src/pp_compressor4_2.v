module	pp_compressor4_2(
	input[63:0]		i1	,
	input[63:0]		i2	,
	input[63:0]		i3	,
	input[63:0]		i4	,

	output[63:0]	C	,
	output[63:0]	S	
);


	wire[63:0]	C_comb;
	wire[63:0]	S_comb;
	wire[63:0]	c_temp;
	wire[64:0]	c_temp_append;
	assign	c_temp_append = {c_temp,1'b0};
	genvar i;
	generate
	for(i=0;i<64;i=i+1)
		begin:compressor4_2_inst
			compressor4_2 u_compressor4_2(
				.i1		(i1[i]),
				.i2		(i2[i]),
				.i3		(i3[i]),
				.i4		(i4[i]),
				.cin	(c_temp_append[i]),
				.cout	(c_temp_append[i+1]),
				.C		(C_comb[i]),
				.S      (S_comb[i])
			);
		end
	endgenerate
	assign	C = {C_comb,1'b0};
	assign	S = S_comb;
endmodule