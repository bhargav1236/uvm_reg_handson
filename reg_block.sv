class reg_block extends uvm_reg_block;
`uvm_object_utils(reg_block);

rand reg_a_model reg_a_model_inst;
rand reg_b_model reg_b_model_inst;
rand reg_c_model reg_c_model_inst; 
rand reg_d_model reg_d_model_inst;

uvm_reg_map default_map;

function new(string name = "reg_block");
super.new(name);
endfunction

function void build();
default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 0);

reg_a_model_inst = new("reg_a_model_inst");
reg_a_model_inst.configure(this);
reg_a_model_inst.build();
default_map.add_reg(reg_a_model_inst, 32'd0, "RW");

reg_b_model_inst = new("reg_b_model_inst");
reg_b_model_inst.configure(this);
reg_b_model_inst.build();
default_map.add_reg(reg_b_model_inst, 32'd1, "RW");

reg_c_model_inst = new("reg_c_model_inst");
reg_c_model_inst.configure(this);
reg_c_model_inst.build();
default_map.add_reg(reg_c_model_inst, 32'd2, "RW");

reg_d_model_inst = new("reg_d_model_inst");
reg_d_model_inst.configure(this);
reg_d_model_inst.build(); 
default_map.add_reg(reg_d_model_inst, 32'd3, "RW");


endfunction
endclass