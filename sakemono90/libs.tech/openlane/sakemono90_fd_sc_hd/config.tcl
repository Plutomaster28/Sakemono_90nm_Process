# Standard Cell Library Configuration for Sakemono 90nm High Density
# This file contains library-specific configuration that overrides PDK defaults

# Library identification
set ::env(STD_CELL_LIBRARY) "sakemono90_fd_sc_hd"
set ::env(STD_CELL_LIBRARY_CDL) "sakemono90_fd_sc_hd"

# Library-specific LEF files
set ::env(CELLS_LEF) [glob "$::env(PDK_ROOT)/sakemono90/libs.ref/lef/sakemono90_fd_sc_hd*.lef"]

# Liberty files for different corners
set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/sakemono90/libs.ref/lib/sakemono90_fd_sc_hd__tt_025C_1v80.lib"
set ::env(LIB_SLOWEST) "$::env(PDK_ROOT)/sakemono90/libs.ref/lib/sakemono90_fd_sc_hd__ss_100C_1v62.lib"
set ::env(LIB_FASTEST) "$::env(PDK_ROOT)/sakemono90/libs.ref/lib/sakemono90_fd_sc_hd__ff_n40C_1v95.lib"
set ::env(LIB_TYPICAL) "$::env(PDK_ROOT)/sakemono90/libs.ref/lib/sakemono90_fd_sc_hd__tt_025C_1v80.lib"

# Additional corner files for more comprehensive analysis
set ::env(LIB_SYNTH_COMPLETE) [glob "$::env(PDK_ROOT)/sakemono90/libs.ref/lib/sakemono90_fd_sc_hd*.lib"]

# Standard cell height for high density library (typical 90nm)
set ::env(CELL_HEIGHT) 2.72

# Track information file
set ::env(TRACKS_INFO_FILE) "$::env(PDK_ROOT)/sakemono90/libs.tech/openlane/sakemono90_fd_sc_hd/tracks.info"

# DRC and synthesis exclusion files
set ::env(DRC_EXCLUDE_CELL_LIST) "$::env(PDK_ROOT)/sakemono90/libs.tech/openlane/sakemono90_fd_sc_hd/drc_exclude.cells"
set ::env(NO_SYNTH_CELL_LIST) "$::env(PDK_ROOT)/sakemono90/libs.tech/openlane/sakemono90_fd_sc_hd/no_synth.cells"

# Optimization specific to high density library
set ::env(PL_TARGET_DENSITY) 0.65
set ::env(FP_CORE_UTIL) 55

# Buffer cells optimized for high density
set ::env(CTS_CLK_BUFFER_LIST) "sakemono90_fd_sc_hd__clkbuf_1 sakemono90_fd_sc_hd__clkbuf_2 sakemono90_fd_sc_hd__clkbuf_4"
set ::env(CTS_ROOT_BUFFER) "sakemono90_fd_sc_hd__clkbuf_8"

# Fill and decap cells for this library
set ::env(FILL_CELL) "sakemono90_fd_sc_hd__fill_1 sakemono90_fd_sc_hd__fill_2 sakemono90_fd_sc_hd__fill_4 sakemono90_fd_sc_hd__fill_8"
set ::env(DECAP_CELL) "sakemono90_fd_sc_hd__decap_3 sakemono90_fd_sc_hd__decap_4 sakemono90_fd_sc_hd__decap_6 sakemono90_fd_sc_hd__decap_8"

# Tap and endcap cells
set ::env(FP_WELLTAP_CELL) "sakemono90_fd_sc_hd__tapvpwrvgnd_1"
set ::env(FP_ENDCAP_CELL) "sakemono90_fd_sc_hd__decap_3"

# Synthesis optimization
set ::env(SYNTH_DRIVING_CELL) "sakemono90_fd_sc_hd__inv_2"
set ::env(SYNTH_DRIVING_CELL_PIN) "Y"

# Maximum fanout for high density design
set ::env(SYNTH_MAX_FANOUT) 5

# Tie cells for unused pins
set ::env(SYNTH_TIELO_CELL) "sakemono90_fd_sc_hd__conb_1"
set ::env(SYNTH_TIEHI_CELL) "sakemono90_fd_sc_hd__conb_1"
set ::env(SYNTH_TIELO_PIN) "LO"
set ::env(SYNTH_TIEHI_PIN) "HI"

# Default antenna diode
set ::env(DIODE_CELL) "sakemono90_fd_sc_hd__diode_2"
set ::env(DIODE_CELL_PIN) "DIODE"

# Clock gating cell
set ::env(CTS_CLK_GATE_CELL) "sakemono90_fd_sc_hd__dlclkp_1"

# Power pins
set ::env(VDD_PIN) "VPWR"
set ::env(GND_PIN) "VGND"

# Cell padding for high density
set ::env(CELL_PAD) 2

# Library-specific routing tracks
set ::env(FP_IO_VLAYER) "met3"
set ::env(FP_IO_HLAYER) "met2"