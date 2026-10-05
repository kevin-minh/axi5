/*
 * axi5_if.sv
 *
 * Author: Kevin Nguyen
 * Last Updated: 2026-10-03
 */

import axi_pkg;

interface axi_if;
  // ==========================================================================
  // Inteface Level Signals
  // ==========================================================================
  logic clk, rst_n;

  // ==========================================================================
  // Write Request Signals
  // ==========================================================================
  logic                       aw_valid;
  logic                       aw_ready;
  logic [ADDR_WIDTH-1:0]      aw_addr;
  logic [2:0]                 aw_size;  // number of bytes per transfer (2^aw_size)
  logic [ID_W_WIDTH-1:0]      aw_id;
  logic [USER_ADDR_WIDTH-1:0] aw_user;  // custom user extension on write reqs

  // ==========================================================================
  // Write Data Signals
  // ==========================================================================
  logic                       w_valid;
  logic                       w_ready;
  logic [DATA_WIDTH-1:0]      w_data;
  logic [STRB_WIDTH-1:0]      w_strb; // indicates which data bytes are valid
  logic [USER_DATA_WIDTH-1:0] w_user; // custom user extension on write data transfers

  // ==========================================================================
  // Write Response Signals
  // ==========================================================================
  logic                       b_valid;
  logic                       b_ready;
  logic [BRESP_WIDTH-1:0]     b_resp;  // response status 
  logic [ID_W_WIDTH-1:0]      b_id;
  logic [USER_RESP_WIDTH-1:0] b_user;  // custom user extension on write response

  // ==========================================================================
  // Read Request Signals
  // ==========================================================================
  logic                       ar_valid;
  logic                       ar_ready;
  logic [ADDR_WIDTH-1:0]      ar_addr;
  logic [2:0]                 ar_size;
  logic [ID_R_WIDTH-1:0]      ar_id;
  logic [USER_ADDR_WIDTH-1:0] ar_user;  // custom user extension on read request

  // ==========================================================================
  // Read Response Signals
  // ==========================================================================
  logic                       r_valid;
  logic                       r_ready;
  logic [DATA_WIDTH-1:0]      r_data;
  logic [RRESP_WIDTH-1:0]     r_resp;  // response status
  logic [ID_R_WIDTH-1:0]      r_id;
  logic [USER_DATA_WIDTH-1:0] r_user;  // custom user extension on read response

endinterface

