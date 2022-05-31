`ifndef LZC_AHBRAM_VIRTUAL_SEQUENCER_SV
`define LZC_AHBRAM_VIRTUAL_SEQUENCER_SV

class lzc_ahbram_virtual_sequencer extends uvm_sequencer;

  // add sub-instances' sqr handles below for routing
  lzc_ahbram_config cfg;
  lin_ahb_master_sequencer ahb_mst_sqr;

  `uvm_component_utils(lzc_ahbram_virtual_sequencer)

  function new (string name = "lzc_ahbram_virtual_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Get configuration from test layer
    if(!uvm_config_db#(lzc_ahbram_config)::get(this,"","cfg", cfg)) begin
      `uvm_fatal("GETCFG","cannot get config object from config DB")
    end
  endfunction
endclass


`endif
