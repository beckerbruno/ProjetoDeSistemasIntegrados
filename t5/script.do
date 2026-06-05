# Script de simulacao para ModelSim/QuestaSim
# Trabalho 5 - UART RX

# Cria biblioteca de trabalho
vlib work
vmap work work

# Compila os arquivos VHDL
vcom -2008 uart_rx.vhd
vcom -2008 uart_rx_tb.vhd

# Inicia simulacao
vsim -voptargs=+acc work.uart_rx_tb

# Configura waveform
add wave -noupdate -divider "System"
add wave -noupdate /uart_rx_tb/clock_in
add wave -noupdate /uart_rx_tb/reset_in

add wave -noupdate -divider "UART RX"
add wave -noupdate /uart_rx_tb/rx
add wave -noupdate /uart_rx_tb/dut/rx_sync
add wave -noupdate /uart_rx_tb/dut/rx_fall
add wave -noupdate /uart_rx_tb/dut/baud_tick
add wave -noupdate /uart_rx_tb/dut/state
add wave -noupdate /uart_rx_tb/dut/sample_cnt
add wave -noupdate /uart_rx_tb/dut/bit_cnt
add wave -noupdate /uart_rx_tb/dut/rx_shift
add wave -noupdate /uart_rx_tb/dut/rx_data

add wave -noupdate -divider "Output"
add wave -noupdate /uart_rx_tb/data_p
add wave -noupdate /uart_rx_tb/data_p_en
add wave -noupdate /uart_rx_tb/rx_count

# Configura formatacao
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 1

# Executa simulacao completa
run -all

# Zoom para ajustar waveform
wave zoom full
