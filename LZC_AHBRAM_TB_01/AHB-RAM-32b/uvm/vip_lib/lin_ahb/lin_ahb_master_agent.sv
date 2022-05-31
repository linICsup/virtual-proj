`ifndef LIN_AHB_MASTER_AGENT_SV
`define LIN_AHB_MASTER_AGENT_SV

class lin_ahb_master_agent extends uvm_agent;
  lin_ahb_agent_configuration cfg;
  lin_ahb_master_driver driver;
  lin_ahb_master_sequencer sequencer;
  lin_ahb_master_monitor monitor;
  virtual lin_ahb_if vif;
`uvm_component_utils(lin_ahb_master_agent)

 function new(string name = "lin_ahb_master_agent",uvm_component parent = null);
   super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   if(!uvm_config_db#(lin_ahb_agent_configuration)::get(this,"","cfg", cfg)) begin
      `uvm_fatal("GETCFG","cannot get config object from config DB")
    end
    if(!uvm_config_db#(virtual lin_ahb_if)::get(this,"","vif", vif)) begin
      `uvm_fatal("GETVIF","cannot get vif handle from config DB")
    end
    monitor = lin_ahb_master_monitor::type_id::create("monitor",this);

    if(cfg.is_active)begin
      driver = lin_ahb_master_driver::type_id::create("driver",this);
      sequencer = lin_ahb_master_sequencer::type_id::create("sequencer",this);
    end
 endfunction

 function void connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   monitor.vif = vif;
   driver.seq_item_port.connect(sequencer.seq_item_export);
   driver.vif = vif;
   sequencer.vif = vif;
 endfunction

 task run_phase(uvm_phase phase);
   super.run_phase(phase);
 endtask

endclass

`endif // LIN_AHB_MASTER_AGENT_SV
