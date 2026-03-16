library verilog;
use verilog.vl_types.all;
entity lab1_b_vlg_sample_tst is
    port(
        s               : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end lab1_b_vlg_sample_tst;
