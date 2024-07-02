library verilog;
use verilog.vl_types.all;
entity instROM is
    port(
        address         : in     vl_logic_vector(7 downto 0);
        clken           : in     vl_logic;
        clock           : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end instROM;
