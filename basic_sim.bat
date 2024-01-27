if exist "work\" rd /q /s "work\"
mkdir work
vlib work
vmap work work
vlog -work work %1
vsim -vopt -voptargs=+acc -sv_seed random -c hdl_top hvl_top -do "run -all;exit"