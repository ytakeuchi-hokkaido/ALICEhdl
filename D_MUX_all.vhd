library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity D_MUX_all is
  generic(
    In_width : natural := 10;
    sel_width : natural := 6;
    SUM_width : natural := 18;
    cont_width: natural := 9;
    contri_width:natural := 9;
    average_width:natural := 12;
    LT_add_width : natural := 4;
    Add_width: natural := 13
    );
  port(
    Clock, Hiclk									:in std_logic;
    In_1, In_2, In_3, In_4, In_5, In_6, In_7, In_8, In_9, In_10 			:in  unsigned((In_width-1) downto 0);
    In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 		:in  unsigned((In_width-1) downto 0);
    In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30 		:in  unsigned((In_width-1) downto 0);
    In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 		:in  unsigned((In_width-1) downto 0);
    In_41, In_42, In_43, In_44, In_45, In_46, In_47, In_48, In_49, In_50		:in  unsigned((In_width-1) downto 0); 
    In_51, In_52, In_53, In_54, In_55, In_56, In_57, In_58, In_59, In_60 		:in  unsigned((In_width-1) downto 0);
    In_61, In_62, In_63, In_64, In_65, In_66, In_67, In_68, In_69, In_70 		:in  unsigned((In_width-1) downto 0);
    In_71, In_72, In_73, In_74, In_75, In_76, In_77, In_78, In_79, In_80 		:in  unsigned((In_width-1) downto 0);
    In_81, In_82, In_83, In_84, In_85, In_86, In_87, In_88, In_89, In_90 		:in  unsigned((In_width-1) downto 0);
    In_91, In_92, In_93, In_94, In_95, In_96, In_97, In_98, In_99, In_100 		:in  unsigned((In_width-1) downto 0);
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
    sel:in unsigned((sel_width-1) downto 0);
    delay_o1, delay_o2, delay_o3, delay_o4, delay_o5:out unsigned((In_width-1) downto 0)
    );
	
end entity;

architecture rtl of D_MUX_all is

-- In_MUX

  component MUX port (
    In_1,  In_2,  In_3,  In_4,  In_5,  In_6,  In_7,  In_8,  In_9,  In_10	:in  unsigned((In_width-1) downto 0);
    In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 :in  unsigned((In_width-1) downto 0);
    In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30	:in  unsigned((In_width-1) downto 0);
    In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 :in  unsigned((In_width-1) downto 0);
    sel	:in  unsigned((sel_width-1) downto 0);
    multi_o:out unsigned((In_width-1) downto 0)
    );
  end component;
-- In_MUX

-- delay_multi

  component delay_1clk
    port( 
      Clock		:in  std_logic;
      Input		:in  unsigned((In_width-1) downto 0);
      delay_o	:out unsigned((In_width-1) downto 0)
      );
  end component;
  signal  delay_1, delay_2, delay_3, delay_4, delay_5, delay_6, delay_7, delay_8, delay_9, delay_10 			:unsigned((In_width-1) downto 0);
  signal  delay_11, delay_12, delay_13, delay_14, delay_15, delay_16, delay_17, delay_18, delay_19, delay_20 		:unsigned((In_width-1) downto 0);
  signal  delay_21, delay_22, delay_23, delay_24, delay_25, delay_26, delay_27, delay_28, delay_29, delay_30 		:unsigned((In_width-1) downto 0);
  signal delay_31, delay_32, delay_33, delay_34, delay_35, delay_36, delay_37, delay_38, delay_39, delay_40 		:unsigned((In_width-1) downto 0);
  signal delay_41, delay_42, delay_43, delay_44, delay_45, delay_46, delay_47, delay_48, delay_49, delay_50		:unsigned((In_width-1) downto 0); 
  signal delay_51, delay_52, delay_53, delay_54, delay_55, delay_56, delay_57, delay_58, delay_59, delay_60 		:unsigned((In_width-1) downto 0);
  signal	delay_61, delay_62, delay_63, delay_64, delay_65, delay_66, delay_67, delay_68, delay_69, delay_70 		:unsigned((In_width-1) downto 0);
  signal	delay_71, delay_72, delay_73, delay_74, delay_75, delay_76, delay_77, delay_78, delay_79, delay_80 		:unsigned((In_width-1) downto 0);
  signal	delay_81, delay_82, delay_83, delay_84, delay_85, delay_86, delay_87, delay_88, delay_89, delay_90 		:unsigned((In_width-1) downto 0);
  signal	delay_91, delay_92, delay_93, delay_94, delay_95, delay_96, delay_97, delay_98, delay_99, delay_100 		:unsigned((In_width-1) downto 0);
  signal	delay_101, delay_102, delay_103, delay_104, delay_105, delay_106, delay_107, delay_108, delay_109, delay_110	:unsigned((In_width-1) downto 0); 
  signal	delay_111, delay_112, delay_113, delay_114, delay_115, delay_116, delay_117, delay_118, delay_119, delay_120 	:unsigned((In_width-1) downto 0);
  signal	delay_121, delay_122, delay_123, delay_124, delay_125, delay_126, delay_127, delay_128, delay_129, delay_130 	:unsigned((In_width-1) downto 0);
  signal	delay_131, delay_132, delay_133, delay_134, delay_135, delay_136, delay_137, delay_138, delay_139, delay_140 	:unsigned((In_width-1) downto 0);
  signal	delay_141, delay_142, delay_143, delay_144, delay_145, delay_146, delay_147, delay_148, delay_149, delay_150 	:unsigned((In_width-1) downto 0);
  signal	delay_151, delay_152, delay_153, delay_154, delay_155, delay_156, delay_157, delay_158, delay_159, delay_160 	:unsigned((In_width-1) downto 0);
  signal	delay_161, delay_162, delay_163, delay_164, delay_165, delay_166, delay_167, delay_168, delay_169, delay_170 	:unsigned((In_width-1) downto 0);
  signal	delay_171, delay_172, delay_173, delay_174, delay_175, delay_176, delay_177, delay_178, delay_179, delay_180 	:unsigned((In_width-1) downto 0);
  signal	delay_181, delay_182, delay_183, delay_184, delay_185, delay_186, delay_187, delay_188, delay_189, delay_190 	:unsigned((In_width-1) downto 0);
  signal	delay_191, delay_192, delay_193, delay_194, delay_195, delay_196, delay_197, delay_198, delay_199, delay_200 	:unsigned((In_width-1) downto 0);
-- delay_multi

begin
  delay1:delay_1clk port map(Clock => Clock, Input => In_1, delay_o => delay_1);
  delay2:delay_1clk port map(Clock => Clock, Input => In_2, delay_o => delay_2);
  delay3:delay_1clk port map(Clock => Clock, Input => In_3, delay_o => delay_3);
  delay4:delay_1clk port map(Clock => Clock, Input => In_4, delay_o => delay_4);
  delay5:delay_1clk port map(Clock => Clock, Input => In_5, delay_o => delay_5);
  delay6:delay_1clk port map(Clock => Clock, Input => In_6, delay_o => delay_6);
  delay7:delay_1clk port map(Clock => Clock, Input => In_7, delay_o => delay_7);
  delay8:delay_1clk port map(Clock => Clock, Input => In_8, delay_o => delay_8);
  delay9:delay_1clk port map(Clock => Clock, Input => In_9, delay_o => delay_9);
  delay10:delay_1clk port map(Clock => Clock, Input => In_10, delay_o => delay_10);
  delay11:delay_1clk port map(Clock => Clock, Input => In_11, delay_o => delay_11);
  delay12:delay_1clk port map(Clock => Clock, Input => In_12, delay_o => delay_12);
  delay13:delay_1clk port map(Clock => Clock, Input => In_13, delay_o => delay_13);
  delay14:delay_1clk port map(Clock => Clock, Input => In_14, delay_o => delay_14);
  delay15:delay_1clk port map(Clock => Clock, Input => In_15, delay_o => delay_15);
  delay16:delay_1clk port map(Clock => Clock, Input => In_16, delay_o => delay_16);
  delay17:delay_1clk port map(Clock => Clock, Input => In_17, delay_o => delay_17);
  delay18:delay_1clk port map(Clock => Clock, Input => In_18, delay_o => delay_18);
  delay19:delay_1clk port map(Clock => Clock, Input => In_19, delay_o => delay_19);
  delay20:delay_1clk port map(Clock => Clock, Input => In_20, delay_o => delay_20);
  delay21:delay_1clk port map(Clock => Clock, Input => In_21, delay_o => delay_21);
  delay22:delay_1clk port map(Clock => Clock, Input => In_22, delay_o => delay_22);
  delay23:delay_1clk port map(Clock => Clock, Input => In_23, delay_o => delay_23);
  delay24:delay_1clk port map(Clock => Clock, Input => In_24, delay_o => delay_24);
  delay25:delay_1clk port map(Clock => Clock, Input => In_25, delay_o => delay_25);
  delay26:delay_1clk port map(Clock => Clock, Input => In_26, delay_o => delay_26);
  delay27:delay_1clk port map(Clock => Clock, Input => In_27, delay_o => delay_27);
  delay28:delay_1clk port map(Clock => Clock, Input => In_28, delay_o => delay_28);
  delay29:delay_1clk port map(Clock => Clock, Input => In_29, delay_o => delay_29);
  delay30:delay_1clk port map(Clock => Clock, Input => In_30, delay_o => delay_30);
  delay31:delay_1clk port map(Clock => Clock, Input => In_31, delay_o => delay_31);
  delay32:delay_1clk port map(Clock => Clock, Input => In_32, delay_o => delay_32);
  delay33:delay_1clk port map(Clock => Clock, Input => In_33, delay_o => delay_33);
  delay34:delay_1clk port map(Clock => Clock, Input => In_34, delay_o => delay_34);
  delay35:delay_1clk port map(Clock => Clock, Input => In_35, delay_o => delay_35);
  delay36:delay_1clk port map(Clock => Clock, Input => In_36, delay_o => delay_36);
  delay37:delay_1clk port map(Clock => Clock, Input => In_37, delay_o => delay_37);
  delay38:delay_1clk port map(Clock => Clock, Input => In_38, delay_o => delay_38);
  delay39:delay_1clk port map(Clock => Clock, Input => In_39, delay_o => delay_39);
  delay40:delay_1clk port map(Clock => Clock, Input => In_40, delay_o => delay_40);
  delay41:delay_1clk port map(Clock => Clock, Input => In_41, delay_o => delay_41);
  delay42:delay_1clk port map(Clock => Clock, Input => In_42, delay_o => delay_42);
  delay43:delay_1clk port map(Clock => Clock, Input => In_43, delay_o => delay_43);
  delay44:delay_1clk port map(Clock => Clock, Input => In_44, delay_o => delay_44);
  delay45:delay_1clk port map(Clock => Clock, Input => In_45, delay_o => delay_45);
  delay46:delay_1clk port map(Clock => Clock, Input => In_46, delay_o => delay_46);
  delay47:delay_1clk port map(Clock => Clock, Input => In_47, delay_o => delay_47);
  delay48:delay_1clk port map(Clock => Clock, Input => In_48, delay_o => delay_48);
  delay49:delay_1clk port map(Clock => Clock, Input => In_49, delay_o => delay_49);
  delay50:delay_1clk port map(Clock => Clock, Input => In_50, delay_o => delay_50);
  delay51:delay_1clk port map(Clock => Clock, Input => In_51, delay_o => delay_51);
  delay52:delay_1clk port map(Clock => Clock, Input => In_52, delay_o => delay_52);
  delay53:delay_1clk port map(Clock => Clock, Input => In_53, delay_o => delay_53);
  delay54:delay_1clk port map(Clock => Clock, Input => In_54, delay_o => delay_54);
  delay55:delay_1clk port map(Clock => Clock, Input => In_55, delay_o => delay_55);
  delay56:delay_1clk port map(Clock => Clock, Input => In_56, delay_o => delay_56);
  delay57:delay_1clk port map(Clock => Clock, Input => In_57, delay_o => delay_57);
  delay58:delay_1clk port map(Clock => Clock, Input => In_58, delay_o => delay_58);
  delay59:delay_1clk port map(Clock => Clock, Input => In_59, delay_o => delay_59);
  delay60:delay_1clk port map(Clock => Clock, Input => In_60, delay_o => delay_60);
  delay61:delay_1clk port map(Clock => Clock, Input => In_61, delay_o => delay_61);
  delay62:delay_1clk port map(Clock => Clock, Input => In_62, delay_o => delay_62);
  delay63:delay_1clk port map(Clock => Clock, Input => In_63, delay_o => delay_63);
  delay64:delay_1clk port map(Clock => Clock, Input => In_64, delay_o => delay_64);
  delay65:delay_1clk port map(Clock => Clock, Input => In_65, delay_o => delay_65);
  delay66:delay_1clk port map(Clock => Clock, Input => In_66, delay_o => delay_66);
  delay67:delay_1clk port map(Clock => Clock, Input => In_67, delay_o => delay_67);
  delay68:delay_1clk port map(Clock => Clock, Input => In_68, delay_o => delay_68);
  delay69:delay_1clk port map(Clock => Clock, Input => In_69, delay_o => delay_69);
  delay70:delay_1clk port map(Clock => Clock, Input => In_70, delay_o => delay_70);
  delay71:delay_1clk port map(Clock => Clock, Input => In_71, delay_o => delay_71);
  delay72:delay_1clk port map(Clock => Clock, Input => In_72, delay_o => delay_72);
  delay73:delay_1clk port map(Clock => Clock, Input => In_73, delay_o => delay_73);
  delay74:delay_1clk port map(Clock => Clock, Input => In_74, delay_o => delay_74);
  delay75:delay_1clk port map(Clock => Clock, Input => In_75, delay_o => delay_75);
  delay76:delay_1clk port map(Clock => Clock, Input => In_76, delay_o => delay_76);
  delay77:delay_1clk port map(Clock => Clock, Input => In_77, delay_o => delay_77);
  delay78:delay_1clk port map(Clock => Clock, Input => In_78, delay_o => delay_78);
  delay79:delay_1clk port map(Clock => Clock, Input => In_79, delay_o => delay_79);
  delay80:delay_1clk port map(Clock => Clock, Input => In_80, delay_o => delay_80);
  delay81:delay_1clk port map(Clock => Clock, Input => In_81, delay_o => delay_81);
  delay82:delay_1clk port map(Clock => Clock, Input => In_82, delay_o => delay_82);
  delay83:delay_1clk port map(Clock => Clock, Input => In_83, delay_o => delay_83);
  delay84:delay_1clk port map(Clock => Clock, Input => In_84, delay_o => delay_84);
  delay85:delay_1clk port map(Clock => Clock, Input => In_85, delay_o => delay_85);
  delay86:delay_1clk port map(Clock => Clock, Input => In_86, delay_o => delay_86);
  delay87:delay_1clk port map(Clock => Clock, Input => In_87, delay_o => delay_87);
  delay88:delay_1clk port map(Clock => Clock, Input => In_88, delay_o => delay_88);
  delay89:delay_1clk port map(Clock => Clock, Input => In_89, delay_o => delay_89);
  delay90:delay_1clk port map(Clock => Clock, Input => In_90, delay_o => delay_90	);
  delay91:delay_1clk port map(Clock => Clock, Input => In_91, delay_o => delay_91);
  delay92:delay_1clk port map(Clock => Clock, Input => In_92, delay_o => delay_92);
  delay93:delay_1clk port map(Clock => Clock, Input => In_93, delay_o => delay_93);
  delay94:delay_1clk port map(Clock => Clock, Input => In_94, delay_o => delay_94);
  delay95:delay_1clk port map(Clock => Clock, Input => In_95, delay_o => delay_95);
  delay96:delay_1clk port map(Clock => Clock, Input => In_96, delay_o => delay_96);
  delay97:delay_1clk port map(Clock => Clock, Input => In_97, delay_o => delay_97);
  delay98:delay_1clk port map(Clock => Clock, Input => In_98, delay_o => delay_98);
  delay99:delay_1clk port map(Clock => Clock, Input => In_99, delay_o => delay_99);
  delay100:delay_1clk port map(Clock => Clock, Input => In_100, delay_o => delay_100);
  delay101:delay_1clk port map(Clock => Clock, Input => In_101, delay_o => delay_101);
  delay102:delay_1clk port map(Clock => Clock, Input => In_102, delay_o => delay_102);
  delay103:delay_1clk port map(Clock => Clock, Input => In_103, delay_o => delay_103);
  delay104:delay_1clk port map(Clock => Clock, Input => In_104, delay_o => delay_104);
  delay105:delay_1clk port map(Clock => Clock, Input => In_105, delay_o => delay_105);
  delay106:delay_1clk port map(Clock => Clock, Input => In_106, delay_o => delay_106);
  delay107:delay_1clk port map(Clock => Clock, Input => In_107, delay_o => delay_107);
  delay108:delay_1clk port map(Clock => Clock, Input => In_108, delay_o => delay_108);
  delay109:delay_1clk port map(Clock => Clock, Input => In_109, delay_o => delay_109);
  delay110:delay_1clk port map(Clock => Clock, Input => In_110, delay_o => delay_110);
  delay111:delay_1clk port map(Clock => Clock, Input => In_111, delay_o => delay_111);
  delay112:delay_1clk port map(Clock => Clock, Input => In_112, delay_o => delay_112);
  delay113:delay_1clk port map(Clock => Clock, Input => In_113, delay_o => delay_113);
  delay114:delay_1clk port map(Clock => Clock, Input => In_114, delay_o => delay_114);
  delay115:delay_1clk port map(Clock => Clock, Input => In_115, delay_o => delay_115);
  delay116:delay_1clk port map(Clock => Clock, Input => In_116, delay_o => delay_116);
  delay117:delay_1clk port map(Clock => Clock, Input => In_117, delay_o => delay_117);
  delay118:delay_1clk port map(Clock => Clock, Input => In_118, delay_o => delay_118);
  delay119:delay_1clk port map(Clock => Clock, Input => In_119, delay_o => delay_119);
  delay120:delay_1clk port map(Clock => Clock, Input => In_120, delay_o => delay_120);
  delay121:delay_1clk port map(Clock => Clock, Input => In_121, delay_o => delay_121);
  delay122:delay_1clk port map(Clock => Clock, Input => In_122, delay_o => delay_122);
  delay123:delay_1clk port map(Clock => Clock, Input => In_123, delay_o => delay_123);
  delay124:delay_1clk port map(Clock => Clock, Input => In_124, delay_o => delay_124);
  delay125:delay_1clk port map(Clock => Clock, Input => In_125, delay_o => delay_125);
  delay126:delay_1clk port map(Clock => Clock, Input => In_126, delay_o => delay_126);
  delay127:delay_1clk port map(Clock => Clock, Input => In_127, delay_o => delay_127);
  delay128:delay_1clk port map(Clock => Clock, Input => In_128, delay_o => delay_128);
  delay129:delay_1clk port map(Clock => Clock, Input => In_129, delay_o => delay_129);
  delay130:delay_1clk port map(Clock => Clock, Input => In_130, delay_o => delay_130);
  delay131:delay_1clk port map(Clock => Clock, Input => In_131, delay_o => delay_131);
  delay132:delay_1clk port map(Clock => Clock, Input => In_132, delay_o => delay_132);
  delay133:delay_1clk port map(Clock => Clock, Input => In_133, delay_o => delay_133);
  delay134:delay_1clk port map(Clock => Clock, Input => In_134, delay_o => delay_134);
  delay135:delay_1clk port map(Clock => Clock, Input => In_135, delay_o => delay_135);
  delay136:delay_1clk port map(Clock => Clock, Input => In_136, delay_o => delay_136);
  delay137:delay_1clk port map(Clock => Clock, Input => In_137, delay_o => delay_137);
  delay138:delay_1clk port map(Clock => Clock, Input => In_138, delay_o => delay_138);
  delay139:delay_1clk port map(Clock => Clock, Input => In_139, delay_o => delay_139);
  delay140:delay_1clk port map(Clock => Clock, Input => In_140, delay_o => delay_140);
  delay141:delay_1clk port map(Clock => Clock, Input => In_141, delay_o => delay_141);
  delay142:delay_1clk port map(Clock => Clock, Input => In_142, delay_o => delay_142);
  delay143:delay_1clk port map(Clock => Clock, Input => In_143, delay_o => delay_143);
  delay144:delay_1clk port map(Clock => Clock, Input => In_144, delay_o => delay_144);
  delay145:delay_1clk port map(Clock => Clock, Input => In_145, delay_o => delay_145);
  delay146:delay_1clk port map(Clock => Clock, Input => In_146, delay_o => delay_146);
  delay147:delay_1clk port map(Clock => Clock, Input => In_147, delay_o => delay_147);
  delay148:delay_1clk port map(Clock => Clock, Input => In_148, delay_o => delay_148);
  delay149:delay_1clk port map(Clock => Clock, Input => In_149, delay_o => delay_149);
  delay150:delay_1clk port map(Clock => Clock, Input => In_150, delay_o => delay_150);
  delay151:delay_1clk port map(Clock => Clock, Input => In_151, delay_o => delay_151);
  delay152:delay_1clk port map(Clock => Clock, Input => In_152, delay_o => delay_152);
  delay153:delay_1clk port map(Clock => Clock, Input => In_153, delay_o => delay_153);
  delay154:delay_1clk port map(Clock => Clock, Input => In_154, delay_o => delay_154);
  delay155:delay_1clk port map(Clock => Clock, Input => In_155, delay_o => delay_155);
  delay156:delay_1clk port map(Clock => Clock, Input => In_156, delay_o => delay_156);
  delay157:delay_1clk port map(Clock => Clock, Input => In_157, delay_o => delay_157);
  delay158:delay_1clk port map(Clock => Clock, Input => In_158, delay_o => delay_158);
  delay159:delay_1clk port map(Clock => Clock, Input => In_159, delay_o => delay_159);
  delay160:delay_1clk port map(Clock => Clock, Input => In_160, delay_o => delay_160	);
  delay161:delay_1clk port map(Clock => Clock, Input => In_161, delay_o => delay_161);
  delay162:delay_1clk port map(Clock => Clock, Input => In_162, delay_o => delay_162);
  delay163:delay_1clk port map(Clock => Clock, Input => In_163, delay_o => delay_163);
  delay164:delay_1clk port map(Clock => Clock, Input => In_164, delay_o => delay_164);
  delay165:delay_1clk port map(Clock => Clock, Input => In_165, delay_o => delay_165);
  delay166:delay_1clk port map(Clock => Clock, Input => In_166, delay_o => delay_166);
  delay167:delay_1clk port map(Clock => Clock, Input => In_167, delay_o => delay_167);
  delay168:delay_1clk port map(Clock => Clock, Input => In_168, delay_o => delay_168);
  delay169:delay_1clk port map(Clock => Clock, Input => In_169, delay_o => delay_169);
  delay170:delay_1clk port map(Clock => Clock, Input => In_170, delay_o => delay_170);
  delay171:delay_1clk port map(Clock => Clock, Input => In_171, delay_o => delay_171);
  delay172:delay_1clk port map(Clock => Clock, Input => In_172, delay_o => delay_172);
  delay173:delay_1clk port map(Clock => Clock, Input => In_173, delay_o => delay_173);
  delay174:delay_1clk port map(Clock => Clock, Input => In_174, delay_o => delay_174);
  delay175:delay_1clk port map(Clock => Clock, Input => In_175, delay_o => delay_175);
  delay176:delay_1clk port map(Clock => Clock, Input => In_176, delay_o => delay_176);
  delay177:delay_1clk port map(Clock => Clock, Input => In_177, delay_o => delay_177);
  delay178:delay_1clk port map(Clock => Clock, Input => In_178, delay_o => delay_178);
  delay179:delay_1clk port map(Clock => Clock, Input => In_179, delay_o => delay_179);
  delay180:delay_1clk port map(Clock => Clock, Input => In_180, delay_o => delay_180);
  delay181:delay_1clk port map(Clock => Clock, Input => In_181, delay_o => delay_181);
  delay182:delay_1clk port map(Clock => Clock, Input => In_182, delay_o => delay_182);
  delay183:delay_1clk port map(Clock => Clock, Input => In_183, delay_o => delay_183);
  delay184:delay_1clk port map(Clock => Clock, Input => In_184, delay_o => delay_184);
  delay185:delay_1clk port map(Clock => Clock, Input => In_185, delay_o => delay_185);
  delay186:delay_1clk port map(Clock => Clock, Input => In_186, delay_o => delay_186);
  delay187:delay_1clk port map(Clock => Clock, Input => In_187, delay_o => delay_187);
  delay188:delay_1clk port map(Clock => Clock, Input => In_188, delay_o => delay_188);
  delay189:delay_1clk port map(Clock => Clock, Input => In_189, delay_o => delay_189);
  delay190:delay_1clk port map(Clock => Clock, Input => In_190, delay_o => delay_190);
  delay191:delay_1clk port map(Clock => Clock, Input => In_191, delay_o => delay_191);
  delay192:delay_1clk port map(Clock => Clock, Input => In_192, delay_o => delay_192);
  delay193:delay_1clk port map(Clock => Clock, Input => In_193, delay_o => delay_193);
  delay194:delay_1clk port map(Clock => Clock, Input => In_194, delay_o => delay_194);
  delay195:delay_1clk port map(Clock => Clock, Input => In_195, delay_o => delay_195);
  delay196:delay_1clk port map(Clock => Clock, Input => In_196, delay_o => delay_196);
  delay197:delay_1clk port map(Clock => Clock, Input => In_197, delay_o => delay_197);
  delay198:delay_1clk port map(Clock => Clock, Input => In_198, delay_o => delay_198);
  delay199:delay_1clk port map(Clock => Clock, Input => In_199, delay_o => delay_199);
  delay200:delay_1clk port map(Clock => Clock, Input => In_200, delay_o => delay_200);

  D_MUX1:MUX port map(
    In_1  => delay_1,  In_2  => delay_2,  In_3  => delay_3,  In_4  => delay_4,  In_5  => delay_5,  In_6  => delay_6,  In_7  => delay_7,  In_8  => delay_8,  In_9  => delay_9,  In_10 => delay_10,
    In_11 => delay_11, In_12 => delay_12, In_13 => delay_13, In_14 => delay_14, In_15 => delay_15, In_16 => delay_16, In_17 => delay_17, In_18 => delay_18, In_19 => delay_19, In_20 => delay_20,
    In_21 => delay_21, In_22 => delay_22, In_23 => delay_23, In_24 => delay_24, In_25 => delay_25, In_26 => delay_26, In_27 => delay_27, In_28 => delay_28, In_29 => delay_29, In_30 => delay_30,
    In_31 => delay_31, In_32 => delay_32, In_33 => delay_33, In_34 => delay_34, In_35 => delay_35, In_36 => delay_36, In_37 => delay_37, In_38 => delay_38, In_39 => delay_39, In_40 => delay_40,
    MULTI_O => delay_O1, SEL => SEL
    );
  
  D_MUX2:MUX port map(
    In_1  => delay_41, In_2  => delay_42, In_3  => delay_43, In_4  => delay_44, In_5  => delay_45, In_6  => delay_46, In_7  => delay_47, In_8  => delay_48, In_9  => delay_49, In_10 => delay_50,
    In_11 => delay_51, In_12 => delay_52, In_13 => delay_53, In_14 => delay_54, In_15 => delay_55, In_16 => delay_56, In_17 => delay_57, In_18 => delay_58, In_19 => delay_59, In_20 => delay_60,
    In_21 => delay_61, In_22 => delay_62, In_23 => delay_63, In_24 => delay_64, In_25 => delay_65, In_26 => delay_66, In_27 => delay_67, In_28 => delay_68, In_29 => delay_69, In_30 => delay_70,
    In_31 => delay_71, In_32 => delay_72, In_33 => delay_73, In_34 => delay_74, In_35 => delay_75, In_36 => delay_76, In_37 => delay_77, In_38 => delay_78, In_39 => delay_79, In_40 => delay_80,
    multi_o => delay_o2, sel => sel
    );

  D_MUX3:MUX port map(
    In_1  => delay_81,  In_2  => delay_82,  In_3  => delay_83,  In_4  => delay_84,  In_5  => delay_95,  In_6  => delay_86,  In_7  => delay_87,  In_8  => delay_88,  In_9  => delay_89,  In_10 => delay_90,
    In_11 => delay_91,  In_12 => delay_92,  In_13 => delay_93,  In_14 => delay_94,  In_15 => delay_95,  In_16 => delay_96,  In_17 => delay_87,  In_18 => delay_98,  In_19 => delay_99,  In_20 => delay_100,
    In_21 => delay_101, In_22 => delay_102, In_23 => delay_103, In_24 => delay_104, In_25 => delay_105, In_26 => delay_106, In_27 => delay_107, In_28 => delay_108, In_29 => delay_109, In_30 => delay_110,
    In_31 => delay_111, In_32 => delay_112, In_33 => delay_113, In_34 => delay_114, In_35 => delay_115, In_36 => delay_116, In_37 => delay_117, In_38 => delay_118, In_39 => delay_119, In_40 => delay_120,
    multi_o => delay_o3, sel => sel
    );


  D_MUX4:MUX port map(
    In_1  => delay_121, In_2  => delay_122, In_3  => delay_123, In_4  => delay_124, In_5  => delay_125, In_6  => delay_126, In_7  => delay_127, In_8  => delay_128, In_9  => delay_129, In_10 => delay_130,
    In_11 => delay_131, In_12 => delay_132, In_13 => delay_133, In_14 => delay_134, In_15 => delay_135, In_16 => delay_136, In_17 => delay_137, In_18 => delay_138, In_19 => delay_139, In_20 => delay_140,
    In_21 => delay_141, In_22 => delay_142, In_23 => delay_143, In_24 => delay_144, In_25 => delay_145, In_26 => delay_146, In_27 => delay_147, In_28 => delay_148, In_29 => delay_149, In_30 => delay_150,
    In_31 => delay_151, In_32 => delay_152, In_33 => delay_153, In_34 => delay_154, In_35 => delay_155, In_36 => delay_156, In_37 => delay_157, In_38 => delay_158, In_39 => delay_159, In_40 => delay_160,
    multi_o => delay_o4, sel => sel
    );

  D_MUX5:MUX port map(
    In_1  => delay_161, In_2  => delay_162, In_3  => delay_163, In_4  => delay_164, In_5  => delay_165, In_6  => delay_166, In_7  => delay_167, In_8  => delay_168, In_9  => delay_169, In_10 => delay_170,
    In_11 => delay_171, In_12 => delay_172, In_13 => delay_173, In_14 => delay_174, In_15 => delay_175, In_16 => delay_176, In_17 => delay_177, In_18 => delay_178, In_19 => delay_179, In_20 => delay_180,
    In_21 => delay_181, In_22 => delay_182, In_23 => delay_183, In_24 => delay_184, In_25 => delay_185, In_26 => delay_186, In_27 => delay_187, In_28 => delay_188, In_29 => delay_189, In_30 => delay_190,
    In_31 => delay_191, In_32 => delay_192, In_33 => delay_193, In_34 => delay_194, In_35 => delay_195, In_36 => delay_196, In_37 => delay_197, In_38 => delay_198, In_39 => delay_199, In_40 => delay_200,
    multi_o => delay_o5, sel => sel
    );

end rtl;
