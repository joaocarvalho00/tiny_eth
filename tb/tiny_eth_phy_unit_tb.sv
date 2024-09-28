`timescale 1ns/1ps
`define PERIOD 400

module tiny_eth_phy_unit_tb();

    logic rst;
    // Rx
    logic rx_clk;
    logic [3:0] rx_data;
    logic serial_in;

    tiny_eth_phy phy(
    .rst                    (rst),
    // Rx
    .rx_clk                 (rx_clk),
    .rx_data                (rx_data),
    .serial_in              (serial_in)
    );

    initial begin
        rst = 0;
        rx_clk = 0;
        serial_in = 0;

        #`PERIOD
        rst = 1;
        for (int i = 0; i<20; i++) begin
            #`PERIOD serial_in = $urandom();
        end

        #85 $finish();
    end


    initial begin
        $dumpfile("tiny_eth_phy_unit_tb.vcd");
        $dumpvars(0, tiny_eth_phy_unit_tb);
    end

    always #`PERIOD rx_clk = !rx_clk;
    always @ (rx_data) $monitor("rx_data = %b", rx_data);

endmodule