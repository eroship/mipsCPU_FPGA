library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        control         : in     vl_logic_vector(3 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0);
        ZF              : out    vl_logic;
        CF              : out    vl_logic;
        \OF\            : out    vl_logic
    );
end ALU;
