transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/top.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/delay.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/control.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/myShow.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/ALU.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/PC.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/regFile.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/extend.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/divider.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/instROM.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/memRAM.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/mux_ALUsrc.v}
vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU {D:/2spring/singlecycleCPU/mux_memToReg.v}

vlog -vlog01compat -work work +incdir+D:/2spring/singlecycleCPU/simulation/modelsim {D:/2spring/singlecycleCPU/simulation/modelsim/top.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  top_vlg_tst

add wave *
view structure
view signals
run -all
