//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Sat Feb  3 11:28:55 2024
//Host        : gb running 64-bit major release  (build 9200)
//Command     : generate_target my_v1_0_bfm_1.bd
//Design      : my_v1_0_bfm_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "my_v1_0_bfm_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=my_v1_0_bfm_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "my_v1_0_bfm_1.hwdef" *) 
module my_v1_0_bfm_1
   (ACLK,
    ARESETN,
    M00_AXI_ERROR,
    M00_AXI_INIT_AXI_TXN,
    M00_AXI_TXN_DONE);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_RESET ARESETN, CLK_DOMAIN my_v1_0_bfm_1_ACLK, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ARESETN;
  output M00_AXI_ERROR;
  input M00_AXI_INIT_AXI_TXN;
  output M00_AXI_TXN_DONE;

  wire aclk_net;
  wire aresetn_net;
  wire error_00;
  wire init_axi_txn_00;
  wire [31:0]my_0_M00_AXI_ARADDR;
  wire [2:0]my_0_M00_AXI_ARPROT;
  wire my_0_M00_AXI_ARREADY;
  wire my_0_M00_AXI_ARVALID;
  wire [31:0]my_0_M00_AXI_AWADDR;
  wire [2:0]my_0_M00_AXI_AWPROT;
  wire my_0_M00_AXI_AWREADY;
  wire my_0_M00_AXI_AWVALID;
  wire my_0_M00_AXI_BREADY;
  wire [1:0]my_0_M00_AXI_BRESP;
  wire my_0_M00_AXI_BVALID;
  wire [31:0]my_0_M00_AXI_RDATA;
  wire my_0_M00_AXI_RREADY;
  wire [1:0]my_0_M00_AXI_RRESP;
  wire my_0_M00_AXI_RVALID;
  wire [31:0]my_0_M00_AXI_WDATA;
  wire my_0_M00_AXI_WREADY;
  wire [3:0]my_0_M00_AXI_WSTRB;
  wire my_0_M00_AXI_WVALID;
  wire txn_done_00;

  assign M00_AXI_ERROR = error_00;
  assign M00_AXI_TXN_DONE = txn_done_00;
  assign aclk_net = ACLK;
  assign aresetn_net = ARESETN;
  assign init_axi_txn_00 = M00_AXI_INIT_AXI_TXN;
  my_v1_0_bfm_1_my_0_0 my_0
       (.m00_axi_aclk(aclk_net),
        .m00_axi_araddr(my_0_M00_AXI_ARADDR),
        .m00_axi_aresetn(aresetn_net),
        .m00_axi_arprot(my_0_M00_AXI_ARPROT),
        .m00_axi_arready(my_0_M00_AXI_ARREADY),
        .m00_axi_arvalid(my_0_M00_AXI_ARVALID),
        .m00_axi_awaddr(my_0_M00_AXI_AWADDR),
        .m00_axi_awprot(my_0_M00_AXI_AWPROT),
        .m00_axi_awready(my_0_M00_AXI_AWREADY),
        .m00_axi_awvalid(my_0_M00_AXI_AWVALID),
        .m00_axi_bready(my_0_M00_AXI_BREADY),
        .m00_axi_bresp(my_0_M00_AXI_BRESP),
        .m00_axi_bvalid(my_0_M00_AXI_BVALID),
        .m00_axi_error(error_00),
        .m00_axi_init_axi_txn(init_axi_txn_00),
        .m00_axi_rdata(my_0_M00_AXI_RDATA),
        .m00_axi_rready(my_0_M00_AXI_RREADY),
        .m00_axi_rresp(my_0_M00_AXI_RRESP),
        .m00_axi_rvalid(my_0_M00_AXI_RVALID),
        .m00_axi_txn_done(txn_done_00),
        .m00_axi_wdata(my_0_M00_AXI_WDATA),
        .m00_axi_wready(my_0_M00_AXI_WREADY),
        .m00_axi_wstrb(my_0_M00_AXI_WSTRB),
        .m00_axi_wvalid(my_0_M00_AXI_WVALID));
  my_v1_0_bfm_1_slave_0_0 slave_0
       (.aclk(aclk_net),
        .aresetn(aresetn_net),
        .s_axi_araddr(my_0_M00_AXI_ARADDR),
        .s_axi_arprot(my_0_M00_AXI_ARPROT),
        .s_axi_arready(my_0_M00_AXI_ARREADY),
        .s_axi_arvalid(my_0_M00_AXI_ARVALID),
        .s_axi_awaddr(my_0_M00_AXI_AWADDR),
        .s_axi_awprot(my_0_M00_AXI_AWPROT),
        .s_axi_awready(my_0_M00_AXI_AWREADY),
        .s_axi_awvalid(my_0_M00_AXI_AWVALID),
        .s_axi_bready(my_0_M00_AXI_BREADY),
        .s_axi_bresp(my_0_M00_AXI_BRESP),
        .s_axi_bvalid(my_0_M00_AXI_BVALID),
        .s_axi_rdata(my_0_M00_AXI_RDATA),
        .s_axi_rready(my_0_M00_AXI_RREADY),
        .s_axi_rresp(my_0_M00_AXI_RRESP),
        .s_axi_rvalid(my_0_M00_AXI_RVALID),
        .s_axi_wdata(my_0_M00_AXI_WDATA),
        .s_axi_wready(my_0_M00_AXI_WREADY),
        .s_axi_wstrb(my_0_M00_AXI_WSTRB),
        .s_axi_wvalid(my_0_M00_AXI_WVALID));
endmodule
