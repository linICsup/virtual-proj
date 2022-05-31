
module lzc_ahbram_tb;
import uvm_pkg::*;
`include "uvm_macros.svh"
import lzc_ahbram_pkg::*;

ahb_blockram_32 dut();

lin_ahb_if ahb_if();

lzc_ahbram_if ahbram_if();

initial begin
  uvm_config_db#(virtual lin_ahb_if)::set(uvm_root::get(), "uvm_test_top.env.ahb_mst","vif",ahb_if);
  uvm_config_db#(virtual lzc_ahbram_if)::set(uvm_root::get(),"uvm_test_top","vif",ahbram_if);
  uvm_config_db#(virtual lzc_ahbram_if)::set(uvm_root::get(),"uvm_test_top.env","vif",ahbram_if);
  uvm_config_db#(virtual lzc_ahbram_if)::set(uvm_root::get(),"uvm_test_top.env.virt_sqr","vif",ahbram_if);

  run_test();
end

endmodule
