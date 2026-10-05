/*
 * axi5_lite_subordinate.sv
 *
 * Author: Kevin Nguyen
 * Last Updated: 2026-10-03
 */

module axi5_lite_subordinate #(
  parameter int unsigned ADDR_WIDTH = 32,
  parameter int unsigned DATA_WIDTH = 32
) (
  input clk_i, rst_ni
);
  import axi5_pkg::*;

endmodule

