`ifndef LZC_AHBRAM_BASE_VIRTUAL_SEQUENCE_SV
`define LZC_AHBRAM_BASE_VIRTUAL_SEQUENCE_SV

class lzc_ahbram_base_virtual_sequence extends uvm_sequence;


  lzc_ahbram_config cfg;
  virtual lzc_ahbram_if vif;
  lzc_ahbram_rgm rgm;
  bit[31:0] wr_val, rd_val;
  uvm_status_e status;
  `uvm_object_utils(lzc_ahbram_base_virtual_sequence)
  `uvm_declare_p_sequencer(lzc_ahbram_virtual_sequencer)

  function new (string name = "lzc_ahbram_base_virtual_sequence");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_info("body", "Entered...", UVM_LOW)
    // get cfg from p_sequencer
    cfg = p_sequencer.cfg;
    vif = cfg.vif;
    rgm = cfg.rgm;
    // TODO in sub-class
    `uvm_info("body", "Exiting...", UVM_LOW)
  endtask

  virtual function void compare_data(logic[31:0] val1, logic[31:0] val2);
    cfg.seq_check_count++;
    if(val1 === val2)
      `uvm_info("CMPSUC", $sformatf("val1 'h%0x === val2 'h%0x", val1, val2), UVM_LOW)
    else begin
      cfg.seq_check_error++;
      `uvm_error("CMPERR", $sformatf("val1 'h%0x !== val2 'h%0x", val1, val2))
    end
  endfunction


  task wait_reset_signal_assertted();
      @(posedge vif.rstn);
  endtask

  task wait_reset_signal_released();
      @(negedge vif.rstn);
  endtask

endclass

`endif  
