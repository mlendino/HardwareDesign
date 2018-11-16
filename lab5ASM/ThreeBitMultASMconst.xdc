# Assign inputs/outputs to actual pins on the FPGA
# need one pin per bit, so have to assign it accordingly
set_property PACKAGE_PIN F22 [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]
set_property PACKAGE_PIN H22 [get_ports {b[0]}]
set_property PACKAGE_PIN F21 [get_ports {b[1]}]
#make sure you assign both bits to different pins otherwise you'll get an error!
set_property PACKAGE_PIN H18 [get_ports {a[0]}]
set_property PACKAGE_PIN H17 [get_ports {a[1]}]
set_property PACKAGE_PIN M15 [get_ports {a[2]}]


set_property PACKAGE_PIN U19 [get_ports {c[4]}]
set_property PACKAGE_PIN U14 [get_ports {c[5]}]


# Define voltage levels (3.3 for LEDs and 1.8 for Switches)
set_property IOSTANDARD LVCMOS18 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {b[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {b[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {a[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {a[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {a[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[5]}]

set_property PACKAGE_PIN H19 [get_ports {b[2]}]
set_property PACKAGE_PIN W22 [get_ports {c[3]}]
set_property PACKAGE_PIN V22 [get_ports {c[2]}]
set_property PACKAGE_PIN U21 [get_ports {c[1]}]
set_property PACKAGE_PIN U22 [get_ports {c[0]}]
