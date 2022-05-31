`ifndef LZC_AHBRAM_ENV_SV
`define LZC_AHBRAM_ENV_SV

class lzc_ahbram_env extends uvm_env;

  lin_ahb_master_agent ahb_mst;
  lzc_ahbram_config cfg;
  lzc_ahbram_virtual_sequencer virt_sqr;
  lzc_ahbram_rgm rgm;
  lzc_ahbram_reg_adapter adapter;
  uvm_reg_predictor #(lin_ahb_transaction) predictor;
  lzc_ahbram_cov cov;
  lzc_ahbram_scoreboard scb;

  `uvm_component_utils(lzc_ahbram_env)

  function new (string name = "lzc_ahbram_env", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Get configuration from test layer
    if(!uvm_config_db#(lzc_ahbram_config)::get(this,"","cfg", cfg)) begin
      `uvm_fatal("GETCFG","cannot get config object from config DB")
    end
    uvm_config_db#(lzc_ahbram_config)::set(this, "virt_sqr", "cfg", cfg);
    uvm_config_db#(lzc_ahbram_config)::set(this, "cov", "cfg", cfg);
    uvm_config_db#(lzc_ahbram_config)::set(this, "scb", "cfg", cfg);
    uvm_config_db#(lin_ahb_agent_configuration)::set(this, "ahb_mst", "cfg", cfg.ahb_cfg);
    ahb_mst = lin_ahb_master_agent::type_id::create("ahb_mst", this);
    virt_sqr = lzc_ahbram_virtual_sequencer::type_id::create("virt_sqr", this);
    if(!uvm_config_db#(lzc_ahbram_rgm)::get(this,"","rgm", rgm)) begin
      rgm = lzc_ahbram_rgm::type_id::create("rgm", this);
      rgm.build();
    end
    uvm_config_db#(lzc_ahbram_rgm)::set(this,"*","rgm", rgm);
    adapter = lzc_ahbram_reg_adapter::type_id::create("adapter", this);
    predictor = uvm_reg_predictor#(lin_ahb_transaction)::type_id::create("predictor", this);
    cov = lzc_ahbram_cov::type_id::create("cov", this);
    scb = lzc_ahbram_scoreboard::type_id::create("scb", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    virt_sqr.ahb_mst_sqr = ahb_mst.sequencer;
    rgm.map.set_sequencer(ahb_mst.sequencer, adapter);
    ahb_mst.monitor.item_observed_port.connect(predictor.bus_in);
    predictor.map = rgm.map;
    predictor.adapter = adapter;
    ahb_mst.monitor.item_observed_port.connect(cov.ahb_trans_observed_imp);
    ahb_mst.monitor.item_observed_port.connect(scb.ahb_trans_observed_imp);
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
  endfunction

  function void report_phase(uvm_phase phase);
    string reports = "\n";
    super.report_phase(phase);
    reports = {reports, $sformatf("=============================================== \n")};
    reports = {reports, $sformatf("CURRENT TEST SUMMARY \n")};
    reports = {reports, $sformatf("SEQUENCE CHECK COUNT : %0d \n", cfg.seq_check_count)};
    reports = {reports, $sformatf("SEQUENCE CHECK ERROR : %0d \n", cfg.seq_check_error)};
    reports = {reports, $sformatf("SCOREBOARD CHECK COUNT : %0d \n", cfg.scb_check_count)};
    reports = {reports, $sformatf("SCOREBOARD CHECK ERROR : %0d \n", cfg.scb_check_error)};
    reports = {reports, $sformatf("=============================================== \n")};
    `uvm_info("TEST_SUMMARY", reports, UVM_LOW)
  endfunction

endclass



`endif // LZC_AHBRAM_ENV_SV
