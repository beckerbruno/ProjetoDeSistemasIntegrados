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

## Compilacao (VHDL-2008 para to_hstring / to_x01)
vcom -2008 ./i2c_driver.vhd
vcom -2008 ./i2c_driver_tb.vhd

## Simulacao
vsim -voptargs=+acc -wlfdeleteonquit work.i2c_driver_tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

## Sinais do testbench
add wave -divider {Testbench}
add wave sim:/i2c_driver_tb/clock
add wave sim:/i2c_driver_tb/reset
add wave sim:/i2c_driver_tb/enable
add wave -radix hex sim:/i2c_driver_tb/data_p

## Barramento I2C
add wave -divider {Barramento I2C}
add wave sim:/i2c_driver_tb/busy
add wave sim:/i2c_driver_tb/scl
add wave sim:/i2c_driver_tb/sda

## Monitor / verificacao
add wave -divider {Monitor}
add wave -radix hex sim:/i2c_driver_tb/got_addr
add wave -radix hex sim:/i2c_driver_tb/got_data
add wave sim:/i2c_driver_tb/frame_cnt
add wave sim:/i2c_driver_tb/err_cnt

## Internos do DUT
add wave -divider {DUT Internos}
add wave sim:/i2c_driver_tb/dut/state
add wave sim:/i2c_driver_tb/dut/phase
add wave sim:/i2c_driver_tb/dut/bit_cnt
add wave -radix hex sim:/i2c_driver_tb/dut/shift_reg

## Execucao: 6 transacoes x ~360 us + gaps + overhead
run 3 ms
