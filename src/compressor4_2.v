module compressor4_2(
	input	i1		,
	input	i2		,
	input	i3		,
	input	i4		,
	input	cin		,
	output	cout	,
	output  C		,
	output	S
);
  wire s_temp = i1^i2^i3^i4;
  assign S  = cin^s_temp;
  assign cout = (i1|i2) & (i3|i4);
  assign C  = (cin&s_temp) | ~(s_temp | ~((i1&i2) | (i3&i4)));
endmodule