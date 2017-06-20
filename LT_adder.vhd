library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LT_adder is

	generic
	(
		LT_add_width : natural := 4
	);

	port 
	(
		LT1, LT2	:in std_logic;
		LT_sum 	:out unsigned ((LT_add_width-3) downto 0)
	);

end entity;

architecture rtl of LT_adder is

begin

	LT_sum <= ("0" & not LT1) + ("0" & not LT2);

end rtl;
