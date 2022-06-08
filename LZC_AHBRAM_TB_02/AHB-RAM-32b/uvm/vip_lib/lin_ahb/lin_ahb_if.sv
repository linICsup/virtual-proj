`ifndef LIN_AHB_IF_SV
`define LIN_AHB_IF_SV

interface lin_ahb_if;

  logic                                   hclk;
  logic                                   hresetn;

  logic                                   hgrant;
  logic [(`LIN_AHB_MAX_DATA_WIDTH - 1):0] hrdata;
  logic                                   hready;
  logic [1:0]                             hresp;
  logic [(`LIN_AHB_MAX_ADDR_WIDTH - 1):0] haddr;
  logic [2:0]                             hburst;
  logic                                   hbusreq;
  logic                                   hlock;
  logic [3:0]                             hport;
  logic [2:0]                             hsize;
  logic [1:0]                             htrans;
  logic [(`LIN_AHB_MAX_DATA_WIDTH - 1):0] hwdata;
  logic                                   hwrite;


  
endinterface

`endif // LIN_AHB_IF_SV
