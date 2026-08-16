/*
 * File:         rdy_vld_if.sv
 * Author:       Kevin Nguyen
 * Date Created: 2026-7-4
 */

/* Interface: rdy_vld_if
 * 
 * An interface to facilitate ready-valid transport as described in the AMBA-AXI5 specifications.
 *
 * Parameters:
 *
 *   DATA_WIDTH - number of data bits in transport
 *
 * Ports:
 * 
 *   clk_i  - global clock input
 *   rst_ni - global reset input active low
 */
interface rdy_vld_if #(
  parameter DATA_WIDTH = 32
) (
  input logic clk_i, 
  input logic rst_ni
);
  // ===============================================================================================
  // Section: Signals
  // ===============================================================================================
  logic                  valid;
  logic                  ready;
  logic [DATA_WIDTH-1:0] data;

  // =============================================================================================
  // Section: Modports
  // =============================================================================================
  modport tx (
    input  ready,
    output valid,
    output data
  );

  modport rx (
    input  valid,
    input  data,
    output ready
  );

  // =============================================================================================
  // Section: Functions
  // =============================================================================================
  function automatic is_transporting();
    return ready && valid;
  endfunction : is_transporting

`ifndef SYNTHESIS
    task automatic transmit(input logic [DATA_WIDTH-1:0] tx_data);
      
    endtask : transmit
`endif

endinterface : rdy_vld_if
