class reg_seq_item extends uvm_sequence_item;
`uvm_object_utils(reg_seq_item);

rand bit wr_en;
rand bit addr_vld;
rand bit [2:0]addr;
rand bit [31:0]din;

rand bit [31:0] dout;
 rand bit dout_vld;
 
function new(string name = "reg_seq_item");
	super.new(name);
endfunction

endclass