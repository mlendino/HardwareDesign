The goal of this project is to build a Bipolar Junction Transistor (BJT) simulator, for
a resistive divider biased BJT without degeneration, on an FPGA. The program will prompt the 
user to input the parameters of the BJT into the command line through the PUTTY interface.
Specifically, for this topology, the user will be prompted for the current gain, the saturation current,
the values for the biasing resistors, Vcc, the thermal voltage, and a guess for the collector current.
The module will perform the necessary calculations to find the DC operating point and AC gain of the
given BJT topology. The module will iteratively solve a system of nonlinear equations, while using
the floating point IP core to efficiently and precisely implement the exponential function.
The AC gain will be computed using the small signal model. The computed values will be output to the
user through the command line as well as displayed on the onboard screen. If time permits, we will 
output the voltages through a DAC so that the user can use the output voltage, say Vbe, in a circuit
directly. For future projects we would wish to expand our design by making modules for alternate 
topologies such as including a modified nodal analysis (MNA) circuit solver to allow for more flexible
and/or solving systems with multiple transistors.

Collaborated with Matt Ferreira and Aziza Almanakly
