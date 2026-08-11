# parking-lot-controller-
Parking Lot Controller

A Verilog-based Parking Lot Controller that monitors vehicle entry and exit, maintains the number of occupied parking spaces, and indicates whether the parking lot is full.

Features

- Supports vehicle entry and exit.
- Maintains the current number of occupied spaces.
- Detects when the parking lot is full.
- Provides available-space information.
- Uses synchronous clock and reset.
- Includes a Verilog testbench for functional verification.
- Simulation waveform can be viewed using GTKWave or a similar simulator.

Inputs

Signal| Description
"clk"| System clock
"reset"| Resets the parking lot
"entry"| Vehicle entering the parking lot
"exit"| Vehicle leaving the parking lot

Outputs

Signal| Description
"count"| Number of occupied parking spaces
"full"| Indicates that the parking lot is full

Working

When a vehicle enters, the occupancy count increases by one.
When a vehicle exits, the occupancy count decreases by one.

The count never exceeds the maximum parking capacity and never goes below zero.

Tools

- Verilog HDL
- Icarus Verilog
- GTKWave
- GitHub

Simulation

Compile and run the testbench:

iverilog -o parking_sim src/parking_lot_controller.v testbench/parking_lot_controller_tb.v
vvp parking_sim

To view the waveform:

gtkwave parking_lot.vcd

Applications

- Smart parking systems
- Automated parking lots
- Vehicle monitoring systems
- Digital control systems
- FPGA-based parking management

Author

Parking Lot Controller – Verilog HDL Project
author:sai teja sree 
