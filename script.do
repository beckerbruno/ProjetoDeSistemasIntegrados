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

## comando de compilação.
vcom 	./ps2_driver.vhd
vcom	./ps2_driver_tb.vhd

## comando de simulação
vsim -voptargs=+acc -wlfdeleteonquit work.ps2_driver_tb
	
set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1 

## adição dos sinais na forma de onda.
add wave sim:/*
add wave -divider dut
add wave sim:/dut/*

#do wave.do

## execução da simulação.
run 25500 ns
