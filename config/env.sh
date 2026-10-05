#!/bin/bash

# =============================================================================
# Project Environment Setup
# =============================================================================

# =============================================================================
# Project Directory Structure
# =============================================================================
export PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
export RTL_DIR="${PROJECT_ROOT}/rtl"
export TB_DIR="${PROJECT_ROOT}/tb"
export SCRIPTS_DIR="${PROJECT_ROOT}/scripts"

export SIM_DIR="${PROJECT_ROOT}/sim"
export SYNTH_DIR="${PROJECT_ROOT}/synth"
export APR_DIR="${PROJECT_ROOT}/apr"
export REPORT_DIR="${PROJECT_ROOT}/reports"

# =============================================================================
# Simulator Setup
# =============================================================================
export SIM="verilator"
export SIM_FLAGS="${SCRIPTS_DIR}/verilator.f"

echo "[+] Project Environment Initialized!"
echo "    - Root: ${PROJECT_ROOT}"
echo "    - Sim:  ${SIM}"
