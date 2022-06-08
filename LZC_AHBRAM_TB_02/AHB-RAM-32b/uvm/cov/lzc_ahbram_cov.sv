`ifndef LZC_AHBRAM_COV_SV
`define LZC_AHBRAM_COV_SV

class lzc_ahbram_cov extends lzc_ahbram_subscriber;

  `uvm_component_utils(lzc_ahbram_cov)

  function new (string name = "lzc_ahbram_cov", uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task do_listen_events();
  endtask

endclass

`endif
