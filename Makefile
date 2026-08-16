# Check if VERILATOR_ROOT is the environment, else assume in PATH
ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
VERILATOR_COVERAGE = verilator_coverage
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
VERILATOR_COVERAGE = $(VERILATOR_ROOT)/bin/verilator_coverage
endif

VERILATOR_FLAGS = -f $(SCRIPTS_DIR)/verilator.f --Mdir $(SIM_DIR) -y $(SRC_DIR)

SRC_DIR = src
TEST_DIR = tb
SCRIPTS_DIR = scripts

REPORT_DIR = reports
SIM_DIR = sim

TOP_FILE = axi.sv

SRCS := $(wildcard $(SRC_DIR)/*.sv)
TBS := $(wildcard $(TEST_DIR)/*.sv)

.DEFAULT_GOAL := help
help:
	@echo "Usage: make [target]"
	@echo 
	@echo "Targets:"
	@awk '/^[a-zA-Z_-]+:$$/{flag=1; next} /^[a-zA-Z_-]+:.*##/{sub(".*##", ""); printf "  %-20s%s\n",$$1,$$2; next} flag' Makefile | grep -v '#'@echo 

%.sim:
	@echo
	VERILATOR --binary $(VERILATOR_FLAGS) $(TEST_DIR)/$*.sv -o out
	@echo
	mkdir -p $(REPORT_DIR)
	$(SIM_DIR)/out > $(REPORT_DIR)/$*.sim.out

.PHONY: sim
sim:
	make axi.sim

%.lint: 
	@echo
	VERILATOR --lint-only $(VERILATOR_FLAGS) $(SRC_DIR)/$(TOP_FILE)
	@echo

clean:
	rm -rf $(SIM_DIR)
	rm -rf $(REPORT_DIR)