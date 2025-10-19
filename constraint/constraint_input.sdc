###############################################################
#  constraint_input.sdc  —  Constraints for ALU Design
###############################################################

# -------------------------------------------------------------
# Clock definition
# -------------------------------------------------------------
# Define a 10 ns clock period (100 MHz) on port clk
create_clock -name clk -period 10 [get_ports clk]

# -------------------------------------------------------------
# Input delays
# -------------------------------------------------------------
# Define 2 ns input delay (relative to clock)
set_input_delay 2 -clock clk [get_ports {A[*] B[*] op_code[*] en}]

# -------------------------------------------------------------
# Output delays
# -------------------------------------------------------------
# Define 2 ns output delay (relative to clock)
set_output_delay 2 -clock clk [get_ports {result_out[*] flag_carry flag_zero}]

# -------------------------------------------------------------
# Drive & load assumptions
# -------------------------------------------------------------
# Assume typical driving strength for all inputs
set_drive 1 [all_inputs]

# Set a small capacitive load for all outputs (e.g., 0.1 pF)
set_load 0.1 [all_outputs]

# -------------------------------------------------------------
# Operating conditions
# -------------------------------------------------------------
# Specify slow corner (already matched to slow.lib)
set_operating_conditions -library slow.lib -analysis_type on_chip_variation

# -------------------------------------------------------------
# Design checks
# -------------------------------------------------------------
# Tell the tool to ignore testbench signals if connected
set_false_path -from [get_ports en] -to [get_ports result_out[*]]

# -------------------------------------------------------------
# End of constraint file
###############################################################

