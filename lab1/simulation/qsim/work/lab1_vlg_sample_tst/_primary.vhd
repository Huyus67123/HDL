library verilog;
use verilog.vl_types.all;
entity lab1_vlg_sample_tst is
    port(
        s               : in     vl_logic_vector(2 downto 0);
        u               : in     vl_logic_vector(2 downto 0);
        v               : in     vl_logic_vector(2 downto 0);
        w               : in     vl_logic_vector(2 downto 0);
        x               : in     vl_logic_vector(2 downto 0);
        y               : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end lab1_vlg_sample_tst;
