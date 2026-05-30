if {! [ file exists work ] } {
	echo "criando biblioteca WORK..."
	vlib work
	echo " "
} else {
	echo "apagando biblioteca WORK..."
	vdel -all
	echo "recriando biblioteca WORK..."
	vlib work
	echo " "
}

## Compilacao (VHDL-2008 para to_hstring e outros recursos)
vcom -2008 ./ps2_driver.vhd
vcom -2008 ./ps2_driver_golden.vhd
vcom -2008 ./ps2_driver_tb.vhd

## Simulacao
vsim -voptargs=+acc -wlfdeleteonquit work.ps2_driver_tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

## Sinais do testbench
add wave -divider {Testbench}
add wave sim:/ps2_driver_tb/clock_in
add wave sim:/ps2_driver_tb/reset_in
add wave sim:/ps2_driver_tb/clock_ps2
add wave sim:/ps2_driver_tb/data_ps2

## Saidas do DUT
add wave -divider {DUT Saidas}
add wave -radix hex sim:/ps2_driver_tb/data_p
add wave sim:/ps2_driver_tb/data_p_en

## Internos do DUT
add wave -divider {DUT Internos}
add wave sim:/ps2_driver_tb/dut/clk_sync
add wave sim:/ps2_driver_tb/dut/dat_sync
add wave sim:/ps2_driver_tb/dut/ps2_fall
add wave sim:/ps2_driver_tb/dut/state
add wave sim:/ps2_driver_tb/dut/bit_cnt
add wave -radix hex sim:/ps2_driver_tb/dut/rx_data
add wave sim:/ps2_driver_tb/dut/rx_par

## Execucao: ~6 bytes x 330 us/byte + gaps + overhead = ~4 ms
run 4 ms
