class reg_env extends uvm_env;
`uvm_component_utils(reg_env)

reg_agent m_reg_agent_h; 
reg_block m_reg_block_h;
reg_adapter m_reg_adapter_h;

reg_block dut_reg_model;

function new (string name = "reg_env", uvm_component parent);
super.new(name, parent);
 endfunction
 
 function void build_phase(uvm_phase phase); 
 super.build_phase(phase);
 m_reg_agent_h = reg_agent::type_id::create("m_reg_agent_h", this);
 
 m_reg_block_h = reg_block::type_id::create("m_reg_block_h", this);
 m_reg_block_h.build();
 m_reg_adapter_h = reg_adapter::type_id::create("m_reg_adapter_h",this);
 
 m_reg_block_h.default_map.set_auto_predict(); 
 m_reg_block_h.add_hdl_path("dut", "reg_model");
 m_reg_block_h.lock_model();
 
 
 
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
m_reg_block_h.default_map.set_sequencer(.sequencer(m_reg_agent_h.m_reg_sequencer_h), .adapter(m_reg_adapter_h));
m_reg_block_h.default_map.set_base_addr(0);
endfunction

endclass