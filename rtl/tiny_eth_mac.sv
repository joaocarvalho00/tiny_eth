    /*
        This module defines 2 primitive functions MA_DATA.request
        and MA_DATA.indication.

        MAC Client       |                               ^
                     - MA_DATA.request --------- MA_DATA.indication
                    |    v                               |          |
                    |                                               |
                    |              Medium Access Control            |
                    |                                               |
                    |                                               |


    */

module tiny_eth_mac(
    input   logic           rst,
    // Tx
    input   logic           tx_clk,
    output  logic [3:0]     tx_data,
    output  logic           tx_en,

    // Rx
    input   logic           rx_clk,
    input   logic [3:0]     rx_data,
    input   logic           rx_en
);

    // Receiver (PHY -> MAC)
    logic [1499:0]          rx_frame;

    always_ff @ (posedge rx_clk or negedge rst) begin
        if (!rst)
            rx_frame            <= '0;
        else begin //if(rx_en) begin
            rx_frame            <= {rx_frame, rx_data};
        end
    end



endmodule