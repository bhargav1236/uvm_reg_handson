class reg_adapter extends uvm_reg_adapter;
`uvm_object_utils(reg_adapter);

function new(string name = "reg_adapter");
super.new(name);
endfunction

virtual function uvm_sequence_item reg2bus (const ref uvm_reg_bus_op rw);
reg_seq_item reg_item;
reg_item = reg_seq_item::type_id::create("reg_item");

reg_item.addr = rw.addr;
reg_item.din = rw.data;
reg_item.wr_en= (rw.kind == UVM_WRITE)?1: 0;
`uvm_info(get_full_name(), "Printing the reg_item in reg2bus function", UVM_LOW);
reg_item.print();
return reg_item;
endfunction

virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
reg_seq_item reg_item;
reg_item = reg_seq_item::type_id::create("reg_item");

if(!$cast(reg_item, bus_item)) begin
`uvm_fatal(get_name(), "casting failed");
end
`uvm_info(get_full_name(), "Printing the reg_item in bus2reg function", UVM_LOW);
reg_item.print();
rw.addr = reg_item.addr;
rw.data = reg_item.dout;
rw.kind = (reg_item.wr_en == 1)? UVM_WRITE: UVM_READ;
rw.status = UVM_IS_OK;
endfunction
endclass