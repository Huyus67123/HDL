library verilog;
use verilog.vl_types.all;
entity D_flipflop is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end D_flipflop;
