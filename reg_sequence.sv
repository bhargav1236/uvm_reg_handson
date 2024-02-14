class reg_sequence extends uvm_sequence;
`uvm_object_utils(reg_sequence);

reg_block dut_reg_model;


function new(string name = "reg_sequence");
super.new(name);
endfunction

 task body();

 uvm_status_e status;
 bit [31:0] value_wr;
 bit [31:0] value_rd;
 string block_name;
 uvm_reg_block root_blk[$];
 uvm_reg_map maps[$];
 uvm_reg regs[$];
 uvm_reg_field fields[$];


//uvm_reg_block access methods
 block_name = dut_reg_model.get_name();
 `uvm_info(get_full_name(), $psprintf("block_name: %0s", block_name), UVM_LOW);

 block_name = dut_reg_model.get_full_name();
 `uvm_info(get_full_name(), $psprintf("block_name: %0s", block_name), UVM_LOW);

 root_blk.delete();
 uvm_reg_block::get_root_blocks(root_blk);

 foreach (root_blk[i]) begin
`uvm_info(get_full_name(), $psprintf("uvm_reg_block::get_root_blocks: %0s", root_blk[i].get_full_name()), UVM_LOW);
end
root_blk.delete();
reg_block::get_root_blocks(root_blk);

foreach (root_blk[i]) begin
`uvm_info(get_full_name(), $psprintf("reg_block::get_root_blocks: %0s", root_blk[i].get_full_name()), UVM_LOW);
end

 dut_reg_model.get_maps(maps);
 foreach (maps[i]) begin
 `uvm_info(get_full_name(), $psprintf("dut_reg_model.get_maps (maps): %0s", maps[i].get_full_name()), UVM_LOW);
 end

 dut_reg_model.get_registers(regs);
//dut_reg_model.get_registers(regs); get_registers function will not delete the existing elements in queues
 foreach (regs[i]) begin
 `uvm_info(get_full_name(), $psprintf("dut_reg_model get registers(regs): %0s", regs[i].get_full_name()), UVM_LOW);
 end
 dut_reg_model.get_fields(fields);
 foreach (fields[i]) begin
 `uvm_info(get_full_name(), $psprintf("dut_reg_model.get fields(fields): %0s", fields[i].get_full_name()), UVM_LOW);
 end

//uvm_reg_map Access methods
 //dut_reg_model.default_map.get_name
 `uvm_info (get_full_name(), $psprintf("dut_reg_model default_map.get name: %0s", dut_reg_model.default_map.get_name), UVM_LOW); 
 `uvm_info (get_full_name(), $psprintf("dut_reg_model.default_map.get_full_name: %0s", dut_reg_model.default_map.get_full_name), UVM_LOW);
 `uvm_info (get_full_name(), $psprintf("dut_reg_model.default_map.get_parent.get_full_name: %0s", dut_reg_model.default_map.get_parent.get_full_name), UVM_LOW); 
 `uvm_info (get_full_name(), $psprintf("dut_reg_model default_map.get_n_bytes: %0h", dut_reg_model.default_map.get_n_bytes), UVM_LOW); 
 `uvm_info (get_full_name(), $psprintf("dut_reg_model default_map.get_addr_unit_bytes: %0h", dut_reg_model.default_map.get_addr_unit_bytes), UVM_LOW);
 `uvm_info (get_full_name(), $psprintf("dut_reg_model default_map.ger_base_addr: %0h", dut_reg_model.default_map.get_base_addr), UVM_LOW);
 `uvm_info (get_full_name(), $psprintf("dut_reg_model default_map.get_sequencer.get_full_name: %0s", dut_reg_model.default_map.get_sequencer.get_full_name), UVM_LOW); 
 `uvm_info (get_full_name(), $psprintf("dut_reg_model default_map.get_adapter.get_full_name: %0s", dut_reg_model.default_map.get_adapter.get_full_name), UVM_LOW); 
 `uvm_info (get_full_name(), $psprintf("dut_reg_model.default map get_auto_predict: %0h", dut_reg_model.default_map.get_auto_predict), UVM_LOW);

 regs.delete();// get_registers function will not delete the existing elements in queues
 dut_reg_model.default_map.get_registers(regs);
 foreach (regs[i]) begin
 `uvm_info(get_full_name(), $psprintf("dut_reg_model.default_map.get_registers(regs): %s", regs[i].get_full_name()), UVM_LOW);
 end

 fields.delete();// get fields function will not delete the existing elements in queues
 dut_reg_model.default_map.get_fields(fields); 
 foreach (fields[i]) begin
`uvm_info (get_full_name(), $psprintf("dut_reg model.default_map.get_fields(fields): %0s", fields[i].get_full_name()), UVM_LOW);
 end
value_wr = 32'hFFFFFFFF;
dut_reg_model.reg_a_model_inst.write(status, value_wr);
dut_reg_model.reg_b_model_inst.write(status, value_wr);
dut_reg_model.reg_a_model_inst.read(status, value_rd);
`uvm_info(get_full_name(), $psprintf("Read: reg_a status %0h Value: %0d", status, value_rd), UVM_LOW);
dut_reg_model.reg_b_model_inst.read(status, value_rd); 
`uvm_info(get_full_name(), $psprintf("Read: reg_b status %0h Value: %0d", status, value_rd), UVM_LOW);
dut_reg_model.reg_a_model_inst.mirror(status, UVM_CHECK);
value_rd = dut_reg_model.reg_a_model_inst.get(); 
value_rd = dut_reg_model.reg_a_model_inst.get_mirrored_value();
dut_reg_model.reg_a_model_inst.read(status, value_rd); 
`uvm_info(get_full_name(), $psprintf("Read: reg_a status %0d value %0d", status, value_rd), UVM_LOW);

endtask

endclass