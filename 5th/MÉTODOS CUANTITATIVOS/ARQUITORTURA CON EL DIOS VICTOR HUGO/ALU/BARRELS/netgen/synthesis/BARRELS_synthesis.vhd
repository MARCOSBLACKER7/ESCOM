--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: BARRELS_synthesis.vhd
-- /___/   /\     Timestamp: Wed Oct 10 11:12:13 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm BARRELS -w -dir netgen/synthesis -ofmt vhdl -sim BARRELS.ngc BARRELS_synthesis.vhd 
-- Device	: xc7a100t-2-csg324
-- Input file	: BARRELS.ngc
-- Output file	: C:\Users\marco\Documents\ESCOM\QUINTO SEMESTRE\ARQUITECTURA DE COMPUTADORAS\BARRELS\netgen\synthesis\BARRELS_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: BARRELS
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity BARRELS is
  port (
    DATAIN : in STD_LOGIC_VECTOR ( 6 downto 0 ); 
    SHIFT : in STD_LOGIC_VECTOR ( 2 downto 0 ); 
    DATAOUT : out STD_LOGIC_VECTOR ( 6 downto 0 ) 
  );
end BARRELS;

architecture Structure of BARRELS is
  signal DATAIN_0_IBUF_0 : STD_LOGIC; 
  signal DATAIN_1_IBUF_1 : STD_LOGIC; 
  signal DATAIN_2_IBUF_2 : STD_LOGIC; 
  signal DATAIN_3_IBUF_3 : STD_LOGIC; 
  signal DATAIN_4_IBUF_4 : STD_LOGIC; 
  signal DATAIN_5_IBUF_5 : STD_LOGIC; 
  signal DATAIN_6_IBUF_6 : STD_LOGIC; 
  signal SHIFT_0_IBUF_7 : STD_LOGIC; 
  signal SHIFT_1_IBUF_8 : STD_LOGIC; 
  signal SHIFT_2_IBUF_9 : STD_LOGIC; 
  signal DATAOUT_0_OBUF_10 : STD_LOGIC; 
  signal DATAOUT_1_OBUF_11 : STD_LOGIC; 
  signal DATAOUT_2_OBUF_12 : STD_LOGIC; 
  signal DATAOUT_3_OBUF_13 : STD_LOGIC; 
  signal DATAOUT_4_OBUF_14 : STD_LOGIC; 
  signal DATAOUT_5_OBUF_15 : STD_LOGIC; 
  signal DATAOUT_6_OBUF_16 : STD_LOGIC; 
begin
  Mmux_data_shift_0_161 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => DATAIN_6_IBUF_6,
      I1 => SHIFT_0_IBUF_7,
      I2 => SHIFT_1_IBUF_8,
      I3 => SHIFT_2_IBUF_9,
      O => DATAOUT_6_OBUF_16
    );
  Mmux_data_shift_0_151 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => DATAIN_5_IBUF_5,
      I1 => SHIFT_0_IBUF_7,
      I2 => SHIFT_1_IBUF_8,
      I3 => SHIFT_2_IBUF_9,
      O => DATAOUT_5_OBUF_15
    );
  Mmux_data_shift_0_141 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => DATAIN_4_IBUF_4,
      I1 => SHIFT_0_IBUF_7,
      I2 => SHIFT_1_IBUF_8,
      I3 => SHIFT_2_IBUF_9,
      O => DATAOUT_4_OBUF_14
    );
  Mmux_data_shift_0_131 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => DATAIN_3_IBUF_3,
      I1 => SHIFT_0_IBUF_7,
      I2 => SHIFT_1_IBUF_8,
      I3 => SHIFT_2_IBUF_9,
      O => DATAOUT_3_OBUF_13
    );
  Mmux_data_shift_0_121 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => DATAIN_2_IBUF_2,
      I1 => SHIFT_0_IBUF_7,
      I2 => SHIFT_1_IBUF_8,
      I3 => SHIFT_2_IBUF_9,
      O => DATAOUT_2_OBUF_12
    );
  Mmux_data_shift_0_111 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => DATAIN_1_IBUF_1,
      I1 => SHIFT_0_IBUF_7,
      I2 => SHIFT_1_IBUF_8,
      I3 => SHIFT_2_IBUF_9,
      O => DATAOUT_1_OBUF_11
    );
  Mmux_data_shift_0_11 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => DATAIN_0_IBUF_0,
      I1 => SHIFT_0_IBUF_7,
      I2 => SHIFT_1_IBUF_8,
      I3 => SHIFT_2_IBUF_9,
      O => DATAOUT_0_OBUF_10
    );
  DATAIN_6_IBUF : IBUF
    port map (
      I => DATAIN(6),
      O => DATAIN_6_IBUF_6
    );
  DATAIN_5_IBUF : IBUF
    port map (
      I => DATAIN(5),
      O => DATAIN_5_IBUF_5
    );
  DATAIN_4_IBUF : IBUF
    port map (
      I => DATAIN(4),
      O => DATAIN_4_IBUF_4
    );
  DATAIN_3_IBUF : IBUF
    port map (
      I => DATAIN(3),
      O => DATAIN_3_IBUF_3
    );
  DATAIN_2_IBUF : IBUF
    port map (
      I => DATAIN(2),
      O => DATAIN_2_IBUF_2
    );
  DATAIN_1_IBUF : IBUF
    port map (
      I => DATAIN(1),
      O => DATAIN_1_IBUF_1
    );
  DATAIN_0_IBUF : IBUF
    port map (
      I => DATAIN(0),
      O => DATAIN_0_IBUF_0
    );
  SHIFT_2_IBUF : IBUF
    port map (
      I => SHIFT(2),
      O => SHIFT_2_IBUF_9
    );
  SHIFT_1_IBUF : IBUF
    port map (
      I => SHIFT(1),
      O => SHIFT_1_IBUF_8
    );
  SHIFT_0_IBUF : IBUF
    port map (
      I => SHIFT(0),
      O => SHIFT_0_IBUF_7
    );
  DATAOUT_6_OBUF : OBUF
    port map (
      I => DATAOUT_6_OBUF_16,
      O => DATAOUT(6)
    );
  DATAOUT_5_OBUF : OBUF
    port map (
      I => DATAOUT_5_OBUF_15,
      O => DATAOUT(5)
    );
  DATAOUT_4_OBUF : OBUF
    port map (
      I => DATAOUT_4_OBUF_14,
      O => DATAOUT(4)
    );
  DATAOUT_3_OBUF : OBUF
    port map (
      I => DATAOUT_3_OBUF_13,
      O => DATAOUT(3)
    );
  DATAOUT_2_OBUF : OBUF
    port map (
      I => DATAOUT_2_OBUF_12,
      O => DATAOUT(2)
    );
  DATAOUT_1_OBUF : OBUF
    port map (
      I => DATAOUT_1_OBUF_11,
      O => DATAOUT(1)
    );
  DATAOUT_0_OBUF : OBUF
    port map (
      I => DATAOUT_0_OBUF_10,
      O => DATAOUT(0)
    );

end Structure;

