library verilog;
use verilog.vl_types.all;
entity T_flipflop_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        T               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end T_flipflop_vlg_sample_tst;
