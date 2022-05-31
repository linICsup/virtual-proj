`ifndef LZC_AHBRAM_CONFIG_SV
`define LZC_AHBRAM_CONFIG_SV

class lzc_ahbram_config extends uvm_object;

  int seq_check_count;
  int seq_check_error;

  int scb_check_count;
  int scb_check_error;

  bit enable_cov = 1;
  bit enable_scb = 1;

  lin_ahb_agent_configuration ahb_cfg;
  virtual lzc_ahbram_if vif;
  lzc_ahbram_rgm rgm;

  `uvm_object_utils(lzc_ahbram_config)

  // USER to specify the config items
  
  function new (string name = "lzc_ahbram_config");
    super.new(name);
    ahb_cfg = lin_ahb_agent_configuration::type_id::create("ahb_cfg");
  endfunction : new

endclass

`endif // LZC_AHBRAM_CONFIG_SV
