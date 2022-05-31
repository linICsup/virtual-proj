`ifndef LZC_AHBRAM_REG_SV
`define LZC_AHBRAM_REG_SV

class lzc_ahbram_rgm extends uvm_reg_block;

  `uvm_object_utils(lzc_ahbram_rgm)

  uvm_reg_map map;
  function new(string name = "lzc_ahbram_rgm");
    super.new(name,UVM_NO_COVERAGE);
  endfunction

  virtual function build();
  map = create_map("map",'h0,4,UVM_LITTLE_ENDIAN);
  endfunction

endclass

`endif
