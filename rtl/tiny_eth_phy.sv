/*
    Monitors the physical medium, decodes incoming frames, and deserializes
    them into 4-bit chunks(RXD[3:0])
    Provides RX_CLK to synchronize with the mac and asserts RX_DV when valid data is available
*/
module tiny_eth_phy(
    input   logic           rst,
    // Rx
    inout   logic           rx_clk,
    input   logic           serial_in,
    output  logic [3:0]     rx_data 
);

    /* ---------------------- DESERIALIZER ----------------------
            > PHY module receives serial data from the medium and deserializes
        them into 4-bit chunks(RXD[3:0])
    */
    logic   [3:0]           sipo_sr;    

    always @ (posedge rx_clk or negedge rst) begin
        if(!rst) begin
            sipo_sr         <= 4'b0;
        end
        else begin
            sipo_sr         <= sipo_sr << 1;
            sipo_sr[0]      <= serial_in;
        end
    end

    assign rx_data = rst ? sipo_sr : 4'b0;
    // ---------------------- /DESERIALIZER ---------------------

endmodule