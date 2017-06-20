library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Differential is

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
      multi_o1, multi_o2, multi_o3, multi_o4, multi_o5 	:in unsigned((In_width-1) downto 0);
      delay_o1, delay_o2, delay_o3, delay_o4, delay_o5	:in unsigned((In_width-1) downto 0);
      Thre :in signed(In_width downto 0);
      mask_o1, mask_o2, mask_o3, mask_o4, mask_o5 :out unsigned((In_width-1) downto 0);
      LT1, LT2, LT3, LT4, LT5	:inout std_logic
      );
end entity;

architecture rtl of Differential is

-- rise sub ,cmp and mask
  component r_sub
    port
      (
        multi_o, delay_o	:in unsigned((In_width-1) downto 0);
	r_sub_o				:out signed(In_width downto 0)
        );
  end component;

  component r_cmp
    port
      (
        r_sub_o, Thre	:in  signed(In_width downto 0);
	r_LT			:out  std_logic
	);
end component;

component f_sub
  port 
	(
         delay_o, multi_o	:in unsigned((In_width-1) downto 0);
	 f_sub_o		:out signed(In_width downto 0)
         );
end component;

component f_cmp
         port 
           (
		f_sub_o, Thre	:in  signed(In_width downto 0);
		f_LT			:out  std_logic
            );
end component;

component cmp_or
  port 
	(
		r_LT, f_LT	:in  std_logic;
		LT		:out  std_logic
        );
end component;

component mask
	port 
	(
		multi_o		:in  unsigned((In_width-1) downto 0);
		mask_o		:out unsigned((In_width-1) downto 0);
		or_o			:in std_logic
	);
end component;
signal r_sub_o1, r_sub_o2, r_sub_o3, r_sub_o4, r_sub_o5	:signed(In_width downto 0);
signal f_sub_o1, f_sub_o2, f_sub_o3, f_sub_o4, f_sub_o5	:signed(In_width downto 0);
signal r_LT1, r_LT2, r_LT3, r_LT4, r_LT5				:std_logic;
signal f_LT1, f_LT2, f_LT3, f_LT4, f_LT5				:std_logic;
-- rise and fall sub ,cmp and mask

begin

RISE_sub1:r_sub port map( multi_o => multi_o1, delay_o => delay_o1, r_sub_o => r_sub_o1 );
RISE_sub2:r_sub port map( multi_o => multi_o2, delay_o => delay_o2, r_sub_o => r_sub_o2 );
RISE_sub3:r_sub port map( multi_o => multi_o3, delay_o => delay_o3, r_sub_o => r_sub_o3 );
RISE_sub4:r_sub port map( multi_o => multi_o4, delay_o => delay_o4, r_sub_o => r_sub_o4 );
RISE_sub5:r_sub port map( multi_o => multi_o5, delay_o => delay_o5, r_sub_o => r_sub_o5 );

RISE_cmp1:r_cmp port map( r_sub_o => r_sub_o1, Thre => Thre, r_LT => r_LT1 );
RISE_cmp2:r_cmp port map( r_sub_o => r_sub_o2, Thre => Thre, r_LT => r_LT2 );
RISE_cmp3:r_cmp port map( r_sub_o => r_sub_o3, Thre => Thre, r_LT => r_LT3 );
RISE_cmp4:r_cmp port map( r_sub_o => r_sub_o4, Thre => Thre, r_LT => r_LT4 );
RISE_cmp5:r_cmp port map( r_sub_o => r_sub_o5, Thre => Thre, r_LT => r_LT5 );

FALL_sub1:f_sub port map( delay_o => delay_o1, multi_o => multi_o1, f_sub_o => f_sub_o1);
FALL_sub2:f_sub port map( delay_o => delay_o2, multi_o => multi_o2, f_sub_o => f_sub_o2);
FALL_sub3:f_sub port map( delay_o => delay_o3, multi_o => multi_o3, f_sub_o => f_sub_o3);
FALL_sub4:f_sub port map( delay_o => delay_o4, multi_o => multi_o4, f_sub_o => f_sub_o4);
FALL_sub5:f_sub port map( delay_o => delay_o5, multi_o => multi_o5, f_sub_o => f_sub_o5);

FALL_cmp1:f_cmp port map( f_sub_o => f_sub_o1, Thre => Thre, f_LT => f_LT1 );
FALL_cmp2:f_cmp port map( f_sub_o => f_sub_o2, Thre => Thre, f_LT => f_LT2 );
FALL_cmp3:f_cmp port map( f_sub_o => f_sub_o3, Thre => Thre, f_LT => f_LT3 );
FALL_cmp4:f_cmp port map( f_sub_o => f_sub_o4, Thre => Thre, f_LT => f_LT4 );
FALL_cmp5:f_cmp port map( f_sub_o => f_sub_o5, Thre => Thre, f_LT => f_LT5 );

COMPARE_or1:cmp_or port map(r_LT => r_LT1, f_LT => f_LT1, LT => LT1);
COMPARE_or2:cmp_or port map(r_LT => r_LT2, f_LT => f_LT2, LT => LT2);
COMPARE_or3:cmp_or port map(r_LT => r_LT3, f_LT => f_LT3, LT => LT3);
COMPARE_or4:cmp_or port map(r_LT => r_LT4, f_LT => f_LT4, LT => LT4);
COMPARE_or5:cmp_or port map(r_LT => r_LT5, f_LT => f_LT5, LT => LT5);

multi_mask1:mask port map( multi_o => multi_o1, mask_o => mask_o1, or_o => LT1 );		
multi_mask2:mask port map( multi_o => multi_o2, mask_o => mask_o2, or_o => LT2 );		
multi_mask3:mask port map( multi_o => multi_o3, mask_o => mask_o3, or_o => LT3 );		
multi_mask4:mask port map( multi_o => multi_o4, mask_o => mask_o4, or_o => LT4 );
multi_mask5:mask port map( multi_o => multi_o5, mask_o => mask_o5, or_o => LT5 );
	
end rtl;
