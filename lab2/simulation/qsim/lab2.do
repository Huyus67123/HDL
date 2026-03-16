onerror {quit -f}
vlib work
vlog -work work lab2.vo
vlog -work work lab2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.count_4bit_vlg_vec_tst
vcd file -direction lab2.msim.vcd
vcd add -internal count_4bit_vlg_vec_tst/*
vcd add -internal count_4bit_vlg_vec_tst/i1/*
add wave /*
run -all
