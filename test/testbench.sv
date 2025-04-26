`include "interface.sv"
`include "test"
module tbench_top;
  logic clk;
  
  intf i_intf();
  
  test t1(i_intf);
  
  initial
    clk=0;
  always
    #1 clk=~clk;
    
  
  gray_code_counter #(.WIDTH(4)) dut(
    .en(i_intf.en),
        .clk(clk),
        .rst_n(i_intf.rst_n),
        .gray_code(i_intf.gray_code),
     .count(i_intf.count)
    );
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
  
endmodule