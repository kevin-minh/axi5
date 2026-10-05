# AXI5 Implementation

An AMBA AXI5 IP project in SystemVerilog. Includes parameterized drivers/interfaces for manager and subordinate devices.

## Table of Contents
- [Description](#description)
- [Directory Structure](#directory-structure)
- [Usage](#usage)

## Description
A personal project to help me understand AMBA AXI5 and advanced verification techniques like UVM in SystemVerilog. The only contributor is me (Kevin Nguyen). This project is also intended for use in other projects, such as a GPGPU.

## Directory Structure
```
axi5/
|-- config/
|   `-- env.sh                      # Script for setting the environment variables. Must be run every session to build.
|-- rtl/
|   |-- axi5_pkg.sv                 # Global package for general AXI5 constructs.
|   `-- axi5_lite/                  # Design RTL for AXI5_LITE interface.
|-- scripts/
|   `-- verilator.f                 # Verilator options file list.
|-- tb/
|   |-- tb_pkg.sv                   # Global package for general testbench constructs.
|   `-- axi5_lite_tb/               # Inclusive testbench for AXI5_LITE implementation.
|-- reports/                        # (GENERATED) Parsed reports from design flow (ex. sim.rpt). Remove with 'make clean'.
|-- sim/                            # (GENERATED) Intermediate simulation build files. Remove with 'make clean'.
|-- Makefile
`-- README.md
```

### Interfaces

```
axi5_lite/
|-- axi5_lite.f
|-- axi5_lite_if.sv
|-- axi5_lite_manager.sv
`-- axi5_lite_subordinate.sv
```

### Testbenches
```
axi5_lite_tb/
|-- axi5_lite_tb.f          # Testbench includes file list.
|-- axi5_lite_tb_defines.f  # Testbench parameter definitions for override.
`-- axi5_lite_tb.sv         # Testbench source code.
```

## Usage
The build system expects environment variables set in "config/env.sh".
If the contents look correct, run 'source config/env.sh' to export environment variables. This must be done every session.

For use in other projects.

