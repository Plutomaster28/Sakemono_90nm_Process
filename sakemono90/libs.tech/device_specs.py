# Sakemono 90nm Process Device Specifications
# Comprehensive device and process parameters for tape-out ready PDK

#==========================================
# CORE TRANSISTOR SPECIFICATIONS
#==========================================

# Core NMOS/PMOS devices
CORE_NMOS_LMIN = 0.09  # µm - Minimum gate length for core logic
CORE_PMOS_LMIN = 0.09  # µm - Minimum gate length for core logic

# Threshold voltage flavors for core devices
CORE_NMOS_LVT_VT = 0.25   # V - Low Vt NMOS @ Vdd=1.8V
CORE_NMOS_SVT_VT = 0.35   # V - Standard Vt NMOS @ Vdd=1.8V  
CORE_NMOS_HVT_VT = 0.45   # V - High Vt NMOS @ Vdd=1.8V

CORE_PMOS_LVT_VT = -0.25  # V - Low Vt PMOS @ Vdd=1.8V
CORE_PMOS_SVT_VT = -0.35  # V - Standard Vt PMOS @ Vdd=1.8V
CORE_PMOS_HVT_VT = -0.45  # V - High Vt PMOS @ Vdd=1.8V

# Core device gate oxide
CORE_TOX = 2.1   # nm - Gate oxide thickness for core devices
CORE_VDD_NOM = 1.8    # V - Nominal supply voltage
CORE_VDD_MIN = 1.62   # V - Minimum supply voltage
CORE_VDD_MAX = 1.95   # V - Maximum supply voltage

#==========================================
# IO TRANSISTOR SPECIFICATIONS  
#==========================================

# IO device geometries
IO_NMOS_LMIN = 0.35   # µm - Minimum gate length for IO devices
IO_PMOS_LMIN = 0.35   # µm - Minimum gate length for IO devices

# IO device gate oxide (thicker for higher voltage)
IO_TOX = 4.5     # nm - Gate oxide thickness for IO devices
IO_VDD_NOM = 1.8      # V - Nominal IO supply voltage
IO_VDD_MAX = 2.0      # V - Maximum IO supply voltage

# IO threshold voltages
IO_NMOS_VT = 0.4     # V - IO NMOS threshold
IO_PMOS_VT = -0.4    # V - IO PMOS threshold

#==========================================
# OPTIONAL DEVICES
#==========================================

# Metal-Insulator-Metal Capacitors
MIM_CAP_AVAILABLE = True
MIM_CAP_UNIT = 1.0   # fF/µm² - Capacitance per unit area
MIM_CAP_LAYERS = ["met4", "met5", "met6"]  # Available metal layers
MIM_CAP_MIN_AREA = 4.0  # µm² - Minimum capacitor area
MIM_CAP_MATCHING = 0.1   # % - Capacitor matching accuracy

# Diffusion Resistors
DIFF_RES_AVAILABLE = True
DIFF_RES_SHEET = 50   # Ω/□ - N+ diffusion sheet resistance
DIFF_RES_CONTACT = 10  # Ω - Contact resistance
DIFF_RES_MIN_W = 0.4   # µm - Minimum resistor width
DIFF_RES_MIN_L = 0.4   # µm - Minimum resistor length

# Polysilicon Resistors
POLY_RES_AVAILABLE = True
POLY_RES_SHEET = 350   # Ω/□ - Polysilicon sheet resistance
POLY_RES_CONTACT = 15  # Ω - Contact resistance  
POLY_RES_MIN_W = 0.18  # µm - Minimum resistor width
POLY_RES_MIN_L = 0.18  # µm - Minimum resistor length
POLY_RES_TEMP_COEFF = 1000  # ppm/°C - Temperature coefficient

# High-Value Resistors
HI_RES_AVAILABLE = True
HI_RES_SHEET = 2000    # Ω/□ - High-resistance poly sheet resistance
HI_RES_MIN_W = 0.4     # µm - Minimum width
HI_RES_MIN_L = 0.4     # µm - Minimum length
HI_RES_MAX_VALUE = 10e6  # Ω - Maximum practical resistance

#==========================================
# DESIGN RULES (HEADLINE VALUES)
#==========================================

# Polysilicon rules
POLY_MIN_WIDTH = 0.09    # µm - Minimum poly width
POLY_MIN_SPACE = 0.12    # µm - Minimum poly spacing
POLY_TO_DIFF_EXT = 0.13  # µm - Poly extension over diffusion
POLY_TO_DIFF_SPACE = 0.07 # µm - Poly to diffusion spacing

# Contact rules
CONTACT_SIZE = 0.11      # µm - Contact via size (square)
CONTACT_POLY_ENC = 0.05  # µm - Contact enclosure by poly
CONTACT_DIFF_ENC = 0.06  # µm - Contact enclosure by diffusion
CONTACT_MIN_SPACE = 0.13 # µm - Minimum contact spacing

# Via rules (via1 through via5)
VIA1_SIZE = 0.11         # µm - Via1 size (li1 to met1)
VIA1_ENCLOSURE = 0.055   # µm - Enclosure by both layers
VIA1_MIN_SPACE = 0.17    # µm - Minimum via1 spacing

VIA2_SIZE = 0.11         # µm - Via2 size (met1 to met2)
VIA2_ENCLOSURE = 0.055   # µm - Enclosure by both layers  
VIA2_MIN_SPACE = 0.17    # µm - Minimum via2 spacing

VIA3_SIZE = 0.11         # µm - Via3 size (met2 to met3)
VIA3_ENCLOSURE = 0.055   # µm - Enclosure by both layers
VIA3_MIN_SPACE = 0.17    # µm - Minimum via3 spacing

VIA4_SIZE = 0.16         # µm - Via4 size (met3 to met4)
VIA4_ENCLOSURE = 0.08    # µm - Enclosure by both layers
VIA4_MIN_SPACE = 0.32    # µm - Minimum via4 spacing

VIA5_SIZE = 0.16         # µm - Via5 size (met4 to met5)
VIA5_ENCLOSURE = 0.08    # µm - Enclosure by both layers
VIA5_MIN_SPACE = 0.32    # µm - Minimum via5 spacing

VIA6_SIZE = 0.16         # µm - Via6 size (met5 to met6)
VIA6_ENCLOSURE = 0.08    # µm - Enclosure by both layers
VIA6_MIN_SPACE = 0.32    # µm - Minimum via6 spacing

# Metal layer pitches and rules
METAL_LAYERS = {
    "li1": {
        "pitch": 0.17,    # µm
        "min_width": 0.085,
        "min_space": 0.085,
        "direction": "horizontal"
    },
    "met1": {
        "pitch": 0.17,    # µm  
        "min_width": 0.14,
        "min_space": 0.14,
        "direction": "horizontal"
    },
    "met2": {
        "pitch": 0.19,    # µm
        "min_width": 0.14, 
        "min_space": 0.14,
        "direction": "vertical"
    },
    "met3": {
        "pitch": 0.19,    # µm
        "min_width": 0.14,
        "min_space": 0.14, 
        "direction": "horizontal"
    },
    "met4": {
        "pitch": 0.28,    # µm
        "min_width": 0.28,
        "min_space": 0.28,
        "direction": "vertical"
    },
    "met5": {
        "pitch": 0.28,    # µm
        "min_width": 0.28,
        "min_space": 0.28,
        "direction": "horizontal"  
    },
    "met6": {
        "pitch": 0.28,    # µm
        "min_width": 0.28,
        "min_space": 0.28,
        "direction": "vertical"
    }
}

# Alignment tolerances and overlay budgets
OVERLAY_BUDGET_CRITICAL = 0.025  # µm - 25 nm for critical layers
OVERLAY_BUDGET_NON_CRITICAL = 0.035  # µm - 35 nm for non-critical
REGISTRATION_TOLERANCE = 0.020    # µm - Layer-to-layer registration

#==========================================
# POWER & PERFORMANCE SPECIFICATIONS
#==========================================

# FO4 inverter delay (Fan-out of 4 inverter chain)
FO4_DELAY_TT_25C = 45     # ps - Typical corner, 25°C, 1.8V
FO4_DELAY_FF_N40C = 35    # ps - Fast corner, -40°C, 1.95V  
FO4_DELAY_SS_125C = 70    # ps - Slow corner, 125°C, 1.62V

# Maximum clock frequencies for standard cells
MAX_CLK_FREQ_TT = 1.5     # GHz - Typical corner sustainable frequency
MAX_CLK_FREQ_FF = 2.0     # GHz - Fast corner max frequency
MAX_CLK_FREQ_SS = 1.0     # GHz - Slow corner sustainable frequency

# Leakage current specifications (per µm of gate width)
LEAKAGE_NMOS_25C = 100    # nA/µm - NMOS leakage at 25°C, 1.8V
LEAKAGE_PMOS_25C = 50     # nA/µm - PMOS leakage at 25°C, 1.8V
LEAKAGE_NMOS_125C = 1000  # nA/µm - NMOS leakage at 125°C, 1.8V  
LEAKAGE_PMOS_125C = 500   # nA/µm - PMOS leakage at 125°C, 1.8V

# Subthreshold slope
SUBTHRESHOLD_SLOPE = 85   # mV/decade at room temperature

#==========================================
# RELIABILITY SPECIFICATIONS
#==========================================

# ESD (Electrostatic Discharge) targets
ESD_HBM_TARGET = 2000     # V - Human Body Model target for pads
ESD_MM_TARGET = 200       # V - Machine Model target
ESD_CDM_TARGET = 750      # V - Charged Device Model target

# Electromigration current density limits
EM_THIN_METAL_LIMIT = 2.0  # mA/µm - For met1, met2, met3 
EM_THICK_METAL_LIMIT = 5.0 # mA/µm - For met4, met5, met6
EM_VIA_LIMIT = 1.5         # mA/via - Current limit per via

# Hot carrier injection lifetime
HCI_LIFETIME_TARGET = 10   # years - At operating conditions

# Time-dependent dielectric breakdown  
TDDB_LIFETIME_TARGET = 10  # years - Gate oxide reliability

#==========================================
# LIBRARY ALIGNMENT SPECIFICATIONS
#==========================================

# Standard cell height verification
STD_CELL_HEIGHT = 2.72     # µm - Standard cell height
MET1_PITCH = 0.17          # µm - Metal 1 track pitch
TRACKS_PER_CELL = 16       # tracks - STD_CELL_HEIGHT / MET1_PITCH = 16

# Verify alignment: 2.72 / 0.17 = 16 tracks exactly
assert abs(STD_CELL_HEIGHT / MET1_PITCH - TRACKS_PER_CELL) < 0.01

# Standard track count library classification
LIBRARY_TYPE = "16-track"  # 16-track high-density library
POWER_RAIL_WIDTH = 2       # tracks - VDD/VSS rail width each
ROUTING_TRACKS = 12        # tracks - Available for signal routing

#==========================================
# DRC GRID & PLACEMENT SPECIFICATIONS  
#==========================================

# Manufacturing grid (for mask generation)
MANUFACTURING_GRID = 0.005  # µm - 5 nm manufacturing grid
DRC_GRID = 0.005           # µm - Design rule checking grid

# Legal placement sites
PLACEMENT_GRID_X = 0.17    # µm - X placement grid (met1 pitch)
PLACEMENT_GRID_Y = 2.72    # µm - Y placement grid (cell height)

# Site definition for standard cells
SITE_CLASS = "core"
SITE_SYMMETRY = "Y"        # Cells can be flipped in Y direction
SITE_SIZE_X = 0.17         # µm - Unit site width
SITE_SIZE_Y = 2.72         # µm - Unit site height

# Snapping rules
SNAP_TO_GRID = True        # All geometries must snap to grid
SNAP_TOLERANCE = 0.001     # µm - Tolerance for snapping