library verilog;
use verilog.vl_types.all;
entity regFile is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        regDist         : in     vl_logic;
        regWrite        : in     vl_logic;
        inst            : in     vl_logic_vector(31 downto 0);
        dataWrite       : in     vl_logic_vector(31 downto 0);
        rsdata          : out    vl_logic_vector(31 downto 0);
        rtdata          : out    vl_logic_vector(31 downto 0)
    );
end regFile;
