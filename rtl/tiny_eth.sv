/*
    Top-level
*/
module tiny_eth(
    input   logic           rst,
    // Rx
    input   logic           rx_clk,
    input   logic           serial_in
);
    // ---------------------- WIRES --------------------
    logic   [3:0]           rx_data_wire;
    logic                   rx_clk_wire;

    // ---------------------- MAC ----------------------
    tiny_eth_mac mac(
    .rst                    (rst             ),
    // Tx
    // .tx_clk                 (tx_clk),
    // .tx_data                (tx_data),
    // .tx_en                  (tx_en),
    // Rx
    .rx_clk                 (rx_clk_wire     ),
    .rx_data                (rx_data_wire    ),
    .rx_en                  (rx_en           )
    );
    // ---------------------- /MAC ---------------------


    // ---------------------- PHY ----------------------
    tiny_eth_phy phy(
    .rst                    (rst            ),
    // Rx
    .rx_clk                 (rx_clk_wire    ),
    .rx_data                (rx_data_wire   ),
    .serial_in              (serial_in      )
    );
    // ---------------------- /PHY ---------------------


endmodule