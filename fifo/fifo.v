module fifo_buffer #(parameter data_width=8,addr_width=6)(
input clk,rst_n,
input [data_width-1:0]fifo_in,
input w_enable,
input r_enable,
output reg [data_width-1:0]fifo_out,
output fifo_empty,fifo_full,
output reg [7:0]fifo_count //counts the number of bytes stored in the fifo
);

reg [data_width-1:0]fifo[0:2**addr_width-1];
reg [addr_width-1:0]wr_ptr,rd_ptr;



assign fifo_empty=(fifo_count==0);
assign fifo_full=(fifo_count==64);
//////////////////////////////////////////
////   handling fifo_counter    /////////
////////////////////////////////////////
always@(posedge clk,negedge rst_n) 
begin
  if(!rst_n)
     fifo_count<=0;
  else if ((w_enable && !fifo_full)&&(r_enable && !fifo_empty))
     fifo_count<=fifo_count;
  else if(w_enable && !fifo_full)
     fifo_count<=fifo_count+1;
  else if(r_enable && !fifo_empty)
     fifo_count<=fifo_count-1;
  else 
     fifo_count<=fifo_count;
end
//////////////////////////////////////////
////   handling writing into the fifo  //
////////////////////////////////////////
always@(posedge clk)
begin
  if(w_enable && !fifo_full)
    fifo[wr_ptr]<=fifo_in;
  else
    fifo[wr_ptr]<=fifo[wr_ptr];
end
//////////////////////////////////////////
////   handling reading from the fifo  //
////////////////////////////////////////
always@(posedge clk , negedge rst_n)
begin
  if(!rst_n)
    fifo_out<=0;
  else if(r_enable && !fifo_empty)
    fifo_out<=fifo[rd_ptr];
  else
    fifo_out<=fifo_out;
end
//////////////////////////////////////////
//// handling read and write pointers  //
////////////////////////////////////////

always@(posedge clk,negedge rst_n )
begin
if(!rst_n)begin
    wr_ptr<=0;
    rd_ptr<=0;
    end
else begin
    if((w_enable && !fifo_full)&&(r_enable && !fifo_empty)) begin
          wr_ptr<=wr_ptr;
          rd_ptr<=rd_ptr;
          end
    else begin
       if(w_enable && !fifo_full)
          wr_ptr<=wr_ptr+1;
       if(r_enable && !fifo_empty)
          rd_ptr<=rd_ptr+1; 
          end
          end 
    
end

endmodule
