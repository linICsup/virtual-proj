`ifndef LIN_AHB_SEQUENCER_SV
`define LIN_AHB_SEQUENCER_SV

class lin_ahb_sequencer #(type REQ = lin_ahb_transaction, type RSP = REQ)extends uvm_sequencer#(REQ, RSP);
`uvm_component_utils(lin_ahb_sequencer)

 function new(string name = "lin_ahb_sequencer",uvm_component parent = null);
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

`endif // LIN_AHB_SEQUENCER_SV
