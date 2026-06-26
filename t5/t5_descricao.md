Projeto de Sistemas Integrados - 98G07- 04
Turma 30
Prof. Me. Marlon Moraes 1 / 2
marlon.moraes@pucrs.br

Trabalho 5
Módulo Receptor UART
Entrega:
Entrega
19/
Objeto de Estudo:
1. Decodificadores;
2. Protocolos de Comunicação;
3. Protocolo UART;
4. Máquinas de Estados Finitos (FSM);
5. Técnicas de Simulação;
6. VHDL;
7. Testbench;
Procedimento:
1. Projete um circuito lógico, descrito em VHDL, que seja capaz de realizar a recepção de dados através do
protocolo serial UART (Universal Asynchronous Receiver/Transmitter). Utilize como referência para a sua
implementação o diagrama apresentado na Figura 1.
Figura 1 – Diagrama de Referência.
2. A entidade do circuito lógico deverá ser nomeada como “uart_rx”. A Tabela 1 apresenta os nomes, os
tipos e as características funcionais das interfaces da entidade do circuito lógico “uart_rx”.
Porta Descrição Sentido Tipo
clock_in Referência de relógio master. Entrada std_logic
reset_in Reset Síncrono. Entrada std_logic
data_p_out Dado de saída paralelizado. Saída std_logic_vector(7 downto 0)
data_p_en_out Habilitação do dado de saída paralelizado. Saída std_logic
uart_data_rx Dado serial de entrada. Entrada std_logic
uart_rate_rx_sel Seleção da taxa de recepção Entrada std_logic_vector(1 downto 0)
Tabela 1 - Interfaces da entidade.
3. A Figura 2 apresenta o protocolo UART que deverá ser implementado tanto para a recepção.
Figura 2 – Protocolo UART.
Projeto de Sistemas Integrados - 98G07- 04
Turma 30
Prof. Me. Marlon Moraes 2 / 2
marlon.moraes@pucrs.br

4. A taxa de recepção de dados (baud rate) deverá ser de selecionada através dos bits de entrada
denominados “uart_rate_rx_sel”. Esta taxa de transmissão deverá respeitar as condições apresentada na
Tabela 2.
uart_rate_rx_sel Taxa de Transmissão [bps]
00 9600
01 19200
10 28800
11 57600
Tabela 2 - Interfaces da entidade.
5. Considere que a referência de relógio deste circuito “clock_in” possui uma frequência de 100MHz.
Códigos (*.vhd):
Os códigos contendo as informações sobre o desenvolvimento dos itens anteriores deverão ser
postados na Área Moodle da disciplina até a data de entrega prevista nesta especificação.