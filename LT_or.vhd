library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LT_or is
	
	port 
	(
		r_LT, f_LT	:in  std_logic;
		LT_sel		:out  std_logic
	);

end entity;

architecture rtl of LT_or is

begin
	LT_sel <= r_LT or f_LT;
end rtl;
