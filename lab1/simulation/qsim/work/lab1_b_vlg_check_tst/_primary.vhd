library verilog;
use verilog.vl_types.all;
entity lab1_b_vlg_check_tst is
    port(
        n0              : in     vl_logic_vector(6 downto 0);
        n1              : in     vl_logic_vector(6 downto 0);
        n2              : in     vl_logic_vector(6 downto 0);
        n3              : in     vl_logic_vector(6 downto 0);
        n4              : in     vl_logic_vector(6 downto 0);
        n5              : in     vl_logic_vector(6 downto 0);
        n6              : in     vl_logic_vector(6 downto 0);
        n7              : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab1_b_vlg_check_tst;
