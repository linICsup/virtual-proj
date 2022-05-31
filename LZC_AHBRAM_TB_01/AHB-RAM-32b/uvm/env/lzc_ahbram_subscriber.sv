`ifndef LZC_AHBRAM_SUBSCRIBER_SV
`define LZC_AHBRAM_SUBSCRIBER_SV

class lzc_ahbram_subscriber extends uvm_component;

  // analysis import
  uvm_analysis_imp #(lin_ahb_transaction, lzc_ahbram_subscriber) ahb_trans_observed_imp;

  // events delcared

  protected uvm_event_pool _ep;
  
  lzc_ahbram_config cfg;
  virtual lzc_ahbram_if vif;

  `uvm_component_utils(lzc_ahbram_subscriber)

  function new (string name = "lzc_ahbram_subscriber", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ahb_trans_observed_imp = new("ahb_trans_observed_imp", this);
    // Get configuration from test layer
    if(!uvm_config_db#(lzc_ahbram_config)::get(this,"","cfg", cfg)) begin
      `uvm_fatal("GETCFG","cannot get config object from config DB")
    end
    vif = cfg.vif;
    // Local event pool and events creation
    _ep = new("_ep");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    do_events_trigger();
    do_listen_events();
  endtask

  virtual function void write(lin_ahb_transaction tr);
  endfunction

  virtual task do_events_trigger();
  endtask

  virtual task do_listen_events();
  endtask

endclass

`endif
