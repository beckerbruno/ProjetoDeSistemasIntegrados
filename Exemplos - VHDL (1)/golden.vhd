-- Prof. Marlon Moraes
-- marlon.moraes@pucrs.br

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_arith.all;
	
entity golden is
port
(
	entrada	: in	std_logic_vector(7 downto 0);
	saida	: out	std_logic_vector(7 downto 0)
);
end golden;

architecture exemplo1 of golden is

begin

	saida <= 	x"41" when entrada = x"1C" else
				x"42" when entrada = x"32" else
				x"43" when entrada = x"21" else
				x"44" when entrada = x"23" else
				x"FF";




end exemplo1;