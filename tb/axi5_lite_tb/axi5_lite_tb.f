// ============================================================================
// Includes File List
// ============================================================================

-f $(RTL_DIR)/axi5_lite/axi5_lite.f

$(TB_DIR)/tb_pkg.sv
$(TB_DIR)/axi5_lite_tb/axi5_lite_tb_defines.f
$(TB_DIR)/axi5_lite_tb/axi5_lite_tb.sv

--top-module axi5_lite_tb
