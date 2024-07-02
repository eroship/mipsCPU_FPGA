library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        instr           : in     vl_logic_vector(31 downto 0);
        jump            : in     vl_logic;
        branch          : in     vl_logic;
        PCout           : out    vl_logic_vector(31 downto 0)
    );
end PC;
