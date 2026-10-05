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
  `SET_DEFAULT(DATA_WIDTH, 32)

  `SET_DEFAULT(ID_W_WIDTH, 4)
  `SET_DEFAULT(ID_R_WIDTH, 4)

  `SET_DEFAULT(AW_USER_WIDTH, 0)
  `SET_DEFAULT(W_USER_WIDTH,  0)
  `SET_DEFAULT(B_USER_WIDTH,  0)
  `SET_DEFAULT(AR_USER_WIDTH, 0)
  `SET_DEFAULT(R_USER_WIDTH,  0)

  typedef logic [`ADDR_WIDTH-1:0]      addr_t;
  typedef logic [`DATA_WIDTH-1:0]      data_t;
  typedef logic [`DATA_WIDTH/8-1:0]    strb_t;
  typedef logic [`ID_W_WIDTH-1:0]      wid_t;
  typedef logic [`ID_R_WIDTH-1:0]      rid_t;
  typedef logic [(`AW_USER_WIDTH > 0 ? `AW_USER_WIDTH : 1)-1:0] aw_user_t;
  typedef logic [(`W_USER_WIDTH  > 0 ? `W_USER_WIDTH  : 1)-1:0] w_user_t;
  typedef logic [(`B_USER_WIDTH  > 0 ? `B_USER_WIDTH  : 1)-1:0] b_user_t;
  typedef logic [(`AR_USER_WIDTH > 0 ? `AR_USER_WIDTH : 1)-1:0] ar_user_t;
  typedef logic [(`R_USER_WIDTH  > 0 ? `R_USER_WIDTH  : 1)-1:0] r_user_t;

  // ==========================================================================
  // Signals
  // ==========================================================================
  logic clk, rst_n;
  always begin
    #1 clk = !clk;
  end

  // ==========================================================================
  // Instantiations
  // ==========================================================================
  axi5_lite_if #(
    .ADDR_WIDTH    (`ADDR_WIDTH),
    .DATA_WIDTH    (`DATA_WIDTH),
    .ID_W_WIDTH    (`ID_W_WIDTH),
    .ID_R_WIDTH    (`ID_R_WIDTH),
    .AW_USER_WIDTH (`AW_USER_WIDTH),
    .W_USER_WIDTH  (`W_USER_WIDTH),
    .B_USER_WIDTH  (`B_USER_WIDTH),
    .AR_USER_WIDTH (`AR_USER_WIDTH),
    .R_USER_WIDTH  (`R_USER_WIDTH)
  ) ifut (
    .clk_i  (clk),
    .rst_ni (rst_n)
  );

  // ==========================================================================
  // Tasks
  // ==========================================================================
  task automatic init_sim;
    clk = 1'b0;
    rst_n = 1'b0;
    @(negedge clk);
    $display("Init sim.");
  endtask

  task automatic reset_dut;
    @(negedge clk);
    rst_n = 1'b0;
    @(negedge clk);
    rst_n = 1'b1;
    @(negedge clk);
    $display("Reset DUT.");
  endtask

  task automatic master_w_req();

  endtask

  // ==========================================================================
  // Test Sequence
  // ==========================================================================
  initial begin
    init_sim();
    reset_dut();

    repeat(10) @(negedge clk);
    $finish;
  end

endmodule

