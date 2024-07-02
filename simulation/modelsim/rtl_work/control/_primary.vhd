library verilog;
use verilog.vl_types.all;
entity control is
    port(
        inst            : in     vl_logic_vector(31 downto 0);
        regDst          : out    vl_logic;
        regWrite        : out    vl_logic;
        ALUsrc          : out    vl_logic;
        branch          : out    vl_logic;
        jump            : out    vl_logic;
        ALUop           : out    vl_logic_vector(3 downto 0);
        memWrite        : out    vl_logic;
        memRead         : out    vl_logic;
        memToReg        : out    vl_logic;
        extOp           : out    vl_logic
    );
end control;
