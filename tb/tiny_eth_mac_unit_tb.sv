`timescale 1ns/1ps
`define PERIOD 400

module tiny_eth_mac_unit_tb();

    logic rst;
    // Rx
    logic rx_clk;
    logic [3:0] rx_data;
    logic rx_en;

    tiny_eth_mac mac(
    .rst                    (rst),
    // Tx
    // .tx_clk                 (tx_clk),
    // .tx_data                (tx_data),
    // .tx_en                  (tx_en),
    // Rx
    .rx_clk                 (rx_clk),
    .rx_data                (rx_data),
    .rx_en                  (rx_en)
    );

    initial begin
        rst = 0;
        rx_clk = 0;
        rx_data = 0;
        rx_en = 0;

        #`PERIOD
        rst = 1;
        rx_en = 1;
        for (int i = 0; i<375; i++) begin
            #`PERIOD rx_data = i;
        end
        rx_en = 0;

        #85 $finish();
    end


    initial begin
        $dumpfile("tiny_eth_mac_unit_tb.vcd");
        $dumpvars(0, tiny_eth_mac_unit_tb);
    end

    always #`PERIOD rx_clk = !rx_clk;

    


endmodule