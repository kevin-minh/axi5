/*
 * axi5_pkg.sv
 *
 * Author: Kevin Nguyen
 * Last Updated: 2026-10-03
 */

package axi5_pkg;

  // ==========================================================================
  // Structs and Enums
  // ==========================================================================

  // See A3.3.1
  typedef enum logic [2:0] {
    B_OKAY        = 3'b000,
    B_EXOKAY      = 3'b001,
    B_SLVERR      = 3'b010,
    B_DECERR      = 3'b011,
    B_DEFER       = 3'b100,
    B_TRANSFAULT  = 3'b101,
    B_RESERVED    = 3'b110,
    B_UNSUPPORTED = 3'b111
  } bresp_e;

  // See A3.3.2
  typedef enum logic [2:0] {
    R_OKAY       = 3'b000,
    R_EXOKAY     = 3'b001,
    R_SLVERR     = 3'b010,
    R_DECERR     = 3'b011,
    R_PREFETCHED = 3'b100,
    R_TRANSFAULT = 3'b101,
    R_OKAYDIRTY  = 3'b110,
    R_RESERVED   = 3'b111
  } rresp_e;

endpackage

