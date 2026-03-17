library verilog;
use verilog.vl_types.all;
entity lab2_2 is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        ENA             : in     vl_logic;
        \out\           : out    vl_logic_vector(6 downto 0)
    );
end lab2_2;
