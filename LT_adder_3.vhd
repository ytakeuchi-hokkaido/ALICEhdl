library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LT_adder_3 is

	generic
	(
		LT_add_width : natural := 4
	);

	port 
	(
		LT5		:in std_logic;
		LT3a		:in unsigned((LT_add_width-2) downto 0);
		LT_sum 	:out unsigned((LT_add_width-1) downto 0)
	);

end entity;

architecture rtl of LT_adder_3 is

begin

	LT_sum <= ("000" & not LT5) + ("0" & LT3a);

end rtl;
