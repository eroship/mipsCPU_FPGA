library verilog;
use verilog.vl_types.all;
entity delay is
    port(
        \in\            : in     vl_logic;
        clk             : in     vl_logic;
        \out\           : out    vl_logic
    );
end delay;
