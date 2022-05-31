`ifndef LZC_AHBRAM_REG_ADAPTER_SV
`define LZC_AHBRAM_REG_ADAPTER_SV

class lzc_ahbram_reg_adapter extends uvm_reg_adapter;
  `uvm_object_utils(lzc_ahbram_reg_adapter)
  function new(string name = "lzc_ahbram_reg_adapter");
    super.new(name);
    provides_responses = 1;
  endfunction
  function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);

  endfunction
  function void bus2reg(uvm_sequence_item bus_item,ref uvm_reg_bus_op rw);
    
  endfunction
endclass

`endif // LZC_AHBRAM_REG_ADAPTER_SV
