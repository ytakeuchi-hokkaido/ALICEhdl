library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder_and_Accumulator is
	
	generic
	(
		In_width : natural := 10;
		sel_width : natural := 1;
		SUM_width : natural := 18;
		cont_width: natural := 9;
		contri_width:natural := 9;
		average_width:natural := 12;
		LT_add_width : natural := 4;
		Add_width: natural := 13
	);
	
	port 
	(
	Hiclk, reset 					:in std_logic;
	mask_o1, mask_o2				:in unsigned((In_width-1) downto 0);
	mask_o3, mask_o4, mask_o5 	:in unsigned((In_width-1) downto 0);
	SUM								:out unsigned((SUM_width-1) downto 0)
	);
end entity;

architecture rtl of Adder_and_Accumulator is


-- N-ch Adder 
component Adder
	port 
	(
		mask_o1, mask_o2	:in unsigned((In_width-1) downto 0);
		add_2		   		:out unsigned ((Add_width-3) downto 0)
	);
end component;

component Adder_2
	port 
	(
		add_2a, add_2b	:in unsigned((Add_width-3) downto 0);
		add_3   			:out unsigned ((Add_width-2) downto 0)
	);
end component;

component Adder_3
	port 
	(
		mask_o5		:in unsigned((In_width-1) downto 0);
		add_3 		:in unsigned((Add_width-2) downto 0);
		mask_sum	   :out unsigned ((Add_width-1) downto 0)
	);
end component;

component Accumulator
	port 
	(
		mask_sum			:in unsigned((Add_width-1) downto 0);
		Hiclk, reset	:in std_logic;	
		SUM 		   	:out unsigned ((SUM_width-1) downto 0)
	);
end component;
signal	add_2a, add_2b 				:unsigned(In_width downto 0);
signal	add_3								:unsigned((In_width+1) downto 0);
signal	mask_sum							:unsigned((Add_width-1) downto 0);
-- N-ch Adder 

begin
	
	Add_1a:Adder port map(mask_o1 => mask_o1, mask_o2 => mask_o2, add_2 => add_2a);
	Add_1b:Adder port map(mask_o1 => mask_o3, mask_o2 => mask_o4, add_2 => add_2b);
	Add_2:Adder_2 port map(add_2a => add_2a, add_2b => add_2b, add_3 => add_3);
	Add_l:Adder_3 port map(mask_o5 => mask_o5, add_3 => add_3, mask_sum => mask_sum);
	SUM1: Accumulator port map(mask_sum => mask_sum, Hiclk => Hiclk, reset => reset, SUM => SUM);
	
end rtl;
