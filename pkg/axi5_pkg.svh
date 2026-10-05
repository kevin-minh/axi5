/*
 * axi_pkg.svh
 *
 * Author: Kevin Nguyen
 * Last Updated: 2026-10-03
 */

package aki_pkg;
  // ==========================================================================
  // Properties (See B2.4)
  // ==========================================================================
  ADDR_WIDTH            = 32; // 1..64
  BRESP_WIDTH           = 0;  // 0, 2, 3
  CACHE_LINE_SIZE       = 16; // 16, 32, 64, 128, 256, 512, 1024, 2048
  DATA_WIDTH            = 32; // 8, 16, 32, 64, 128, 256, 512, 1024
  ID_W_WIDTH            = 4;  // 0..32
  ID_R_WIDTH            = 4;  // 0..32
  MAX_TRANSACTION_BYTES = 64; // 64, 128, 256, 512, 1024, 2048, 4096
  RRESP_WIDTH           = 0;  // 0, 2, 3

  USER_DATA_WIDTH       = 0;  // 0..DATA_WIDTH/2
  USER_REQ_WIDTH        = 0;  // 1..128
  USER_RESP_WIDTH       = 0;  // 0..16
  
  // ==========================================================================
  // Structs and Enums
  // ==========================================================================
  typedef logic [ADDR_WIDTH-1:0] addr_t;
  typedef logic [DATA_WIDTH-1:0] data_t;
  typedef logic [ID_W_WIDTH-1:0] wid_t;
  typedef logic [ID_R_WIDTH-1:0] rid_t;

  // See A3.3.1
  typedef enum logic [2:0] {
    OKAY        = 3'b000,
    EXOKAY      = 3'b001,
    SLVERR      = 3'b010,
    DECERR      = 3'b011,
    DEFER       = 3'b100,
    TRANSFAULT  = 3'b101,
    RESERVED    = 3'b110,
    UNSUPPORTED = 3'b111
  } bresp_e;

  // See A3.3.2
  typedef enum logic [2:0] {
    OKAY       = 3'b000,
    EXOKAY     = 3'b001,
    SLVERR     = 3'b010,
    DECERR     = 3'b011,
    PREFETCHED = 3'b100,
    TRANSFAULT = 3'b101,
    OKAYDIRTY  = 3'b110,
    RESERVED   = 3'b111
  } rresp_e;


endpackage

