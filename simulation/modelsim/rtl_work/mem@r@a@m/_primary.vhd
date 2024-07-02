library verilog;
use verilog.vl_types.all;
entity memRAM is
    port(
        address         : in     vl_logic_vector(6 downto 0);
        clken           : in     vl_logic;
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end memRAM;
