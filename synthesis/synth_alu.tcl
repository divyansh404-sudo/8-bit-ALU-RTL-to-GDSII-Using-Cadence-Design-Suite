# ============================================================
# Cadence Genus Synthesis Script for ALU (180 nm Technology)
# ============================================================

# ------------------------------------------------------------
# Library setup
# ------------------------------------------------------------
# Update the path to your 180nm library location
set_db init_lib_search_path {/home/install/FOUNDRY/digital/180nm/dig/lib/}

# Specify the correct 180nm standard-cell library name
# (Change "slow.lib" to the actual .lib name for your 180 nm node,
#  e.g., "typical.lib", "ss_1p8v_25C.lib", etc.)
set_db library slow.lib

# ------------------------------------------------------------
# Read RTL source and elaborate
# ------------------------------------------------------------
read_hdl {./alu.v}
elaborate alu

# ------------------------------------------------------------
# Read constraints
# ------------------------------------------------------------
read_sdc ./constraint_input.sdc

# ------------------------------------------------------------
# Set synthesis effort
# ------------------------------------------------------------
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

# ------------------------------------------------------------
# Run synthesis flow
# ------------------------------------------------------------
syn_generic
syn_map
syn_opt

# ------------------------------------------------------------
# Write out synthesized netlist and constraints
# ------------------------------------------------------------
write_hdl > alu_netlist_180nm.v
write_sdc > alu_output_180nm.sdc

# ------------------------------------------------------------
# Generate synthesis reports
# ------------------------------------------------------------
report timing > alu_timing_180nm.rpt
report power  > alu_power_180nm.rpt
report area   > alu_area_180nm.rpt
report gates  > alu_gates_180nm.rpt

# ------------------------------------------------------------
# Optional GUI
# ------------------------------------------------------------
gui_show
