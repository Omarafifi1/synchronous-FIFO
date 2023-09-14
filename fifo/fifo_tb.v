`timescale 1ns / 1ps

module fifo_tb;
  parameter data_width=8;
reg clk,rst_n;
reg [data_width-1:0]fifo_in;
reg w_enable;
wire [data_width-1:0]fifo_out;
 reg r_enable;
wire fifo_empty,fifo_full;
wire [7:0]fifo_count; //counts the number of bytes stored in the fifo

fifo_buffer #(.data_width(data_width))dut(
.clk(clk),
.rst_n(rst_n),                
.fifo_in(fifo_in),  
.w_enable(w_enable),                 
.fifo_out(fifo_out),
.r_enable(r_enable),                
.fifo_empty(fifo_empty),
.fifo_full(fifo_full),    
.fifo_count(fifo_count) 
);
localparam T=10;
initial
#800
$stop;
always 
begin
  clk=0;
  #(T/2);
  clk=1;
  #(T/2);
end

initial
begin
  rst_n=0;
  #2;
  rst_n=1;
end

initial
begin
  fifo_in= 150;
  w_enable=1;
  r_enable=0;
  #10;
  
   fifo_in= 80;
  w_enable=1;
  r_enable=1;
  #10;
 

  
  
  fifo_in= 80;
  w_enable=1;
  r_enable=0;
  #10;
  
  

  fifo_in= 65;
  w_enable=0;
  r_enable=1;
  #10;
  
  fifo_in= 40;
  w_enable=0;
  r_enable=1;
  #10;
  
  
 repeat(64)begin
   
  fifo_in=fifo_in+1;
  w_enable=1;
  r_enable=0;
  #10;
 end
   
  fifo_in= 40;
  w_enable=0;
  r_enable=1;
  #10;

end
endmodule
