class reg_a_model extends uvm_reg;
`uvm_object_utils(reg_a_model);

rand uvm_reg_field reg_a_model_field;

function new(string name = "reg_a_model"); 
super.new(name, 32, 0);
endfunction

function void build();
 reg_a_model_field = new("reg_a_model_field");
 reg_a_model_field.configure(this, 32, 0, "RW", 0,0,1,1,0);
endfunction

endclass

class reg_b_model extends uvm_reg;
`uvm_object_utils(reg_b_model);

rand uvm_reg_field reg_b_model_field;

function new(string name = "reg_b_model");
super.new(name, 32, 0);
endfunction

function void build();
reg_b_model_field = new("reg_b_model_field");
reg_b_model_field.configure(this, 32, 0, "RW", 0,0,1,1,0);
endfunction

endclass

class reg_c_model extends uvm_reg;
`uvm_object_utils(reg_c_model);

rand uvm_reg_field reg_c_model_field;

function new(string name = "reg_c_model");
super.new(name, 32,0);
endfunction

function void build();
reg_c_model_field = new("reg_c_model_field");
reg_c_model_field.configure(this, 32, 0, "RW", 0, 0,1,1,0);
endfunction

endclass

class reg_d_model extends uvm_reg; 
`uvm_object_utils(reg_d_model);

 rand uvm_reg_field reg_d_model_field;
 
 function new(string name = "reg_d_model");
super.new(name, 32, 0);
endfunction

function void build();
reg_d_model_field = new("reg_d_model_field"); 
reg_d_model_field.configure(this, 32, 0, "RW", 0,0,1,1,0);
endfunction

endclass