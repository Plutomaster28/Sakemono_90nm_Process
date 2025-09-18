# OpenLane Configuration for Sakemono 90nm PDK Test Design
# Counter design to validate the PDK functionality

set ::env(DESIGN_NAME) "counter"

# ========================================
# PDK Configuration - Using Sakemono 90nm
# ========================================
# PDK and SCL are specified via command line flags
# --pdk sakemono90 --scl sakemono90_fd_sc_hd --manual-pdk

# ========================================
# Design Files
# ========================================
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# ========================================
# Clock Configuration
# ========================================
set ::env(CLOCK_PERIOD) "10.0"      ; # 100MHz target
set ::env(CLOCK_PORT) "clk"

# ========================================
# Floorplan Configuration
# ========================================
set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 200 200"     ; # Small test die (200x200 um)
set ::env(FP_CORE_UTIL) 40            ; # Conservative utilization

# Core area margins
set ::env(FP_CORE_MARGIN) 10

# ========================================
# Placement Configuration  
# ========================================
set ::env(PL_TARGET_DENSITY) 0.35     ; # Conservative for first test
set ::env(PL_BASIC_PLACEMENT) 1
set ::env(PL_SKIP_INITIAL_PLACEMENT) 0

# ========================================
# Synthesis Configuration
# ========================================
set ::env(SYNTH_STRATEGY) "AREA 0"
set ::env(SYNTH_BUFFERING) 1
set ::env(SYNTH_SIZING) 1
set ::env(SYNTH_SPLITNETS) 0
set ::env(SYNTH_MAX_FANOUT) 5

# ========================================
# Routing Configuration
# ========================================
set ::env(ROUTING_STRATEGY) 0
set ::env(RT_MAX_LAYER) {met6}

# ========================================
# DRC & LVS Configuration
# ========================================
set ::env(RUN_MAGIC_DRC) 1
set ::env(RUN_LVS) 1
set ::env(RUN_ANTENNA_CHECK) 1

# ========================================
# Pin Configuration
# ========================================
set ::env(FP_PIN_ORDER_CFG) $::env(DESIGN_DIR)/pin_order.cfg

# ========================================
# Power Configuration
# ========================================
set ::env(VDD_NETS) [list {VDD}]
set ::env(GND_NETS) [list {VSS}]

# Power ring configuration
set ::env(FP_PDN_CORE_RING) 1
set ::env(FP_PDN_ENABLE_RAILS) 1

# ========================================
# Magic Configuration
# ========================================
set ::env(MAGIC_ZEROIZE_ORIGIN) 0
set ::env(MAGIC_WRITE_FULL_LEF) 1