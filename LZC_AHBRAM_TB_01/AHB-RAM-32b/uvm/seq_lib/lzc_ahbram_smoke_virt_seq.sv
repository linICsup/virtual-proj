`ifndef LZC_AHBRAM_SMOKE_VIRT_SEQ_SV
`define LZC_AHBRAM_SMOKE_VIRT_SEQ_SV


class lzc_ahbram_smoke_virt_seq extends lzc_ahbram_base_virtual_sequence;
  `uvm_object_utils(lzc_ahbram_smoke_virt_seq)

  function new (string name = "lzc_ahbram_smoke_virt_seq");
    super.new(name);
  endfunction

  virtual task body();
    super.body();
    `uvm_info("body", "Entered...", UVM_LOW)

    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

endclass


`endif 
