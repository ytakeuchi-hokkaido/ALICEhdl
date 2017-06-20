library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity SUBs is
  generic(
    In_width : natural := 10;
    Out_width : natural := 13;
    sel_width : natural := 2;
    SUM_width : natural := 18;
    cont_width: natural := 9;
    contri_width:natural := 9;
    average_width:natural := 12;
    LT_add_width : natural := 4;
    Add_width: natural := 13
    );
	

  port(
    Df_o1, Df_o2, Df_o3, Df_o4, Df_o5, Df_o6, Df_o7, Df_o8, Df_o9, Df_o10 			:in  unsigned((In_width-1) downto 0);
    Df_o11, Df_o12, Df_o13, Df_o14, Df_o15, Df_o16, Df_o17, Df_o18, Df_o19, Df_o20 		:in  unsigned((In_width-1) downto 0);
    Df_o21, Df_o22, Df_o23, Df_o24, Df_o25, Df_o26, Df_o27, Df_o28, Df_o29, Df_o30 		:in  unsigned((In_width-1) downto 0);
    Df_o31, Df_o32, Df_o33, Df_o34, Df_o35, Df_o36, Df_o37, Df_o38, Df_o39, Df_o40 		:in  unsigned((In_width-1) downto 0);
    Df_o41, Df_o42, Df_o43, Df_o44, Df_o45, Df_o46, Df_o47, Df_o48, Df_o49, Df_o50		:in  unsigned((In_width-1) downto 0); 
    Df_o51, Df_o52, Df_o53, Df_o54, Df_o55, Df_o56, Df_o57, Df_o58, Df_o59, Df_o60 		:in  unsigned((In_width-1) downto 0);
    Df_o61, Df_o62, Df_o63, Df_o64, Df_o65, Df_o66, Df_o67, Df_o68, Df_o69, Df_o70 		:in  unsigned((In_width-1) downto 0);
    Df_o71, Df_o72, Df_o73, Df_o74, Df_o75, Df_o76, Df_o77, Df_o78, Df_o79, Df_o80 		:in  unsigned((In_width-1) downto 0);
    Df_o81, Df_o82, Df_o83, Df_o84, Df_o85, Df_o86, Df_o87, Df_o88, Df_o89, Df_o90 		:in  unsigned((In_width-1) downto 0);
    Df_o91, Df_o92, Df_o93, Df_o94, Df_o95, Df_o96, Df_o97, Df_o98, Df_o99, Df_o100 	:in  unsigned((In_width-1) downto 0);
    Df_o101, Df_o102, Df_o103, Df_o104, Df_o105, Df_o106, Df_o107, Df_o108, Df_o109, Df_o110:in  unsigned((In_width-1) downto 0); 
    Df_o111, Df_o112, Df_o113, Df_o114, Df_o115, Df_o116, Df_o117, Df_o118, Df_o119, Df_o120:in  unsigned((In_width-1) downto 0);
    Df_o121, Df_o122, Df_o123, Df_o124, Df_o125, Df_o126, Df_o127, Df_o128, Df_o129, Df_o130:in  unsigned((In_width-1) downto 0);
    Df_o131, Df_o132, Df_o133, Df_o134, Df_o135, Df_o136, Df_o137, Df_o138, Df_o139, Df_o140:in  unsigned((In_width-1) downto 0);
    Df_o141, Df_o142, Df_o143, Df_o144, Df_o145, Df_o146, Df_o147, Df_o148, Df_o149, Df_o150:in  unsigned((In_width-1) downto 0);
    Df_o151, Df_o152, Df_o153, Df_o154, Df_o155, Df_o156, Df_o157, Df_o158, Df_o159, Df_o160:in  unsigned((In_width-1) downto 0);
    Df_o161, Df_o162, Df_o163, Df_o164, Df_o165, Df_o166, Df_o167, Df_o168, Df_o169, Df_o170:in  unsigned((In_width-1) downto 0);
    Df_o171, Df_o172, Df_o173, Df_o174, Df_o175, Df_o176, Df_o177, Df_o178, Df_o179, Df_o180:in  unsigned((In_width-1) downto 0);
    Df_o181, Df_o182, Df_o183, Df_o184, Df_o185, Df_o186, Df_o187, Df_o188, Df_o189, Df_o190:in  unsigned((In_width-1) downto 0);
    Df_o191, Df_o192, Df_o193, Df_o194, Df_o195, Df_o196, Df_o197, Df_o198, Df_o199, Df_o200:in  unsigned((In_width-1) downto 0);
    average											:in unsigned((average_width-1) downto 0);
    CMF_o1, CMF_o2, CMF_o3, CMF_o4, CMF_o5, CMF_o6, CMF_o7, CMF_o8, CMF_o9, CMF_o10 			:out  signed((Out_width-1) downto 0);
    CMF_o11, CMF_o12, CMF_o13, CMF_o14, CMF_o15, CMF_o16, CMF_o17, CMF_o18, CMF_o19, CMF_o20 		:out  signed((Out_width-1) downto 0);
    CMF_o21, CMF_o22, CMF_o23, CMF_o24, CMF_o25, CMF_o26, CMF_o27, CMF_o28, CMF_o29, CMF_o30 		:out  signed((Out_width-1) downto 0);
    CMF_o31, CMF_o32, CMF_o33, CMF_o34, CMF_o35, CMF_o36, CMF_o37, CMF_o38, CMF_o39, CMF_o40 		:out  signed((Out_width-1) downto 0);
    CMF_o41, CMF_o42, CMF_o43, CMF_o44, CMF_o45, CMF_o46, CMF_o47, CMF_o48, CMF_o49, CMF_o50		:out  signed((Out_width-1) downto 0); 
    CMF_o51, CMF_o52, CMF_o53, CMF_o54, CMF_o55, CMF_o56, CMF_o57, CMF_o58, CMF_o59, CMF_o60 		:out  signed((Out_width-1) downto 0);
    CMF_o61, CMF_o62, CMF_o63, CMF_o64, CMF_o65, CMF_o66, CMF_o67, CMF_o68, CMF_o69, CMF_o70 		:out  signed((Out_width-1) downto 0);
    CMF_o71, CMF_o72, CMF_o73, CMF_o74, CMF_o75, CMF_o76, CMF_o77, CMF_o78, CMF_o79, CMF_o80 		:out  signed((Out_width-1) downto 0);
    CMF_o81, CMF_o82, CMF_o83, CMF_o84, CMF_o85, CMF_o86, CMF_o87, CMF_o88, CMF_o89, CMF_o90 		:out  signed((Out_width-1) downto 0);
    CMF_o91, CMF_o92, CMF_o93, CMF_o94, CMF_o95, CMF_o96, CMF_o97, CMF_o98, CMF_o99, CMF_o100 	:out  signed((Out_width-1) downto 0);
    CMF_o101, CMF_o102, CMF_o103, CMF_o104, CMF_o105, CMF_o106, CMF_o107, CMF_o108, CMF_o109, CMF_o110:out  signed((Out_width-1) downto 0); 
    CMF_o111, CMF_o112, CMF_o113, CMF_o114, CMF_o115, CMF_o116, CMF_o117, CMF_o118, CMF_o119, CMF_o120:out  signed((Out_width-1) downto 0);
    CMF_o121, CMF_o122, CMF_o123, CMF_o124, CMF_o125, CMF_o126, CMF_o127, CMF_o128, CMF_o129, CMF_o130:out  signed((Out_width-1) downto 0);
    CMF_o131, CMF_o132, CMF_o133, CMF_o134, CMF_o135, CMF_o136, CMF_o137, CMF_o138, CMF_o139, CMF_o140:out  signed((Out_width-1) downto 0);
    CMF_o141, CMF_o142, CMF_o143, CMF_o144, CMF_o145, CMF_o146, CMF_o147, CMF_o148, CMF_o149, CMF_o150:out  signed((Out_width-1) downto 0);
    CMF_o151, CMF_o152, CMF_o153, CMF_o154, CMF_o155, CMF_o156, CMF_o157, CMF_o158, CMF_o159, CMF_o160:out  signed((Out_width-1) downto 0);
    CMF_o161, CMF_o162, CMF_o163, CMF_o164, CMF_o165, CMF_o166, CMF_o167, CMF_o168, CMF_o169, CMF_o170:out  signed((Out_width-1) downto 0);
    CMF_o171, CMF_o172, CMF_o173, CMF_o174, CMF_o175, CMF_o176, CMF_o177, CMF_o178, CMF_o179, CMF_o180:out  signed((Out_width-1) downto 0);
    CMF_o181, CMF_o182, CMF_o183, CMF_o184, CMF_o185, CMF_o186, CMF_o187, CMF_o188, CMF_o189, CMF_o190:out  signed((Out_width-1) downto 0);
    CMF_o191, CMF_o192, CMF_o193, CMF_o194, CMF_o195, CMF_o196, CMF_o197, CMF_o198, CMF_o199, CMF_o200:out  signed((Out_width-1) downto 0)
    );
	
end entity;

architecture rtl of SUBs is

-- Subtractor

  component SUB	port(
    Df_o		:in unsigned((In_width-1) downto 0);
    average	:in unsigned((average_width-1) downto 0);
    SUB_o		:out signed((Out_width-1) downto 0)
    );
  end component;
-- Subtractor

begin

  SUB1:SUB port map(Df_o => Df_o1, average => average, SUB_o => CMF_o1);
  SUB2:SUB port map(Df_o => Df_o2, average => average, SUB_o => CMF_o2);
  SUB3:SUB port map(Df_o => Df_o3, average => average, SUB_o => CMF_o3);
  SUB4:SUB port map(Df_o => Df_o4, average => average, SUB_o => CMF_o4);
  SUB5:SUB port map(Df_o => Df_o5, average => average, SUB_o => CMF_o5);
  SUB6:SUB port map(Df_o => Df_o6, average => average, SUB_o => CMF_o6);
  SUB7:SUB port map(Df_o => Df_o7, average => average, SUB_o => CMF_o7);
  SUB8:SUB port map(Df_o => Df_o8, average => average, SUB_o => CMF_o8);
  SUB9:SUB port map(Df_o => Df_o9, average => average, SUB_o => CMF_o9);
  SUB10:SUB port map(Df_o => Df_o10, average => average, SUB_o => CMF_o10);

  SUB11:SUB port map(Df_o => Df_o11, average => average, SUB_o => CMF_o11);
  SUB12:SUB port map(Df_o => Df_o12, average => average, SUB_o => CMF_o12);
  SUB13:SUB port map(Df_o => Df_o13, average => average, SUB_o => CMF_o13);
  SUB14:SUB port map(Df_o => Df_o14, average => average, SUB_o => CMF_o14);
  SUB15:SUB port map(Df_o => Df_o15, average => average, SUB_o => CMF_o15);
  SUB16:SUB port map(Df_o => Df_o16, average => average, SUB_o => CMF_o16);
  SUB17:SUB port map(Df_o => Df_o17, average => average, SUB_o => CMF_o17);
  SUB18:SUB port map(Df_o => Df_o18, average => average, SUB_o => CMF_o18);
  SUB19:SUB port map(Df_o => Df_o19, average => average, SUB_o => CMF_o19);
  SUB20:SUB port map(Df_o => Df_o20, average => average, SUB_o => CMF_o20);

  SUB21:SUB port map(Df_o => Df_o21, average => average, SUB_o => CMF_o21);
  SUB22:SUB port map(Df_o => Df_o22, average => average, SUB_o => CMF_o22);
  SUB23:SUB port map(Df_o => Df_o23, average => average, SUB_o => CMF_o23);
  SUB24:SUB port map(Df_o => Df_o24, average => average, SUB_o => CMF_o24);
  SUB25:SUB port map(Df_o => Df_o25, average => average, SUB_o => CMF_o25);
  SUB26:SUB port map(Df_o => Df_o26, average => average, SUB_o => CMF_o26);
  SUB27:SUB port map(Df_o => Df_o27, average => average, SUB_o => CMF_o27);
  SUB28:SUB port map(Df_o => Df_o28, average => average, SUB_o => CMF_o28);
  SUB29:SUB port map(Df_o => Df_o29, average => average, SUB_o => CMF_o29);
  SUB30:SUB port map(Df_o => Df_o30, average => average, SUB_o => CMF_o30);

  SUB31:SUB port map(Df_o => Df_o31, average => average, SUB_o => CMF_o31);
  SUB32:SUB port map(Df_o => Df_o32, average => average, SUB_o => CMF_o32);
  SUB33:SUB port map(Df_o => Df_o33, average => average, SUB_o => CMF_o33);
  SUB34:SUB port map(Df_o => Df_o34, average => average, SUB_o => CMF_o34);
  SUB35:SUB port map(Df_o => Df_o35, average => average, SUB_o => CMF_o35);
  SUB36:SUB port map(Df_o => Df_o36, average => average, SUB_o => CMF_o36);
  SUB37:SUB port map(Df_o => Df_o37, average => average, SUB_o => CMF_o37);
  SUB38:SUB port map(Df_o => Df_o38, average => average, SUB_o => CMF_o38);
  SUB39:SUB port map(Df_o => Df_o39, average => average, SUB_o => CMF_o39);
  SUB40:SUB port map(Df_o => Df_o40, average => average, SUB_o => CMF_o40);

  SUB41:SUB port map(Df_o => Df_o41, average => average, SUB_o => CMF_o41);
  SUB42:SUB port map(Df_o => Df_o42, average => average, SUB_o => CMF_o42);
  SUB43:SUB port map(Df_o => Df_o43, average => average, SUB_o => CMF_o43);
  SUB44:SUB port map(Df_o => Df_o44, average => average, SUB_o => CMF_o44);
  SUB45:SUB port map(Df_o => Df_o45, average => average, SUB_o => CMF_o45);
  SUB46:SUB port map(Df_o => Df_o46, average => average, SUB_o => CMF_o46);
  SUB47:SUB port map(Df_o => Df_o47, average => average, SUB_o => CMF_o47);
  SUB48:SUB port map(Df_o => Df_o48, average => average, SUB_o => CMF_o48);
  SUB49:SUB port map(Df_o => Df_o49, average => average, SUB_o => CMF_o49);
  SUB50:SUB port map(Df_o => Df_o50, average => average, SUB_o => CMF_o50);

  SUB51:SUB port map(Df_o => Df_o51, average => average, SUB_o => CMF_o51);
  SUB52:SUB port map(Df_o => Df_o52, average => average, SUB_o => CMF_o52);
  SUB53:SUB port map(Df_o => Df_o53, average => average, SUB_o => CMF_o53);
  SUB54:SUB port map(Df_o => Df_o54, average => average, SUB_o => CMF_o54);
  SUB55:SUB port map(Df_o => Df_o55, average => average, SUB_o => CMF_o55);
  SUB56:SUB port map(Df_o => Df_o56, average => average, SUB_o => CMF_o56);
  SUB57:SUB port map(Df_o => Df_o57, average => average, SUB_o => CMF_o57);
  SUB58:SUB port map(Df_o => Df_o58, average => average, SUB_o => CMF_o58);
  SUB59:SUB port map(Df_o => Df_o59, average => average, SUB_o => CMF_o59);
  SUB60:SUB port map(Df_o => Df_o60, average => average, SUB_o => CMF_o60);

  SUB61:SUB port map(Df_o => Df_o61, average => average, SUB_o => CMF_o61);
  SUB62:SUB port map(Df_o => Df_o62, average => average, SUB_o => CMF_o62);
  SUB63:SUB port map(Df_o => Df_o63, average => average, SUB_o => CMF_o63);
  SUB64:SUB port map(Df_o => Df_o64, average => average, SUB_o => CMF_o64);
  SUB65:SUB port map(Df_o => Df_o65, average => average, SUB_o => CMF_o65);
  SUB66:SUB port map(Df_o => Df_o66, average => average, SUB_o => CMF_o66);
  SUB67:SUB port map(Df_o => Df_o67, average => average, SUB_o => CMF_o67);
  SUB68:SUB port map(Df_o => Df_o68, average => average, SUB_o => CMF_o68);
  SUB69:SUB port map(Df_o => Df_o69, average => average, SUB_o => CMF_o69);
  SUB70:SUB port map(Df_o => Df_o70, average => average, SUB_o => CMF_o70);

  SUB71:SUB port map(Df_o => Df_o71, average => average, SUB_o => CMF_o71);
  SUB72:SUB port map(Df_o => Df_o72, average => average, SUB_o => CMF_o72);
  SUB73:SUB port map(Df_o => Df_o73, average => average, SUB_o => CMF_o73);
  SUB74:SUB port map(Df_o => Df_o74, average => average, SUB_o => CMF_o74);
  SUB75:SUB port map(Df_o => Df_o75, average => average, SUB_o => CMF_o75);
  SUB76:SUB port map(Df_o => Df_o76, average => average, SUB_o => CMF_o76);
  SUB77:SUB port map(Df_o => Df_o77, average => average, SUB_o => CMF_o77);
  SUB78:SUB port map(Df_o => Df_o78, average => average, SUB_o => CMF_o78);
  SUB79:SUB port map(Df_o => Df_o79, average => average, SUB_o => CMF_o79);
  SUB80:SUB port map(Df_o => Df_o80, average => average, SUB_o => CMF_o80);

  SUB81:SUB port map(Df_o => Df_o81, average => average, SUB_o => CMF_o81);
  SUB82:SUB port map(Df_o => Df_o82, average => average, SUB_o => CMF_o82);
  SUB83:SUB port map(Df_o => Df_o83, average => average, SUB_o => CMF_o83);
  SUB84:SUB port map(Df_o => Df_o84, average => average, SUB_o => CMF_o84);
  SUB85:SUB port map(Df_o => Df_o85, average => average, SUB_o => CMF_o85);
  SUB86:SUB port map(Df_o => Df_o86, average => average, SUB_o => CMF_o86);
  SUB87:SUB port map(Df_o => Df_o87, average => average, SUB_o => CMF_o87);
  SUB88:SUB port map(Df_o => Df_o88, average => average, SUB_o => CMF_o88);
  SUB89:SUB port map(Df_o => Df_o89, average => average, SUB_o => CMF_o89);
  SUB90:SUB port map(Df_o => Df_o90, average => average, SUB_o => CMF_o90);

  SUB91:SUB port map(Df_o => Df_o91, average => average, SUB_o => CMF_o91);
  SUB92:SUB port map(Df_o => Df_o92, average => average, SUB_o => CMF_o92);
  SUB93:SUB port map(Df_o => Df_o93, average => average, SUB_o => CMF_o93);
  SUB94:SUB port map(Df_o => Df_o94, average => average, SUB_o => CMF_o94);
  SUB95:SUB port map(Df_o => Df_o95, average => average, SUB_o => CMF_o95);
  SUB96:SUB port map(Df_o => Df_o96, average => average, SUB_o => CMF_o96);
  SUB97:SUB port map(Df_o => Df_o97, average => average, SUB_o => CMF_o97);
  SUB98:SUB port map(Df_o => Df_o98, average => average, SUB_o => CMF_o98);
  SUB99:SUB port map(Df_o => Df_o99, average => average, SUB_o => CMF_o99);
  SUB100:SUB port map(Df_o => Df_o100, average => average, SUB_o => CMF_o100);

  SUB101:SUB port map(Df_o => Df_o101, average => average, SUB_o => CMF_o101);
  SUB102:SUB port map(Df_o => Df_o102, average => average, SUB_o => CMF_o102);
  SUB103:SUB port map(Df_o => Df_o103, average => average, SUB_o => CMF_o103);
  SUB104:SUB port map(Df_o => Df_o104, average => average, SUB_o => CMF_o104);
  SUB105:SUB port map(Df_o => Df_o105, average => average, SUB_o => CMF_o105);
  SUB106:SUB port map(Df_o => Df_o106, average => average, SUB_o => CMF_o106);
  SUB107:SUB port map(Df_o => Df_o107, average => average, SUB_o => CMF_o107);
  SUB108:SUB port map(Df_o => Df_o108, average => average, SUB_o => CMF_o108);
  SUB109:SUB port map(Df_o => Df_o109, average => average, SUB_o => CMF_o109);
  SUB110:SUB port map(Df_o => Df_o110, average => average, SUB_o => CMF_o110);

  SUB111:SUB port map(Df_o => Df_o111, average => average, SUB_o => CMF_o111);
  SUB112:SUB port map(Df_o => Df_o112, average => average, SUB_o => CMF_o112);
  SUB113:SUB port map(Df_o => Df_o113, average => average, SUB_o => CMF_o113);
  SUB114:SUB port map(Df_o => Df_o114, average => average, SUB_o => CMF_o114);
  SUB115:SUB port map(Df_o => Df_o115, average => average, SUB_o => CMF_o115);
  SUB116:SUB port map(Df_o => Df_o116, average => average, SUB_o => CMF_o116);
  SUB117:SUB port map(Df_o => Df_o117, average => average, SUB_o => CMF_o117);
  SUB118:SUB port map(Df_o => Df_o118, average => average, SUB_o => CMF_o118);
  SUB119:SUB port map(Df_o => Df_o119, average => average, SUB_o => CMF_o119);
  SUB120:SUB port map(Df_o => Df_o120, average => average, SUB_o => CMF_o120);

  SUB121:SUB port map(Df_o => Df_o121, average => average, SUB_o => CMF_o121);
  SUB122:SUB port map(Df_o => Df_o122, average => average, SUB_o => CMF_o122);
  SUB123:SUB port map(Df_o => Df_o123, average => average, SUB_o => CMF_o123);
  SUB124:SUB port map(Df_o => Df_o124, average => average, SUB_o => CMF_o124);
  SUB125:SUB port map(Df_o => Df_o125, average => average, SUB_o => CMF_o125);
  SUB126:SUB port map(Df_o => Df_o126, average => average, SUB_o => CMF_o126);
  SUB127:SUB port map(Df_o => Df_o127, average => average, SUB_o => CMF_o127);
  SUB128:SUB port map(Df_o => Df_o128, average => average, SUB_o => CMF_o128);
  SUB129:SUB port map(Df_o => Df_o129, average => average, SUB_o => CMF_o129);
  SUB130:SUB port map(Df_o => Df_o130, average => average, SUB_o => CMF_o130);

  SUB131:SUB port map(Df_o => Df_o131, average => average, SUB_o => CMF_o131);
  SUB132:SUB port map(Df_o => Df_o132, average => average, SUB_o => CMF_o132);
  SUB133:SUB port map(Df_o => Df_o133, average => average, SUB_o => CMF_o133);
  SUB134:SUB port map(Df_o => Df_o134, average => average, SUB_o => CMF_o134);
  SUB135:SUB port map(Df_o => Df_o135, average => average, SUB_o => CMF_o135);
  SUB136:SUB port map(Df_o => Df_o136, average => average, SUB_o => CMF_o136);
  SUB137:SUB port map(Df_o => Df_o137, average => average, SUB_o => CMF_o137);
  SUB138:SUB port map(Df_o => Df_o138, average => average, SUB_o => CMF_o138);
  SUB139:SUB port map(Df_o => Df_o139, average => average, SUB_o => CMF_o139);
  SUB140:SUB port map(Df_o => Df_o140, average => average, SUB_o => CMF_o140);

  SUB141:SUB port map(Df_o => Df_o141, average => average, SUB_o => CMF_o141);
  SUB142:SUB port map(Df_o => Df_o142, average => average, SUB_o => CMF_o142);
  SUB143:SUB port map(Df_o => Df_o143, average => average, SUB_o => CMF_o143);
  SUB144:SUB port map(Df_o => Df_o144, average => average, SUB_o => CMF_o144);
  SUB145:SUB port map(Df_o => Df_o145, average => average, SUB_o => CMF_o145);
  SUB146:SUB port map(Df_o => Df_o146, average => average, SUB_o => CMF_o146);
  SUB147:SUB port map(Df_o => Df_o147, average => average, SUB_o => CMF_o147);
  SUB148:SUB port map(Df_o => Df_o148, average => average, SUB_o => CMF_o148);
  SUB149:SUB port map(Df_o => Df_o149, average => average, SUB_o => CMF_o149);
  SUB150:SUB port map(Df_o => Df_o150, average => average, SUB_o => CMF_o150);

  SUB151:SUB port map(Df_o => Df_o151, average => average, SUB_o => CMF_o151);
  SUB152:SUB port map(Df_o => Df_o152, average => average, SUB_o => CMF_o152);
  SUB153:SUB port map(Df_o => Df_o153, average => average, SUB_o => CMF_o153);
  SUB154:SUB port map(Df_o => Df_o154, average => average, SUB_o => CMF_o154);
  SUB155:SUB port map(Df_o => Df_o155, average => average, SUB_o => CMF_o155);
  SUB156:SUB port map(Df_o => Df_o156, average => average, SUB_o => CMF_o156);
  SUB157:SUB port map(Df_o => Df_o157, average => average, SUB_o => CMF_o157);
  SUB158:SUB port map(Df_o => Df_o158, average => average, SUB_o => CMF_o158);
  SUB159:SUB port map(Df_o => Df_o159, average => average, SUB_o => CMF_o159);
  SUB160:SUB port map(Df_o => Df_o160, average => average, SUB_o => CMF_o160);

  SUB161:SUB port map(Df_o => Df_o161, average => average, SUB_o => CMF_o161);
  SUB162:SUB port map(Df_o => Df_o162, average => average, SUB_o => CMF_o162);
  SUB163:SUB port map(Df_o => Df_o163, average => average, SUB_o => CMF_o163);
  SUB164:SUB port map(Df_o => Df_o164, average => average, SUB_o => CMF_o164);
  SUB165:SUB port map(Df_o => Df_o165, average => average, SUB_o => CMF_o165);
  SUB166:SUB port map(Df_o => Df_o166, average => average, SUB_o => CMF_o166);
  SUB167:SUB port map(Df_o => Df_o167, average => average, SUB_o => CMF_o167);
  SUB168:SUB port map(Df_o => Df_o168, average => average, SUB_o => CMF_o168);
  SUB169:SUB port map(Df_o => Df_o169, average => average, SUB_o => CMF_o169);
  SUB170:SUB port map(Df_o => Df_o170, average => average, SUB_o => CMF_o170);

  SUB171:SUB port map(Df_o => Df_o171, average => average, SUB_o => CMF_o171);
  SUB172:SUB port map(Df_o => Df_o172, average => average, SUB_o => CMF_o172);
  SUB173:SUB port map(Df_o => Df_o173, average => average, SUB_o => CMF_o173);
  SUB174:SUB port map(Df_o => Df_o174, average => average, SUB_o => CMF_o174);
  SUB175:SUB port map(Df_o => Df_o175, average => average, SUB_o => CMF_o175);
  SUB176:SUB port map(Df_o => Df_o176, average => average, SUB_o => CMF_o176);
  SUB177:SUB port map(Df_o => Df_o177, average => average, SUB_o => CMF_o177);
  SUB178:SUB port map(Df_o => Df_o178, average => average, SUB_o => CMF_o178);
  SUB179:SUB port map(Df_o => Df_o179, average => average, SUB_o => CMF_o179);
  SUB180:SUB port map(Df_o => Df_o180, average => average, SUB_o => CMF_o180);

  SUB181:SUB port map(Df_o => Df_o181, average => average, SUB_o => CMF_o181);
  SUB182:SUB port map(Df_o => Df_o182, average => average, SUB_o => CMF_o182);
  SUB183:SUB port map(Df_o => Df_o183, average => average, SUB_o => CMF_o183);
  SUB184:SUB port map(Df_o => Df_o184, average => average, SUB_o => CMF_o184);
  SUB185:SUB port map(Df_o => Df_o185, average => average, SUB_o => CMF_o185);
  SUB186:SUB port map(Df_o => Df_o186, average => average, SUB_o => CMF_o186);
  SUB187:SUB port map(Df_o => Df_o187, average => average, SUB_o => CMF_o187);
  SUB188:SUB port map(Df_o => Df_o188, average => average, SUB_o => CMF_o188);
  SUB189:SUB port map(Df_o => Df_o189, average => average, SUB_o => CMF_o189);
  SUB190:SUB port map(Df_o => Df_o190, average => average, SUB_o => CMF_o190);

  SUB191:SUB port map(Df_o => Df_o191, average => average, SUB_o => CMF_o191);
  SUB192:SUB port map(Df_o => Df_o192, average => average, SUB_o => CMF_o192);
  SUB193:SUB port map(Df_o => Df_o193, average => average, SUB_o => CMF_o193);
  SUB194:SUB port map(Df_o => Df_o194, average => average, SUB_o => CMF_o194);
  SUB195:SUB port map(Df_o => Df_o195, average => average, SUB_o => CMF_o195);
  SUB196:SUB port map(Df_o => Df_o196, average => average, SUB_o => CMF_o196);
  SUB197:SUB port map(Df_o => Df_o197, average => average, SUB_o => CMF_o197);
  SUB198:SUB port map(Df_o => Df_o198, average => average, SUB_o => CMF_o198);
  SUB199:SUB port map(Df_o => Df_o199, average => average, SUB_o => CMF_o199);
  SUB200:SUB port map(Df_o => Df_o200, average => average, SUB_o => CMF_o200);

end rtl;
