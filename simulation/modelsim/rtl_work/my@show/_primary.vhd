library verilog;
use verilog.vl_types.all;
entity myShow is
    port(
        clk             : in     vl_logic;
        num1            : in     vl_logic_vector(3 downto 0);
        num2            : in     vl_logic_vector(3 downto 0);
        num3            : in     vl_logic_vector(3 downto 0);
        num4            : in     vl_logic_vector(3 downto 0);
        posDecode       : out    vl_logic_vector(3 downto 0);
        numberDecode    : out    vl_logic_vector(6 downto 0)
    );
end myShow;
