library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LT_adder_2 is

	generic
	(
		LT_add_width : natural := 4
	);

	port 
	(
		LT2a, LT2b	:in unsigned((LT_add_width-3) downto 0);
		LT3a 	:out unsigned((LT_add_width-2) downto 0)
	);

end entity;

architecture rtl of LT_adder_2 is

begin

	LT3a <= ("0" & LT2a) + ("0" & LT2b);

end rtl;
