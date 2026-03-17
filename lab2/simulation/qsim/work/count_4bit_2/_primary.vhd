library verilog;
use verilog.vl_types.all;
entity count_4bit_2 is
    port(
        Ena             : in     vl_logic;
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        Q               : out    vl_logic_vector(3 downto 0)
    );
end count_4bit_2;
