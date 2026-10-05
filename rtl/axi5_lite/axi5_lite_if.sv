/*
 * axi5_lite_if.sv
 *
 * Author: Kevin Nguyen
 * Last Updated: 2026-10-03
 */

interface axi5_lite_if #(
  // ==========================================================================
  // Parameters
  // ==========================================================================
  parameter int unsigned ADDR_WIDTH = 32,
  parameter int unsigned DATA_WIDTH = 32,

  parameter int unsigned ID_W_WIDTH = 4,
  parameter int unsigned ID_R_WIDTH = 4,

  parameter int unsigned AW_USER_WIDTH = 0,
  parameter int unsigned W_USER_WIDTH  = 0,
  parameter int unsigned B_USER_WIDTH  = 0,
  parameter int unsigned AR_USER_WIDTH = 0,
  parameter int unsigned R_USER_WIDTH  = 0,

  localparam int unsigned STRB_WIDTH = DATA_WIDTH/8
  ) (
  input logic clk_i, rst_ni
  );
  import axi5_pkg::*;

  // ==========================================================================
  // Type Definitions  
  // ==========================================================================
  typedef logic [ADDR_WIDTH-1:0] addr_t;
  typedef logic [DATA_WIDTH-1:0] data_t;
  typedef logic [STRB_WIDTH-1:0] strb_t;

  typedef logic [ID_W_WIDTH-1:0] wid_t; // write id
  typedef logic [ID_R_WIDTH-1:0] rid_t; // read id

  // Custom user signals
  typedef logic [(AW_USER_WIDTH > 0 ? AW_USER_WIDTH : 1)-1:0] aw_user_t;
  typedef logic [(W_USER_WIDTH  > 0 ? W_USER_WIDTH  : 1)-1:0] w_user_t;
  typedef logic [(B_USER_WIDTH  > 0 ? B_USER_WIDTH  : 1)-1:0] b_user_t;
  typedef logic [(AR_USER_WIDTH > 0 ? AR_USER_WIDTH : 1)-1:0] ar_user_t;
  typedef logic [(R_USER_WIDTH  > 0 ? R_USER_WIDTH  : 1)-1:0] r_user_t;

  // ==========================================================================
  // Signals
  // ==========================================================================
  
  // Write Request Signals
  logic       aw_valid;
  logic       aw_ready;
  addr_t      aw_addr;
  logic [2:0] aw_size;  // number of bytes per transfer (2^aw_size)
  logic [2:0] aw_prot;  // protection attributes
  wid_t       aw_id;
  aw_user_t   aw_user;  // custom user extension on write reqs

  // Write Data Signals
  logic    w_valid;
  logic    w_ready;
  data_t   w_data;
  strb_t   w_strb;  // indicates which data bytes are valid
  w_user_t w_user;  // custom user extension on write data

  // Write Response Signals
  logic    b_valid;
  logic    b_ready;
  bresp_e  b_resp;  // response status 
  wid_t    b_id;
  b_user_t b_user;  // custom user extension on write response

  // Read Request Signals
  logic       ar_valid;
  logic       ar_ready;
  addr_t      ar_addr;
  logic [2:0] ar_size;
  logic [2:0] ar_prot;  // protection attributes
  rid_t       ar_id;
  ar_user_t   ar_user;  // custom user extension on read reqs

  // Read Response Signals
  logic    r_valid;
  logic    r_ready;
  data_t   r_data;
  rresp_e  r_resp;  // response status
  rid_t    r_id;
  r_user_t r_user;  // custom user extension on read data

  // If user signals are not used, tie-down for synthesis opt-out
  if (AW_USER_WIDTH == 0) assign aw_user = '0;
  if (W_USER_WIDTH == 0)  assign w_user  = '0;
  if (B_USER_WIDTH == 0)  assign b_user  = '0;
  if (AR_USER_WIDTH == 0) assign ar_user = '0;
  if (R_USER_WIDTH == 0)  assign r_user  = '0;

  // ==========================================================================
  // Modports
  // ==========================================================================
 
  modport manager (
    output aw_valid,
    input  aw_ready,
    output aw_addr,
    output aw_size,
    output aw_prot,
    output aw_id,
    output aw_user,

    output w_valid,
    input  w_ready,
    output w_data,
    output w_strb,
    output w_user,

    input  b_valid,
    output b_ready,
    input  b_resp,
    input  b_id,
    input  b_user,

    output ar_valid,
    input  ar_ready,
    output ar_addr,
    output ar_size,
    output ar_prot,
    output ar_id,
    output ar_user,

    input  r_valid,
    output r_ready,
    input  r_data,
    input  r_resp,
    input  r_id,
    input  r_user
  );

  modport subordinate (
    input  aw_valid,
    output aw_ready,
    input  aw_addr,
    input  aw_size,
    input  aw_prot,
    input  aw_id,
    input  aw_user,

    input  w_valid,
    output w_ready,
    input  w_data,
    input  w_strb,
    input  w_user,

    output b_valid,
    input  b_ready,
    output b_resp,
    output b_id,
    output b_user,

    input  ar_valid,
    output ar_ready,
    input  ar_addr,
    input  ar_size,
    input  ar_prot,
    input  ar_id,
    input  ar_user,

    output r_valid,
    input  r_ready,
    output r_data,
    output r_resp,
    output r_id,
    output r_user
  );

  modport monitor (
    input aw_valid,
    input aw_ready,
    input aw_addr,
    input aw_size,
    input aw_prot,
    input aw_id,
    input aw_user,

    input w_valid,
    input w_ready,
    input w_data,
    input w_strb,
    input w_user,

    input b_valid,
    input b_ready,
    input b_resp,
    input b_id,
    input b_user,

    input ar_valid,
    input ar_ready,
    input ar_addr,
    input ar_size,
    input ar_prot,
    input ar_id,
    input ar_user,

    input r_valid,
    input r_ready,
    input r_data,
    input r_resp,
    input r_id,
    input r_user
  );

endinterface

