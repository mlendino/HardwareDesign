# Assign inputs/outputs to actual pins on the FPGA
# need one pin per bit, so have to assign it accordingly
set_property PACKAGE_PIN F22 [get_ports ROM_input[0]] 
set_property PACKAGE_PIN G22 [get_ports ROM_input[1]] 
set_property PACKAGE_PIN H22 [get_ports ROM_input[2]]
set_property PACKAGE_PIN F21 [get_ports ROM_input[3]]
#make sure you assign both bits to different pins otherwise you'll get an error!
set_property PACKAGE_PIN T22 [get_ports ROM_output[0]]
set_property PACKAGE_PIN T21 [get_ports ROM_output[1]]  
set_property PACKAGE_PIN U22 [get_ports ROM_output[2]]
set_property PACKAGE_PIN U21 [get_ports ROM_output[3]]      

# Define voltage levels (3.3 for LEDs and 1.8 for Switches)
set_property IOSTANDARD LVCMOS18 [get_ports ROM_input[0]] 
set_property IOSTANDARD LVCMOS18 [get_ports ROM_input[1]] 
set_property IOSTANDARD LVCMOS18 [get_ports ROM_input[2]] 
set_property IOSTANDARD LVCMOS18 [get_ports ROM_input[3]] 
set_property IOSTANDARD LVCMOS33 [get_ports ROM_output[0]]
set_property IOSTANDARD LVCMOS33 [get_ports ROM_output[1]] 
set_property IOSTANDARD LVCMOS33 [get_ports ROM_output[2]] 
set_property IOSTANDARD LVCMOS33 [get_ports ROM_output[3]] 