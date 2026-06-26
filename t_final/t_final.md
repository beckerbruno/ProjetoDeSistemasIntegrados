Trabalho Final
Driver I2C
Entrega:

Entrega
10/
Objeto do Estudo:

Circuitos Lógicos Combinacionais;
Circuitos Lógicos Sequenciais;
Máquina de Estados Finitos (FSM);
Protocolos de Comunicação;
Codificadores / Decodificadores;
Síntese Lógica;
Constraints.
Especificação:

Projete um circuito lógico síncrono, com característica de Máquina de Estados Finitos (FSM), que seja
capaz de controlar um periférico via protocolo I 2 C;
A Tabela 1 apresenta o nome, os tipos e as características funcionais das interfaces da entidade do
circuito lógico “i2c_driver”.
Função Sentido Tipo
clock in std_logic
reset in std_logic
data_p in std_logic_vector(7 downto 0)
enable in std_logic
busy out std_logic
scl out std_logic
sda inout std_logic
Tabela 1 – Interface do Bloco.
O sinal de relógio master (clock) deverá operar em uma frequência de 100 MHz.
As estruturas lógicas internas do circuito deverão ser sensíveis a borda de subida do sinal de relógio
master (clock).
O sinal de reset global (reset) deverá ser ativo em nível lógico alto e assíncrono.
O sinal de relógio do protocolo I2C (SDA) deverá ter uma frequência máxima de 100 kHz.
O sinal “enable” deverá ficar em nível lógico alto durante um ciclo de clock, do sinal de relógio master
(clock), para indicar que existe um dado válido novo no barramento de dados paralelos “data_p”.
A porta “busy” deve ficar em nível lógico alto para indicar que a última operação de escrita i2C ainda não
foi concluída. Em resumo, quando a porta “busy” estiver em nível lógico baixo significa que um novo dado
paralelo (data_p) poderá ser escrito.
Prof. Me. Marlon Moraes 2 / 3

A Figura 1 apresenta o protocolo de escrita I2C para o envido de dados ao PCF8574A que deverá ser
utilizado como referência para a sua implementação.
Figura 1 – Protocolo de Escrita I2C. Fonte: Datasheet PCF8574A.
A Figura 2 apresenta as transições dos pinos SDA e SCL para a garantia de inicialização (START) e
finalização (STOP) do protocolo I2C.
Figura 2 – Condição de START e STOP do Protocolo I2C. Fonte: Datasheet PCF8574A.
A Tabela 1 apresenta o mapa de endereçamento I2C do PCF8574A diante das combinações possíveis
das suas entradas de endereçamento físico. Utilizar o endereço em destaque para a sua implementação.
Tabela 1 – Mapa de Endereços. Fonte: Datasheet PCF8574A.
Para este projeto utilizar os bits A2, A1 e A0 iguais a nível lógico baixo (Tabela 1 ). Sugere-se que a
definição dos elementos A2, A1 e A0 sejam implementadas através de um generic.
As definições de projeto não previstas nesta especificação devem ser tratadas e resolvidas pelos grupos
de trabalho.
Prof. Me. Marlon Moraes 3 / 3
    
Critérios de Avaliação:

A Avaliação desta experiência seguirá os critérios indicados abaixo:
Códigos Fontes / Correção Funcional ( 70 %);

Scripts de Síntese Lógica (10%)

Constraints - *.sdc (10%)

Relatórios ( 1 0%);

i) Relatório de Timing;
ii) Relatório de Área;
iii) Relatório de Potência;