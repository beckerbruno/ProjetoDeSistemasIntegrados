###############################################################################
# Script de Sintese Logica - Trabalho Final - Driver I2C
# Ferramenta: Synopsys Design Compiler (dc_shell -f synthesis.tcl)
#
# Gera os relatorios exigidos:
#   - reports/timing.rpt  (Relatorio de Timing)
#   - reports/area.rpt    (Relatorio de Area)
#   - reports/power.rpt   (Relatorio de Potencia)
#
# OBS.: ajuste target_library / link_library para a biblioteca de celulas
#       (tecnologia) disponivel no seu ambiente antes de executar.
###############################################################################

set DESIGN_NAME i2c_driver

# -----------------------------------------------------------------------------
# Bibliotecas de tecnologia (AJUSTAR conforme o ambiente / PDK do laboratorio)
# -----------------------------------------------------------------------------
# Exemplo:
#   set target_library  "saed32rvt_tt0p78v125c.db"
#   set link_library    "* $target_library"
if {![info exists target_library] || $target_library eq ""} {
    puts "AVISO: defina 'target_library' e 'link_library' antes de compilar."
}

# -----------------------------------------------------------------------------
# Diretorios de trabalho
# -----------------------------------------------------------------------------
file mkdir reports
file mkdir work

# -----------------------------------------------------------------------------
# Leitura / elaboracao do RTL
# -----------------------------------------------------------------------------
analyze -format vhdl ./i2c_driver.vhd
elaborate $DESIGN_NAME
current_design $DESIGN_NAME
link

# -----------------------------------------------------------------------------
# Constraints
# -----------------------------------------------------------------------------
source ./i2c_driver.sdc

# -----------------------------------------------------------------------------
# Sintese
# -----------------------------------------------------------------------------
set_max_area 0
compile_ultra

# -----------------------------------------------------------------------------
# Relatorios exigidos
# -----------------------------------------------------------------------------
report_timing       > ./reports/timing.rpt
report_area         > ./reports/area.rpt
report_power        > ./reports/power.rpt

# Netlist e constraints sintetizados (opcional)
write -format verilog -hierarchy -output ./reports/${DESIGN_NAME}_netlist.v
write_sdc ./reports/${DESIGN_NAME}_synth.sdc

puts "Sintese concluida. Relatorios em ./reports/"
exit
