library verilog;
use verilog.vl_types.all;
entity count_4bit is
    port(
        CLK             : in     vl_logic;
        ENA             : in     vl_logic;
        Clear           : in     vl_logic;
        Q               : out    vl_logic_vector(3 downto 0)
    );
end count_4bit;
