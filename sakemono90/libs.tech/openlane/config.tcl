# PDK Configuration for Sakemono 90nm Process - Production Ready
# OpenLane compatible PDK configuration with comprehensive 90nm parameters

# Process identification
set ::env(PDK) "sakemono90"
set ::env(STD_CELL_LIBRARY) "sakemono90_fd_sc_hd"
set ::env(PROCESS) 90

# Technology files and layers
set ::env(TECH_LEF) "$::env(PDK_ROOT)/sakemono90/libs.ref/techlef/sakemono90.tlef"
set ::env(CELLS_LEF) [glob "$::env(PDK_ROOT)/sakemono90/libs.ref/lef/*.lef"]

# Liberty timing files for all corners
set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/sakemono90/libs.ref/lib/sakemono90_fd_sc_hd__tt_025C_1v80.lib"
set ::env(LIB_FASTEST) "$::env(PDK_ROOT)/sakemono90/libs.ref/lib/sakemono90_fd_sc_hd__ff_n40C_1v95.lib"
set ::env(LIB_SLOWEST) "$::env(PDK_ROOT)/sakemono90/libs.ref/lib/sakemono90_fd_sc_hd__ss_100C_1v62.lib"
set ::env(LIB_TYPICAL) "$::env(PDK_ROOT)/sakemono90/libs.ref/lib/sakemono90_fd_sc_hd__tt_025C_1v80.lib"

# Additional corners for comprehensive analysis
set ::env(LIB_SYNTH_COMPLETE) [glob "$::env(PDK_ROOT)/sakemono90/libs.ref/lib/sakemono90_fd_sc_hd*.lib"]

# Metal layer stack definition
set ::env(TECH_METAL_LAYERS) 6
set ::env(TECH_VIA_LAYERS) 5

# Process voltages and operating conditions
set ::env(VDD_PIN) "VPWR"
set ::env(GND_PIN) "VGND"
set ::env(VDD_NET) "VDD"
set ::env(GND_NET) "VSS"
set ::env(IO_HIGH_VOLTAGE) 1.8
set ::env(IO_LOW_VOLTAGE) 0.0

# Supply voltage corners for 90nm
set ::env(VOLTAGE_TYPICAL) 1.80
set ::env(VOLTAGE_FAST) 1.95
set ::env(VOLTAGE_SLOW) 1.62

# Temperature corners
set ::env(TEMPERATURE_TYPICAL) 25
set ::env(TEMPERATURE_FAST) -40
set ::env(TEMPERATURE_SLOW) 125

# Manufacturing and placement grid
set ::env(MANUFACTURING_GRID) 0.005  
set ::env(PLACEMENT_GRID_X) 0.17
set ::env(PLACEMENT_GRID_Y) 2.72

# Standard cell specifications (16-track library)
set ::env(CELL_HEIGHT) 2.72
set ::env(CELL_HEIGHT_TRACKS) 16
set ::env(POWER_RAIL_TRACKS) 4      # VDD + VSS rails (2 tracks each)
set ::env(SIGNAL_TRACKS) 12         # Available for signal routing

# Design rule specifications for 90nm process
set ::env(FP_CORE_UTIL) 55          # Optimized for 16-track cells
set ::env(PL_TARGET_DENSITY) 0.65   # High density achievable
set ::env(CELL_PAD) 2               # Minimal padding for tight layout

# Performance targets (based on FO4 measurements)
set ::env(FO4_DELAY_TT) 45          # ps - Fan-out 4 delay typical
set ::env(FO4_DELAY_FF) 35          # ps - Fan-out 4 delay fast
set ::env(FO4_DELAY_SS) 70          # ps - Fan-out 4 delay slow

# Maximum sustainable clock frequencies
set ::env(MAX_CLK_FREQ_TT) 1.5      # GHz - Typical corner
set ::env(MAX_CLK_FREQ_FF) 2.0      # GHz - Fast corner  
set ::env(MAX_CLK_FREQ_SS) 1.0      # GHz - Slow corner

# Leakage specifications (nA/µm at different temperatures)
set ::env(LEAKAGE_NMOS_25C) 100     # nA/µm
set ::env(LEAKAGE_PMOS_25C) 50      # nA/µm
set ::env(LEAKAGE_NMOS_125C) 1000   # nA/µm
set ::env(LEAKAGE_PMOS_125C) 500    # nA/µm

# Metal layer design rules and properties
set ::env(TECH_LEF_MIN_WIDTH) {
    li1  0.085
    met1 0.14
    met2 0.14  
    met3 0.14
    met4 0.28
    met5 0.28
    met6 0.28
}

set ::env(TECH_LEF_MIN_SPACING) {
    li1  0.085
    met1 0.14
    met2 0.14
    met3 0.14
    met4 0.28
    met5 0.28
    met6 0.28
}

set ::env(TECH_LEF_PITCHES) {
    li1  0.17
    met1 0.17
    met2 0.19
    met3 0.19
    met4 0.28
    met5 0.28
    met6 0.28
}

# Via specifications
set ::env(TECH_LEF_VIAS) {
    via1 via2 via3 via4 via5 via6
}

set ::env(VIA_SIZES) {
    via1 0.11
    via2 0.11
    via3 0.11
    via4 0.16
    via5 0.16
    via6 0.16
}

# Electromigration current limits
set ::env(EM_THIN_METAL_LIMIT) 2.0  # mA/µm for met1-met3
set ::env(EM_THICK_METAL_LIMIT) 5.0 # mA/µm for met4-met6
set ::env(EM_VIA_LIMIT) 1.5         # mA/via

# Reliability specifications
set ::env(ESD_HBM_TARGET) 2000      # V - Human Body Model
set ::env(ESD_MM_TARGET) 200        # V - Machine Model
set ::env(ESD_CDM_TARGET) 750       # V - Charged Device Model

# Overlay and alignment tolerances  
set ::env(OVERLAY_CRITICAL) 0.025   # µm - Critical layer alignment
set ::env(OVERLAY_NON_CRITICAL) 0.035 # µm - Non-critical alignment
set ::env(REGISTRATION_TOL) 0.020   # µm - Layer registration

# Clock tree synthesis with 90nm optimized buffers
set ::env(CTS_CLK_BUFFER_LIST) "sakemono90_fd_sc_hd__clkbuf_1 sakemono90_fd_sc_hd__clkbuf_2 sakemono90_fd_sc_hd__clkbuf_4 sakemono90_fd_sc_hd__clkbuf_8"
set ::env(CTS_ROOT_BUFFER) "sakemono90_fd_sc_hd__clkbuf_16"
set ::env(CTS_CLK_GATE_CELL) "sakemono90_fd_sc_hd__dlclkp_1"

# Fill and decap cells for 90nm
set ::env(FILL_CELL) "sakemono90_fd_sc_hd__fill_1 sakemono90_fd_sc_hd__fill_2 sakemono90_fd_sc_hd__fill_4 sakemono90_fd_sc_hd__fill_8"
set ::env(DECAP_CELL) "sakemono90_fd_sc_hd__decap_3 sakemono90_fd_sc_hd__decap_4 sakemono90_fd_sc_hd__decap_6 sakemono90_fd_sc_hd__decap_8 sakemono90_fd_sc_hd__decap_12"

# Tap and endcap cells
set ::env(FP_WELLTAP_CELL) "sakemono90_fd_sc_hd__tapvpwrvgnd_1"
set ::env(FP_ENDCAP_CELL) "sakemono90_fd_sc_hd__decap_3"

# Antenna rules for 90nm process
set ::env(USE_ARC_ANTENNA_CHECK) 1
set ::env(GRT_ANT_ITERS) 15
set ::env(GRT_ANT_MARGIN) 10
set ::env(DIODE_CELL) "sakemono90_fd_sc_hd__diode_2"
set ::env(DIODE_CELL_PIN) "DIODE"

# Antenna accumulation ratios by metal layer
set ::env(ANTENNA_METAL_RATIOS) {
    met1 400
    met2 400
    met3 800
    met4 1600
    met5 1600
    met6 3200
}

# DRC and verification settings
set ::env(MAGIC_DRC_USE_GDS) 1
set ::env(RUN_KLAYOUT_DRC) 1
set ::env(RUN_KLAYOUT_XOR) 1
set ::env(DRC_EXCLUDE_CELL_LIST) "$::env(PDK_ROOT)/sakemono90/libs.tech/openlane/sakemono90_fd_sc_hd/drc_exclude.cells"

# Routing configuration for 6-metal stack
set ::env(RT_MAX_LAYER) 6
set ::env(RT_MIN_LAYER) 1
set ::env(GLB_RT_MINLAYER) 1  
set ::env(GLB_RT_MAXLAYER) 6
set ::env(GLB_RT_ALLOW_CONGESTION) 0

# Layer-specific routing preferences
set ::env(GLB_RT_L1_ADJUSTMENT) 0.5   # Reduce met1 usage (local)
set ::env(GLB_RT_L2_ADJUSTMENT) 0.8   # Prefer met2 for short routes
set ::env(GLB_RT_L3_ADJUSTMENT) 1.0   # Balanced met3 usage
set ::env(GLB_RT_L4_ADJUSTMENT) 1.2   # Prefer met4 for power
set ::env(GLB_RT_L5_ADJUSTMENT) 1.2   # Prefer met5 for power
set ::env(GLB_RT_L6_ADJUSTMENT) 1.5   # Prefer met6 for global signals

# Default die area and floorplanning
set ::env(DIE_AREA) "0 0 100 100"
set ::env(FP_SIZING) "absolute" 
set ::env(FP_IO_VLAYER) "met4"        # Thick metal for IO
set ::env(FP_IO_HLAYER) "met3"        # Intermediate for IO

# Clock specifications
set ::env(CLOCK_PERIOD) 10.0          # Default 100MHz (adjustable per design)
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_TREE_SYNTH) 1

# Synthesis optimization settings  
set ::env(SYNTH_DRIVING_CELL) "sakemono90_fd_sc_hd__inv_2"
set ::env(SYNTH_DRIVING_CELL_PIN) "Y"
set ::env(SYNTH_CAP_LOAD) 17.65       # fF - Typical input cap
set ::env(OUTPUT_CAP_LOAD) 17.65      # fF - Output load

set ::env(SYNTH_MAX_FANOUT) 5         # Conservative for 90nm
set ::env(SYNTH_SIZING) 1
set ::env(SYNTH_BUFFERING) 1

# Buffer cells for optimization
set ::env(SYNTH_BUF_LIST) "sakemono90_fd_sc_hd__buf_1 sakemono90_fd_sc_hd__buf_2 sakemono90_fd_sc_hd__buf_4 sakemono90_fd_sc_hd__buf_8"

# Tie cells for unused pins
set ::env(SYNTH_TIELO_CELL) "sakemono90_fd_sc_hd__conb_1"
set ::env(SYNTH_TIEHI_CELL) "sakemono90_fd_sc_hd__conb_1"
set ::env(SYNTH_TIELO_PIN) "LO"
set ::env(SYNTH_TIEHI_PIN) "HI"

# Default flip-flop for sequential synthesis
set ::env(SYNTH_LATCH_FLOP) "sakemono90_fd_sc_hd__dfrtp_1"
set ::env(SYNTH_TRISTATE_BUFFER) "sakemono90_fd_sc_hd__ebufn_1"

# Power analysis and extraction
set ::env(RUN_SPEF_EXTRACTION) 1
set ::env(SPEF_WIRE_MODEL) "L"        # Lumped model for 90nm
set ::env(SPEF_EDGE_CAP_FACTOR) 1.0

# Technology files for various tools
set ::env(MAGIC_TECH_FILE) "$::env(PDK_ROOT)/sakemono90/libs.tech/magic/sakemono90.tech"
set ::env(NETGEN_SETUP_FILE) "$::env(PDK_ROOT)/sakemono90/libs.tech/netgen/sakemono90_setup.tcl"
set ::env(KLAYOUT_TECH_FILE) "$::env(PDK_ROOT)/sakemono90/libs.tech/klayout/sakemono90.lyt"
set ::env(KLAYOUT_PROPERTIES_FILE) "$::env(PDK_ROOT)/sakemono90/libs.tech/klayout/sakemono90.lyp"

# Track information file
set ::env(TRACKS_INFO_FILE) "$::env(PDK_ROOT)/sakemono90/libs.tech/openlane/sakemono90_fd_sc_hd/tracks.info"

# Density and fill requirements
set ::env(FILL_INSERTION) 1
set ::env(METAL_FILL_LAYER_MIN) 1
set ::env(METAL_FILL_LAYER_MAX) 6

# Density targets for each metal layer
set ::env(DENSITY_TARGET) {
    met1 0.55
    met2 0.55  
    met3 0.55
    met4 0.65
    met5 0.65
    met6 0.65
}

# Technology LEF max layer definition  
set ::env(TECH_LEF_MAX_LAYER) met6

# End of PDK configuration