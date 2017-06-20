library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder_2 is

	generic
	(
		In_width : natural := 10;
		Add_width: natural := 13
	);

	port 
	(
		add_2a, add_2b	:in unsigned((Add_width-3) downto 0);
		add_3   			:out unsigned((Add_width-2) downto 0)
	);

end entity;

architecture rtl of Adder_2 is
begin

	add_3 <= ("0" & add_2a) + ("0" & add_2b);

end rtl;
