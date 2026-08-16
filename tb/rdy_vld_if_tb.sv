/*
 * Author: Kevin Nguyen
 * Date Created: 2026-7-4
 */

module rdy_vld_if_tb;
  // Interconnect Instantiations
  logic clk_i, rst_ni;
  logic rdy, vld;
  logic [31:0] data;

  // Clock Gen
  always #1 clk_i = !clk_i;

  // DUT Instantiation
  rdy_vld_if #(
    .DATA_WIDTH (32)
  ) dut (
    .clk_i  (clk_i),
    .rst_ni (rst_ni),
    .ready  (rdy),
    .valid  (vld),
    .data   (data)
  );

  // Main TB Tasks
  task automatic init_sim();
    clk_i  = 1'b0;
    rst_ni = 1'b0;
    rdy    = 1'b0;
    vld    = 1'b0;
    data   = '0;
    @(posedge clk_i);
  endtask // init_sim

  task automatic reset_dut();
    rst_ni = 1'b0;
    @(negedge clk_i);
    rst_ni = 1'b1;
    @(negedge clk_i);
  endtask // reset_dut

  initial begin
    init_sim();
    reset_dut();

    @(posedge clk_i);
    $finish;
  end

endmodule // rdy_vld_if_tb
