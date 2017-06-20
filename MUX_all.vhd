library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity MUX_all is
	
	generic
	(
		In_width : natural := 10;
		sel_width : natural := 6;
		SUM_width : natural := 18;
		cont_width: natural := 9;
		contri_width:natural := 9;
		average_width:natural := 12;
		LT_add_width : natural := 4;
		Add_width: natural := 13
	);
	
	port 
	(
	Clock																										:in  std_logic;
	In_1, In_2, In_3, In_4, In_5, In_6, In_7, In_8, In_9, In_10 							:in  unsigned((In_width-1) downto 0);
	In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 				:in  unsigned((In_width-1) downto 0);
	In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30 				:in  unsigned((In_width-1) downto 0);
	In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 				:in  unsigned((In_width-1) downto 0);
	In_41, In_42, In_43, In_44, In_45, In_46, In_47, In_48, In_49, In_50					:in  unsigned((In_width-1) downto 0); 
	In_51, In_52, In_53, In_54, In_55, In_56, In_57, In_58, In_59, In_60 				:in  unsigned((In_width-1) downto 0);
	In_61, In_62, In_63, In_64, In_65, In_66, In_67, In_68, In_69, In_70 				:in  unsigned((In_width-1) downto 0);
	In_71, In_72, In_73, In_74, In_75, In_76, In_77, In_78, In_79, In_80 				:in  unsigned((In_width-1) downto 0);
	In_81, In_82, In_83, In_84, In_85, In_86, In_87, In_88, In_89, In_90 				:in  unsigned((In_width-1) downto 0);
	In_91, In_92, In_93, In_94, In_95, In_96, In_97, In_98, In_99, In_100 				:in  unsigned((In_width-1) downto 0);
	In_101, In_102, In_103, In_104, In_105, In_106, In_107, In_108, In_109, In_110	:in  unsigned((In_width-1) downto 0); 
	In_111, In_112, In_113, In_114, In_115, In_116, In_117, In_118, In_119, In_120 	:in  unsigned((In_width-1) downto 0);
	In_121, In_122, In_123, In_124, In_125, In_126, In_127, In_128, In_129, In_130 	:in  unsigned((In_width-1) downto 0);
	In_131, In_132, In_133, In_134, In_135, In_136, In_137, In_138, In_139, In_140 	:in  unsigned((In_width-1) downto 0);
	In_141, In_142, In_143, In_144, In_145, In_146, In_147, In_148, In_149, In_150 	:in  unsigned((In_width-1) downto 0);
	In_151, In_152, In_153, In_154, In_155, In_156, In_157, In_158, In_159, In_160 	:in  unsigned((In_width-1) downto 0);
	In_161, In_162, In_163, In_164, In_165, In_166, In_167, In_168, In_169, In_170 	:in  unsigned((In_width-1) downto 0);
	In_171, In_172, In_173, In_174, In_175, In_176, In_177, In_178, In_179, In_180 	:in  unsigned((In_width-1) downto 0);
	In_181, In_182, In_183, In_184, In_185, In_186, In_187, In_188, In_189, In_190 	:in  unsigned((In_width-1) downto 0);
	In_191, In_192, In_193, In_194, In_195, In_196, In_197, In_198, In_199, In_200 	:in  unsigned((In_width-1) downto 0);
	sel																										:in  unsigned((sel_width-1) downto 0);
	multi_o1, multi_o2, multi_o3, multi_o4, multi_o5 											:out unsigned((In_width-1) downto 0)
	);
	
end entity;

architecture rtl of MUX_all is

-- In_MUX
component MUX
	port 
	(
		In_1,  In_2,  In_3,  In_4,  In_5,  In_6,  In_7,  In_8,  In_9,  In_10	:in  unsigned((In_width-1) downto 0);
		In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 :in  unsigned((In_width-1) downto 0);
		In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30	:in  unsigned((In_width-1) downto 0);
		In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 :in  unsigned((In_width-1) downto 0);
		sel																						:in  unsigned((sel_width-1) downto 0);
		multi_o																					:out unsigned((In_width-1) downto 0)
	);
end component;
-- In_MUX

begin

Multiplex1:MUX port map
	(
	In_1  => In_1,  In_2  => In_2,  In_3  => In_3,  In_4  => In_4,  In_5  => In_5,  In_6  => In_6,  In_7  => In_7,  In_8  => In_8,  In_9  => In_9,  In_10 => In_10,
	In_11 => In_11, In_12 => In_12, In_13 => In_13, In_14 => In_14, In_15 => In_15, In_16 => In_16, In_17 => In_17, In_18 => In_18, In_19 => In_19, In_20 => In_20,
	In_21 => In_21, In_22 => In_22, In_23 => In_23, In_24 => In_24, In_25 => In_25, In_26 => In_26, In_27 => In_27, In_28 => In_28, In_29 => In_29, In_30 => In_30,
	In_31 => In_31, In_32 => In_32, In_33 => In_33, In_34 => In_34, In_35 => In_35, In_36 => In_36, In_37 => In_37, In_38 => In_38, In_39 => In_39, In_40 => In_40,
	multi_o => multi_o1, sel => sel
	);

Multiplex2:MUX port map
	(
	In_1  => In_41, In_2  => In_42, In_3  => In_43, In_4  => In_44, In_5  => In_45, In_6  => In_46, In_7  => In_47, In_8  => In_48, In_9  => In_49, In_10 => In_50,
	In_11 => In_51, In_12 => In_52, In_13 => In_53, In_14 => In_54, In_15 => In_55, In_16 => In_56, In_17 => In_57, In_18 => In_58, In_19 => In_59, In_20 => In_60,
	In_21 => In_61, In_22 => In_62, In_23 => In_63, In_24 => In_64, In_25 => In_65, In_26 => In_66, In_27 => In_67, In_28 => In_68, In_29 => In_69, In_30 => In_70,
	In_31 => In_71, In_32 => In_72, In_33 => In_73, In_34 => In_74, In_35 => In_75, In_36 => In_76, In_37 => In_77, In_38 => In_78, In_39 => In_79, In_40 => In_80,
	multi_o => multi_o2, sel => sel
	);

Multiplex3:MUX port map
	(
	In_1  => In_81,  In_2  => In_82,  In_3  => In_83,  In_4  => In_84,  In_5  => In_95,  In_6  => In_86,  In_7  => In_87,  In_8  => In_88,  In_9  => In_89,  In_10 => In_90,
	In_11 => In_91,  In_12 => In_92,  In_13 => In_93,  In_14 => In_94,  In_15 => In_95,  In_16 => In_96,  In_17 => In_87,  In_18 => In_98,  In_19 => In_99,  In_20 => In_100,
	In_21 => In_101, In_22 => In_102, In_23 => In_103, In_24 => In_104, In_25 => In_105, In_26 => In_106, In_27 => In_107, In_28 => In_108, In_29 => In_109, In_30 => In_110,
	In_31 => In_111, In_32 => In_112, In_33 => In_113, In_34 => In_114, In_35 => In_115, In_36 => In_116, In_37 => In_117, In_38 => In_118, In_39 => In_119, In_40 => In_120,
	multi_o => multi_o3, sel => sel
	);

Multiplex4:MUX port map
	(
	In_1  => In_121, In_2  => In_122, In_3  => In_123, In_4  => In_124, In_5  => In_125, In_6  => In_126, In_7  => In_127, In_8  => In_128, In_9  => In_129, In_10 => In_130,
	In_11 => In_131, In_12 => In_132, In_13 => In_133, In_14 => In_134, In_15 => In_135, In_16 => In_136, In_17 => In_137, In_18 => In_138, In_19 => In_139, In_20 => In_140,
	In_21 => In_141, In_22 => In_142, In_23 => In_143, In_24 => In_144, In_25 => In_145, In_26 => In_146, In_27 => In_147, In_28 => In_148, In_29 => In_149, In_30 => In_150,
	In_31 => In_151, In_32 => In_152, In_33 => In_153, In_34 => In_154, In_35 => In_155, In_36 => In_156, In_37 => In_157, In_38 => In_158, In_39 => In_159, In_40 => In_160,
	multi_o => multi_o4, sel => sel
	);

Multiplex5:MUX port map
	(
	In_1  => In_161, In_2  => In_162, In_3  => In_163, In_4  => In_164, In_5  => In_165, In_6  => In_166, In_7  => In_167, In_8  => In_168, In_9  => In_169, In_10 => In_170,
	In_11 => In_171, In_12 => In_172, In_13 => In_173, In_14 => In_174, In_15 => In_175, In_16 => In_176, In_17 => In_177, In_18 => In_178, In_19 => In_179, In_20 => In_180,
	In_21 => In_181, In_22 => In_182, In_23 => In_183, In_24 => In_184, In_25 => In_185, In_26 => In_186, In_27 => In_187, In_28 => In_188, In_29 => In_189, In_30 => In_190,
	In_31 => In_191, In_32 => In_192, In_33 => In_193, In_34 => In_194, In_35 => In_195, In_36 => In_196, In_37 => In_197, In_38 => In_198, In_39 => In_199, In_40 => In_200,
	multi_o => multi_o5, sel => sel
	);	

end rtl;
