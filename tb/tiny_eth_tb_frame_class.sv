class frame;
    bit [1499:0] frame_bus; 
    for (int i = 0; i<150; i++) begin
        frame_bus[(i+1)*10-1:i*10] = $urandom();
    end

    function display();
        $display("frame = %x", frame_bus);
        //$display("hello");
    endfunction
endclass