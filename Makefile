compile:
	iverilog rtl/tiny_eth_$(MODULE).sv tb/tiny_eth_$(MODULE)_unit_tb.sv -g2012 -o sim/tiny_eth_$(MODULE)
	vvp sim/tiny_eth_$(MODULE)
	mv tiny_eth_$(MODULE)_unit_tb.vcd sim/

compile_all:
	iverilog rtl/tiny_eth_mac.sv \
			 rtl/tiny_eth_phy.sv \
			 rtl/tiny_eth.sv \
			 tb/tiny_eth_tb.sv \
			 -g2012 -o sim/tiny_eth
	vvp sim/tiny_eth
	mv tiny_eth_tb.vcd sim/

simu:
	gtkwave sim/tiny_eth_$(MODULE)_unit_tb.vcd

simu_all:
	gtkwave sim/tiny_eth.vcd

clean:
	