library verilog;
use verilog.vl_types.all;
entity fifo_buffer is
    generic(
        data_width      : integer := 8;
        addr_width      : integer := 6
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        fifo_in         : in     vl_logic_vector;
        w_enable        : in     vl_logic;
        r_enable        : in     vl_logic;
        fifo_out        : out    vl_logic_vector;
        fifo_empty      : out    vl_logic;
        fifo_full       : out    vl_logic;
        fifo_count      : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_width : constant is 1;
    attribute mti_svvh_generic_type of addr_width : constant is 1;
end fifo_buffer;
