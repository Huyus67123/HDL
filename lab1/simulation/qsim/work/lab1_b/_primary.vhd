library verilog;
use verilog.vl_types.all;
entity lab1_b is
    port(
        s               : in     vl_logic_vector(2 downto 0);
        n7              : out    vl_logic_vector(6 downto 0);
        n6              : out    vl_logic_vector(6 downto 0);
        n5              : out    vl_logic_vector(6 downto 0);
        n4              : out    vl_logic_vector(6 downto 0);
        n3              : out    vl_logic_vector(6 downto 0);
        n2              : out    vl_logic_vector(6 downto 0);
        n1              : out    vl_logic_vector(6 downto 0);
        n0              : out    vl_logic_vector(6 downto 0)
    );
end lab1_b;
