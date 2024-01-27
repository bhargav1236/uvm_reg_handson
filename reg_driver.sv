class reg_driver extends uvm_driver#(reg_seq_item, reg_seq_item);
`uvm_component_utils(reg_driver);

rand reg_seq_item reg_item; 
virtual reg_model_interface reg_intf;

function new(string name = "reg_driver", uvm_component parent);
super.new(name, parent);
endfunction

 function void build_phase (uvm_phase phase);
 super.build_phase(phase);
 if(!uvm_config_db#(virtual reg_model_interface)::get(this, "", "reg_intf", reg_intf))
  `uvm_fatal(get_full_name(), "Driver unable to access interface");
  
 endfunction
 
 task toggle_rst();
 reg_intf.rst <= 1;
 repeat (5) @(posedge reg_intf.clk);
 reg_intf.rst <=0;
 endtask

task drive_reg_design();
 @(posedge reg_intf.clk);
	reg_intf.wr_en <= reg_item.wr_en;
	reg_intf.addr_vld <= 1; 
	reg_intf.addr <= reg_item.addr;
	if (reg_item.wr_en) begin 
		reg_intf.din <= reg_item.din;
	end
	else begin
		@(posedge reg_intf.dout_vld);
		reg_item.dout = reg_intf.dout;
		`uvm_info(get_full_name(), $psprintf("reg_item.dout:: %h", reg_item.dout), UVM_LOW);
	end
	
	@(posedge reg_intf.clk);
	reg_intf.addr_vld <= 0;
 endtask

 task start_driving();
 
forever begin
reg_item = reg_seq_item::type_id::create("reg_item");
seq_item_port.get_next_item(reg_item);
drive_reg_design();
seq_item_port.item_done();
end

endtask

task run_phase (uvm_phase phase);

toggle_rst();

start_driving();
endtask

endclass