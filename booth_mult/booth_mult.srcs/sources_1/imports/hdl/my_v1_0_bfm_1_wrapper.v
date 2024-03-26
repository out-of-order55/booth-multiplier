//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Sat Feb  3 11:28:50 2024
//Host        : gb running 64-bit major release  (build 9200)
//Command     : generate_target my_v1_0_bfm_1_wrapper.bd
//Design      : my_v1_0_bfm_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module my_v1_0_bfm_1_wrapper
   (ACLK,
    ARESETN,
    M00_AXI_ERROR,
    M00_AXI_INIT_AXI_TXN,
    M00_AXI_TXN_DONE);
  input ACLK;
  input ARESETN;
  output M00_AXI_ERROR;
  input M00_AXI_INIT_AXI_TXN;
  output M00_AXI_TXN_DONE;

  wire ACLK;
  wire ARESETN;
  wire M00_AXI_ERROR;
  wire M00_AXI_INIT_AXI_TXN;
  wire M00_AXI_TXN_DONE;

  my_v1_0_bfm_1 my_v1_0_bfm_1_i
       (.ACLK(ACLK),
        .ARESETN(ARESETN),
        .M00_AXI_ERROR(M00_AXI_ERROR),
        .M00_AXI_INIT_AXI_TXN(M00_AXI_INIT_AXI_TXN),
        .M00_AXI_TXN_DONE(M00_AXI_TXN_DONE));
endmodule
