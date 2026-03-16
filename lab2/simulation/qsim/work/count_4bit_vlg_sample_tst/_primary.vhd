library verilog;
use verilog.vl_types.all;
entity count_4bit_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        Clear           : in     vl_logic;
        ENA             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end count_4bit_vlg_sample_tst;
