module hdl_top;

logic clk = 0;
logic rst = 0;

reg_model_interface reg_intf(clk);

reg_design dut (
.clk(reg_intf.clk),
.rst(reg_intf.rst),
.wr_en(reg_intf.wr_en),
.addr_vld(reg_intf.addr_vld),
.addr(reg_intf.addr),
.din(reg_intf.din),

.dout(reg_intf.dout), 
.dout_vld(reg_intf.dout_vld)
);

 always #5 clk = ~clk;

 initial begin
 import uvm_pkg::uvm_config_db;
 uvm_config_db #(virtual reg_model_interface)::set(null, "uvm_test_top.m_reg_env_h.m_reg_agent_h.m_reg_driver_h", "reg_intf",reg_intf);
 end
 initial begin
 if ($test$plusargs("enable_dump")) begin
 $dumpfile("dump.vcd");
 $dumpvars;
 end
 end
 endmodule