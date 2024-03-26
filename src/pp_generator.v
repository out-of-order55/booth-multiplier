module pp_generator(
	input 			   clk	,
	input			   rst_n,
	input [32:0]	   data_i,
	input [16:0]       set0	,	
	input [16:0]       inv	,	
	input [16:0]       X2	,
	input			valid_i,
	output			ready_o,
	//下一级
	input			ready_i,
	output			valid_o,

	output reg[63:0]       pp0	,
	output reg[63:0]       pp1	,
	output reg[63:0]       pp2	,
	output reg[63:0]       pp3	,
	output reg[63:0]       pp4	,
	output reg[63:0]       pp5	,
	output reg[63:0]       pp6	,
	output reg[63:0]       pp7	,
	output reg[63:0]       pp8	,
	output reg[63:0]       pp9	,
	output reg[63:0]       pp10	,
	output reg[63:0]       pp11	,
	output reg[63:0]       pp12	,
	output reg[63:0]       pp13	,
	output reg[63:0]       pp14	,
	output reg[63:0]       pp15	,
	output reg[63:0]	   pp16
);

	assign		ready_o = ready_i;
	
	reg			valid_r;
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)begin
			valid_r<=1'b0;
		end
		else if(ready_o)begin
			valid_r<=valid_i;
		end
	end

	wire[63:0]  pp_temp[16:0];
	wire[33:0]  data;
	assign	data = {data_i[32],data_i};
	genvar	i;
	generate
		for(i=0;i<=16;i=i+1)
		begin:pp_gen
			assign pp_temp[i] = {64{((~set0[i])&(~inv[i])&(~X2[i]))}}&({{30{data[33]}},data})
							|   {64{((inv[i])&(~X2[i]))}}&((~({{30{data[33]}},data}))+64'b1)
							|   {64{((~inv[i])&(X2[i]))}}&({{30{data[33]}},data<<1})
							|	{64{((inv[i])&(X2[i]))}}&((~({{30{data[33]}},data<<1}))+64'b1)
							|   {64{(set0[i])}}&(64'b0)
							;
		end
	endgenerate
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			{pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,pp16} <= 'b0;
		end
		else if(ready_o&valid_i)begin
			pp0	 <= pp_temp[0];
			pp1	 <= {pp_temp[1]<<2};
			pp2	 <= {pp_temp[2]<<4};
			pp3	 <= {pp_temp[3]<<6};
			pp4	 <= {pp_temp[4]<<8};
			pp5	 <= {pp_temp[5]<<10};
			pp6	 <= {pp_temp[6]<<12};
			pp7	 <= {pp_temp[7]<<14};
			pp8	 <= {pp_temp[8]<<16};
			pp9	 <= {pp_temp[9]<<18};
			pp10 <= {pp_temp[10]<<20};	
			pp11 <= {pp_temp[11]<<22};	
			pp12 <= {pp_temp[12]<<24};	
			pp13 <= {pp_temp[13]<<26};	
			pp14 <= {pp_temp[14]<<28};	
			pp15 <= {pp_temp[15]<<30};
			pp16 <= {pp_temp[16]<<32};			
		end
	end
	assign		valid_o	= valid_r;
endmodule