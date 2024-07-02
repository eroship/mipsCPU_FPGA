transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {SCC.vo}

vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU/simulation/modelsim {D:/2spring/singlecycleCPU/simulation/modelsim/top.vt}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  top_vlg_tst

add wave *
view structure
view signals
run -all
