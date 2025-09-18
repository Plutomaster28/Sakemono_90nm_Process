# Sakemono 90nm PDK Test - OpenLane Setup Instructions

## Quick Setup for WSL

1. **Copy PDK to OpenLane:**
   ```bash
   # In WSL, copy your PDK to OpenLane
   cp -r /mnt/c/Users/theni/OneDrive/Documents/Sakemono_90nm_Process/sakemono90 $OPENLANE_ROOT/pdks/
   ```

2. **Copy Test Design:**
   ```bash
   # Copy this test design to OpenLane designs
   cp -r /mnt/c/Users/theni/OneDrive/Documents/Sakemono_90nm_Process/openlane_test_design/sakemono_test_counter $OPENLANE_ROOT/designs/
   ```

3. **Set Environment Variables:**
   ```bash
   export PDK_ROOT="$OPENLANE_ROOT/pdks"
   export PDK="sakemono90" 
   export STD_CELL_LIBRARY="sakemono90_fd_sc_hd"
   ```

4. **Run OpenLane Flow:**
   ```bash
   cd $OPENLANE_ROOT
   make mount
   
   # Inside container:
   ./flow.tcl -design sakemono_test_counter -interactive
   
   # Or run complete flow:
   ./flow.tcl -design sakemono_test_counter
   ```

## Expected Results

If successful, you should see:
- ✅ Synthesis completed with your Sakemono cells
- ✅ Placement using 16-track architecture 
- ✅ Routing with 90nm metal stack
- ✅ DRC clean with Magic
- ✅ LVS passed
- ✅ Final GDS generated

## Troubleshooting

**Synthesis Issues:** Check Liberty file paths and syntax
**Placement Issues:** Verify LEF pin definitions
**Routing Issues:** Check track definitions and metal rules
**DRC Issues:** Review Magic technology file

## Files Created
- `src/counter.v` - Simple 8-bit counter RTL
- `config.tcl` - OpenLane configuration for Sakemono PDK  
- `pin_order.cfg` - Pin placement configuration

This test will validate your entire PDK stack from RTL to GDSII!