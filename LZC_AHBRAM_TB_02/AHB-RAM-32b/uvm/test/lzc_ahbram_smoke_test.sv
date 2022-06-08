`ifndef LZC_AHBRAM_SMOKE_TEST_SV
`define LZC_AHBRAM_SMOKE_TEST_SV

class lzc_ahbram_smoke_test extends lzc_ahbram_base_test;

  `uvm_component_utils(lzc_ahbram_smoke_test)

  function new (string name = "lzc_ahbram_smoke_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    lzc_ahbram_smoke_virt_seq seq = lzc_ahbram_smoke_virt_seq::type_id::create("this");
    super.run_phase(phase);
    phase.raise_objection(this);
    seq.start(env.virt_sqr);
    phase.drop_objection(this);
  endtask

endclass

`endif
