module booth_ctrl(
	input [32:0]		A,
	output[16:0]        set0,
	output[16:0]        inv,
	output[16:0]    	X2
);
	wire[34:0]	ext_data = {1'b0,A,1'b0};//为了将负位添加上
	wire[2:0]	code[16:0];
	genvar	i;
	generate
		for(i=0;i<=16;i=i+1)
		begin:encoder
			assign code[i] = ext_data[2*i+2:2*i];
		end
	endgenerate
	
	genvar j;
	generate
		for(j=0;j<=16;j=j+1)
		begin:ctrl_signal
			assign	set0[j] = (code[j]==3'b000)|(code[j]==3'b111);
			assign	inv[j]	= (((~code[j][0])|(~code[j][1]))&(code[j][2]));//(code[j]==3'b001)|(code[j]==3'b011)|(code[j]==3'b101);
			assign	X2[j]   = (code[j]==3'b011)|(code[j]==3'b100);
		end
	endgenerate
endmodule