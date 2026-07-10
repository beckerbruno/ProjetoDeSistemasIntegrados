# =========================================================
# Script de sintese - Cadence Genus
# Trabalho Final - Driver I2C
# (adaptado do template do Prof. Marlon Moraes)
#
# Como rodar (na maquina do laboratorio):
#   cd sintese
#   genus -f sintese.tcl
#
# Saidas:
#   reports/timing.rpt   -> Relatorio de Timing
#   reports/area.rpt     -> Relatorio de Area
#   reports/power.rpt    -> Relatorio de Potencia
#   netlist/i2c_driver_mapped.v
# =========================================================

# Caminho para a biblioteca de celulas (STM 65 nm, mesma do template)
set_db library /soft64/design-kits/stm/65nm-cmos065/CORE65GPSVT/5.2/libs/CORE65GPSVT_nom_1.00V_25C.lib

# Arquivos de design RTL
read_hdl -vhdl {source/i2c_driver.vhd}

# Elabora RTL (entidade top: i2c_driver)
elaborate i2c_driver

# Carrega constraints
read_sdc constraints.sdc

# Sintese generica
syn_gen

# Sintese mapeada para celulas da biblioteca
syn_map

# Relatorios exigidos pelo trabalho
report_timing > reports/timing.rpt
report_area   > reports/area.rpt
report_power  > reports/power.rpt

# Exporta netlist sintetizado
write_hdl > netlist/i2c_driver_mapped.v

# Banco de dados para rodadas futuras
write_db i2c_driver.db

exit
