`timescale 1ps/1ps


module tiny_eth_mac(
    input   logic clk,
    input   logic rst,

    input   logic d,
    output  logic q
);

    always_ff @ (posedge clk or negedge rst) begin
        if (!rst)
            q <= '0;
        else
            q <= d;
    end



endmodule