`timescale 1ns/1ps
`define PERIOD 400



module tiny_eth_tb();
    // Includes
    

    logic rst;
    // Rx
    logic rx_clk;
    logic serial_in;

    logic [1499:0] frame;
    
    //std::randomize(sample_frame);

    tiny_eth dut(
    .rst                    (rst      ),
    // Rx
    .rx_clk                 (rx_clk   ),
    .serial_in              (serial_in)
    );

    initial begin
        rst         = 0;
        rx_clk      = 0;
        serial_in   = 0;
        //myframe.display();
        #`PERIOD
        rst         = 1;

        for (int i = 0; i<1500; i++) begin
            #`PERIOD serial_in = i;
        end

        #85 $finish();
    end


    initial begin
        $dumpfile("tiny_eth_tb.vcd");
        $dumpvars(0, tiny_eth_tb);
    end

    initial begin
        std::randomize(frame);
    end

    always #`PERIOD rx_clk = !rx_clk;

    


endmodule