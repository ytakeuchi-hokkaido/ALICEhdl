library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder_3 is

	generic
	(
		In_width : natural := 10;
		Add_width: natural := 13
	);

	port 
	(
		mask_o5		:in unsigned((In_width-1) downto 0);
		add_3 		:in unsigned((Add_width-2) downto 0);
		mask_sum	   :out unsigned((Add_width-1) downto 0)
	);

end entity;

architecture rtl of Adder_3 is
begin

	mask_sum <= ("0" & add_3) + ("000" & mask_o5);

end rtl;
