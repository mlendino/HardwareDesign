# Assign inputs/outputs to actual pins on the FPGA
# need one pin per bit, so have to assign it accordingly
set_property PACKAGE_PIN M15 [get_ports A[0]] 
set_property PACKAGE_PIN H17 [get_ports A[1]] 
set_property PACKAGE_PIN H18 [get_ports B[0]]
set_property PACKAGE_PIN H19 [get_ports B[1]]
set_property PACKAGE_PIN F21 [get_ports S]
#make sure you assign both bits to different pins otherwise you'll get an error!
set_property PACKAGE_PIN W22 [get_ports C[0]]
set_property PACKAGE_PIN U19 [get_ports C[1]]  
 
# Define voltage levels (3.3 for LEDs and 1.8 for Switches)
set_property IOSTANDARD LVCMOS18 [get_ports A[0]] 
set_property IOSTANDARD LVCMOS18 [get_ports A[1]] 
set_property IOSTANDARD LVCMOS18 [get_ports B[0]] 
set_property IOSTANDARD LVCMOS18 [get_ports B[1]] 
set_property IOSTANDARD LVCMOS18 [get_ports S] 
set_property IOSTANDARD LVCMOS33 [get_ports C[0]]
set_property IOSTANDARD LVCMOS33 [get_ports C[1]] 
