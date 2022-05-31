`ifndef LIN_AHB_CONFIGURATION_SV
`define LIN_AHB_CONFIGURATION_SV

class lin_ahb_configuration extends uvm_object;
`uvm_object_utils_begin(lin_ahb_configuration)
  `uvm_object_utils_end

  function new(string name ="lin_ahb_configuration");
    super.new(name);
  endfunction

endclass

`endif // LIN_AHB_CONFIGURATION_SV
