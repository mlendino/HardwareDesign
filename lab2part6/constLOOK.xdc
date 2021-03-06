# Assign inputs/outputs to actual pins on the FPGA
set_property PACKAGE_PIN M15 [get_ports a0]
set_property PACKAGE_PIN H17 [get_ports a1] 
set_property PACKAGE_PIN H18 [get_ports a2] 
set_property PACKAGE_PIN H19 [get_ports a3]  
set_property PACKAGE_PIN F21 [get_ports b0]
set_property PACKAGE_PIN H22 [get_ports b1]
set_property PACKAGE_PIN G22 [get_ports b2]
set_property PACKAGE_PIN F22 [get_ports b3] 
#set_property PACKAGE_PIN H18 [get_ports cin]
set_property PACKAGE_PIN T22 [get_ports s0]
set_property PACKAGE_PIN T21 [get_ports s1]
set_property PACKAGE_PIN U22 [get_ports s2]
set_property PACKAGE_PIN U21 [get_ports s3]
set_property PACKAGE_PIN V22 [get_ports cout]  

# Define voltage levels (3.3 for LEDs and 1.8 for Switches)
set_property IOSTANDARD LVCMOS18 [get_ports a0]
set_property IOSTANDARD LVCMOS18 [get_ports a1] 
set_property IOSTANDARD LVCMOS18 [get_ports a2] 
set_property IOSTANDARD LVCMOS18 [get_ports a3]  
set_property IOSTANDARD LVCMOS18 [get_ports b0]
set_property IOSTANDARD LVCMOS18 [get_ports b1]
set_property IOSTANDARD LVCMOS18 [get_ports b2]
set_property IOSTANDARD LVCMOS18 [get_ports b3] 
#set_property IOSTANDARD LVCMOS18 [get_ports cin] 
set_property IOSTANDARD LVCMOS33 [get_ports s0]
set_property IOSTANDARD LVCMOS33 [get_ports s1]
set_property IOSTANDARD LVCMOS33 [get_ports s2]
set_property IOSTANDARD LVCMOS33 [get_ports s3]
set_property IOSTANDARD LVCMOS33 [get_ports cout]