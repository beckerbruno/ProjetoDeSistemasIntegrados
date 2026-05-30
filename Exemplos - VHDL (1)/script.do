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
vcom 	./decoder_scancode_ascii_map.vhd
vcom	./golden.vhd
vcom	./golden2.vhd
vcom	./golden3.vhd
vcom	./golden4.vhd
vcom	./decoder_scancode_ascii_tb.vhd

## comando de simulação
vsim -voptargs=+acc -wlfdeleteonquit work.decoder_scancode_ascii_tb
	
set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1 

## adição dos sinais na forma de onda.
add wave sim:/*


## execução da simulação.
run 2550 ns
