## vga_test.xdc - Basys-3 constraints for vga_test.v

## Clock (100 MHz input on W5)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.00 -name sys_clk -waveform {0 5} [get_ports clk]

## Reset (center push-button BTN_C on U18)
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## Slide Switches SW[11:0]
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {sw[7]}]
set_property PACKAGE_PIN V2  [get_ports {sw[8]}]
set_property PACKAGE_PIN T3  [get_ports {sw[9]}]
set_property PACKAGE_PIN T2  [get_ports {sw[10]}]
set_property PACKAGE_PIN R3  [get_ports {sw[11]}]

## VGA Red channel (rgb[11:8])
set_property PACKAGE_PIN N19 [get_ports {rgb[11]}]
set_property PACKAGE_PIN J19 [get_ports {rgb[10]}]
set_property PACKAGE_PIN H19 [get_ports {rgb[9]}]
set_property PACKAGE_PIN G19 [get_ports {rgb[8]}]

## VGA Green channel (rgb[7:4])
set_property PACKAGE_PIN D17 [get_ports {rgb[7]}]
set_property PACKAGE_PIN G17 [get_ports {rgb[6]}]
set_property PACKAGE_PIN H17 [get_ports {rgb[5]}]
set_property PACKAGE_PIN J17 [get_ports {rgb[4]}]

## VGA Blue channel (rgb[3:0])
set_property PACKAGE_PIN J18 [get_ports {rgb[3]}]
set_property PACKAGE_PIN K18 [get_ports {rgb[2]}]
set_property PACKAGE_PIN L18 [get_ports {rgb[1]}]
set_property PACKAGE_PIN N18 [get_ports {rgb[0]}]

## VGA sync signals
set_property PACKAGE_PIN P19 [get_ports horizontal_sync]
set_property PACKAGE_PIN R19 [get_ports vertical_sync]

## --- I/O Standards - all pins at 3.3 V
set_property IOSTANDARD LVCMOS33 [get_ports {clk reset
                                              sw[*]
                                              rgb[*]
                                              horizontal_sync
                                              vertical_sync}]
