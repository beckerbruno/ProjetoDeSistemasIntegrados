###############################################################################
# Constraints (SDC) - Trabalho Final - Driver I2C
#
# Clock master: 100 MHz  -> periodo de 10.0 ns
# Compativel com Synopsys Design Compiler e Intel/Altera Quartus (TimeQuest).
###############################################################################

# -----------------------------------------------------------------------------
# Definicao do clock master (100 MHz)
# -----------------------------------------------------------------------------
create_clock -name clock -period 10.000 [get_ports clock]

# Incerteza de clock (jitter/skew estimado)
set_clock_uncertainty 0.100 [get_clocks clock]

# -----------------------------------------------------------------------------
# Reset assincrono: nao deve participar da analise de timing sincrona
# -----------------------------------------------------------------------------
set_false_path -from [get_ports reset]

# -----------------------------------------------------------------------------
# Atrasos de entrada (20% do periodo) - entradas amostradas pelo clock
# -----------------------------------------------------------------------------
set_input_delay  -clock clock 2.000 [get_ports {data_p[*]}]
set_input_delay  -clock clock 2.000 [get_ports enable]

# -----------------------------------------------------------------------------
# Atrasos de saida (20% do periodo)
# As saidas I2C (scl/sda) sao de baixa frequencia (<=100 kHz); ainda assim
# restringimos para garantir caminhos bem comportados em relacao ao clock.
# -----------------------------------------------------------------------------
set_output_delay -clock clock 2.000 [get_ports busy]
set_output_delay -clock clock 2.000 [get_ports scl]
set_output_delay -clock clock 2.000 [get_ports sda]

# -----------------------------------------------------------------------------
# Carga de saida e drive de entrada (valores ilustrativos)
# -----------------------------------------------------------------------------
set_load 0.050 [all_outputs]
