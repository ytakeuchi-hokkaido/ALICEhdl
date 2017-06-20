library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity delay_1clk is
	
	generic
	(
		In_width : natural := 10
	);

	port
	( 
		Clock		:in  std_logic;
		Input		:in  unsigned((In_width-1) downto 0);
		delay_o	:out unsigned((In_width-1) downto 0)
	);
	
end entity;

architecture rtl of delay_1clk is
signal reg :unsigned((In_width-1) downto 0);

begin
	process (Clock, Input, reg)
	begin
		if (Clock='1') then
			delay_o <= reg;
		else
			reg <= Input;
		end if;
	end process;
end rtl;
