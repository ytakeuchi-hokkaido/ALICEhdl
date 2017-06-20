library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX is
	
	generic
	(	
		In_width  : natural := 10
	);
	--constant sel_width : integer := 6;

	port 
	(
		In_1,  In_2,  In_3,  In_4,  In_5,  In_6,  In_7,  In_8,  In_9,  In_10	:in  unsigned((In_width-1) downto 0);
		In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 :in  unsigned((In_width-1) downto 0);
		In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30	:in  unsigned((In_width-1) downto 0);
		In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 :in  unsigned((In_width-1) downto 0);
		--sel	:in  unsigned((sel_width-1) downto 0);
		sel	:in  unsigned(5 downto 0);
		multi_o	:out unsigned((In_width-1) downto 0)
	);

end entity;

architecture rtl of MUX is


begin
	process(In_1, In_2, In_3, In_4, In_5, In_6, In_7, In_8, In_9, In_10, 
	In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20, 
	In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30, 
	In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40, sel)
	begin
		case sel is
			when "000000" => multi_o <= In_1;
			when "000001" => multi_o <= In_2;
			when "000010" => multi_o <= In_3;
			when "000011" => multi_o <= In_4;
			when "000100" => multi_o <= In_5;
			when "000101" => multi_o <= In_6;
			when "000110" => multi_o <= In_7;
			when "000111" => multi_o <= In_8;
			when "001000" => multi_o <= In_9;
			when "001001" => multi_o <= In_10;
			when "001010" => multi_o <= In_11;
			when "001011" => multi_o <= In_12;
			when "001100" => multi_o <= In_13;
			when "001101" => multi_o <= In_14;
			when "001110" => multi_o <= In_15;
			when "001111" => multi_o <= In_16;
			when "010000" => multi_o <= In_17;
			when "010001" => multi_o <= In_18;
			when "010010" => multi_o <= In_19;
			when "010011" => multi_o <= In_20;
			when "010100" => multi_o <= In_21;
			when "010101" => multi_o <= In_22;
			when "010110" => multi_o <= In_23;
			when "010111" => multi_o <= In_24;
			when "011000" => multi_o <= In_25;
			when "011001" => multi_o <= In_26;
			when "011010" => multi_o <= In_27;
			when "011011" => multi_o <= In_28;
			when "011100" => multi_o <= In_29;
			when "011101" => multi_o <= In_30;
			when "011110" => multi_o <= In_31;
			when "011111" => multi_o <= In_32;
			when "100000" => multi_o <= In_33;
			when "100001" => multi_o <= In_34;
			when "100010" => multi_o <= In_35;
			when "100011" => multi_o <= In_36;
			when "100100" => multi_o <= In_37;
			when "100101" => multi_o <= In_38;
			when "100110" => multi_o <= In_39;
			when "100111" => multi_o <= In_40;
			when others => multi_o <= (others => '0');
		end case;
	end process;
end rtl;
