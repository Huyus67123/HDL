library verilog;
use verilog.vl_types.all;
entity T_flipflop is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        T               : in     vl_logic;
        Q               : out    vl_logic
    );
end T_flipflop;
