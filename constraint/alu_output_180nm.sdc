# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Sat Oct 18 12:10:24 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design alu

create_clock -name "clk" -period 20.0 -waveform {0.0 10.0} [get_ports clk]
set_load -pin_load 0.1 [get_ports {result_out[7]}]
set_load -pin_load 0.1 [get_ports {result_out[6]}]
set_load -pin_load 0.1 [get_ports {result_out[5]}]
set_load -pin_load 0.1 [get_ports {result_out[4]}]
set_load -pin_load 0.1 [get_ports {result_out[3]}]
set_load -pin_load 0.1 [get_ports {result_out[2]}]
set_load -pin_load 0.1 [get_ports {result_out[1]}]
set_load -pin_load 0.1 [get_ports {result_out[0]}]
set_load -pin_load 0.1 [get_ports flag_carry]
set_load -pin_load 0.1 [get_ports flag_zero]
set_false_path -from [get_ports en] -to [list \
  [get_ports {result_out[7]}]  \
  [get_ports {result_out[6]}]  \
  [get_ports {result_out[5]}]  \
  [get_ports {result_out[4]}]  \
  [get_ports {result_out[3]}]  \
  [get_ports {result_out[2]}]  \
  [get_ports {result_out[1]}]  \
  [get_ports {result_out[0]}] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {A[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {A[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {A[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {A[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {A[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {A[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {A[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {A[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {B[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {B[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {B[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {B[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {B[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {B[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {B[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {B[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {op_code[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {op_code[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {op_code[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports en]
set_output_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {result_out[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {result_out[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {result_out[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {result_out[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {result_out[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {result_out[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {result_out[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports {result_out[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports flag_carry]
set_output_delay -clock [get_clocks clk] -add_delay 3.0 [get_ports flag_zero]
set_drive 1.0 [get_ports {A[7]}]
set_drive 1.0 [get_ports {A[6]}]
set_drive 1.0 [get_ports {A[5]}]
set_drive 1.0 [get_ports {A[4]}]
set_drive 1.0 [get_ports {A[3]}]
set_drive 1.0 [get_ports {A[2]}]
set_drive 1.0 [get_ports {A[1]}]
set_drive 1.0 [get_ports {A[0]}]
set_drive 1.0 [get_ports {B[7]}]
set_drive 1.0 [get_ports {B[6]}]
set_drive 1.0 [get_ports {B[5]}]
set_drive 1.0 [get_ports {B[4]}]
set_drive 1.0 [get_ports {B[3]}]
set_drive 1.0 [get_ports {B[2]}]
set_drive 1.0 [get_ports {B[1]}]
set_drive 1.0 [get_ports {B[0]}]
set_drive 1.0 [get_ports {op_code[2]}]
set_drive 1.0 [get_ports {op_code[1]}]
set_drive 1.0 [get_ports {op_code[0]}]
set_drive 1.0 [get_ports clk]
set_drive 1.0 [get_ports en]
set_wire_load_mode "enclosed"
