# =============================================================================
# Top-Level Project Makefile
# =============================================================================
ENV_FILE := config/env.sh
ifndef PROJECT_ROOT
$(error Environment variables not set. Please run 'source $(ENV_FILE)' before running make commands.)
endif

.ONESHELL:

.PHONY: help
.DEFAULT_GOAL: help
help:
	@clear
	@echo "================================================================================"
	@echo "  Project Build System"
	@echo "================================================================================"
	@echo "Usage: make [target] [OPTION=value]"
	@echo ""
	@echo "Available targets:"
	@awk '/^## / {desc=substr($$0, 4)} /^[a-zA-Z0-9_%.-]+:/ {if (desc) {printf "  \033[36m%-15s\033[0m %s\n", $$1, desc; desc=""}}' $(firstword $(MAKEFILE_LIST)) | sed 's/://'
	@echo "================================================================================"

.PHONY: FORCE
FORCE:

# =============================================================================
# RTL Design and Verification
# =============================================================================

## Run RTL simulations
%.sim: FORCE
	@mkdir -p $(SIM_DIR)/$*
	@mkdir -p $(REPORT_DIR)/$*
	@$(SIM) -f $(SIM_FLAGS) --Mdir $(SIM_DIR)/$* -f $(TB_DIR)/$*.f > $(SIM_DIR)/$*/$(SIM).log
	@$(SIM_DIR)/$*/V$* > $(REPORT_DIR)/$*/$(SIM).log

# =============================================================================
# Cleanup
# =============================================================================

.PHONY: clean nuke

## Delete RTL simulation build directories and reports
clean:
	@rm -rf $(SIM_DIR)
	@rm -rf $(REPORT_DIR)

## Delete synthesis outputs
clean_synth: 
	@rm -rf $(SYNTH_DIR)

## Delete APR outputs
clean_apr: 
	@rm -rf $(APR_DIR)
