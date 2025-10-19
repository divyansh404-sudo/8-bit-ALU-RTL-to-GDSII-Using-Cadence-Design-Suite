###############################################################
#  constraint_input_180nm.sdc  —  Constraints for ALU Design (180 nm)
###############################################################

# -------------------------------------------------------------
# Clock definition
# -------------------------------------------------------------
# Define a 20 ns clock period (50 MHz) on port clk
# 180 nm logic typically runs slower than 90 nm, so we use a relaxed clock.
create_clock -name clk -period 20 [get_ports clk]

# -------------------------------------------------------------
# Input delays
# -------------------------------------------------------------
# Define 3 ns input delay (relative to clock)
# Slightly higher due to slower interface timing at 180 nm.
set_input_delay 3 -clock clk [get_ports {A[*] B[*] op_code[*] en}]

# -------------------------------------------------------------
# Output delays
# -------------------------------------------------------------
# Define 3 ns output delay (relative to clock)
set_output_delay 3 -clock clk [get_ports {result_out[*] flag_carry flag_zero}]

# -------------------------------------------------------------
# Drive & load assumptions
# -------------------------------------------------------------
# Typical driving strength for all inputs
set_drive 1 [all_inputs]

# Slight capacitive load for all outputs (e.g., 0.1 pF)
set_load 0.1 [all_outputs]

# -------------------------------------------------------------
# Operating conditions
# -------------------------------------------------------------
# Specify slow corner (matched to slow.lib of 180 nm library)
set_operating_conditions -library slow.lib -analysis_type on_chip_variation

# -------------------------------------------------------------
# Design checks / false paths
# -------------------------------------------------------------
# Ignore the enable signal timing path if it is not critical
set_false_path -from [get_ports en] -to [get_ports result_out[*]]

# -------------------------------------------------------------
# End of constraint file
###############################################################
