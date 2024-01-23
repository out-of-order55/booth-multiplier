module pp_generator(
	input 			   clk	,
	input			   rst_n,
	input [31:0]	   data_i,
	input [15:0]       set0	,	
	input [15:0]       inv	,	
	input [15:0]       X2	,
	
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
	output reg[63:0]       pp15	
);
	wire[63:0]  pp_temp[15:0];
	wire[32:0]  data;
	assign	data = {data_i[31],data_i};
	genvar	i;
	generate
		for(i=0;i<16;i=i+1)
		begin:pp_gen
			assign pp_temp[i] = {64{((~set0[i])&(~inv[i])&(~X2[i]))}}&({{31{data[32]}},data})
							|   {64{((inv[i])&(~X2[i]))}}&((~({{31{data[32]}},data}))+64'b1)
							|   {64{((~inv[i])&(X2[i]))}}&({{31{data[32]}},data<<1})
							|	{64{((inv[i])&(X2[i]))}}&((~({{31{data[32]}},data<<1}))+64'b1)
							|   {64{(set0[i])}}&(64'b0)
							;
		end
	endgenerate
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			{pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15} <= 'b0;
		end
		else begin
			// pp0	 <= pp_temp[0];
			// pp1	 <= {pp_temp[1]<<2,2'b0};
			// pp2	 <= {pp_temp[2]<<4,4'b0};
			// pp3	 <= {pp_temp[3]<<6,6'b0};
			// pp4	 <= {pp_temp[4]<<8,8'b0};
			// pp5	 <= {pp_temp[5]<<10,10'b0};
			// pp6	 <= {pp_temp[6]<<12,12'b0};
			// pp7	 <= {pp_temp[7]<<14,14'b0};
			// pp8	 <= {pp_temp[8]<<16,16'b0};
			// pp9	 <= {pp_temp[9]<<18,18'b0};
			// pp10 <= {pp_temp[10]<<20,20'b0};	
			// pp11 <= {pp_temp[11]<<22,22'b0};	
			// pp12 <= {pp_temp[12]<<24,24'b0};	
			// pp13 <= {pp_temp[13]<<26,26'b0};	
			// pp14 <= {pp_temp[14]<<28,28'b0};	
			// pp15 <= {pp_temp[15]<<30,30'b0};
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
		end
	end
endmodule