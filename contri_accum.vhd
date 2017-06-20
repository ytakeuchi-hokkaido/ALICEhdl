library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contri_accum is

	generic
	(
		LT_add_width : natural := 4;
		contri_width:natural := 9
	);

	port 
	(
		Hiclk, reset	:in std_logic;
		LT_sum 			:in unsigned ((LT_add_width-1) downto 0);
		contribute   	:out unsigned ((contri_width-1) downto 0)
	);

end entity;

architecture rtl of contri_accum is

	signal old_contri_add 	:unsigned ((contri_width-1) downto 0);
	signal contri_adder_out :unsigned ((contri_width-1) downto 0);
	signal contri_buf 		:unsigned ((contri_width-1) downto 0);


begin

	old_contri_add <= ("00000" & LT_sum);

	process (contri_adder_out, reset)
	begin
		if (reset = '1') then    -- Clear the accumulated data
			contri_buf <= (others => '0');
		else
			contri_buf <= contri_adder_out;
		end if;
	end process;

	process (Hiclk)
	begin
		if (rising_edge(Hiclk)) then

			contri_adder_out <= contri_buf + old_contri_add;			-- Store accumulation result in a register

		end if;
	end process;

	contribute <= contri_adder_out; 	-- Output accumulation result

end rtl;
