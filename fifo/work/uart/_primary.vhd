library verilog;
use verilog.vl_types.all;
entity uart is
    generic(
        data_width      : integer := 8;
        width           : integer := 4
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        baud_enable     : in     vl_logic;
        rx              : in     vl_logic;
        final_value     : in     vl_logic_vector;
        w_data          : in     vl_logic_vector;
        wr_uart         : in     vl_logic;
        rd_uart         : in     vl_logic;
        tx_full         : out    vl_logic;
        rx_empty        : out    vl_logic;
        r_data          : out    vl_logic_vector;
        tx              : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_width : constant is 1;
    attribute mti_svvh_generic_type of width : constant is 1;
end uart;
