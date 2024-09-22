compile:
	iverilog rtl/$(MODULE).sv tb/$(MODULE)_unit_tb.sv -g2012 -o sim/$(MODULE)
	#iverilog ../rtl/tiny_eth_mac.sv ../tb/tiny_eth_mac_unit_tb.sv -g2012 -o tiny_eth_mac

	vvp sim/$(MODULE)