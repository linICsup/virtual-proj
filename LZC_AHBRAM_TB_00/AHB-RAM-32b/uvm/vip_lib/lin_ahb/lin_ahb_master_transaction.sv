`ifndef LIN_AHB_MASTER_TRANSACTION_SV
`define LIN_AHB_MASTER_TRANSACTION_SV

class lin_ahb_master_transaction extends lin_ahb_transaction;
`uvm_object_utils_begin(lin_ahb_master_transaction)
  `uvm_object_utils_end

  function new(string name ="lin_ahb_master_transaction");
    super.new(name);
  endfunction

endclass

`endif // LIN_AHB_MASTER_TRANSACTION_SV
