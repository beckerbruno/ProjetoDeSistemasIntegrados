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

## comandos de compilacao (ordem de dependencia: folhas -> uart_rx -> testbench).
vcom	./sync.vhd
vcom	./baud_gen.vhd
vcom	./shift_reg.vhd
vcom	./fsm_ctrl.vhd
vcom	./uart_rx.vhd
vcom	./uart_rx_tb.vhd

## comando de simulacao
vsim -voptargs=+acc -wlfdeleteonquit work.uart_rx_tb

set StdArithNoWarnings 1
set StdVitalGlitchNoWarnings 1

## adicao dos sinais na forma de onda.
add wave sim:/*
## para ver tambem os sinais internos do DUT (FSM, baud tick, shift reg), use:
# add wave -r sim:/*

## execucao da simulacao.
## o testbench se auto-encerra com 'severity failure'; run -all roda ate la.
run 3000000000 ns
