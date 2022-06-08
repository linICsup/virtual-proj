`ifndef LIN_AHB_TRANSACTION_SV
`define LIN_AHB_TRANSACTION_SV

class lin_ahb_transaction extends uvm_sequence_item;

  rand bit [`LIN_AHB_MAX_DATA_WIDTH - 1:0] data[];
  rand bit [`LIN_AHB_MAX_DATA_WIDTH - 1:0] addr = 0;
  rand burst_size_enum burst_size = BURST_SIZE_8BIT;
  rand burst_type_enum burst_type = SINGLE;
  rand response_type_enum response_type = OKAY;
  trans_type_enum trans_type;
  response_type_enum all_beat_response[];
  int current_data_beat_num;
  status_enum status = INITIAL;

  rand bit idle_xact_hwrite = 1;


  `uvm_object_utils_begin(lin_ahb_transaction)
  `uvm_object_utils_end

  function new(string name ="lin_ahb_transaction");
    super.new(name);
  endfunction
  
endclass

`endif // LIN_AHB_TRANSACTION_SV
