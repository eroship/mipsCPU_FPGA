library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        regDist         : out    vl_logic;
        ZF              : out    vl_logic;
        CF              : out    vl_logic;
        \OF\            : out    vl_logic;
        clk_5000HZ      : out    vl_logic;
        branch          : out    vl_logic;
        jump            : out    vl_logic;
        ALUsrc          : out    vl_logic;
        memWrite        : out    vl_logic;
        regWrite        : out    vl_logic;
        memToReg        : out    vl_logic;
        branchTrue      : out    vl_logic;
        clk_instROM     : out    vl_logic;
        ALUop           : out    vl_logic_vector(3 downto 0);
        busB            : out    vl_logic_vector(31 downto 0);
        inst            : out    vl_logic_vector(31 downto 0);
        numberDecode    : out    vl_logic_vector(6 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        posDecode       : out    vl_logic_vector(3 downto 0);
        rsdata          : out    vl_logic_vector(31 downto 0);
        rtdata          : out    vl_logic_vector(31 downto 0)
    );
end top;
