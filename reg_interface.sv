interface reg_model_interface (input logic clk );

logic rst;
logic wr_en;
logic addr_vld;
logic [2:0]addr;
logic [31:0]din;

logic [31:0] dout;
logic dout_vld;

 clocking cb @(posedge clk);
 default input #1 output #0;
 input wr_en;
 input addr_vld;
 input addr;
 input din;


//output dout;
//output dout_vld;
endclocking



endinterface