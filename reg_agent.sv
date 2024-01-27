class reg_agent extends uvm_agent;
`uvm_component_utils(reg_agent);

reg_driver m_reg_driver_h;
reg_sequencer m_reg_sequencer_h;

function new(string name = "reg_agent", uvm_component parent);
	super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
m_reg_driver_h = reg_driver::type_id::create("m_reg_driver_h",this);
m_reg_sequencer_h = reg_sequencer::type_id::create("m_reg_sequencer_h", this);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
m_reg_driver_h.seq_item_port.connect(m_reg_sequencer_h.seq_item_export);
endfunction


endclass