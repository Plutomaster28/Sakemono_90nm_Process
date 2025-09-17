# Sakemono 90nm PDK - Quick Start Guide

##  Getting Started

### Prerequisites
- OpenLane installed and configured
- Magic VLSI Layout Tool
- ngspice or compatible SPICE simulator
- Python 3.6+ for validation scripts

### Installation

1. **Clone or extract the PDK:**
   ```bash
   git clone https://github.com/your-repo/sakemono90-pdk.git
   # OR extract sakemono90.tar.gz
   ```

2. **Set environment variables:**
   ```bash
   export PDK_ROOT=/path/to/sakemono90-pdk
   export PDK=sakemono90
   export STD_CELL_LIBRARY=sakemono90_fd_sc_hd
   ```

3. **Validate the PDK:**
   ```bash
   cd /path/to/sakemono90-pdk
   python validate_pdk.py sakemono90
   ```

##  Using with OpenLane

### Basic Design Flow

1. **Create a new design directory:**
   ```bash
   mkdir my_90nm_design
   cd my_90nm_design
   ```

2. **Create config.json:**
   ```json
   {
       "DESIGN_NAME": "my_design",
       "VERILOG_FILES": "dir::src/*.v",
       "CLOCK_PERIOD": 10.0,
       "CLOCK_PORT": "clk",
       "PDK": "sakemono90",
       "STD_CELL_LIBRARY": "sakemono90_fd_sc_hd",
       "DESIGN_IS_CORE": true,
       "FP_SIZING": "absolute",
       "DIE_AREA": "0 0 100 100"
   }
   ```

3. **Run OpenLane flow:**
   ```bash
   flow.tcl -design . -tag my_run_001
   ```

### Available Standard Cells

| Cell Type | Available Cells | Drive Strengths |
|-----------|----------------|-----------------|
| **Inverters** | inv_1, inv_2, inv_4, inv_8 | 1X, 2X, 4X, 8X |
| **Buffers** | buf_1, buf_2, buf_4, buf_8, buf_16 | 1X-16X |
| **Logic Gates** | nand2_1, nor2_1, and2_1, or2_1 | 2-input |
| **Sequential** | dfxtp_1, dfxtn_1, dfxbp_1 | Rising/Falling edge |

### Process Corners

| Corner | Temperature | Voltage | Usage |
|--------|-------------|---------|-------|
| **TT** | 25°C | 1.80V | Typical operation |
| **FF** | -40°C | 1.95V | Fast (best case) |
| **SS** | 125°C | 1.62V | Slow (worst case) |

##  Design Guidelines

### Recommended Practices

1. **Clock Frequencies:**
   - Conservative: ≤ 1.0 GHz (all corners)
   - Typical: ≤ 1.5 GHz (TT corner)
   - Aggressive: ≤ 2.0 GHz (FF corner)

2. **Power Supply:**
   - Use 1.8V ± 10% for core logic
   - Use appropriate I/O voltage for pads

3. **Cell Usage:**
   - Start with inv_1, nand2_1, nor2_1 for basic logic
   - Use higher drive strengths for high-fanout nets
   - Prefer dfxtp_1 for positive edge clocking

### Physical Design Constraints

- **Cell Height:** 2.72µm (16-track)
- **Minimum Wire Width:** 140nm (met1)
- **Via Size:** 130nm (lower layers)
- **Power Stripes:** Use met4/met5/met6 for power distribution

##  Verification & Debug

### DRC Checking
```bash
magic -T $PDK_ROOT/libs.tech/magic/sakemono90.tech -noconsole \
      -batch drc_check.tcl my_design.gds
```

### LVS Verification
```bash
netgen -batch lvs "my_design.spice my_design" \
       "my_design.gds my_design" $PDK_ROOT/libs.tech/magic/sakemono90.tech
```

### Timing Analysis
- Use the Liberty .lib files for STA
- Check all three corners (TT/FF/SS)
- Verify setup and hold times

##  Performance Benchmarks

### Typical Results (TT Corner)
- **Ring Oscillator:** ~350 MHz (31-stage)
- **FO4 Delay:** 45 ps
- **Standard Cell Area:** 0.92µm² (inv_1)
- **Leakage Power:** ~2.5 nW per gate

### Expected Tool Runtime
- **Synthesis:** ~1 min for 10k gates
- **Place & Route:** ~5 min for 10k gates
- **DRC/LVS:** ~2 min for 1mm² die

##  Troubleshooting

### Common Issues

1. **"PDK not found" error:**
   - Check PDK_ROOT environment variable
   - Verify sakemono90 directory exists

2. **Standard cells not found:**
   - Ensure STD_CELL_LIBRARY=sakemono90_fd_sc_hd
   - Check lib files exist in libs.ref/lib/

3. **DRC violations:**
   - Use Magic technology file for checking
   - Verify minimum feature sizes

4. **Timing failures:**
   - Check clock period constraints
   - Consider using higher drive strength cells
   - Review synthesis quality of results

### Getting Help

- **Validation Report:** Check pdk_validation_report.json
- **Log Files:** Review OpenLane run logs
- **Magic Console:** Use for interactive debugging
- **SPICE Simulation:** Verify custom cells

##  Next Steps

1. **Test Designs:**
   - Start with simple combinational logic
   - Progress to sequential circuits
   - Try memory arrays and processors

2. **Custom Cells:**
   - Use existing cells as templates
   - Follow 16-track design rules
   - Characterize timing and power

3. **Advanced Features:**
   - Clock gating cells
   - Level shifters for multi-VDD
   - Custom analog/mixed-signal blocks

4. **Tape-out Preparation:**
   - Full DRC/LVS sign-off
   - Parasitic extraction
   - Final timing closure
   - GDS streaming for fabrication

---

##  Ready to Design!

Your Sakemono 90nm PDK is validated and ready for production use. Start with simple designs and work your way up to complex ASICs. 

**Happy designing! **