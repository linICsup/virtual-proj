`ifndef LIN_AHB_TRANSACTION_SV
`define LIN_AHB_TRANSACTION_SV

class lin_ahb_transaction extends uvm_sequence_item;
`uvm_object_utils_begin(lin_ahb_transaction)
  `uvm_object_utils_end

  function new(string name ="lin_ahb_transaction");
    super.new(name);
  endfunction

endclass

`endif // LIN_AHB_TRANSACTION_SV
