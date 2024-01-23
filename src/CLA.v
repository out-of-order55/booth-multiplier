module CLA(
	input[3:0]	in1	,
	input[3:0]	in2	,
	input		cin	,
	output		cout,
	output[3:0]	s	
);
wire[3:0]	p,g;
wire[4:0]	c_temp;
assign	p=in1^in2;
assign	g=in1&in2;
assign	c_temp[0] = cin;
assign	cout = c_temp[4];
assign	s = p^c_temp[3:0];
assign	c_temp[1] = g[0]|(p[0]&c_temp[0]);
assign	c_temp[2] = g[1]|(p[1]&(g[0]|(p[0]&c_temp[0])));
assign	c_temp[3] = g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c_temp[0])))));
assign	c_temp[4] = g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c_temp[0])))))));
endmodule