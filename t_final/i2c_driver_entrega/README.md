# Trabalho Final - Driver I2C (PCF8574A)

Circuito lógico síncrono, do tipo Máquina de Estados Finitos (FSM), capaz de
controlar o periférico **PCF8574A** via protocolo **I2C** (operação de escrita).

## Estrutura dos Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `i2c_driver.vhd` | Implementação RTL do driver I2C (FSM síncrona) |
| `i2c_driver_tb.vhd` | Testbench auto-verificável (monitor decodifica o barramento) |
| `script.do` | Script de simulação para ModelSim/QuestaSim |
| `sintese/sintese.tcl` | Script de síntese lógica (Cadence Genus, biblioteca STM 65 nm) |
| `sintese/constraints.sdc` | Constraints de síntese (clock 100 MHz, delays, false path do reset) |
| `sintese/reports/timing.rpt` | Relatório de Timing (slack +7,61 ns @ 100 MHz — MET) |
| `sintese/reports/area.rpt` | Relatório de Área (138 células, 688,48 µm²) |
| `sintese/reports/power.rpt` | Relatório de Potência (~52,8 µW total) |
| `sintese/netlist/i2c_driver_mapped.v` | Netlist sintetizado (mapeado para células) |

Síntese executada com `genus -no_gui -f sintese.tcl` (Genus 21.1, servidor paxos.inf.pucrs.br).

## Interface (Tabela 1)

| Função | Sentido | Tipo |
|--------|---------|------|
| `clock`  | in    | `std_logic` |
| `reset`  | in    | `std_logic` |
| `data_p` | in    | `std_logic_vector(7 downto 0)` |
| `enable` | in    | `std_logic` |
| `busy`   | out   | `std_logic` |
| `scl`    | out   | `std_logic` |
| `sda`    | inout | `std_logic` |

## Especificações atendidas

- **Clock master**: 100 MHz, lógica sensível à **borda de subida**.
- **Reset**: global, **ativo alto** e **assíncrono**.
- **SCL**: frequência **máxima de 100 kHz** (gerada por divisor configurável).
- **enable**: pulso de **1 ciclo de clock** indica novo dado válido em `data_p`.
- **busy**: em nível alto enquanto a escrita não foi concluída; em nível baixo
  indica que um novo `data_p` pode ser escrito.
- **Endereço A2/A1/A0**: definido via `generic` (padrão `'0'`, `'0'`, `'0'`).

## Endereçamento I2C

O PCF8574A possui prefixo fixo `0111`. Com `A2=A1=A0='0'`:

```
Byte de endereço = | 0 1 1 1 | A2 A1 A0 | R/W |
                   |   0x38 (7 bits)     |  0  |   = 0x70 (com R/W=0, escrita)
```

## Protocolo de Escrita Implementado

```
START | Endereço(7b)+W(0) | ACK | Dado(8b) | ACK | STOP
```

- **START**: SDA cai de `1`→`0` com SCL em `1`.
- **Bytes**: enviados **MSB primeiro**; SDA muda com SCL em `0`, estável com SCL em `1`.
- **ACK**: o master libera SDA (open-drain) e gera 1 pulso de SCL para o escravo.
- **STOP**: SDA sobe de `0`→`1` com SCL em `1`.

`SDA` é tratado como **open-drain**: o driver puxa para `'0'` ou libera (`'Z'`),
e o resistor de pull-up externo garante o nível `'1'`.

## Geração do SCL (divisor de clock)

```
DIVISOR = CLK_FREQ / SCL_FREQ = 100 MHz / 100 kHz = 1000 ciclos
QUARTER = DIVISOR / 4 = 250 ciclos  (cada bit I2C = 4 fases)
```

Cada bit do barramento é dividido em 4 fases iguais (`phase` 0..3),
controlando o setup de SDA, a subida/descida de SCL e a amostragem.

## Máquina de Estados (FSM)

```
S_IDLE -> S_START -> S_ADDR -> S_ACK1 -> S_DATA -> S_ACK2 -> S_STOP -> S_IDLE
```

| Estado | Função |
|--------|--------|
| `S_IDLE`  | Repouso; SCL/SDA liberados; aguarda `enable` |
| `S_START` | Gera condição de START |
| `S_ADDR`  | Envia byte de endereço + R/W (8 bits, MSB primeiro) |
| `S_ACK1`  | Pulso de ACK do escravo (endereço) |
| `S_DATA`  | Envia byte de dado (8 bits, MSB primeiro) |
| `S_ACK2`  | Pulso de ACK do escravo (dado) |
| `S_STOP`  | Gera condição de STOP |

## Parâmetros Genéricos

| Parâmetro | Padrão | Descrição |
|-----------|--------|-----------|
| `CLK_FREQ` | 100000000 | Frequência do clock master (Hz) |
| `SCL_FREQ` | 100000 | Frequência do SCL I2C (Hz) |
| `ADDR_A2`  | `'0'` | Bit de endereço físico A2 |
| `ADDR_A1`  | `'0'` | Bit de endereço físico A1 |
| `ADDR_A0`  | `'0'` | Bit de endereço físico A0 |

## Simulação

ModelSim/QuestaSim:

```tcl
do script.do
```

Ou manualmente:

```tcl
vlib work
vcom -2008 i2c_driver.vhd
vcom -2008 i2c_driver_tb.vhd
vsim -voptargs=+acc work.i2c_driver_tb
run 3 ms
```

O testbench envia 6 bytes (`0x55, 0xAA, 0x0F, 0xF0, 0x00, 0xFF`), decodifica o
barramento I2C com um monitor independente e verifica endereço e dado de cada
transação. Ao final reporta `Simulacao OK` se as 6 transações forem corretas.

## Síntese Lógica e Relatórios

Com Synopsys Design Compiler (após ajustar `target_library`/`link_library`):

```sh
dc_shell -f synthesis.tcl
```

Gera, no diretório `reports/`:

- `timing.rpt`  — Relatório de Timing
- `area.rpt`    — Relatório de Área
- `power.rpt`   — Relatório de Potência

As constraints estão em `i2c_driver.sdc` (clock de 100 MHz / 10 ns,
`set_false_path` no `reset` assíncrono, e delays de I/O).
