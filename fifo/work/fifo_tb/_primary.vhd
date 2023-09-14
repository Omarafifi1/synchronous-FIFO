library verilog;
use verilog.vl_types.all;
entity fifo_tb is
    generic(
        data_width      : integer := 8
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_width : constant is 1;
end fifo_tb;
