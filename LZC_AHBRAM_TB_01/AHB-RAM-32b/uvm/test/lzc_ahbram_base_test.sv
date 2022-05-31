`ifndef LZC_AHBRAM_BASE_TEST_SV
`define LZC_AHBRAM_BASE_TEST_SV

virtual class lzc_ahbram_base_test extends uvm_test;

  lzc_ahbram_config cfg;
  lzc_ahbram_env env;
  lzc_ahbram_rgm rgm;

  function new (string name = "lzc_ahbram_base_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rgm = lzc_ahbram_rgm::type_id::create("rgm");
    rgm.build();
    uvm_config_db#(lzc_ahbram_rgm)::set(this, "env", "rgm", rgm);
    cfg = lzc_ahbram_config::type_id::create("cfg");
    cfg.rgm = rgm;
    if(!uvm_config_db#(virtual lzc_ahbram_if)::get(this,"","vif", cfg.vif))
      `uvm_fatal("GETCFG","cannot get virtual interface from config DB")
    uvm_config_db#(lzc_ahbram_config)::set(this, "env", "cfg", cfg);
    env = lzc_ahbram_env::type_id::create("env", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.phase_done.set_drain_time(this, 1us);
    phase.raise_objection(this);
    phase.drop_objection(this);
  endtask


endclass

`endif
