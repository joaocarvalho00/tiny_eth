

module tiny_eth_mac_unit_tb();

    logic clk;
    logic rst;
    logic d;
    logic q;

    tiny_eth_mac mac(
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    initial begin
        $dumpfile("tiny_eth_mac_unit_tb.vcd");
        $dumpvars(0, tiny_eth_mac_unit_tb);
        clk = 0;
        rst = 1;
        d   = 0;

        #15 rst = 0;
        d = 1;


        #85 $finish();
    end

    always #10 clk = !clk;

    


endmodule