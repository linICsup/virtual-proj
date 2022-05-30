`ifndef LIN_AHB_MASTER_AGENT_SV
`define LIN_AHB_MASTER_AGENT_SV

class lin_ahb_master_agent extends uvm_agent;
`uvm_component_utils(lin_ahb_master_agent)

 function new(string name = "lin_ahb_master_agent",uvm_component parent = null);
   super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
   super.build_phase(phase);
 endfunction

 function void connect_phase(uvm_phase phase);
   super.connect_phase(phase);
 endfunction

 task run_phase(uvm_phase phase);
   super.run_phase(phase);
 endtask

endclass

`endif // LIN_AHB_MASTER_AGENT_SV
