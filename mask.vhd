library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mask is
	
	generic
	(	
		In_width  : natural := 10
	);
	
	port 
	(
		multi_o		:in  unsigned((In_width-1) downto 0);
		mask_o		:out unsigned((In_width-1) downto 0);
		or_o			:in std_logic
	);

end entity;

architecture rtl of mask is
begin
	process(multi_o, or_o)
	begin
		case or_o is
			when '0' => mask_o <= multi_o;
			when '1' => mask_o <= (others => '0');
			when others => mask_o <= (others => '0');
		end case;
	end process;
end rtl;
