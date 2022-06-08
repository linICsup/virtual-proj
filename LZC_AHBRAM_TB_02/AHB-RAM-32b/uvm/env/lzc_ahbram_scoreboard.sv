`ifndef LZC_AHBRAM_SCOREBOARD_SV
`define LZC_AHBRAM_SCOREBOARD_SV

class lzc_ahbram_scoreboard extends lzc_ahbram_subscriber;

  `uvm_component_utils(lzc_ahbram_scoreboard)

  function new(string name = "lzc_ahbram_scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    do_data_check();
  endtask

  virtual task do_data_check();
  endtask

  task do_listen_events();
  endtask
endclass

`endif
