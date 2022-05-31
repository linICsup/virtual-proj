`ifndef LZC_AHBRAM_PKG_SV
`define LZC_AHBRAM_PKG_SV

package lzc_ahbram_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"
import lin_ahb_pkg::*;

 `include "lzc_ahbram_reg.sv"
 `include "lzc_ahbram_config.sv"
 `include "lzc_ahbram_reg_adapter.sv"
 `include "lzc_ahbram_subscriber.sv"
 `include "lzc_ahbram_cov.sv"
 `include "lzc_ahbram_scoreboard.sv"
 `include "lzc_ahbram_virtual_sequencer.sv"
 `include "lzc_ahbram_env.sv"
 `include "lzc_ahbram_seq_lib.svh"
 `include "lzc_ahbram_tests.svh"
endpackage

`endif  
