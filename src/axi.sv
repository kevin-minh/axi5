/*
 * Author: Kevin Nguyen
 * Date Created: 2025-12-14
 */

interface axi_if #(
  parameter RWIDTH = 8, // 8, 16, 32, 64, 128, 256, 512, or 1024
  parameter WWIDTH = 8, // 8, 16, 32, 64, 128, 256, 512, or 1024
  parameter ADDR_WIDTH = 32
) (
  input ACLK, ARST_n 
);
  // Write Address Signals
  logic [3:0]            AWID;
  logic [ADDR_WIDTH-1:0] AWADDR;
  logic [3:0]            AWLEN;
  logic [2:0]            AWSIZE;
  logic [1:0]            AWBURST;
  logic [1:0]            AWLOCK;
  logic [1:0]            AWCACHE;
  logic [2:0]            AWPROT;
  logic                  AWVALID;
  logic                  AWREADY;

  // Write Data Signals
  logic [3:0]        WID;
  logic [WWIDTH-1:0] WDATA;
  logic [3:0]        WSTRB;
  logic              WLAST;
  logic              WVALID;
  logic              WREADY;

  // Write Response Signals
  logic [3:0] BID;
  logic [1:0] BRESP;
  logic       BVALID;
  logic       BREADY;

  // Read Address Signals
  logic [3:0]            ARID;
  logic [ADDR_WIDTH-1:0] ARADDR;
  logic [3:0]            ARLEN;
  logic [2:0]            ARSIZE;
  logic [1:0]            ARBURST;
  logic [1:0]            ARLOCK;
  logic [3:0]            ARCACHE;
  logic [2:0]            ARPROT;
  logic                  ARVALID;
  logic                  ARREADY;

  // Read Data Signals
  logic [3:0]        RID;
  logic [RWIDTH-1:0] RDATA;
  logic [1:0]        RRESP;
  logic              RLAST;
  logic              RVALID;
  logic              RREADY;

  modport controller (
    input  AWREADY,
    output AWID,
    output AWADDR,
    output AWLEN,
    output AWSIZE,
    output AWBURST,
    output AWLOCK,
    output AWCACHE,
    output AWPROT,
    output AWVALID,
    
    input  WREADY,
    output WID,
    output WDATA,
    output WSTRB,
    output WLAST,
    output WVALID,

    input  BID,
    input  BRESP,
    input  BVALID,
    output BREADY,

    input  ARREADY,
    output ARID,
    output ARADDR,
    output ARLEN,
    output ARSIZE,
    output ARBURST,
    output ARLOCK,
    output ARCACHE,
    output ARPROT,
    output ARVALID,

    input  RID,
    input  RDATA,
    input  RRESP,
    input  RLAST,
    input  RVALID,
    output RREADY
  );

  modport device (
    input  AWID,
    input  AWADDR,
    input  AWLEN,
    input  AWSIZE,
    input  AWBURST,
    input  AWLOCK,
    input  AWCACHE,
    input  AWPROT,
    input  AWVALID,
    output AWREADY,

    input  WID,
    input  WDATA,
    input  WSTRB,
    input  WLAST,
    input  WVALID,
    output WREADY,

    input  BREADY,
    output BID,
    output BRESP,
    output BVALID,

    input  ARID,
    input  ARADDR,
    input  ARLEN,
    input  ARSIZE,
    input  ARBURST,
    input  ARLOCK,
    input  ARCACHE,
    input  ARPROT,
    input  ARVALID,
    output ARREADY,

    input  RREADY,
    output RID,
    output RDATA,
    output RRESP,
    output RLAST,
    output RVALID
  );
  
endinterface
