library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftreg is

	generic
	(
		In_width : natural := 10
	);

	port 
	(
		Clock			:in std_logic;
		Input	    	:in unsigned((In_width-1) downto 0);
		Output		:out unsigned((In_width-1) downto 0)
	);

end entity;

architecture rtl of shiftreg is
signal sr_buf:unsigned((In_width-1) downto 0);

begin

	process (Clock, Input, sr_buf)
	begin
		if (Clock='1') then
			Output <= sr_buf;
		else
			sr_buf <= Input;
		end if;
	end process;

end rtl;
