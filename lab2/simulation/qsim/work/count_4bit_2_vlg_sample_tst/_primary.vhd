library verilog;
use verilog.vl_types.all;
entity count_4bit_2_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        Ena             : in     vl_logic;
        Reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end count_4bit_2_vlg_sample_tst;
