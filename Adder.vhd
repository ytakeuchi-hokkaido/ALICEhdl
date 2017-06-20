library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder is

	generic
	(
		In_width : natural := 10;
		Add_width: natural := 13
	);

	port 
	(
		mask_o1, mask_o2	:in unsigned((In_width-1) downto 0);
		add_2	   		:out unsigned((Add_width-3) downto 0)
	);

end entity;

architecture rtl of Adder is
begin

	add_2 <= ("0" & mask_o1) + ("0" & mask_o2);

end rtl;
