library verilog;
use verilog.vl_types.all;
entity lab1 is
    port(
        s               : in     vl_logic_vector(2 downto 0);
        u               : in     vl_logic_vector(2 downto 0);
        v               : in     vl_logic_vector(2 downto 0);
        w               : in     vl_logic_vector(2 downto 0);
        x               : in     vl_logic_vector(2 downto 0);
        y               : in     vl_logic_vector(2 downto 0);
        n1              : out    vl_logic_vector(6 downto 0);
        n2              : out    vl_logic_vector(6 downto 0);
        n3              : out    vl_logic_vector(6 downto 0);
        n4              : out    vl_logic_vector(6 downto 0);
        n0              : out    vl_logic_vector(6 downto 0)
    );
end lab1;
