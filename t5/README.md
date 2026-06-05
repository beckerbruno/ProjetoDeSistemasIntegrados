# Trabalho 5 - UART RX (Universal Asynchronous Receiver Transmitter)

## Descrição

Implementação de um receptor UART assíncrono em VHDL, baseado na arquitetura do driver PS/2 do Trabalho 4.

## Estrutura dos Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `uart_rx.vhd` | Implementação principal do receptor UART RX |
| `uart_rx_golden.vhd` | Implementação compacta de referência |
| `uart_rx_tb.vhd` | Testbench para validação |
| `script.do` | Script de simulação para ModelSim/QuestaSim |
| `10 - Trabalho 5.1 - Universal Asynchronous Receiver Transmitter (UART) - RX.pdf` | Especificação do trabalho |

## Diferenças: PS/2 (t4) vs UART RX (t5)

| Característica | PS/2 (t4) | UART RX (t5) |
|----------------|-----------|--------------|
| Sincronização | Protocolo síncrono com clock separado | Protocolo assíncrono |
| Amostragem | Borda de descida do `clock_ps2` | Oversampling 16x com baud rate gerado internamente |
| Frame | Start(0) + 8 bits dados + Paridade + Stop(1) | Start(0) + 8 bits dados + Stop(1) |
| Taxa de dados | ~50 kHz (definida por clock PS/2) | Configurável (padrão: 115200 bps) |

## Arquitetura do UART RX

```
clock_in (100 MHz) ──┐
                     │
                     ▼
              ┌─────────────┐
              │ Sincronizador│
              │   (2 estágios)│
              └─────────────┘
                     │
                     ▼
              ┌─────────────┐
              │   Baud Gen  │ ← 16x oversampling
              │  (tick_gen) │
              └─────────────┘
                     │
                     ▼
              ┌─────────────┐
              │    FSM      │ ← Máquina de estados
              │  (uart_rx)  │   IDLE → WAIT_START → RECV_DATA → RECV_STOP
              └─────────────┘
                     │
                     ▼
              ┌─────────────┐
              │    Saída    │
              │ data_p[7:0] │
              │  data_p_en  │
              └─────────────┘
```

## Parâmetros Genéricos

| Parâmetro | Padrão | Descrição |
|-----------|--------|-----------|
| `CLK_FREQ` | 100000000 | Frequência do clock do sistema em Hz (100 MHz) |
| `BAUD_RATE` | 115200 | Taxa de transmissão em bps |

## Simulação

Para executar a simulação no ModelSim/QuestaSim:

```tcl
do script.do
```

Ou manualmente:

```tcl
vlib work
vcom -2008 uart_rx.vhd
vcom -2008 uart_rx_tb.vhd
vsim -voptargs=+acc work.uart_rx_tb
run -all
```

## Protocolo UART Frame

```
     Idle   Start  D0  D1  D2  D3  D4  D5  D6  D7  Stop  Idle
      │       │    │   │   │   │   │   │   │   │    │     │
  ────┴───────┘    └───┘   └───┘   └───┘   └───┘   └──┘──────
     '1'    '0'   LSB............................MSB  '1'   '1'

  │←─1 bit─→│←─────────────────8 bits────────────────→│←1bit→│
  │←─────────────────────10 bits total──────────────────────→│
```

- **Idle**: Linha em nível alto ('1')
- **Start bit**: '0' (indica início da transmissão)
- **Dados**: 8 bits, LSB primeiro (bit 0 primeiro)
- **Stop bit**: '1' (indica fim da transmissão)

## Estados da Máquina de Estados

1. **IDLE**: Aguarda borda de descida (start bit)
2. **WAIT_START**: Aguarda meio período para amostrar o meio do start bit
3. **RECV_DATA**: Recebe 8 bits de dados (LSB primeiro)
4. **RECV_STOP**: Verifica stop bit e sinaliza dado pronto

## Oversampling

O receptor usa oversampling de 16x o baud rate:
- Gera "baud tick" a cada 1/16 do período do bit
- Amostra o start bit no meio (tick 7 de 16)
- Amostra cada bit de dados no meio (tick 15 = fim do bit anterior, início do próximo)
- Permite melhor tolerância a desvio de fase

## Sinais de Saída

| Sinal | Largura | Descrição |
|-------|---------|-----------|
| `data_p` | 8 bits | Dado paralelo recebido |
| `data_p_en` | 1 bit | Pulso de 1 ciclo indicando dado válido |
