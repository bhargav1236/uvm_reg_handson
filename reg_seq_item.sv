class reg_seq_item extends uvm_sequence_item;


rand bit wr_en;
rand bit addr_vld;
rand bit [2:0]addr;
rand bit [31:0]din;

rand bit [31:0] dout;
 rand bit dout_vld;
 //Declared uvm_field macros to see in log when print function is used in adapter
`uvm_object_utils_begin(reg_seq_item)
	`uvm_field_int(wr_en,UVM_ALL_ON)
	`uvm_field_int(addr_vld,UVM_ALL_ON)
	`uvm_field_int(addr,UVM_ALL_ON)
	`uvm_field_int(din,UVM_ALL_ON)
	`uvm_field_int(dout,UVM_ALL_ON)
	`uvm_field_int(dout_vld,UVM_ALL_ON)
`uvm_object_utils_end
function new(string name = "reg_seq_item");
	super.new(name);
endfunction

endclass