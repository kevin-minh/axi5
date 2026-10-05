/*
 * axi5_lite_tb.sv
 * 
 * Author: Kevin Nguyen
 * Last Updated: 2026-10-03
 */

module axi5_lite_tb;
  import axi5_pkg::*;
  import tb_pkg::*;

  // ==========================================================================
  // Parameters
  // ==========================================================================
  `SET_DEFAULT(ADDR_WIDTH, 32)
`ifndef DATA_WIDTH
  `define DATA_WIDTH 32
`endif

`ifndef ID_W_WIDTH
  `define ID_W_WIDTH 4
`endif
`ifndef ID_R_WIDTH
  `define ID_R_WIDTH 4
`endif

`ifndef USER_REQ_WIDTH
  `define USER_REQ_WIDTH 0
`endif
`ifndef USER_DATA_WIDTH
  `define USER_DATA_WIDTH 0
`endif
`ifndef USER_RESP_WIDTH
  `define USER_RESP_WIDTH 0
`endif

  typedef logic [`ADDR_WIDTH-1:0]      addr_t;
  typedef logic [`DATA_WIDTH-1:0]      data_t;
  typedef logic [`DATA_WIDTH/8-1:0]    strb_t;
  typedef logic [`ID_W_WIDTH-1:0]      wid_t;
  typedef logic [`ID_R_WIDTH-1:0]      rid_t;
  typedef logic [`USER_REQ_WIDTH-1:0]  user_req_t;
  typedef logic [`USER_DATA_WIDTH-1:0] user_data_t;
  typedef logic [`USER_RESP_WIDTH-1:0] user_resp_t;

  // ==========================================================================
  // Signals
  // ==========================================================================
  logic clk_i, rst_ni;
  always begin
    #1 clk_i = !clk_i;
  end

  // Write Request Signals
  logic       aw_valid;
  logic       aw_ready;
  addr_t      aw_addr;
  logic [2:0] aw_size;  // number of bytes per transfer (2^aw_size)
  logic [2:0] aw_prot;  // protection attributes
  wid_t       aw_id;
  user_req_t  aw_user;  // custom user extension on write reqs

  // Write Data Signals
  logic       w_valid;
  logic       w_ready;
  data_t      w_data;
  strb_t      w_strb; // indicates which data bytes are valid
  user_data_t w_user; // custom user extension on write data transfers

  // Write Response Signals
  logic       b_valid;
  logic       b_ready;
  bresp_e     b_resp;  // response status 
  wid_t       b_id;
  user_resp_t b_user;  // custom user extension on write response

  // Read Request Signals
  logic       ar_valid;
  logic       ar_ready;
  addr_t      ar_addr;
  logic [2:0] ar_size;
  logic [2:0] ar_prot;  // protection attributes
  rid_t       ar_id;
  user_req_t  ar_user;  // custom user extension on read request

  // Read Response Signals
  logic       r_valid;
  logic       r_ready;
  data_t      r_data;
  rresp_e     r_resp;  // response status
  rid_t       r_id;
  user_resp_t r_user;  // custom user extension on read response

  // ==========================================================================
  // Instantiations
  // ==========================================================================
  axi5_lite_if #(
    .ADDR_WIDTH(`ADDR_WIDTH),
    .DATA_WIDTH(`DATA_WIDTH),
    .ID_W_WIDTH(`ID_W_WIDTH),
    .ID_R_WIDTH(`ID_R_WIDTH),
    .USER_REQ_WIDTH(`USER_REQ_WIDTH),
    .USER_DATA_WIDTH(`USER_DATA_WIDTH),
    .USER_RESP_WIDTH(`USER_RESP_WIDTH)
  ) ifut (.*);

  // ==========================================================================
  // Tasks
  // ==========================================================================
  task automatic init_sim;
    clk_i = 1'b0;
    rst_ni = 1'b0;
    @(negedge clk_i);
  endtask

  task automatic reset_dut;
    @(negedge clk_i);
    rst_ni = 1'b0;
    @(negedge clk_i);
    rst_ni = 1'b1;
    @(negedge clk_i);
    $display("Reset DUT.");
  endtask

  // ==========================================================================
  // Test Sequence
  // ==========================================================================
  initial begin
    init_sim();
    reset_dut();

    repeat(10) @(negedge clk_i);
    $finish;
  end

endmodule

