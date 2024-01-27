class reg_test extends uvm_test;
`uvm_component_utils(reg_test);

reg_env m_reg_env_h;
reg_sequence reg_seq;

function new(string name = "reg_test",uvm_component parent); 
super.new(name, parent);
endfunction

function void build_phase (uvm_phase phase);
  super.build_phase(phase);
  m_reg_env_h = reg_env::type_id::create("m_reg_env_h",this); 
  $display("Inside test build phase");
endfunction

task run_phase(uvm_phase phase);
	reg_seq = reg_sequence::type_id::create("reg_seq");
	reg_seq.dut_reg_model = m_reg_env_h.m_reg_block_h;
	phase.raise_objection(this);
	if(!reg_seq.randomize())
		`uvm_fatal(get_full_name(), "unable to randomize reg_seq"); 
	reg_seq.start(m_reg_env_h.m_reg_agent_h.m_reg_sequencer_h);
	phase.drop_objection(this);
	phase.phase_done.set_drain_time(this, 5000);
endtask

endclass