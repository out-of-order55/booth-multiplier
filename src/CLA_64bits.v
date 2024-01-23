module CLA_64bits(
	input[63:0]		in1,
	input[63:0]		in2,
	input			cin,
	output[63:0]	res
);
	wire[16:0]	select;
	wire[16:0]	c_temp1,c_temp2;
	wire[63:0]	s_temp1,s_temp2;
	genvar	i;
	generate
		for(i=0;i<16;i=i+1)
		begin:CLA_inst
			if(i==0)begin
				CLA CLA_0(
					.in1	(in1[3:0]),
					.in2	(in2[3:0]),
					.cin	(cin),
					.cout	(select[1]),
					.s	    (s_temp1[3:0])
				);
				assign	res[3:0] = s_temp1[3:0];
			end
			else begin
				CLA CLA_c0(
					.in1	(in1[4*i+3:4*i]),
					.in2	(in2[4*i+3:4*i]),
					.cin	(1'b0),
					.cout	(c_temp1[i+1]),
					.s	    (s_temp1[4*i+3:4*i])
				);
				CLA CLA_c1(
					.in1	(in1[4*i+3:4*i]),
					.in2	(in2[4*i+3:4*i]),
					.cin	(1'b1),
					.cout	(c_temp2[i+1]),
					.s	    (s_temp2[4*i+3:4*i])
				);
				assign	select[i+1]  = select[i]?c_temp2[i+1]:c_temp1[i+1];
				assign	res[4*i+3:4*i] = select[i]?s_temp2[4*i+3:4*i]:s_temp1[4*i+3:4*i];
			end
		end
	endgenerate
endmodule