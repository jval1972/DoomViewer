//------------------------------------------------------------------------------
//
//  Surfaces Engine (SE) - Gaming engine for Windows based on DirectX & DelphiX
//  Copyright (C) 1999-2004, 2018 by Jim Valavanis
//
//  This program is free software; you can redistribute it and/or
//  modify it under the terms of the GNU General Public License
//  as published by the Free Software Foundation; either version 2
//  of the License, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, inc., 59 Temple Place - Suite 330, Boston, MA
//  02111-1307, USA.
//
// DESCRIPTION:
//  Heretic things
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//------------------------------------------------------------------------------

{$I defs.inc}

unit se_HereticThings;

interface

uses
  se_IDWADThingsCommon;

type
  spritenum_t = (
    SPR_IMPX,
    SPR_ACLO,
    SPR_PTN1,
    SPR_SHLD,
    SPR_SHD2,
    SPR_BAGH,
    SPR_SPMP,
    SPR_INVS,
    SPR_PTN2,
    SPR_SOAR,
    SPR_INVU,
    SPR_PWBK,
    SPR_EGGC,
    SPR_EGGM,
    SPR_FX01,
    SPR_SPHL,
    SPR_TRCH,
    SPR_FBMB,
    SPR_XPL1,
    SPR_ATLP,
    SPR_PPOD,
    SPR_AMG1,
    SPR_SPSH,
    SPR_LVAS,
    SPR_SLDG,
    SPR_SKH1,
    SPR_SKH2,
    SPR_SKH3,
    SPR_SKH4,
    SPR_CHDL,
    SPR_SRTC,
    SPR_SMPL,
    SPR_STGS,
    SPR_STGL,
    SPR_STCS,
    SPR_STCL,
    SPR_KFR1,
    SPR_BARL,
    SPR_BRPL,
    SPR_MOS1,
    SPR_MOS2,
    SPR_WTRH,
    SPR_HCOR,
    SPR_KGZ1,
    SPR_KGZB,
    SPR_KGZG,
    SPR_KGZY,
    SPR_VLCO,
    SPR_VFBL,
    SPR_VTFB,
    SPR_SFFI,
    SPR_TGLT,
    SPR_TELE,
    SPR_STFF,
    SPR_PUF3,
    SPR_PUF4,
    SPR_BEAK,
    SPR_WGNT,
    SPR_GAUN,
    SPR_PUF1,
    SPR_WBLS,
    SPR_BLSR,
    SPR_FX18,
    SPR_FX17,
    SPR_WMCE,
    SPR_MACE,
    SPR_FX02,
    SPR_WSKL,
    SPR_HROD,
    SPR_FX00,
    SPR_FX20,
    SPR_FX21,
    SPR_FX22,
    SPR_FX23,
    SPR_GWND,
    SPR_PUF2,
    SPR_WPHX,
    SPR_PHNX,
    SPR_FX04,
    SPR_FX08,
    SPR_FX09,
    SPR_WBOW,
    SPR_CRBW,
    SPR_FX03,
    SPR_BLOD,
    SPR_PLAY,
    SPR_FDTH,
    SPR_BSKL,
    SPR_CHKN,
    SPR_MUMM,
    SPR_FX15,
    SPR_BEAS,
    SPR_FRB1,
    SPR_SNKE,
    SPR_SNFX,
    SPR_HEAD,
    SPR_FX05,
    SPR_FX06,
    SPR_FX07,
    SPR_CLNK,
    SPR_WZRD,
    SPR_FX11,
    SPR_FX10,
    SPR_KNIG,
    SPR_SPAX,
    SPR_RAXE,
    SPR_SRCR,
    SPR_FX14,
    SPR_SOR2,
    SPR_SDTH,
    SPR_FX16,
    SPR_MNTR,
    SPR_FX12,
    SPR_FX13,
    SPR_AKYY,
    SPR_BKYY,
    SPR_CKYY,
    SPR_AMG2,
    SPR_AMM1,
    SPR_AMM2,
    SPR_AMC1,
    SPR_AMC2,
    SPR_AMS1,
    SPR_AMS2,
    SPR_AMP1,
    SPR_AMP2,
    SPR_AMB1,
    SPR_AMB2,
    NUMSPRITES
  );

  statenum_t = (
    S_NULL,
    S_FREETARGMOBJ,
    S_ITEM_PTN1_1,
    S_ITEM_PTN1_2,
    S_ITEM_PTN1_3,
    S_ITEM_SHLD1,
    S_ITEM_SHD2_1,
    S_ITEM_BAGH1,
    S_ITEM_SPMP1,
    S_HIDESPECIAL1,
    S_HIDESPECIAL2,
    S_HIDESPECIAL3,
    S_HIDESPECIAL4,
    S_HIDESPECIAL5,
    S_HIDESPECIAL6,
    S_HIDESPECIAL7,
    S_HIDESPECIAL8,
    S_HIDESPECIAL9,
    S_HIDESPECIAL10,
    S_HIDESPECIAL11,
    S_DORMANTARTI1,
    S_DORMANTARTI2,
    S_DORMANTARTI3,
    S_DORMANTARTI4,
    S_DORMANTARTI5,
    S_DORMANTARTI6,
    S_DORMANTARTI7,
    S_DORMANTARTI8,
    S_DORMANTARTI9,
    S_DORMANTARTI10,
    S_DORMANTARTI11,
    S_DORMANTARTI12,
    S_DORMANTARTI13,
    S_DORMANTARTI14,
    S_DORMANTARTI15,
    S_DORMANTARTI16,
    S_DORMANTARTI17,
    S_DORMANTARTI18,
    S_DORMANTARTI19,
    S_DORMANTARTI20,
    S_DORMANTARTI21,
    S_DEADARTI1,
    S_DEADARTI2,
    S_DEADARTI3,
    S_DEADARTI4,
    S_DEADARTI5,
    S_DEADARTI6,
    S_DEADARTI7,
    S_DEADARTI8,
    S_DEADARTI9,
    S_DEADARTI10,
    S_ARTI_INVS1,
    S_ARTI_PTN2_1,
    S_ARTI_PTN2_2,
    S_ARTI_PTN2_3,
    S_ARTI_SOAR1,
    S_ARTI_SOAR2,
    S_ARTI_SOAR3,
    S_ARTI_SOAR4,
    S_ARTI_INVU1,
    S_ARTI_INVU2,
    S_ARTI_INVU3,
    S_ARTI_INVU4,
    S_ARTI_PWBK1,
    S_ARTI_EGGC1,
    S_ARTI_EGGC2,
    S_ARTI_EGGC3,
    S_ARTI_EGGC4,
    S_EGGFX1,
    S_EGGFX2,
    S_EGGFX3,
    S_EGGFX4,
    S_EGGFX5,
    S_EGGFXI1_1,
    S_EGGFXI1_2,
    S_EGGFXI1_3,
    S_EGGFXI1_4,
    S_ARTI_SPHL1,
    S_ARTI_TRCH1,
    S_ARTI_TRCH2,
    S_ARTI_TRCH3,
    S_ARTI_FBMB1,
    S_FIREBOMB1,
    S_FIREBOMB2,
    S_FIREBOMB3,
    S_FIREBOMB4,
    S_FIREBOMB5,
    S_FIREBOMB6,
    S_FIREBOMB7,
    S_FIREBOMB8,
    S_FIREBOMB9,
    S_FIREBOMB10,
    S_FIREBOMB11,
    S_ARTI_ATLP1,
    S_ARTI_ATLP2,
    S_ARTI_ATLP3,
    S_ARTI_ATLP4,
    S_POD_WAIT1,
    S_POD_PAIN1,
    S_POD_DIE1,
    S_POD_DIE2,
    S_POD_DIE3,
    S_POD_DIE4,
    S_POD_GROW1,
    S_POD_GROW2,
    S_POD_GROW3,
    S_POD_GROW4,
    S_POD_GROW5,
    S_POD_GROW6,
    S_POD_GROW7,
    S_POD_GROW8,
    S_PODGOO1,
    S_PODGOO2,
    S_PODGOOX,
    S_PODGENERATOR,
    S_SPLASH1,
    S_SPLASH2,
    S_SPLASH3,
    S_SPLASH4,
    S_SPLASHX,
    S_SPLASHBASE1,
    S_SPLASHBASE2,
    S_SPLASHBASE3,
    S_SPLASHBASE4,
    S_SPLASHBASE5,
    S_SPLASHBASE6,
    S_SPLASHBASE7,
    S_LAVASPLASH1,
    S_LAVASPLASH2,
    S_LAVASPLASH3,
    S_LAVASPLASH4,
    S_LAVASPLASH5,
    S_LAVASPLASH6,
    S_LAVASMOKE1,
    S_LAVASMOKE2,
    S_LAVASMOKE3,
    S_LAVASMOKE4,
    S_LAVASMOKE5,
    S_SLUDGECHUNK1,
    S_SLUDGECHUNK2,
    S_SLUDGECHUNK3,
    S_SLUDGECHUNK4,
    S_SLUDGECHUNKX,
    S_SLUDGESPLASH1,
    S_SLUDGESPLASH2,
    S_SLUDGESPLASH3,
    S_SLUDGESPLASH4,
    S_SKULLHANG70_1,
    S_SKULLHANG60_1,
    S_SKULLHANG45_1,
    S_SKULLHANG35_1,
    S_CHANDELIER1,
    S_CHANDELIER2,
    S_CHANDELIER3,
    S_SERPTORCH1,
    S_SERPTORCH2,
    S_SERPTORCH3,
    S_SMALLPILLAR,
    S_STALAGMITESMALL,
    S_STALAGMITELARGE,
    S_STALACTITESMALL,
    S_STALACTITELARGE,
    S_FIREBRAZIER1,
    S_FIREBRAZIER2,
    S_FIREBRAZIER3,
    S_FIREBRAZIER4,
    S_FIREBRAZIER5,
    S_FIREBRAZIER6,
    S_FIREBRAZIER7,
    S_FIREBRAZIER8,
    S_BARREL,
    S_BRPILLAR,
    S_MOSS1,
    S_MOSS2,
    S_WALLTORCH1,
    S_WALLTORCH2,
    S_WALLTORCH3,
    S_HANGINGCORPSE,
    S_KEYGIZMO1,
    S_KEYGIZMO2,
    S_KEYGIZMO3,
    S_KGZ_START,
    S_KGZ_BLUEFLOAT1,
    S_KGZ_GREENFLOAT1,
    S_KGZ_YELLOWFLOAT1,
    S_VOLCANO1,
    S_VOLCANO2,
    S_VOLCANO3,
    S_VOLCANO4,
    S_VOLCANO5,
    S_VOLCANO6,
    S_VOLCANO7,
    S_VOLCANO8,
    S_VOLCANO9,
    S_VOLCANOBALL1,
    S_VOLCANOBALL2,
    S_VOLCANOBALLX1,
    S_VOLCANOBALLX2,
    S_VOLCANOBALLX3,
    S_VOLCANOBALLX4,
    S_VOLCANOBALLX5,
    S_VOLCANOBALLX6,
    S_VOLCANOTBALL1,
    S_VOLCANOTBALL2,
    S_VOLCANOTBALLX1,
    S_VOLCANOTBALLX2,
    S_VOLCANOTBALLX3,
    S_VOLCANOTBALLX4,
    S_VOLCANOTBALLX5,
    S_VOLCANOTBALLX6,
    S_VOLCANOTBALLX7,
    S_TELEGLITGEN1,
    S_TELEGLITGEN2,
    S_TELEGLITTER1_1,
    S_TELEGLITTER1_2,
    S_TELEGLITTER1_3,
    S_TELEGLITTER1_4,
    S_TELEGLITTER1_5,
    S_TELEGLITTER2_1,
    S_TELEGLITTER2_2,
    S_TELEGLITTER2_3,
    S_TELEGLITTER2_4,
    S_TELEGLITTER2_5,
    S_TFOG1,
    S_TFOG2,
    S_TFOG3,
    S_TFOG4,
    S_TFOG5,
    S_TFOG6,
    S_TFOG7,
    S_TFOG8,
    S_TFOG9,
    S_TFOG10,
    S_TFOG11,
    S_TFOG12,
    S_TFOG13,
    S_LIGHTDONE,
    S_STAFFREADY,
    S_STAFFDOWN,
    S_STAFFUP,
    S_STAFFREADY2_1,
    S_STAFFREADY2_2,
    S_STAFFREADY2_3,
    S_STAFFDOWN2,
    S_STAFFUP2,
    S_STAFFATK1_1,
    S_STAFFATK1_2,
    S_STAFFATK1_3,
    S_STAFFATK2_1,
    S_STAFFATK2_2,
    S_STAFFATK2_3,
    S_STAFFPUFF1,
    S_STAFFPUFF2,
    S_STAFFPUFF3,
    S_STAFFPUFF4,
    S_STAFFPUFF2_1,
    S_STAFFPUFF2_2,
    S_STAFFPUFF2_3,
    S_STAFFPUFF2_4,
    S_STAFFPUFF2_5,
    S_STAFFPUFF2_6,
    S_BEAKREADY,
    S_BEAKDOWN,
    S_BEAKUP,
    S_BEAKATK1_1,
    S_BEAKATK2_1,
    S_WGNT,
    S_GAUNTLETREADY,
    S_GAUNTLETDOWN,
    S_GAUNTLETUP,
    S_GAUNTLETREADY2_1,
    S_GAUNTLETREADY2_2,
    S_GAUNTLETREADY2_3,
    S_GAUNTLETDOWN2,
    S_GAUNTLETUP2,
    S_GAUNTLETATK1_1,
    S_GAUNTLETATK1_2,
    S_GAUNTLETATK1_3,
    S_GAUNTLETATK1_4,
    S_GAUNTLETATK1_5,
    S_GAUNTLETATK1_6,
    S_GAUNTLETATK1_7,
    S_GAUNTLETATK2_1,
    S_GAUNTLETATK2_2,
    S_GAUNTLETATK2_3,
    S_GAUNTLETATK2_4,
    S_GAUNTLETATK2_5,
    S_GAUNTLETATK2_6,
    S_GAUNTLETATK2_7,
    S_GAUNTLETPUFF1_1,
    S_GAUNTLETPUFF1_2,
    S_GAUNTLETPUFF1_3,
    S_GAUNTLETPUFF1_4,
    S_GAUNTLETPUFF2_1,
    S_GAUNTLETPUFF2_2,
    S_GAUNTLETPUFF2_3,
    S_GAUNTLETPUFF2_4,
    S_BLSR,
    S_BLASTERREADY,
    S_BLASTERDOWN,
    S_BLASTERUP,
    S_BLASTERATK1_1,
    S_BLASTERATK1_2,
    S_BLASTERATK1_3,
    S_BLASTERATK1_4,
    S_BLASTERATK1_5,
    S_BLASTERATK1_6,
    S_BLASTERATK2_1,
    S_BLASTERATK2_2,
    S_BLASTERATK2_3,
    S_BLASTERATK2_4,
    S_BLASTERATK2_5,
    S_BLASTERATK2_6,
    S_BLASTERFX1_1,
    S_BLASTERFXI1_1,
    S_BLASTERFXI1_2,
    S_BLASTERFXI1_3,
    S_BLASTERFXI1_4,
    S_BLASTERFXI1_5,
    S_BLASTERFXI1_6,
    S_BLASTERFXI1_7,
    S_BLASTERSMOKE1,
    S_BLASTERSMOKE2,
    S_BLASTERSMOKE3,
    S_BLASTERSMOKE4,
    S_BLASTERSMOKE5,
    S_RIPPER1,
    S_RIPPER2,
    S_RIPPERX1,
    S_RIPPERX2,
    S_RIPPERX3,
    S_RIPPERX4,
    S_RIPPERX5,
    S_BLASTERPUFF1_1,
    S_BLASTERPUFF1_2,
    S_BLASTERPUFF1_3,
    S_BLASTERPUFF1_4,
    S_BLASTERPUFF1_5,
    S_BLASTERPUFF2_1,
    S_BLASTERPUFF2_2,
    S_BLASTERPUFF2_3,
    S_BLASTERPUFF2_4,
    S_BLASTERPUFF2_5,
    S_BLASTERPUFF2_6,
    S_BLASTERPUFF2_7,
    S_WMCE,
    S_MACEREADY,
    S_MACEDOWN,
    S_MACEUP,
    S_MACEATK1_1,
    S_MACEATK1_2,
    S_MACEATK1_3,
    S_MACEATK1_4,
    S_MACEATK1_5,
    S_MACEATK1_6,
    S_MACEATK1_7,
    S_MACEATK1_8,
    S_MACEATK1_9,
    S_MACEATK1_10,
    S_MACEATK2_1,
    S_MACEATK2_2,
    S_MACEATK2_3,
    S_MACEATK2_4,
    S_MACEFX1_1,
    S_MACEFX1_2,
    S_MACEFXI1_1,
    S_MACEFXI1_2,
    S_MACEFXI1_3,
    S_MACEFXI1_4,
    S_MACEFXI1_5,
    S_MACEFX2_1,
    S_MACEFX2_2,
    S_MACEFXI2_1,
    S_MACEFX3_1,
    S_MACEFX3_2,
    S_MACEFX4_1,
    S_MACEFXI4_1,
    S_WSKL,
    S_HORNRODREADY,
    S_HORNRODDOWN,
    S_HORNRODUP,
    S_HORNRODATK1_1,
    S_HORNRODATK1_2,
    S_HORNRODATK1_3,
    S_HORNRODATK2_1,
    S_HORNRODATK2_2,
    S_HORNRODATK2_3,
    S_HORNRODATK2_4,
    S_HORNRODATK2_5,
    S_HORNRODATK2_6,
    S_HORNRODATK2_7,
    S_HORNRODATK2_8,
    S_HORNRODATK2_9,
    S_HRODFX1_1,
    S_HRODFX1_2,
    S_HRODFXI1_1,
    S_HRODFXI1_2,
    S_HRODFXI1_3,
    S_HRODFXI1_4,
    S_HRODFXI1_5,
    S_HRODFXI1_6,
    S_HRODFX2_1,
    S_HRODFX2_2,
    S_HRODFX2_3,
    S_HRODFX2_4,
    S_HRODFXI2_1,
    S_HRODFXI2_2,
    S_HRODFXI2_3,
    S_HRODFXI2_4,
    S_HRODFXI2_5,
    S_HRODFXI2_6,
    S_HRODFXI2_7,
    S_HRODFXI2_8,
    S_RAINPLR1_1,
    S_RAINPLR2_1,
    S_RAINPLR3_1,
    S_RAINPLR4_1,
    S_RAINPLR1X_1,
    S_RAINPLR1X_2,
    S_RAINPLR1X_3,
    S_RAINPLR1X_4,
    S_RAINPLR1X_5,
    S_RAINPLR2X_1,
    S_RAINPLR2X_2,
    S_RAINPLR2X_3,
    S_RAINPLR2X_4,
    S_RAINPLR2X_5,
    S_RAINPLR3X_1,
    S_RAINPLR3X_2,
    S_RAINPLR3X_3,
    S_RAINPLR3X_4,
    S_RAINPLR3X_5,
    S_RAINPLR4X_1,
    S_RAINPLR4X_2,
    S_RAINPLR4X_3,
    S_RAINPLR4X_4,
    S_RAINPLR4X_5,
    S_RAINAIRXPLR1_1,
    S_RAINAIRXPLR2_1,
    S_RAINAIRXPLR3_1,
    S_RAINAIRXPLR4_1,
    S_RAINAIRXPLR1_2,
    S_RAINAIRXPLR2_2,
    S_RAINAIRXPLR3_2,
    S_RAINAIRXPLR4_2,
    S_RAINAIRXPLR1_3,
    S_RAINAIRXPLR2_3,
    S_RAINAIRXPLR3_3,
    S_RAINAIRXPLR4_3,
    S_GOLDWANDREADY,
    S_GOLDWANDDOWN,
    S_GOLDWANDUP,
    S_GOLDWANDATK1_1,
    S_GOLDWANDATK1_2,
    S_GOLDWANDATK1_3,
    S_GOLDWANDATK1_4,
    S_GOLDWANDATK2_1,
    S_GOLDWANDATK2_2,
    S_GOLDWANDATK2_3,
    S_GOLDWANDATK2_4,
    S_GWANDFX1_1,
    S_GWANDFX1_2,
    S_GWANDFXI1_1,
    S_GWANDFXI1_2,
    S_GWANDFXI1_3,
    S_GWANDFXI1_4,
    S_GWANDFX2_1,
    S_GWANDFX2_2,
    S_GWANDPUFF1_1,
    S_GWANDPUFF1_2,
    S_GWANDPUFF1_3,
    S_GWANDPUFF1_4,
    S_GWANDPUFF1_5,
    S_WPHX,
    S_PHOENIXREADY,
    S_PHOENIXDOWN,
    S_PHOENIXUP,
    S_PHOENIXATK1_1,
    S_PHOENIXATK1_2,
    S_PHOENIXATK1_3,
    S_PHOENIXATK1_4,
    S_PHOENIXATK1_5,
    S_PHOENIXATK2_1,
    S_PHOENIXATK2_2,
    S_PHOENIXATK2_3,
    S_PHOENIXATK2_4,
    S_PHOENIXFX1_1,
    S_PHOENIXFXI1_1,
    S_PHOENIXFXI1_2,
    S_PHOENIXFXI1_3,
    S_PHOENIXFXI1_4,
    S_PHOENIXFXI1_5,
    S_PHOENIXFXI1_6,
    S_PHOENIXFXI1_7,
    S_PHOENIXFXI1_8,
    S_PHOENIXPUFF1,
    S_PHOENIXPUFF2,
    S_PHOENIXPUFF3,
    S_PHOENIXPUFF4,
    S_PHOENIXPUFF5,
    S_PHOENIXFX2_1,
    S_PHOENIXFX2_2,
    S_PHOENIXFX2_3,
    S_PHOENIXFX2_4,
    S_PHOENIXFX2_5,
    S_PHOENIXFX2_6,
    S_PHOENIXFX2_7,
    S_PHOENIXFX2_8,
    S_PHOENIXFX2_9,
    S_PHOENIXFX2_10,
    S_PHOENIXFXI2_1,
    S_PHOENIXFXI2_2,
    S_PHOENIXFXI2_3,
    S_PHOENIXFXI2_4,
    S_PHOENIXFXI2_5,
    S_WBOW,
    S_CRBOW1,
    S_CRBOW2,
    S_CRBOW3,
    S_CRBOW4,
    S_CRBOW5,
    S_CRBOW6,
    S_CRBOW7,
    S_CRBOW8,
    S_CRBOW9,
    S_CRBOW10,
    S_CRBOW11,
    S_CRBOW12,
    S_CRBOW13,
    S_CRBOW14,
    S_CRBOW15,
    S_CRBOW16,
    S_CRBOW17,
    S_CRBOW18,
    S_CRBOWDOWN,
    S_CRBOWUP,
    S_CRBOWATK1_1,
    S_CRBOWATK1_2,
    S_CRBOWATK1_3,
    S_CRBOWATK1_4,
    S_CRBOWATK1_5,
    S_CRBOWATK1_6,
    S_CRBOWATK1_7,
    S_CRBOWATK1_8,
    S_CRBOWATK2_1,
    S_CRBOWATK2_2,
    S_CRBOWATK2_3,
    S_CRBOWATK2_4,
    S_CRBOWATK2_5,
    S_CRBOWATK2_6,
    S_CRBOWATK2_7,
    S_CRBOWATK2_8,
    S_CRBOWFX1,
    S_CRBOWFXI1_1,
    S_CRBOWFXI1_2,
    S_CRBOWFXI1_3,
    S_CRBOWFX2,
    S_CRBOWFX3,
    S_CRBOWFXI3_1,
    S_CRBOWFXI3_2,
    S_CRBOWFXI3_3,
    S_CRBOWFX4_1,
    S_CRBOWFX4_2,
    S_BLOOD1,
    S_BLOOD2,
    S_BLOOD3,
    S_BLOODSPLATTER1,
    S_BLOODSPLATTER2,
    S_BLOODSPLATTER3,
    S_BLOODSPLATTERX,
    S_PLAY,
    S_PLAY_RUN1,
    S_PLAY_RUN2,
    S_PLAY_RUN3,
    S_PLAY_RUN4,
    S_PLAY_ATK1,
    S_PLAY_ATK2,
    S_PLAY_PAIN,
    S_PLAY_PAIN2,
    S_PLAY_DIE1,
    S_PLAY_DIE2,
    S_PLAY_DIE3,
    S_PLAY_DIE4,
    S_PLAY_DIE5,
    S_PLAY_DIE6,
    S_PLAY_DIE7,
    S_PLAY_DIE8,
    S_PLAY_DIE9,
    S_PLAY_XDIE1,
    S_PLAY_XDIE2,
    S_PLAY_XDIE3,
    S_PLAY_XDIE4,
    S_PLAY_XDIE5,
    S_PLAY_XDIE6,
    S_PLAY_XDIE7,
    S_PLAY_XDIE8,
    S_PLAY_XDIE9,
    S_PLAY_FDTH1,
    S_PLAY_FDTH2,
    S_PLAY_FDTH3,
    S_PLAY_FDTH4,
    S_PLAY_FDTH5,
    S_PLAY_FDTH6,
    S_PLAY_FDTH7,
    S_PLAY_FDTH8,
    S_PLAY_FDTH9,
    S_PLAY_FDTH10,
    S_PLAY_FDTH11,
    S_PLAY_FDTH12,
    S_PLAY_FDTH13,
    S_PLAY_FDTH14,
    S_PLAY_FDTH15,
    S_PLAY_FDTH16,
    S_PLAY_FDTH17,
    S_PLAY_FDTH18,
    S_PLAY_FDTH19,
    S_PLAY_FDTH20,
    S_BLOODYSKULL1,
    S_BLOODYSKULL2,
    S_BLOODYSKULL3,
    S_BLOODYSKULL4,
    S_BLOODYSKULL5,
    S_BLOODYSKULLX1,
    S_BLOODYSKULLX2,
    S_CHICPLAY,
    S_CHICPLAY_RUN1,
    S_CHICPLAY_RUN2,
    S_CHICPLAY_RUN3,
    S_CHICPLAY_RUN4,
    S_CHICPLAY_ATK1,
    S_CHICPLAY_PAIN,
    S_CHICPLAY_PAIN2,
    S_CHICKEN_LOOK1,
    S_CHICKEN_LOOK2,
    S_CHICKEN_WALK1,
    S_CHICKEN_WALK2,
    S_CHICKEN_PAIN1,
    S_CHICKEN_PAIN2,
    S_CHICKEN_ATK1,
    S_CHICKEN_ATK2,
    S_CHICKEN_DIE1,
    S_CHICKEN_DIE2,
    S_CHICKEN_DIE3,
    S_CHICKEN_DIE4,
    S_CHICKEN_DIE5,
    S_CHICKEN_DIE6,
    S_CHICKEN_DIE7,
    S_CHICKEN_DIE8,
    S_FEATHER1,
    S_FEATHER2,
    S_FEATHER3,
    S_FEATHER4,
    S_FEATHER5,
    S_FEATHER6,
    S_FEATHER7,
    S_FEATHER8,
    S_FEATHERX,
    S_MUMMY_LOOK1,
    S_MUMMY_LOOK2,
    S_MUMMY_WALK1,
    S_MUMMY_WALK2,
    S_MUMMY_WALK3,
    S_MUMMY_WALK4,
    S_MUMMY_ATK1,
    S_MUMMY_ATK2,
    S_MUMMY_ATK3,
    S_MUMMYL_ATK1,
    S_MUMMYL_ATK2,
    S_MUMMYL_ATK3,
    S_MUMMYL_ATK4,
    S_MUMMYL_ATK5,
    S_MUMMYL_ATK6,
    S_MUMMY_PAIN1,
    S_MUMMY_PAIN2,
    S_MUMMY_DIE1,
    S_MUMMY_DIE2,
    S_MUMMY_DIE3,
    S_MUMMY_DIE4,
    S_MUMMY_DIE5,
    S_MUMMY_DIE6,
    S_MUMMY_DIE7,
    S_MUMMY_DIE8,
    S_MUMMY_SOUL1,
    S_MUMMY_SOUL2,
    S_MUMMY_SOUL3,
    S_MUMMY_SOUL4,
    S_MUMMY_SOUL5,
    S_MUMMY_SOUL6,
    S_MUMMY_SOUL7,
    S_MUMMYFX1_1,
    S_MUMMYFX1_2,
    S_MUMMYFX1_3,
    S_MUMMYFX1_4,
    S_MUMMYFXI1_1,
    S_MUMMYFXI1_2,
    S_MUMMYFXI1_3,
    S_MUMMYFXI1_4,
    S_BEAST_LOOK1,
    S_BEAST_LOOK2,
    S_BEAST_WALK1,
    S_BEAST_WALK2,
    S_BEAST_WALK3,
    S_BEAST_WALK4,
    S_BEAST_WALK5,
    S_BEAST_WALK6,
    S_BEAST_ATK1,
    S_BEAST_ATK2,
    S_BEAST_PAIN1,
    S_BEAST_PAIN2,
    S_BEAST_DIE1,
    S_BEAST_DIE2,
    S_BEAST_DIE3,
    S_BEAST_DIE4,
    S_BEAST_DIE5,
    S_BEAST_DIE6,
    S_BEAST_DIE7,
    S_BEAST_DIE8,
    S_BEAST_DIE9,
    S_BEAST_XDIE1,
    S_BEAST_XDIE2,
    S_BEAST_XDIE3,
    S_BEAST_XDIE4,
    S_BEAST_XDIE5,
    S_BEAST_XDIE6,
    S_BEAST_XDIE7,
    S_BEAST_XDIE8,
    S_BEASTBALL1,
    S_BEASTBALL2,
    S_BEASTBALL3,
    S_BEASTBALL4,
    S_BEASTBALL5,
    S_BEASTBALL6,
    S_BEASTBALLX1,
    S_BEASTBALLX2,
    S_BEASTBALLX3,
    S_BEASTBALLX4,
    S_BEASTBALLX5,
    S_BURNBALL1,
    S_BURNBALL2,
    S_BURNBALL3,
    S_BURNBALL4,
    S_BURNBALL5,
    S_BURNBALL6,
    S_BURNBALL7,
    S_BURNBALL8,
    S_BURNBALLFB1,
    S_BURNBALLFB2,
    S_BURNBALLFB3,
    S_BURNBALLFB4,
    S_BURNBALLFB5,
    S_BURNBALLFB6,
    S_BURNBALLFB7,
    S_BURNBALLFB8,
    S_PUFFY1,
    S_PUFFY2,
    S_PUFFY3,
    S_PUFFY4,
    S_PUFFY5,
    S_SNAKE_LOOK1,
    S_SNAKE_LOOK2,
    S_SNAKE_WALK1,
    S_SNAKE_WALK2,
    S_SNAKE_WALK3,
    S_SNAKE_WALK4,
    S_SNAKE_ATK1,
    S_SNAKE_ATK2,
    S_SNAKE_ATK3,
    S_SNAKE_ATK4,
    S_SNAKE_ATK5,
    S_SNAKE_ATK6,
    S_SNAKE_ATK7,
    S_SNAKE_ATK8,
    S_SNAKE_ATK9,
    S_SNAKE_PAIN1,
    S_SNAKE_PAIN2,
    S_SNAKE_DIE1,
    S_SNAKE_DIE2,
    S_SNAKE_DIE3,
    S_SNAKE_DIE4,
    S_SNAKE_DIE5,
    S_SNAKE_DIE6,
    S_SNAKE_DIE7,
    S_SNAKE_DIE8,
    S_SNAKE_DIE9,
    S_SNAKE_DIE10,
    S_SNAKEPRO_A1,
    S_SNAKEPRO_A2,
    S_SNAKEPRO_A3,
    S_SNAKEPRO_A4,
    S_SNAKEPRO_AX1,
    S_SNAKEPRO_AX2,
    S_SNAKEPRO_AX3,
    S_SNAKEPRO_AX4,
    S_SNAKEPRO_AX5,
    S_SNAKEPRO_B1,
    S_SNAKEPRO_B2,
    S_SNAKEPRO_BX1,
    S_SNAKEPRO_BX2,
    S_SNAKEPRO_BX3,
    S_SNAKEPRO_BX4,
    S_HEAD_LOOK,
    S_HEAD_FLOAT,
    S_HEAD_ATK1,
    S_HEAD_ATK2,
    S_HEAD_PAIN1,
    S_HEAD_PAIN2,
    S_HEAD_DIE1,
    S_HEAD_DIE2,
    S_HEAD_DIE3,
    S_HEAD_DIE4,
    S_HEAD_DIE5,
    S_HEAD_DIE6,
    S_HEAD_DIE7,
    S_HEADFX1_1,
    S_HEADFX1_2,
    S_HEADFX1_3,
    S_HEADFXI1_1,
    S_HEADFXI1_2,
    S_HEADFXI1_3,
    S_HEADFXI1_4,
    S_HEADFX2_1,
    S_HEADFX2_2,
    S_HEADFX2_3,
    S_HEADFXI2_1,
    S_HEADFXI2_2,
    S_HEADFXI2_3,
    S_HEADFXI2_4,
    S_HEADFX3_1,
    S_HEADFX3_2,
    S_HEADFX3_3,
    S_HEADFX3_4,
    S_HEADFX3_5,
    S_HEADFX3_6,
    S_HEADFXI3_1,
    S_HEADFXI3_2,
    S_HEADFXI3_3,
    S_HEADFXI3_4,
    S_HEADFX4_1,
    S_HEADFX4_2,
    S_HEADFX4_3,
    S_HEADFX4_4,
    S_HEADFX4_5,
    S_HEADFX4_6,
    S_HEADFX4_7,
    S_HEADFXI4_1,
    S_HEADFXI4_2,
    S_HEADFXI4_3,
    S_HEADFXI4_4,
    S_CLINK_LOOK1,
    S_CLINK_LOOK2,
    S_CLINK_WALK1,
    S_CLINK_WALK2,
    S_CLINK_WALK3,
    S_CLINK_WALK4,
    S_CLINK_ATK1,
    S_CLINK_ATK2,
    S_CLINK_ATK3,
    S_CLINK_PAIN1,
    S_CLINK_PAIN2,
    S_CLINK_DIE1,
    S_CLINK_DIE2,
    S_CLINK_DIE3,
    S_CLINK_DIE4,
    S_CLINK_DIE5,
    S_CLINK_DIE6,
    S_CLINK_DIE7,
    S_WIZARD_LOOK1,
    S_WIZARD_LOOK2,
    S_WIZARD_WALK1,
    S_WIZARD_WALK2,
    S_WIZARD_WALK3,
    S_WIZARD_WALK4,
    S_WIZARD_WALK5,
    S_WIZARD_WALK6,
    S_WIZARD_WALK7,
    S_WIZARD_WALK8,
    S_WIZARD_ATK1,
    S_WIZARD_ATK2,
    S_WIZARD_ATK3,
    S_WIZARD_ATK4,
    S_WIZARD_ATK5,
    S_WIZARD_ATK6,
    S_WIZARD_ATK7,
    S_WIZARD_ATK8,
    S_WIZARD_ATK9,
    S_WIZARD_PAIN1,
    S_WIZARD_PAIN2,
    S_WIZARD_DIE1,
    S_WIZARD_DIE2,
    S_WIZARD_DIE3,
    S_WIZARD_DIE4,
    S_WIZARD_DIE5,
    S_WIZARD_DIE6,
    S_WIZARD_DIE7,
    S_WIZARD_DIE8,
    S_WIZFX1_1,
    S_WIZFX1_2,
    S_WIZFXI1_1,
    S_WIZFXI1_2,
    S_WIZFXI1_3,
    S_WIZFXI1_4,
    S_WIZFXI1_5,
    S_IMP_LOOK1,
    S_IMP_LOOK2,
    S_IMP_LOOK3,
    S_IMP_LOOK4,
    S_IMP_FLY1,
    S_IMP_FLY2,
    S_IMP_FLY3,
    S_IMP_FLY4,
    S_IMP_FLY5,
    S_IMP_FLY6,
    S_IMP_FLY7,
    S_IMP_FLY8,
    S_IMP_MEATK1,
    S_IMP_MEATK2,
    S_IMP_MEATK3,
    S_IMP_MSATK1_1,
    S_IMP_MSATK1_2,
    S_IMP_MSATK1_3,
    S_IMP_MSATK1_4,
    S_IMP_MSATK1_5,
    S_IMP_MSATK1_6,
    S_IMP_MSATK2_1,
    S_IMP_MSATK2_2,
    S_IMP_MSATK2_3,
    S_IMP_PAIN1,
    S_IMP_PAIN2,
    S_IMP_DIE1,
    S_IMP_DIE2,
    S_IMP_XDIE1,
    S_IMP_XDIE2,
    S_IMP_XDIE3,
    S_IMP_XDIE4,
    S_IMP_XDIE5,
    S_IMP_CRASH1,
    S_IMP_CRASH2,
    S_IMP_CRASH3,
    S_IMP_CRASH4,
    S_IMP_XCRASH1,
    S_IMP_XCRASH2,
    S_IMP_XCRASH3,
    S_IMP_CHUNKA1,
    S_IMP_CHUNKA2,
    S_IMP_CHUNKA3,
    S_IMP_CHUNKB1,
    S_IMP_CHUNKB2,
    S_IMP_CHUNKB3,
    S_IMPFX1,
    S_IMPFX2,
    S_IMPFX3,
    S_IMPFXI1,
    S_IMPFXI2,
    S_IMPFXI3,
    S_IMPFXI4,
    S_KNIGHT_STND1,
    S_KNIGHT_STND2,
    S_KNIGHT_WALK1,
    S_KNIGHT_WALK2,
    S_KNIGHT_WALK3,
    S_KNIGHT_WALK4,
    S_KNIGHT_ATK1,
    S_KNIGHT_ATK2,
    S_KNIGHT_ATK3,
    S_KNIGHT_ATK4,
    S_KNIGHT_ATK5,
    S_KNIGHT_ATK6,
    S_KNIGHT_PAIN1,
    S_KNIGHT_PAIN2,
    S_KNIGHT_DIE1,
    S_KNIGHT_DIE2,
    S_KNIGHT_DIE3,
    S_KNIGHT_DIE4,
    S_KNIGHT_DIE5,
    S_KNIGHT_DIE6,
    S_KNIGHT_DIE7,
    S_SPINAXE1,
    S_SPINAXE2,
    S_SPINAXE3,
    S_SPINAXEX1,
    S_SPINAXEX2,
    S_SPINAXEX3,
    S_REDAXE1,
    S_REDAXE2,
    S_REDAXEX1,
    S_REDAXEX2,
    S_REDAXEX3,
    S_SRCR1_LOOK1,
    S_SRCR1_LOOK2,
    S_SRCR1_WALK1,
    S_SRCR1_WALK2,
    S_SRCR1_WALK3,
    S_SRCR1_WALK4,
    S_SRCR1_PAIN1,
    S_SRCR1_ATK1,
    S_SRCR1_ATK2,
    S_SRCR1_ATK3,
    S_SRCR1_ATK4,
    S_SRCR1_ATK5,
    S_SRCR1_ATK6,
    S_SRCR1_ATK7,
    S_SRCR1_DIE1,
    S_SRCR1_DIE2,
    S_SRCR1_DIE3,
    S_SRCR1_DIE4,
    S_SRCR1_DIE5,
    S_SRCR1_DIE6,
    S_SRCR1_DIE7,
    S_SRCR1_DIE8,
    S_SRCR1_DIE9,
    S_SRCR1_DIE10,
    S_SRCR1_DIE11,
    S_SRCR1_DIE12,
    S_SRCR1_DIE13,
    S_SRCR1_DIE14,
    S_SRCR1_DIE15,
    S_SRCR1_DIE16,
    S_SRCR1_DIE17,
    S_SRCRFX1_1,
    S_SRCRFX1_2,
    S_SRCRFX1_3,
    S_SRCRFXI1_1,
    S_SRCRFXI1_2,
    S_SRCRFXI1_3,
    S_SRCRFXI1_4,
    S_SRCRFXI1_5,
    S_SOR2_RISE1,
    S_SOR2_RISE2,
    S_SOR2_RISE3,
    S_SOR2_RISE4,
    S_SOR2_RISE5,
    S_SOR2_RISE6,
    S_SOR2_RISE7,
    S_SOR2_LOOK1,
    S_SOR2_LOOK2,
    S_SOR2_WALK1,
    S_SOR2_WALK2,
    S_SOR2_WALK3,
    S_SOR2_WALK4,
    S_SOR2_PAIN1,
    S_SOR2_PAIN2,
    S_SOR2_ATK1,
    S_SOR2_ATK2,
    S_SOR2_ATK3,
    S_SOR2_TELE1,
    S_SOR2_TELE2,
    S_SOR2_TELE3,
    S_SOR2_TELE4,
    S_SOR2_TELE5,
    S_SOR2_TELE6,
    S_SOR2_DIE1,
    S_SOR2_DIE2,
    S_SOR2_DIE3,
    S_SOR2_DIE4,
    S_SOR2_DIE5,
    S_SOR2_DIE6,
    S_SOR2_DIE7,
    S_SOR2_DIE8,
    S_SOR2_DIE9,
    S_SOR2_DIE10,
    S_SOR2_DIE11,
    S_SOR2_DIE12,
    S_SOR2_DIE13,
    S_SOR2_DIE14,
    S_SOR2_DIE15,
    S_SOR2FX1_1,
    S_SOR2FX1_2,
    S_SOR2FX1_3,
    S_SOR2FXI1_1,
    S_SOR2FXI1_2,
    S_SOR2FXI1_3,
    S_SOR2FXI1_4,
    S_SOR2FXI1_5,
    S_SOR2FXI1_6,
    S_SOR2FXSPARK1,
    S_SOR2FXSPARK2,
    S_SOR2FXSPARK3,
    S_SOR2FX2_1,
    S_SOR2FX2_2,
    S_SOR2FX2_3,
    S_SOR2FXI2_1,
    S_SOR2FXI2_2,
    S_SOR2FXI2_3,
    S_SOR2FXI2_4,
    S_SOR2FXI2_5,
    S_SOR2TELEFADE1,
    S_SOR2TELEFADE2,
    S_SOR2TELEFADE3,
    S_SOR2TELEFADE4,
    S_SOR2TELEFADE5,
    S_SOR2TELEFADE6,
    S_MNTR_LOOK1,
    S_MNTR_LOOK2,
    S_MNTR_WALK1,
    S_MNTR_WALK2,
    S_MNTR_WALK3,
    S_MNTR_WALK4,
    S_MNTR_ATK1_1,
    S_MNTR_ATK1_2,
    S_MNTR_ATK1_3,
    S_MNTR_ATK2_1,
    S_MNTR_ATK2_2,
    S_MNTR_ATK2_3,
    S_MNTR_ATK3_1,
    S_MNTR_ATK3_2,
    S_MNTR_ATK3_3,
    S_MNTR_ATK3_4,
    S_MNTR_ATK4_1,
    S_MNTR_PAIN1,
    S_MNTR_PAIN2,
    S_MNTR_DIE1,
    S_MNTR_DIE2,
    S_MNTR_DIE3,
    S_MNTR_DIE4,
    S_MNTR_DIE5,
    S_MNTR_DIE6,
    S_MNTR_DIE7,
    S_MNTR_DIE8,
    S_MNTR_DIE9,
    S_MNTR_DIE10,
    S_MNTR_DIE11,
    S_MNTR_DIE12,
    S_MNTR_DIE13,
    S_MNTR_DIE14,
    S_MNTR_DIE15,
    S_MNTRFX1_1,
    S_MNTRFX1_2,
    S_MNTRFXI1_1,
    S_MNTRFXI1_2,
    S_MNTRFXI1_3,
    S_MNTRFXI1_4,
    S_MNTRFXI1_5,
    S_MNTRFXI1_6,
    S_MNTRFX2_1,
    S_MNTRFXI2_1,
    S_MNTRFXI2_2,
    S_MNTRFXI2_3,
    S_MNTRFXI2_4,
    S_MNTRFXI2_5,
    S_MNTRFX3_1,
    S_MNTRFX3_2,
    S_MNTRFX3_3,
    S_MNTRFX3_4,
    S_MNTRFX3_5,
    S_MNTRFX3_6,
    S_MNTRFX3_7,
    S_MNTRFX3_8,
    S_MNTRFX3_9,
    S_AKYY1,
    S_AKYY2,
    S_AKYY3,
    S_AKYY4,
    S_AKYY5,
    S_AKYY6,
    S_AKYY7,
    S_AKYY8,
    S_AKYY9,
    S_AKYY10,
    S_BKYY1,
    S_BKYY2,
    S_BKYY3,
    S_BKYY4,
    S_BKYY5,
    S_BKYY6,
    S_BKYY7,
    S_BKYY8,
    S_BKYY9,
    S_BKYY10,
    S_CKYY1,
    S_CKYY2,
    S_CKYY3,
    S_CKYY4,
    S_CKYY5,
    S_CKYY6,
    S_CKYY7,
    S_CKYY8,
    S_CKYY9,
    S_AMG1,
    S_AMG2_1,
    S_AMG2_2,
    S_AMG2_3,
    S_AMM1,
    S_AMM2,
    S_AMC1,
    S_AMC2_1,
    S_AMC2_2,
    S_AMC2_3,
    S_AMS1_1,
    S_AMS1_2,
    S_AMS2_1,
    S_AMS2_2,
    S_AMP1_1,
    S_AMP1_2,
    S_AMP1_3,
    S_AMP2_1,
    S_AMP2_2,
    S_AMP2_3,
    S_AMB1_1,
    S_AMB1_2,
    S_AMB1_3,
    S_AMB2_1,
    S_AMB2_2,
    S_AMB2_3,
    S_SND_WIND,
    S_SND_WATERFALL,
    NUMSTATES
  );

  state_t = record
    sprite: spritenum_t;
    frame: longint;
    tics: longint;
    nextstate: statenum_t;
    misc1,
    misc2: longint;
  end;

  mobjtype_t = (
    MT_MISC0,
    MT_ITEMSHIELD1,
    MT_ITEMSHIELD2,
    MT_MISC1,
    MT_MISC2,
    MT_ARTIINVISIBILITY,
    MT_MISC3,
    MT_ARTIFLY,
    MT_ARTIINVULNERABILITY,
    MT_ARTITOMEOFPOWER,
    MT_ARTIEGG,
    MT_EGGFX,
    MT_ARTISUPERHEAL,
    MT_MISC4,
    MT_MISC5,
    MT_FIREBOMB,
    MT_ARTITELEPORT,
    MT_POD,
    MT_PODGOO,
    MT_PODGENERATOR,
    MT_SPLASH,
    MT_SPLASHBASE,
    MT_LAVASPLASH,
    MT_LAVASMOKE,
    MT_SLUDGECHUNK,
    MT_SLUDGESPLASH,
    MT_SKULLHANG70,
    MT_SKULLHANG60,
    MT_SKULLHANG45,
    MT_SKULLHANG35,
    MT_CHANDELIER,
    MT_SERPTORCH,
    MT_SMALLPILLAR,
    MT_STALAGMITESMALL,
    MT_STALAGMITELARGE,
    MT_STALACTITESMALL,
    MT_STALACTITELARGE,
    MT_MISC6,
    MT_BARREL,
    MT_MISC7,
    MT_MISC8,
    MT_MISC9,
    MT_MISC10,
    MT_MISC11,
    MT_KEYGIZMOBLUE,
    MT_KEYGIZMOGREEN,
    MT_KEYGIZMOYELLOW,
    MT_KEYGIZMOFLOAT,
    MT_MISC12,
    MT_VOLCANOBLAST,
    MT_VOLCANOTBLAST,
    MT_TELEGLITGEN,
    MT_TELEGLITGEN2,
    MT_TELEGLITTER,
    MT_TELEGLITTER2,
    MT_TFOG,
    MT_TELEPORTMAN,
    MT_STAFFPUFF,
    MT_STAFFPUFF2,
    MT_BEAKPUFF,
    MT_MISC13,
    MT_GAUNTLETPUFF1,
    MT_GAUNTLETPUFF2,
    MT_MISC14,
    MT_BLASTERFX1,
    MT_BLASTERSMOKE,
    MT_RIPPER,
    MT_BLASTERPUFF1,
    MT_BLASTERPUFF2,
    MT_WMACE,
    MT_MACEFX1,
    MT_MACEFX2,
    MT_MACEFX3,
    MT_MACEFX4,
    MT_WSKULLROD,
    MT_HORNRODFX1,
    MT_HORNRODFX2,
    MT_RAINPLR1,
    MT_RAINPLR2,
    MT_RAINPLR3,
    MT_RAINPLR4,
    MT_GOLDWANDFX1,
    MT_GOLDWANDFX2,
    MT_GOLDWANDPUFF1,
    MT_GOLDWANDPUFF2,
    MT_WPHOENIXROD,
    MT_PHOENIXFX1,
    MT_PHOENIXPUFF,
    MT_PHOENIXFX2,
    MT_MISC15,
    MT_CRBOWFX1,
    MT_CRBOWFX2,
    MT_CRBOWFX3,
    MT_CRBOWFX4,
    MT_BLOOD,
    MT_BLOODSPLATTER,
    MT_PLAYER,
    MT_BLOODYSKULL,
    MT_CHICPLAYER,
    MT_CHICKEN,
    MT_FEATHER,
    MT_MUMMY,
    MT_MUMMYLEADER,
    MT_MUMMYGHOST,
    MT_MUMMYLEADERGHOST,
    MT_MUMMYSOUL,
    MT_MUMMYFX1,
    MT_BEAST,
    MT_BEASTBALL,
    MT_BURNBALL,
    MT_BURNBALLFB,
    MT_PUFFY,
    MT_SNAKE,
    MT_SNAKEPRO_A,
    MT_SNAKEPRO_B,
    MT_HEAD,
    MT_HEADFX1,
    MT_HEADFX2,
    MT_HEADFX3,
    MT_WHIRLWIND,
    MT_CLINK,
    MT_WIZARD,
    MT_WIZFX1,
    MT_IMP,
    MT_IMPLEADER,
    MT_IMPCHUNK1,
    MT_IMPCHUNK2,
    MT_IMPBALL,
    MT_KNIGHT,
    MT_KNIGHTGHOST,
    MT_KNIGHTAXE,
    MT_REDAXE,
    MT_SORCERER1,
    MT_SRCRFX1,
    MT_SORCERER2,
    MT_SOR2FX1,
    MT_SOR2FXSPARK,
    MT_SOR2FX2,
    MT_SOR2TELEFADE,
    MT_MINOTAUR,
    MT_MNTRFX1,
    MT_MNTRFX2,
    MT_MNTRFX3,
    MT_AKYY,
    MT_BKYY,
    MT_CKEY,
    MT_AMGWNDWIMPY,
    MT_AMGWNDHEFTY,
    MT_AMMACEWIMPY,
    MT_AMMACEHEFTY,
    MT_AMCBOWWIMPY,
    MT_AMCBOWHEFTY,
    MT_AMSKRDWIMPY,
    MT_AMSKRDHEFTY,
    MT_AMPHRDWIMPY,
    MT_AMPHRDHEFTY,
    MT_AMBLSRWIMPY,
    MT_AMBLSRHEFTY,
    MT_SOUNDWIND,
    MT_SOUNDWATERFALL,
    NUMMOBJTYPES
  );

var
  sprNamesLookUp: array [0..ord(NUMSPRITES) - 1] of TLookUpRec;

const
  sprnames: array[0..ord(NUMSPRITES) - 1] of TSprite = (
    (Name: 'IMPX'; Width: 46; Height: 35),
    (Name: 'ACLO'; Width: -1; Height: -1),
    (Name: 'PTN1'; Width:  6; Height: 16),
    (Name: 'SHLD'; Width: 26; Height: 21),
    (Name: 'SHD2'; Width: 21; Height: 25),
    (Name: 'BAGH'; Width: 21; Height: 19),
    (Name: 'SPMP'; Width: 30; Height: 21),
    (Name: 'INVS'; Width: 34; Height: 27),
    (Name: 'PTN2'; Width: 15; Height: 19),
    (Name: 'SOAR'; Width: 35; Height: 20; ForceAnim: 'AC'),

    (Name: 'INVU'; Width: 19; Height: 15),
    (Name: 'PWBK'; Width: 25; Height: 23),
    (Name: 'EGGC'; Width: 20; Height: 21),
    (Name: 'EGGM'; Width: -1; Height: -1),
    (Name: 'FX01'; Width: -1; Height: -1),
    (Name: 'SPHL'; Width: 19; Height: 25),
    (Name: 'TRCH'; Width: 17; Height: 21),
    (Name: 'FBMB'; Width: 20; Height: 20),
    (Name: 'XPL1'; Width: -1; Height: -1),
    (Name: 'ATLP'; Width: 27; Height: 23),

    (Name: 'PPOD'; Width: 54; Height: 43),
    (Name: 'AMG1'; Width:  8; Height:  8),
    (Name: 'SPSH'; Width: -1; Height: -1),
    (Name: 'LVAS'; Width: -1; Height: -1),
    (Name: 'SLDG'; Width: -1; Height: -1),
    (Name: 'SKH1'; Width: 11; Height: 70),
    (Name: 'SKH2'; Width: 11; Height: 60),
    (Name: 'SKH3'; Width: 11; Height: 45),
    (Name: 'SKH4'; Width: 11; Height: 35),
    (Name: 'CHDL'; Width: 55; Height: 60),

    (Name: 'SRTC'; Width: 13; Height: 63),
    (Name: 'SMPL'; Width: 30; Height: 37),
    (Name: 'STGS'; Width: 21; Height: 39),
    (Name: 'STGL'; Width: 38; Height: 72),
    (Name: 'STCS'; Width: 21; Height: 39),
    (Name: 'STCL'; Width: 38; Height: 72),
    (Name: 'KFR1'; Width: 41; Height: 78),
    (Name: 'BARL'; Width: 34; Height: 36),
    (Name: 'BRPL'; Width: 60; Height:128),
    (Name: 'MOS1'; Width: 39; Height: 26),

    (Name: 'MOS2'; Width: 29; Height: 29),
    (Name: 'WTRH'; Width: 11; Height: 41),
    (Name: 'HCOR'; Width: 22; Height:107),
    (Name: 'KGZ1'; Width: 38; Height: 53),
    (Name: 'KGZB'; Width: -1; Height: -1),
    (Name: 'KGZG'; Width: -1; Height: -1),
    (Name: 'KGZY'; Width: -1; Height: -1),
    (Name: 'VLCO'; Width: 32; Height: 25),
    (Name: 'VFBL'; Width: -1; Height: -1),
    (Name: 'VTFB'; Width: -1; Height: -1),

    (Name: 'SFFI'; Width: -1; Height: -1),
    (Name: 'TGLT'; Width:  7; Height:  7),
    (Name: 'TELE'; Width: -1; Height: -1),
    (Name: 'STFF'; Width: -1; Height: -1),
    (Name: 'PUF3'; Width: -1; Height: -1),
    (Name: 'PUF4'; Width: -1; Height: -1),
    (Name: 'BEAK'; Width: -1; Height: -1),
    (Name: 'WGNT'; Width: 31; Height: 32),
    (Name: 'GAUN'; Width: -1; Height: -1),
    (Name: 'PUF1'; Width: -1; Height: -1),

    (Name: 'WBLS'; Width: 23; Height: 20),
    (Name: 'BLSR'; Width: -1; Height: -1),
    (Name: 'FX18'; Width: -1; Height: -1),
    (Name: 'FX17'; Width: -1; Height: -1),
    (Name: 'WMCE'; Width: 16; Height: 39),
    (Name: 'MACE'; Width: -1; Height: -1),
    (Name: 'FX02'; Width: -1; Height: -1),
    (Name: 'WSKL'; Width: 20; Height: 41),
    (Name: 'HROD'; Width: -1; Height: -1),
    (Name: 'FX00'; Width: -1; Height: -1),

    (Name: 'FX20'; Width: -1; Height: -1),
    (Name: 'FX21'; Width: -1; Height: -1),
    (Name: 'FX22'; Width: -1; Height: -1),
    (Name: 'FX23'; Width: -1; Height: -1),
    (Name: 'GWND'; Width: -1; Height: -1),
    (Name: 'PUF2'; Width: -1; Height: -1),
    (Name: 'WPHX'; Width: 24; Height: 40),
    (Name: 'PHNX'; Width: -1; Height: -1),
    (Name: 'FX04'; Width: -1; Height: -1),
    (Name: 'FX08'; Width: -1; Height: -1),

    (Name: 'FX09'; Width: -1; Height: -1),
    (Name: 'WBOW'; Width: 45; Height: 40),
    (Name: 'CRBW'; Width: -1; Height: -1),
    (Name: 'FX03'; Width: -1; Height: -1),
    (Name: 'BLOD'; Width: -1; Height: -1),
    (Name: 'PLAY'; Width: -1; Height: -1),
    (Name: 'FDTH'; Width: -1; Height: -1),
    (Name: 'BSKL'; Width: -1; Height: -1),
    (Name: 'CHKN'; Width: -1; Height: -1),
    (Name: 'MUMM'; Width: 58; Height: 61),

    (Name: 'FX15'; Width: -1; Height: -1),
    (Name: 'BEAS'; Width: 88; Height: 77),
    (Name: 'FRB1'; Width: -1; Height: -1),
    (Name: 'SNKE'; Width: 74; Height: 68),
    (Name: 'SNFX'; Width: -1; Height: -1),
    (Name: 'HEAD'; Width:108; Height: 87; ForceAnim: 'AB'),
    (Name: 'FX05'; Width: -1; Height: -1),
    (Name: 'FX06'; Width: -1; Height: -1),
    (Name: 'FX07'; Width: -1; Height: -1),
    (Name: 'CLNK'; Width: 74; Height: 77),

    (Name: 'WZRD'; Width: 73; Height: 84),
    (Name: 'FX11'; Width: -1; Height: -1),
    (Name: 'FX10'; Width: -1; Height: -1),
    (Name: 'KNIG'; Width: 58; Height: 84),
    (Name: 'SPAX'; Width: -1; Height: -1),
    (Name: 'RAXE'; Width: -1; Height: -1),
    (Name: 'SRCR'; Width: -1; Height: -1),
    (Name: 'FX14'; Width: -1; Height: -1),
    (Name: 'SOR2'; Width: -1; Height: -1),
    (Name: 'SDTH'; Width: -1; Height: -1),

    (Name: 'FX16'; Width: -1; Height: -1),
    (Name: 'MNTR'; Width:101; Height:106),
    (Name: 'FX12'; Width: -1; Height: -1),
    (Name: 'FX13'; Width: -1; Height: -1),
    (Name: 'AKYY'; Width: 20; Height: 26),
    (Name: 'BKYY'; Width: 26; Height: 25),
    (Name: 'CKYY'; Width: 24; Height: 32),
    (Name: 'AMG2'; Width: 11; Height:  8),
    (Name: 'AMM1'; Width: 28; Height: 21),
    (Name: 'AMM2'; Width: 35; Height: 28),

    (Name: 'AMC1'; Width: 10; Height: 31),
    (Name: 'AMC2'; Width: 10; Height: 26),
    (Name: 'AMS1'; Width: 11; Height: 12),
    (Name: 'AMS2'; Width: 26; Height: 26),
    (Name: 'AMP1'; Width: 15; Height: 14),
    (Name: 'AMP2'; Width: 28; Height: 26),
    (Name: 'AMB1'; Width: 16; Height: 16),
    (Name: 'AMB2'; Width: 24; Height: 24)
  );

type
  mobjinfo_t = record
    doomednum,
    spawnstate,
    spawnhealth,
    seestate,
    seesound,
    reactiontime,
    attacksound,
    painstate,
    painchance,
    painsound,
    meleestate,
    missilestate,
    crashstate,
    deathstate,
    xdeathstate,
    deathsound,
    speed,
    radius,
    height,
    mass,
    damage,
    activesound,
    flags,
    flags2: integer;
  end;

  state_p_array = ^state_t_array;
  state_t_array = array[0..ord(NUMSTATES) - 1] of state_t;

  TStateAction = procedure;

  mobjinfo_p_array = ^mobjinfo_t_array;
  mobjinfo_t_array = array[0..ord(NUMMOBJTYPES) - 1] of mobjinfo_t;

var
  states: state_p_array;
  mobjinfo: mobjinfo_p_array;

function GetThingTextureSubFix(const th: integer; var txName: string): integer;

function GetThingTextureSequence(const ipos: integer): string;

function MakeState(
    sprite: spritenum_t;
    frame: longint;
    tics: longint;
  // void    (*action) ();
    nextstate: statenum_t;
    misc1,
    misc2: longint): state_t;

function MakeObjInfo(
    doomednum,
    spawnstate,
    spawnhealth,
    seestate,
    seesound,
    reactiontime,
    attacksound,
    painstate,
    painchance,
    painsound,
    meleestate,
    missilestate,
    crashstate,
    deathstate,
    xdeathstate,
    deathsound,
    speed,
    radius,
    height,
    mass,
    damage,
    activesound,
    flags,
    flags2: integer): mobjinfo_t;

procedure Initialize;

procedure Finalize;

const
  HereticFlatAnims: array[0..6] of TTextureAnim = (
    (NumAnims: 3; Speed: 8; Anims: ('FLTWAWA1', 'FLTWAWA2', 'FLTWAWA3', '', '', '', '', '')),
    (NumAnims: 3; Speed: 8; Anims: ('FLTSLUD1', 'FLTSLUD2', 'FLTSLUD3', '', '', '', '', '')),
    (NumAnims: 4; Speed: 6; Anims: ('FLTTELE1', 'FLTTELE2', 'FLTTELE3', 'FLTTELE4', '', '', '', '')),
    (NumAnims: 3; Speed: 9; Anims: ('FLTFLWW1', 'FLTFLWW2', 'FLTFLWW3', '', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('FLTLAVA1', 'FLTLAVA2', 'FLTLAVA3', 'FLTLAVA4', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('FLATHUH1', 'FLATHUH2', 'FLATHUH3', 'FLATHUH4', '', '', '', '')),
    (NumAnims: 0; Speed:-1; Anims: ('',         '',         '',         '', '', '', '', ''))
  );

  HereticWallAnims: array[0..2] of TTextureAnim = (
    (NumAnims: 3; Speed: 6; Anims: ('LAVAFL1',  'LAVAFL2',  'LAVAFL3',  '', '', '', '', '')),
    (NumAnims: 3; Speed: 4; Anims: ('WATRWAL1', 'WATRWAL2', 'WATRWAL',  '', '', '', '', '')),
    (NumAnims: 0; Speed:-1; Anims: ('',         '',         '',         '', '', '', '', ''))
  );

implementation

uses
  se_Main;
  
var
  PositiveStart: integer;

function SearchSortedmobjinfo(const dnum: integer): integer;
var
  L, H, I, C: Integer;
begin
  L := PositiveStart;
  H := ord(NUMMOBJTYPES) - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := mobjinfo[I].doomednum - dnum;
    if C < 0 then
      L := I + 1
    else
    begin
      if C = 0 then
      begin
        Result := I;
        exit;
      end;
      H := I - 1;
    end;
  end;
  Result := -1;
end;

procedure QuickSortmobjinfo;

  procedure QuickSort(L: integer; const R: integer); register;
  var
    I, J: Integer;
    P: Integer;
    T: mobjinfo_t;
  begin
    I := L;
    repeat   
      J := R;
      P := mobjinfo[(I + J) shr 1].doomednum;
      repeat
        while (mobjinfo[I].doomednum - P) < 0 do
          Inc(I);
        while (mobjinfo[J].doomednum - P) > 0 do
          Dec(J);
        if I <= J then
        begin
          T := mobjinfo[I];
          mobjinfo[I] := mobjinfo[J];
          mobjinfo[J] := T;
          Inc(I);
          Dec(J);
        end;
      until I > J;
      if L < J then
        QuickSort(L, J);
      L := I;
    until I >= R;
  end;

begin
  QuickSort(0, ord(NUMMOBJTYPES) - 1);
end;

function GetThingTextureSubFix(const th: integer; var txName: string): integer;
begin
  Result := SearchSortedmobjinfo(th);
  if Result >= 0 then
    txName := sprnames[ord(states[mobjinfo[Result].spawnstate].sprite)].Name
  else
    txName := '';
end;

function GetThingTextureSequence(const ipos: integer): string;
var
  spos: integer;
  sprite: spritenum_t;
  frm: integer;
  cnt: integer;
begin
  Result := '';
  spos := mobjinfo[ipos].spawnstate;
  sprite := states[spos].sprite;
  cnt := 0;
  while (Length(Result) < MAXTEXTURES) and (spos >= 0) and (spos < ord(NUMSTATES)) do
  begin
    if states[spos].sprite <> sprite then
      Break;
    frm := states[spos].frame and $FF;
    Result := Result + Chr(Ord('A') + frm);
    spos := Ord(states[spos].nextstate);
    if mobjinfo[ipos].spawnstate = spos then
      Break;
    inc(cnt);
    if cnt = MAXTEXTURES div 8 then
      Break;
  end;
end;

function GetThingTextureAnimLength(const th: integer): integer;
begin
  Result := SearchSortedmobjinfo(th);
  if Result >= 0 then
    Result := states[mobjinfo[Result].spawnstate].tics;
end;

function MakeState(
    sprite: spritenum_t;
    frame: longint;
    tics: longint;
    nextstate: statenum_t;
    misc1,
    misc2: longint
  ): state_t;
begin
  Result.sprite := sprite;
  Result.frame := frame;
  Result.tics := tics;
  Result.nextstate := nextstate;
  Result.misc1 := misc1;
  Result.misc2 := misc2;
end;

function MakeObjInfo(
    doomednum,
    spawnstate,
    spawnhealth,
    seestate,
    seesound,
    reactiontime,
    attacksound,
    painstate,
    painchance,
    painsound,
    meleestate,
    missilestate,
    crashstate,
    deathstate,
    xdeathstate,
    deathsound,
    speed,
    radius,
    height,
    mass,
    damage,
    activesound,
    flags,
    flags2: integer): mobjinfo_t;
begin
  Result.doomednum := doomednum;
  Result.spawnstate := spawnstate;
  Result.spawnhealth := spawnhealth;
  Result.seestate := seestate;
  Result.seesound := seesound;
  Result.reactiontime := reactiontime;
  Result.attacksound := attacksound;
  Result.painstate := painstate;
  Result.painchance := painchance;
  Result.painsound := painsound;
  Result.meleestate := meleestate;
  Result.missilestate := missilestate;
  Result.crashstate := crashstate;
  Result.deathstate := deathstate;
  Result.xdeathstate := xdeathstate;
  Result.deathsound := deathsound;
  Result.speed := speed;
  Result.radius := radius;
  Result.height := height;
  Result.mass := mass;
  Result.damage := damage;
  Result.activesound := activesound;
  Result.flags := flags;
  Result.flags2 := flags2;
end;

var IsInitialized: boolean;

procedure Initialize;
var i: integer;
begin
  if IsInitialized then exit;

  GetMem(states, ord(NUMSTATES) * SizeOf(state_t));

  states[0] := MakeState(SPR_IMPX,0,-1, S_NULL, 0, 0);  // S_NULL
  states[1] := MakeState(SPR_ACLO,4,1050 {FreeTargMobj}, S_NULL, 0, 0);  // S_FREETARGMOBJ
  states[2] := MakeState(SPR_PTN1,0,3, S_ITEM_PTN1_2, 0, 0);  // S_ITEM_PTN1_1
  states[3] := MakeState(SPR_PTN1,1,3, S_ITEM_PTN1_3, 0, 0);  // S_ITEM_PTN1_2
  states[4] := MakeState(SPR_PTN1,2,3, S_ITEM_PTN1_1, 0, 0);  // S_ITEM_PTN1_3
  states[5] := MakeState(SPR_SHLD,0,-1, S_NULL, 0, 0);  // S_ITEM_SHLD1
  states[6] := MakeState(SPR_SHD2,0,-1, S_NULL, 0, 0);  // S_ITEM_SHD2_1
  states[7] := MakeState(SPR_BAGH,0,-1, S_NULL, 0, 0);  // S_ITEM_BAGH1
  states[8] := MakeState(SPR_SPMP,0,-1, S_NULL, 0, 0);  // S_ITEM_SPMP1
  states[9] := MakeState(SPR_ACLO,4,1400, S_HIDESPECIAL2, 0, 0);  // S_HIDESPECIAL1
  states[10] := MakeState(SPR_ACLO,0,4 {RestoreSpecialThing1}, S_HIDESPECIAL3, 0, 0);  // S_HIDESPECIAL2
  states[11] := MakeState(SPR_ACLO,1,4, S_HIDESPECIAL4, 0, 0);  // S_HIDESPECIAL3
  states[12] := MakeState(SPR_ACLO,0,4, S_HIDESPECIAL5, 0, 0);  // S_HIDESPECIAL4
  states[13] := MakeState(SPR_ACLO,1,4, S_HIDESPECIAL6, 0, 0);  // S_HIDESPECIAL5
  states[14] := MakeState(SPR_ACLO,2,4, S_HIDESPECIAL7, 0, 0);  // S_HIDESPECIAL6
  states[15] := MakeState(SPR_ACLO,1,4, S_HIDESPECIAL8, 0, 0);  // S_HIDESPECIAL7
  states[16] := MakeState(SPR_ACLO,2,4, S_HIDESPECIAL9, 0, 0);  // S_HIDESPECIAL8
  states[17] := MakeState(SPR_ACLO,3,4, S_HIDESPECIAL10, 0, 0);  // S_HIDESPECIAL9
  states[18] := MakeState(SPR_ACLO,2,4, S_HIDESPECIAL11, 0, 0);  // S_HIDESPECIAL10
  states[19] := MakeState(SPR_ACLO,3,4 {RestoreSpecialThing2}, S_NULL, 0, 0);  // S_HIDESPECIAL11
  states[20] := MakeState(SPR_ACLO,3,3, S_DORMANTARTI2, 0, 0);  // S_DORMANTARTI1
  states[21] := MakeState(SPR_ACLO,2,3, S_DORMANTARTI3, 0, 0);  // S_DORMANTARTI2
  states[22] := MakeState(SPR_ACLO,3,3, S_DORMANTARTI4, 0, 0);  // S_DORMANTARTI3
  states[23] := MakeState(SPR_ACLO,2,3, S_DORMANTARTI5, 0, 0);  // S_DORMANTARTI4
  states[24] := MakeState(SPR_ACLO,1,3, S_DORMANTARTI6, 0, 0);  // S_DORMANTARTI5
  states[25] := MakeState(SPR_ACLO,2,3, S_DORMANTARTI7, 0, 0);  // S_DORMANTARTI6
  states[26] := MakeState(SPR_ACLO,1,3, S_DORMANTARTI8, 0, 0);  // S_DORMANTARTI7
  states[27] := MakeState(SPR_ACLO,0,3, S_DORMANTARTI9, 0, 0);  // S_DORMANTARTI8
  states[28] := MakeState(SPR_ACLO,1,3, S_DORMANTARTI10, 0, 0);  // S_DORMANTARTI9
  states[29] := MakeState(SPR_ACLO,0,3, S_DORMANTARTI11, 0, 0);  // S_DORMANTARTI10
  states[30] := MakeState(SPR_ACLO,0,1400 {HideThing}, S_DORMANTARTI12, 0, 0);  // S_DORMANTARTI11
  states[31] := MakeState(SPR_ACLO,0,3 {UnHideThing}, S_DORMANTARTI13, 0, 0);  // S_DORMANTARTI12
  states[32] := MakeState(SPR_ACLO,1,3, S_DORMANTARTI14, 0, 0);  // S_DORMANTARTI13
  states[33] := MakeState(SPR_ACLO,0,3, S_DORMANTARTI15, 0, 0);  // S_DORMANTARTI14
  states[34] := MakeState(SPR_ACLO,1,3, S_DORMANTARTI16, 0, 0);  // S_DORMANTARTI15
  states[35] := MakeState(SPR_ACLO,2,3, S_DORMANTARTI17, 0, 0);  // S_DORMANTARTI16
  states[36] := MakeState(SPR_ACLO,1,3, S_DORMANTARTI18, 0, 0);  // S_DORMANTARTI17
  states[37] := MakeState(SPR_ACLO,2,3, S_DORMANTARTI19, 0, 0);  // S_DORMANTARTI18
  states[38] := MakeState(SPR_ACLO,3,3, S_DORMANTARTI20, 0, 0);  // S_DORMANTARTI19
  states[39] := MakeState(SPR_ACLO,2,3, S_DORMANTARTI21, 0, 0);  // S_DORMANTARTI20
  states[40] := MakeState(SPR_ACLO,3,3 {RestoreArtifact}, S_NULL, 0, 0);  // S_DORMANTARTI21
  states[41] := MakeState(SPR_ACLO,3,3, S_DEADARTI2, 0, 0);  // S_DEADARTI1
  states[42] := MakeState(SPR_ACLO,2,3, S_DEADARTI3, 0, 0);  // S_DEADARTI2
  states[43] := MakeState(SPR_ACLO,3,3, S_DEADARTI4, 0, 0);  // S_DEADARTI3
  states[44] := MakeState(SPR_ACLO,2,3, S_DEADARTI5, 0, 0);  // S_DEADARTI4
  states[45] := MakeState(SPR_ACLO,1,3, S_DEADARTI6, 0, 0);  // S_DEADARTI5
  states[46] := MakeState(SPR_ACLO,2,3, S_DEADARTI7, 0, 0);  // S_DEADARTI6
  states[47] := MakeState(SPR_ACLO,1,3, S_DEADARTI8, 0, 0);  // S_DEADARTI7
  states[48] := MakeState(SPR_ACLO,0,3, S_DEADARTI9, 0, 0);  // S_DEADARTI8
  states[49] := MakeState(SPR_ACLO,1,3, S_DEADARTI10, 0, 0);  // S_DEADARTI9
  states[50] := MakeState(SPR_ACLO,0,3, S_NULL, 0, 0);  // S_DEADARTI10
  states[51] := MakeState(SPR_INVS,32768,350, S_ARTI_INVS1, 0, 0);  // S_ARTI_INVS1
  states[52] := MakeState(SPR_PTN2,0,4, S_ARTI_PTN2_2, 0, 0);  // S_ARTI_PTN2_1
  states[53] := MakeState(SPR_PTN2,1,4, S_ARTI_PTN2_3, 0, 0);  // S_ARTI_PTN2_2
  states[54] := MakeState(SPR_PTN2,2,4, S_ARTI_PTN2_1, 0, 0);  // S_ARTI_PTN2_3
  states[55] := MakeState(SPR_SOAR,0,5, S_ARTI_SOAR2, 0, 0);  // S_ARTI_SOAR1
  states[56] := MakeState(SPR_SOAR,1,5, S_ARTI_SOAR3, 0, 0);  // S_ARTI_SOAR2
  states[57] := MakeState(SPR_SOAR,2,5, S_ARTI_SOAR4, 0, 0);  // S_ARTI_SOAR3
  states[58] := MakeState(SPR_SOAR,1,5, S_ARTI_SOAR1, 0, 0);  // S_ARTI_SOAR4
  states[59] := MakeState(SPR_INVU,0,3, S_ARTI_INVU2, 0, 0);  // S_ARTI_INVU1
  states[60] := MakeState(SPR_INVU,1,3, S_ARTI_INVU3, 0, 0);  // S_ARTI_INVU2
  states[61] := MakeState(SPR_INVU,2,3, S_ARTI_INVU4, 0, 0);  // S_ARTI_INVU3
  states[62] := MakeState(SPR_INVU,3,3, S_ARTI_INVU1, 0, 0);  // S_ARTI_INVU4
  states[63] := MakeState(SPR_PWBK,0,350, S_ARTI_PWBK1, 0, 0);  // S_ARTI_PWBK1
  states[64] := MakeState(SPR_EGGC,0,6, S_ARTI_EGGC2, 0, 0);  // S_ARTI_EGGC1
  states[65] := MakeState(SPR_EGGC,1,6, S_ARTI_EGGC3, 0, 0);  // S_ARTI_EGGC2
  states[66] := MakeState(SPR_EGGC,2,6, S_ARTI_EGGC4, 0, 0);  // S_ARTI_EGGC3
  states[67] := MakeState(SPR_EGGC,1,6, S_ARTI_EGGC1, 0, 0);  // S_ARTI_EGGC4
  states[68] := MakeState(SPR_EGGM,0,4, S_EGGFX2, 0, 0);  // S_EGGFX1
  states[69] := MakeState(SPR_EGGM,1,4, S_EGGFX3, 0, 0);  // S_EGGFX2
  states[70] := MakeState(SPR_EGGM,2,4, S_EGGFX4, 0, 0);  // S_EGGFX3
  states[71] := MakeState(SPR_EGGM,3,4, S_EGGFX5, 0, 0);  // S_EGGFX4
  states[72] := MakeState(SPR_EGGM,4,4, S_EGGFX1, 0, 0);  // S_EGGFX5
  states[73] := MakeState(SPR_FX01,32772,3, S_EGGFXI1_2, 0, 0);  // S_EGGFXI1_1
  states[74] := MakeState(SPR_FX01,32773,3, S_EGGFXI1_3, 0, 0);  // S_EGGFXI1_2
  states[75] := MakeState(SPR_FX01,32774,3, S_EGGFXI1_4, 0, 0);  // S_EGGFXI1_3
  states[76] := MakeState(SPR_FX01,32775,3, S_NULL, 0, 0);  // S_EGGFXI1_4
  states[77] := MakeState(SPR_SPHL,0,350, S_ARTI_SPHL1, 0, 0);  // S_ARTI_SPHL1
  states[78] := MakeState(SPR_TRCH,32768,3, S_ARTI_TRCH2, 0, 0);  // S_ARTI_TRCH1
  states[79] := MakeState(SPR_TRCH,32769,3, S_ARTI_TRCH3, 0, 0);  // S_ARTI_TRCH2
  states[80] := MakeState(SPR_TRCH,32770,3, S_ARTI_TRCH1, 0, 0);  // S_ARTI_TRCH3
  states[81] := MakeState(SPR_FBMB,4,350, S_ARTI_FBMB1, 0, 0);  // S_ARTI_FBMB1
  states[82] := MakeState(SPR_FBMB,0,10, S_FIREBOMB2, 0, 0);  // S_FIREBOMB1
  states[83] := MakeState(SPR_FBMB,1,10, S_FIREBOMB3, 0, 0);  // S_FIREBOMB2
  states[84] := MakeState(SPR_FBMB,2,10, S_FIREBOMB4, 0, 0);  // S_FIREBOMB3
  states[85] := MakeState(SPR_FBMB,3,10, S_FIREBOMB5, 0, 0);  // S_FIREBOMB4
  states[86] := MakeState(SPR_FBMB,4,6 {Scream}, S_FIREBOMB6, 0, 0);  // S_FIREBOMB5
  states[87] := MakeState(SPR_XPL1,32768,4 {Explode}, S_FIREBOMB7, 0, 0);  // S_FIREBOMB6
  states[88] := MakeState(SPR_XPL1,32769,4, S_FIREBOMB8, 0, 0);  // S_FIREBOMB7
  states[89] := MakeState(SPR_XPL1,32770,4, S_FIREBOMB9, 0, 0);  // S_FIREBOMB8
  states[90] := MakeState(SPR_XPL1,32771,4, S_FIREBOMB10, 0, 0);  // S_FIREBOMB9
  states[91] := MakeState(SPR_XPL1,32772,4, S_FIREBOMB11, 0, 0);  // S_FIREBOMB10
  states[92] := MakeState(SPR_XPL1,32773,4, S_NULL, 0, 0);  // S_FIREBOMB11
  states[93] := MakeState(SPR_ATLP,0,4, S_ARTI_ATLP2, 0, 0);  // S_ARTI_ATLP1
  states[94] := MakeState(SPR_ATLP,1,4, S_ARTI_ATLP3, 0, 0);  // S_ARTI_ATLP2
  states[95] := MakeState(SPR_ATLP,2,4, S_ARTI_ATLP4, 0, 0);  // S_ARTI_ATLP3
  states[96] := MakeState(SPR_ATLP,1,4, S_ARTI_ATLP1, 0, 0);  // S_ARTI_ATLP4
  states[97] := MakeState(SPR_PPOD,0,10, S_POD_WAIT1, 0, 0);  // S_POD_WAIT1
  states[98] := MakeState(SPR_PPOD,1,14 {PodPain}, S_POD_WAIT1, 0, 0);  // S_POD_PAIN1
  states[99] := MakeState(SPR_PPOD,32770,5 {RemovePod}, S_POD_DIE2, 0, 0);  // S_POD_DIE1
  states[100] := MakeState(SPR_PPOD,32771,5 {Scream}, S_POD_DIE3, 0, 0);  // S_POD_DIE2
  states[101] := MakeState(SPR_PPOD,32772,5 {Explode}, S_POD_DIE4, 0, 0);  // S_POD_DIE3
  states[102] := MakeState(SPR_PPOD,32773,10, S_FREETARGMOBJ, 0, 0);  // S_POD_DIE4
  states[103] := MakeState(SPR_PPOD,8,3, S_POD_GROW2, 0, 0);  // S_POD_GROW1
  states[104] := MakeState(SPR_PPOD,9,3, S_POD_GROW3, 0, 0);  // S_POD_GROW2
  states[105] := MakeState(SPR_PPOD,10,3, S_POD_GROW4, 0, 0);  // S_POD_GROW3
  states[106] := MakeState(SPR_PPOD,11,3, S_POD_GROW5, 0, 0);  // S_POD_GROW4
  states[107] := MakeState(SPR_PPOD,12,3, S_POD_GROW6, 0, 0);  // S_POD_GROW5
  states[108] := MakeState(SPR_PPOD,13,3, S_POD_GROW7, 0, 0);  // S_POD_GROW6
  states[109] := MakeState(SPR_PPOD,14,3, S_POD_GROW8, 0, 0);  // S_POD_GROW7
  states[110] := MakeState(SPR_PPOD,15,3, S_POD_WAIT1, 0, 0);  // S_POD_GROW8
  states[111] := MakeState(SPR_PPOD,6,8, S_PODGOO2, 0, 0);  // S_PODGOO1
  states[112] := MakeState(SPR_PPOD,7,8, S_PODGOO1, 0, 0);  // S_PODGOO2
  states[113] := MakeState(SPR_PPOD,6,10, S_NULL, 0, 0);  // S_PODGOOX
  states[114] := MakeState(SPR_AMG1,0,35 {MakePod}, S_PODGENERATOR, 0, 0);  // S_PODGENERATOR
  states[115] := MakeState(SPR_SPSH,0,8, S_SPLASH2, 0, 0);  // S_SPLASH1
  states[116] := MakeState(SPR_SPSH,1,8, S_SPLASH3, 0, 0);  // S_SPLASH2
  states[117] := MakeState(SPR_SPSH,2,8, S_SPLASH4, 0, 0);  // S_SPLASH3
  states[118] := MakeState(SPR_SPSH,3,16, S_NULL, 0, 0);  // S_SPLASH4
  states[119] := MakeState(SPR_SPSH,3,10, S_NULL, 0, 0);  // S_SPLASHX
  states[120] := MakeState(SPR_SPSH,4,5, S_SPLASHBASE2, 0, 0);  // S_SPLASHBASE1
  states[121] := MakeState(SPR_SPSH,5,5, S_SPLASHBASE3, 0, 0);  // S_SPLASHBASE2
  states[122] := MakeState(SPR_SPSH,6,5, S_SPLASHBASE4, 0, 0);  // S_SPLASHBASE3
  states[123] := MakeState(SPR_SPSH,7,5, S_SPLASHBASE5, 0, 0);  // S_SPLASHBASE4
  states[124] := MakeState(SPR_SPSH,8,5, S_SPLASHBASE6, 0, 0);  // S_SPLASHBASE5
  states[125] := MakeState(SPR_SPSH,9,5, S_SPLASHBASE7, 0, 0);  // S_SPLASHBASE6
  states[126] := MakeState(SPR_SPSH,10,5, S_NULL, 0, 0);  // S_SPLASHBASE7
  states[127] := MakeState(SPR_LVAS,32768,5, S_LAVASPLASH2, 0, 0);  // S_LAVASPLASH1
  states[128] := MakeState(SPR_LVAS,32769,5, S_LAVASPLASH3, 0, 0);  // S_LAVASPLASH2
  states[129] := MakeState(SPR_LVAS,32770,5, S_LAVASPLASH4, 0, 0);  // S_LAVASPLASH3
  states[130] := MakeState(SPR_LVAS,32771,5, S_LAVASPLASH5, 0, 0);  // S_LAVASPLASH4
  states[131] := MakeState(SPR_LVAS,32772,5, S_LAVASPLASH6, 0, 0);  // S_LAVASPLASH5
  states[132] := MakeState(SPR_LVAS,32773,5, S_NULL, 0, 0);  // S_LAVASPLASH6
  states[133] := MakeState(SPR_LVAS,32774,5, S_LAVASMOKE2, 0, 0);  // S_LAVASMOKE1
  states[134] := MakeState(SPR_LVAS,32775,5, S_LAVASMOKE3, 0, 0);  // S_LAVASMOKE2
  states[135] := MakeState(SPR_LVAS,32776,5, S_LAVASMOKE4, 0, 0);  // S_LAVASMOKE3
  states[136] := MakeState(SPR_LVAS,32777,5, S_LAVASMOKE5, 0, 0);  // S_LAVASMOKE4
  states[137] := MakeState(SPR_LVAS,32778,5, S_NULL, 0, 0);  // S_LAVASMOKE5
  states[138] := MakeState(SPR_SLDG,0,8, S_SLUDGECHUNK2, 0, 0);  // S_SLUDGECHUNK1
  states[139] := MakeState(SPR_SLDG,1,8, S_SLUDGECHUNK3, 0, 0);  // S_SLUDGECHUNK2
  states[140] := MakeState(SPR_SLDG,2,8, S_SLUDGECHUNK4, 0, 0);  // S_SLUDGECHUNK3
  states[141] := MakeState(SPR_SLDG,3,8, S_NULL, 0, 0);  // S_SLUDGECHUNK4
  states[142] := MakeState(SPR_SLDG,3,6, S_NULL, 0, 0);  // S_SLUDGECHUNKX
  states[143] := MakeState(SPR_SLDG,4,5, S_SLUDGESPLASH2, 0, 0);  // S_SLUDGESPLASH1
  states[144] := MakeState(SPR_SLDG,5,5, S_SLUDGESPLASH3, 0, 0);  // S_SLUDGESPLASH2
  states[145] := MakeState(SPR_SLDG,6,5, S_SLUDGESPLASH4, 0, 0);  // S_SLUDGESPLASH3
  states[146] := MakeState(SPR_SLDG,7,5, S_NULL, 0, 0);  // S_SLUDGESPLASH4
  states[147] := MakeState(SPR_SKH1,0,-1, S_NULL, 0, 0);  // S_SKULLHANG70_1
  states[148] := MakeState(SPR_SKH2,0,-1, S_NULL, 0, 0);  // S_SKULLHANG60_1
  states[149] := MakeState(SPR_SKH3,0,-1, S_NULL, 0, 0);  // S_SKULLHANG45_1
  states[150] := MakeState(SPR_SKH4,0,-1, S_NULL, 0, 0);  // S_SKULLHANG35_1
  states[151] := MakeState(SPR_CHDL,0,4, S_CHANDELIER2, 0, 0);  // S_CHANDELIER1
  states[152] := MakeState(SPR_CHDL,1,4, S_CHANDELIER3, 0, 0);  // S_CHANDELIER2
  states[153] := MakeState(SPR_CHDL,2,4, S_CHANDELIER1, 0, 0);  // S_CHANDELIER3
  states[154] := MakeState(SPR_SRTC,0,4, S_SERPTORCH2, 0, 0);  // S_SERPTORCH1
  states[155] := MakeState(SPR_SRTC,1,4, S_SERPTORCH3, 0, 0);  // S_SERPTORCH2
  states[156] := MakeState(SPR_SRTC,2,4, S_SERPTORCH1, 0, 0);  // S_SERPTORCH3
  states[157] := MakeState(SPR_SMPL,0,-1, S_NULL, 0, 0);  // S_SMALLPILLAR
  states[158] := MakeState(SPR_STGS,0,-1, S_NULL, 0, 0);  // S_STALAGMITESMALL
  states[159] := MakeState(SPR_STGL,0,-1, S_NULL, 0, 0);  // S_STALAGMITELARGE
  states[160] := MakeState(SPR_STCS,0,-1, S_NULL, 0, 0);  // S_STALACTITESMALL
  states[161] := MakeState(SPR_STCL,0,-1, S_NULL, 0, 0);  // S_STALACTITELARGE
  states[162] := MakeState(SPR_KFR1,32768,3, S_FIREBRAZIER2, 0, 0);  // S_FIREBRAZIER1
  states[163] := MakeState(SPR_KFR1,32769,3, S_FIREBRAZIER3, 0, 0);  // S_FIREBRAZIER2
  states[164] := MakeState(SPR_KFR1,32770,3, S_FIREBRAZIER4, 0, 0);  // S_FIREBRAZIER3
  states[165] := MakeState(SPR_KFR1,32771,3, S_FIREBRAZIER5, 0, 0);  // S_FIREBRAZIER4
  states[166] := MakeState(SPR_KFR1,32772,3, S_FIREBRAZIER6, 0, 0);  // S_FIREBRAZIER5
  states[167] := MakeState(SPR_KFR1,32773,3, S_FIREBRAZIER7, 0, 0);  // S_FIREBRAZIER6
  states[168] := MakeState(SPR_KFR1,32774,3, S_FIREBRAZIER8, 0, 0);  // S_FIREBRAZIER7
  states[169] := MakeState(SPR_KFR1,32775,3, S_FIREBRAZIER1, 0, 0);  // S_FIREBRAZIER8
  states[170] := MakeState(SPR_BARL,0,-1, S_NULL, 0, 0);  // S_BARREL
  states[171] := MakeState(SPR_BRPL,0,-1, S_NULL, 0, 0);  // S_BRPILLAR
  states[172] := MakeState(SPR_MOS1,0,-1, S_NULL, 0, 0);  // S_MOSS1
  states[173] := MakeState(SPR_MOS2,0,-1, S_NULL, 0, 0);  // S_MOSS2
  states[174] := MakeState(SPR_WTRH,32768,6, S_WALLTORCH2, 0, 0);  // S_WALLTORCH1
  states[175] := MakeState(SPR_WTRH,32769,6, S_WALLTORCH3, 0, 0);  // S_WALLTORCH2
  states[176] := MakeState(SPR_WTRH,32770,6, S_WALLTORCH1, 0, 0);  // S_WALLTORCH3
  states[177] := MakeState(SPR_HCOR,0,-1, S_NULL, 0, 0);  // S_HANGINGCORPSE
  states[178] := MakeState(SPR_KGZ1,0,1, S_KEYGIZMO2, 0, 0);  // S_KEYGIZMO1
  states[179] := MakeState(SPR_KGZ1,0,1 {InitKeyGizmo}, S_KEYGIZMO3, 0, 0);  // S_KEYGIZMO2
  states[180] := MakeState(SPR_KGZ1,0,-1, S_NULL, 0, 0);  // S_KEYGIZMO3
  states[181] := MakeState(SPR_KGZB,0,1, S_KGZ_START, 0, 0);  // S_KGZ_START
  states[182] := MakeState(SPR_KGZB,32768,-1, S_NULL, 0, 0);  // S_KGZ_BLUEFLOAT1
  states[183] := MakeState(SPR_KGZG,32768,-1, S_NULL, 0, 0);  // S_KGZ_GREENFLOAT1
  states[184] := MakeState(SPR_KGZY,32768,-1, S_NULL, 0, 0);  // S_KGZ_YELLOWFLOAT1
  states[185] := MakeState(SPR_VLCO,0,350, S_VOLCANO2, 0, 0);  // S_VOLCANO1
  states[186] := MakeState(SPR_VLCO,0,35 {VolcanoSet}, S_VOLCANO3, 0, 0);  // S_VOLCANO2
  states[187] := MakeState(SPR_VLCO,1,3, S_VOLCANO4, 0, 0);  // S_VOLCANO3
  states[188] := MakeState(SPR_VLCO,2,3, S_VOLCANO5, 0, 0);  // S_VOLCANO4
  states[189] := MakeState(SPR_VLCO,3,3, S_VOLCANO6, 0, 0);  // S_VOLCANO5
  states[190] := MakeState(SPR_VLCO,1,3, S_VOLCANO7, 0, 0);  // S_VOLCANO6
  states[191] := MakeState(SPR_VLCO,2,3, S_VOLCANO8, 0, 0);  // S_VOLCANO7
  states[192] := MakeState(SPR_VLCO,3,3, S_VOLCANO9, 0, 0);  // S_VOLCANO8
  states[193] := MakeState(SPR_VLCO,4,10 {VolcanoBlast}, S_VOLCANO2, 0, 0);  // S_VOLCANO9
  states[194] := MakeState(SPR_VFBL,0,4 {BeastPuff}, S_VOLCANOBALL2, 0, 0);  // S_VOLCANOBALL1
  states[195] := MakeState(SPR_VFBL,1,4 {BeastPuff}, S_VOLCANOBALL1, 0, 0);  // S_VOLCANOBALL2
  states[196] := MakeState(SPR_XPL1,0,4 {VolcBallImpact}, S_VOLCANOBALLX2, 0, 0);  // S_VOLCANOBALLX1
  states[197] := MakeState(SPR_XPL1,1,4, S_VOLCANOBALLX3, 0, 0);  // S_VOLCANOBALLX2
  states[198] := MakeState(SPR_XPL1,2,4, S_VOLCANOBALLX4, 0, 0);  // S_VOLCANOBALLX3
  states[199] := MakeState(SPR_XPL1,3,4, S_VOLCANOBALLX5, 0, 0);  // S_VOLCANOBALLX4
  states[200] := MakeState(SPR_XPL1,4,4, S_VOLCANOBALLX6, 0, 0);  // S_VOLCANOBALLX5
  states[201] := MakeState(SPR_XPL1,5,4, S_NULL, 0, 0);  // S_VOLCANOBALLX6
  states[202] := MakeState(SPR_VTFB,0,4, S_VOLCANOTBALL2, 0, 0);  // S_VOLCANOTBALL1
  states[203] := MakeState(SPR_VTFB,1,4, S_VOLCANOTBALL1, 0, 0);  // S_VOLCANOTBALL2
  states[204] := MakeState(SPR_SFFI,2,4, S_VOLCANOTBALLX2, 0, 0);  // S_VOLCANOTBALLX1
  states[205] := MakeState(SPR_SFFI,1,4, S_VOLCANOTBALLX3, 0, 0);  // S_VOLCANOTBALLX2
  states[206] := MakeState(SPR_SFFI,0,4, S_VOLCANOTBALLX4, 0, 0);  // S_VOLCANOTBALLX3
  states[207] := MakeState(SPR_SFFI,1,4, S_VOLCANOTBALLX5, 0, 0);  // S_VOLCANOTBALLX4
  states[208] := MakeState(SPR_SFFI,2,4, S_VOLCANOTBALLX6, 0, 0);  // S_VOLCANOTBALLX5
  states[209] := MakeState(SPR_SFFI,3,4, S_VOLCANOTBALLX7, 0, 0);  // S_VOLCANOTBALLX6
  states[210] := MakeState(SPR_SFFI,4,4, S_NULL, 0, 0);  // S_VOLCANOTBALLX7
  states[211] := MakeState(SPR_TGLT,0,8 {SpawnTeleGlitter}, S_TELEGLITGEN1, 0, 0);  // S_TELEGLITGEN1
  states[212] := MakeState(SPR_TGLT,5,8 {SpawnTeleGlitter2}, S_TELEGLITGEN2, 0, 0);  // S_TELEGLITGEN2
  states[213] := MakeState(SPR_TGLT,32768,2, S_TELEGLITTER1_2, 0, 0);  // S_TELEGLITTER1_1
  states[214] := MakeState(SPR_TGLT,32769,2 {AccTeleGlitter}, S_TELEGLITTER1_3, 0, 0);  // S_TELEGLITTER1_2
  states[215] := MakeState(SPR_TGLT,32770,2, S_TELEGLITTER1_4, 0, 0);  // S_TELEGLITTER1_3
  states[216] := MakeState(SPR_TGLT,32771,2 {AccTeleGlitter}, S_TELEGLITTER1_5, 0, 0);  // S_TELEGLITTER1_4
  states[217] := MakeState(SPR_TGLT,32772,2, S_TELEGLITTER1_1, 0, 0);  // S_TELEGLITTER1_5
  states[218] := MakeState(SPR_TGLT,32773,2, S_TELEGLITTER2_2, 0, 0);  // S_TELEGLITTER2_1
  states[219] := MakeState(SPR_TGLT,32774,2 {AccTeleGlitter}, S_TELEGLITTER2_3, 0, 0);  // S_TELEGLITTER2_2
  states[220] := MakeState(SPR_TGLT,32775,2, S_TELEGLITTER2_4, 0, 0);  // S_TELEGLITTER2_3
  states[221] := MakeState(SPR_TGLT,32776,2 {AccTeleGlitter}, S_TELEGLITTER2_5, 0, 0);  // S_TELEGLITTER2_4
  states[222] := MakeState(SPR_TGLT,32777,2, S_TELEGLITTER2_1, 0, 0);  // S_TELEGLITTER2_5
  states[223] := MakeState(SPR_TELE,32768,6, S_TFOG2, 0, 0);  // S_TFOG1
  states[224] := MakeState(SPR_TELE,32769,6, S_TFOG3, 0, 0);  // S_TFOG2
  states[225] := MakeState(SPR_TELE,32770,6, S_TFOG4, 0, 0);  // S_TFOG3
  states[226] := MakeState(SPR_TELE,32771,6, S_TFOG5, 0, 0);  // S_TFOG4
  states[227] := MakeState(SPR_TELE,32772,6, S_TFOG6, 0, 0);  // S_TFOG5
  states[228] := MakeState(SPR_TELE,32773,6, S_TFOG7, 0, 0);  // S_TFOG6
  states[229] := MakeState(SPR_TELE,32774,6, S_TFOG8, 0, 0);  // S_TFOG7
  states[230] := MakeState(SPR_TELE,32775,6, S_TFOG9, 0, 0);  // S_TFOG8
  states[231] := MakeState(SPR_TELE,32774,6, S_TFOG10, 0, 0);  // S_TFOG9
  states[232] := MakeState(SPR_TELE,32773,6, S_TFOG11, 0, 0);  // S_TFOG10
  states[233] := MakeState(SPR_TELE,32772,6, S_TFOG12, 0, 0);  // S_TFOG11
  states[234] := MakeState(SPR_TELE,32771,6, S_TFOG13, 0, 0);  // S_TFOG12
  states[235] := MakeState(SPR_TELE,32770,6, S_NULL, 0, 0);  // S_TFOG13
  states[236] := MakeState(SPR_STFF, 0, 0 {Light0}, S_NULL, 0, 0);  // S_LIGHTDONE
  states[237] := MakeState(SPR_STFF,0,1 {WeaponReady}, S_STAFFREADY, 0, 0);  // S_STAFFREADY
  states[238] := MakeState(SPR_STFF,0,1 {Lower}, S_STAFFDOWN, 0, 0);  // S_STAFFDOWN
  states[239] := MakeState(SPR_STFF,0,1 {Raise}, S_STAFFUP, 0, 0);  // S_STAFFUP
  states[240] := MakeState(SPR_STFF,3,4 {WeaponReady}, S_STAFFREADY2_2, 0, 0);  // S_STAFFREADY2_1
  states[241] := MakeState(SPR_STFF,4,4 {WeaponReady}, S_STAFFREADY2_3, 0, 0);  // S_STAFFREADY2_2
  states[242] := MakeState(SPR_STFF,5,4 {WeaponReady}, S_STAFFREADY2_1, 0, 0);  // S_STAFFREADY2_3
  states[243] := MakeState(SPR_STFF,3,1 {Lower}, S_STAFFDOWN2, 0, 0);  // S_STAFFDOWN2
  states[244] := MakeState(SPR_STFF,3,1 {Raise}, S_STAFFUP2, 0, 0);  // S_STAFFUP2
  states[245] := MakeState(SPR_STFF,1,6, S_STAFFATK1_2, 0, 0);  // S_STAFFATK1_1
  states[246] := MakeState(SPR_STFF,2,8 {StaffAttackPL1}, S_STAFFATK1_3, 0, 0);  // S_STAFFATK1_2
  states[247] := MakeState(SPR_STFF,1,8 {ReFire}, S_STAFFREADY, 0, 0);  // S_STAFFATK1_3
  states[248] := MakeState(SPR_STFF,6,6, S_STAFFATK2_2, 0, 0);  // S_STAFFATK2_1
  states[249] := MakeState(SPR_STFF,7,8 {StaffAttackPL2}, S_STAFFATK2_3, 0, 0);  // S_STAFFATK2_2
  states[250] := MakeState(SPR_STFF,6,8 {ReFire}, S_STAFFREADY2_1, 0, 0);  // S_STAFFATK2_3
  states[251] := MakeState(SPR_PUF3,32768,4, S_STAFFPUFF2, 0, 0);  // S_STAFFPUFF1
  states[252] := MakeState(SPR_PUF3,1,4, S_STAFFPUFF3, 0, 0);  // S_STAFFPUFF2
  states[253] := MakeState(SPR_PUF3,2,4, S_STAFFPUFF4, 0, 0);  // S_STAFFPUFF3
  states[254] := MakeState(SPR_PUF3,3,4, S_NULL, 0, 0);  // S_STAFFPUFF4
  states[255] := MakeState(SPR_PUF4,32768,4, S_STAFFPUFF2_2, 0, 0);  // S_STAFFPUFF2_1
  states[256] := MakeState(SPR_PUF4,32769,4, S_STAFFPUFF2_3, 0, 0);  // S_STAFFPUFF2_2
  states[257] := MakeState(SPR_PUF4,32770,4, S_STAFFPUFF2_4, 0, 0);  // S_STAFFPUFF2_3
  states[258] := MakeState(SPR_PUF4,32771,4, S_STAFFPUFF2_5, 0, 0);  // S_STAFFPUFF2_4
  states[259] := MakeState(SPR_PUF4,32772,4, S_STAFFPUFF2_6, 0, 0);  // S_STAFFPUFF2_5
  states[260] := MakeState(SPR_PUF4,32773,4, S_NULL, 0, 0);  // S_STAFFPUFF2_6
  states[261] := MakeState(SPR_BEAK,0,1 {BeakReady}, S_BEAKREADY, 0, 0);  // S_BEAKREADY
  states[262] := MakeState(SPR_BEAK,0,1 {Lower}, S_BEAKDOWN, 0, 0);  // S_BEAKDOWN
  states[263] := MakeState(SPR_BEAK,0,1 {BeakRaise}, S_BEAKUP, 0, 0);  // S_BEAKUP
  states[264] := MakeState(SPR_BEAK,0,18 {BeakAttackPL1}, S_BEAKREADY, 0, 0);  // S_BEAKATK1_1
  states[265] := MakeState(SPR_BEAK,0,12 {BeakAttackPL2}, S_BEAKREADY, 0, 0);  // S_BEAKATK2_1
  states[266] := MakeState(SPR_WGNT,0,-1, S_NULL, 0, 0);  // S_WGNT
  states[267] := MakeState(SPR_GAUN,0,1 {WeaponReady}, S_GAUNTLETREADY, 0, 0);  // S_GAUNTLETREADY
  states[268] := MakeState(SPR_GAUN,0,1 {Lower}, S_GAUNTLETDOWN, 0, 0);  // S_GAUNTLETDOWN
  states[269] := MakeState(SPR_GAUN,0,1 {Raise}, S_GAUNTLETUP, 0, 0);  // S_GAUNTLETUP
  states[270] := MakeState(SPR_GAUN,6,4 {WeaponReady}, S_GAUNTLETREADY2_2, 0, 0);  // S_GAUNTLETREADY2_1
  states[271] := MakeState(SPR_GAUN,7,4 {WeaponReady}, S_GAUNTLETREADY2_3, 0, 0);  // S_GAUNTLETREADY2_2
  states[272] := MakeState(SPR_GAUN,8,4 {WeaponReady}, S_GAUNTLETREADY2_1, 0, 0);  // S_GAUNTLETREADY2_3
  states[273] := MakeState(SPR_GAUN,6,1 {Lower}, S_GAUNTLETDOWN2, 0, 0);  // S_GAUNTLETDOWN2
  states[274] := MakeState(SPR_GAUN,6,1 {Raise}, S_GAUNTLETUP2, 0, 0);  // S_GAUNTLETUP2
  states[275] := MakeState(SPR_GAUN,1,4, S_GAUNTLETATK1_2, 0, 0);  // S_GAUNTLETATK1_1
  states[276] := MakeState(SPR_GAUN,2,4, S_GAUNTLETATK1_3, 0, 0);  // S_GAUNTLETATK1_2
  states[277] := MakeState(SPR_GAUN,32771,4 {GauntletAttack}, S_GAUNTLETATK1_4, 0, 0);  // S_GAUNTLETATK1_3
  states[278] := MakeState(SPR_GAUN,32772,4 {GauntletAttack}, S_GAUNTLETATK1_5, 0, 0);  // S_GAUNTLETATK1_4
  states[279] := MakeState(SPR_GAUN,32773,4 {GauntletAttack}, S_GAUNTLETATK1_6, 0, 0);  // S_GAUNTLETATK1_5
  states[280] := MakeState(SPR_GAUN,2,4 {ReFire}, S_GAUNTLETATK1_7, 0, 0);  // S_GAUNTLETATK1_6
  states[281] := MakeState(SPR_GAUN,1,4 {Light0}, S_GAUNTLETREADY, 0, 0);  // S_GAUNTLETATK1_7
  states[282] := MakeState(SPR_GAUN,9,4, S_GAUNTLETATK2_2, 0, 0);  // S_GAUNTLETATK2_1
  states[283] := MakeState(SPR_GAUN,10,4, S_GAUNTLETATK2_3, 0, 0);  // S_GAUNTLETATK2_2
  states[284] := MakeState(SPR_GAUN,32779,4 {GauntletAttack}, S_GAUNTLETATK2_4, 0, 0);  // S_GAUNTLETATK2_3
  states[285] := MakeState(SPR_GAUN,32780,4 {GauntletAttack}, S_GAUNTLETATK2_5, 0, 0);  // S_GAUNTLETATK2_4
  states[286] := MakeState(SPR_GAUN,32781,4 {GauntletAttack}, S_GAUNTLETATK2_6, 0, 0);  // S_GAUNTLETATK2_5
  states[287] := MakeState(SPR_GAUN,10,4 {ReFire}, S_GAUNTLETATK2_7, 0, 0);  // S_GAUNTLETATK2_6
  states[288] := MakeState(SPR_GAUN,9,4 {Light0}, S_GAUNTLETREADY2_1, 0, 0);  // S_GAUNTLETATK2_7
  states[289] := MakeState(SPR_PUF1,32768,4, S_GAUNTLETPUFF1_2, 0, 0);  // S_GAUNTLETPUFF1_1
  states[290] := MakeState(SPR_PUF1,32769,4, S_GAUNTLETPUFF1_3, 0, 0);  // S_GAUNTLETPUFF1_2
  states[291] := MakeState(SPR_PUF1,32770,4, S_GAUNTLETPUFF1_4, 0, 0);  // S_GAUNTLETPUFF1_3
  states[292] := MakeState(SPR_PUF1,32771,4, S_NULL, 0, 0);  // S_GAUNTLETPUFF1_4
  states[293] := MakeState(SPR_PUF1,32772,4, S_GAUNTLETPUFF2_2, 0, 0);  // S_GAUNTLETPUFF2_1
  states[294] := MakeState(SPR_PUF1,32773,4, S_GAUNTLETPUFF2_3, 0, 0);  // S_GAUNTLETPUFF2_2
  states[295] := MakeState(SPR_PUF1,32774,4, S_GAUNTLETPUFF2_4, 0, 0);  // S_GAUNTLETPUFF2_3
  states[296] := MakeState(SPR_PUF1,32775,4, S_NULL, 0, 0);  // S_GAUNTLETPUFF2_4
  states[297] := MakeState(SPR_WBLS,0,-1, S_NULL, 0, 0);  // S_BLSR
  states[298] := MakeState(SPR_BLSR,0,1 {WeaponReady}, S_BLASTERREADY, 0, 0);  // S_BLASTERREADY
  states[299] := MakeState(SPR_BLSR,0,1 {Lower}, S_BLASTERDOWN, 0, 0);  // S_BLASTERDOWN
  states[300] := MakeState(SPR_BLSR,0,1 {Raise}, S_BLASTERUP, 0, 0);  // S_BLASTERUP
  states[301] := MakeState(SPR_BLSR,1,3, S_BLASTERATK1_2, 0, 0);  // S_BLASTERATK1_1
  states[302] := MakeState(SPR_BLSR,2,3, S_BLASTERATK1_3, 0, 0);  // S_BLASTERATK1_2
  states[303] := MakeState(SPR_BLSR,3,2 {FireBlasterPL1}, S_BLASTERATK1_4, 0, 0);  // S_BLASTERATK1_3
  states[304] := MakeState(SPR_BLSR,2,2, S_BLASTERATK1_5, 0, 0);  // S_BLASTERATK1_4
  states[305] := MakeState(SPR_BLSR,1,2, S_BLASTERATK1_6, 0, 0);  // S_BLASTERATK1_5
  states[306] := MakeState(SPR_BLSR, 0, 0 {ReFire}, S_BLASTERREADY, 0, 0);  // S_BLASTERATK1_6
  states[307] := MakeState(SPR_BLSR,1,0, S_BLASTERATK2_2, 0, 0);  // S_BLASTERATK2_1
  states[308] := MakeState(SPR_BLSR,2,0, S_BLASTERATK2_3, 0, 0);  // S_BLASTERATK2_2
  states[309] := MakeState(SPR_BLSR,3,3 {FireBlasterPL2}, S_BLASTERATK2_4, 0, 0);  // S_BLASTERATK2_3
  states[310] := MakeState(SPR_BLSR,2,4, S_BLASTERATK2_5, 0, 0);  // S_BLASTERATK2_4
  states[311] := MakeState(SPR_BLSR,1,4, S_BLASTERATK2_6, 0, 0);  // S_BLASTERATK2_5
  states[312] := MakeState(SPR_BLSR, 0, 0 {ReFire}, S_BLASTERREADY, 0, 0);  // S_BLASTERATK2_6
  states[313] := MakeState(SPR_ACLO,4,200, S_BLASTERFX1_1, 0, 0);  // S_BLASTERFX1_1
  states[314] := MakeState(SPR_FX18,32768,3 {SpawnRippers}, S_BLASTERFXI1_2, 0, 0);  // S_BLASTERFXI1_1
  states[315] := MakeState(SPR_FX18,32769,3, S_BLASTERFXI1_3, 0, 0);  // S_BLASTERFXI1_2
  states[316] := MakeState(SPR_FX18,32770,4, S_BLASTERFXI1_4, 0, 0);  // S_BLASTERFXI1_3
  states[317] := MakeState(SPR_FX18,32771,4, S_BLASTERFXI1_5, 0, 0);  // S_BLASTERFXI1_4
  states[318] := MakeState(SPR_FX18,32772,4, S_BLASTERFXI1_6, 0, 0);  // S_BLASTERFXI1_5
  states[319] := MakeState(SPR_FX18,32773,4, S_BLASTERFXI1_7, 0, 0);  // S_BLASTERFXI1_6
  states[320] := MakeState(SPR_FX18,32774,4, S_NULL, 0, 0);  // S_BLASTERFXI1_7
  states[321] := MakeState(SPR_FX18,7,4, S_BLASTERSMOKE2, 0, 0);  // S_BLASTERSMOKE1
  states[322] := MakeState(SPR_FX18,8,4, S_BLASTERSMOKE3, 0, 0);  // S_BLASTERSMOKE2
  states[323] := MakeState(SPR_FX18,9,4, S_BLASTERSMOKE4, 0, 0);  // S_BLASTERSMOKE3
  states[324] := MakeState(SPR_FX18,10,4, S_BLASTERSMOKE5, 0, 0);  // S_BLASTERSMOKE4
  states[325] := MakeState(SPR_FX18,11,4, S_NULL, 0, 0);  // S_BLASTERSMOKE5
  states[326] := MakeState(SPR_FX18,12,4, S_RIPPER2, 0, 0);  // S_RIPPER1
  states[327] := MakeState(SPR_FX18,13,5, S_RIPPER1, 0, 0);  // S_RIPPER2
  states[328] := MakeState(SPR_FX18,32782,4, S_RIPPERX2, 0, 0);  // S_RIPPERX1
  states[329] := MakeState(SPR_FX18,32783,4, S_RIPPERX3, 0, 0);  // S_RIPPERX2
  states[330] := MakeState(SPR_FX18,32784,4, S_RIPPERX4, 0, 0);  // S_RIPPERX3
  states[331] := MakeState(SPR_FX18,32785,4, S_RIPPERX5, 0, 0);  // S_RIPPERX4
  states[332] := MakeState(SPR_FX18,32786,4, S_NULL, 0, 0);  // S_RIPPERX5
  states[333] := MakeState(SPR_FX17,32768,4, S_BLASTERPUFF1_2, 0, 0);  // S_BLASTERPUFF1_1
  states[334] := MakeState(SPR_FX17,32769,4, S_BLASTERPUFF1_3, 0, 0);  // S_BLASTERPUFF1_2
  states[335] := MakeState(SPR_FX17,32770,4, S_BLASTERPUFF1_4, 0, 0);  // S_BLASTERPUFF1_3
  states[336] := MakeState(SPR_FX17,32771,4, S_BLASTERPUFF1_5, 0, 0);  // S_BLASTERPUFF1_4
  states[337] := MakeState(SPR_FX17,32772,4, S_NULL, 0, 0);  // S_BLASTERPUFF1_5
  states[338] := MakeState(SPR_FX17,32773,3, S_BLASTERPUFF2_2, 0, 0);  // S_BLASTERPUFF2_1
  states[339] := MakeState(SPR_FX17,32774,3, S_BLASTERPUFF2_3, 0, 0);  // S_BLASTERPUFF2_2
  states[340] := MakeState(SPR_FX17,32775,4, S_BLASTERPUFF2_4, 0, 0);  // S_BLASTERPUFF2_3
  states[341] := MakeState(SPR_FX17,32776,4, S_BLASTERPUFF2_5, 0, 0);  // S_BLASTERPUFF2_4
  states[342] := MakeState(SPR_FX17,32777,4, S_BLASTERPUFF2_6, 0, 0);  // S_BLASTERPUFF2_5
  states[343] := MakeState(SPR_FX17,32778,4, S_BLASTERPUFF2_7, 0, 0);  // S_BLASTERPUFF2_6
  states[344] := MakeState(SPR_FX17,32779,4, S_NULL, 0, 0);  // S_BLASTERPUFF2_7
  states[345] := MakeState(SPR_WMCE,0,-1, S_NULL, 0, 0);  // S_WMCE
  states[346] := MakeState(SPR_MACE,0,1 {WeaponReady}, S_MACEREADY, 0, 0);  // S_MACEREADY
  states[347] := MakeState(SPR_MACE,0,1 {Lower}, S_MACEDOWN, 0, 0);  // S_MACEDOWN
  states[348] := MakeState(SPR_MACE,0,1 {Raise}, S_MACEUP, 0, 0);  // S_MACEUP
  states[349] := MakeState(SPR_MACE,1,4, S_MACEATK1_2, 0, 0);  // S_MACEATK1_1
  states[350] := MakeState(SPR_MACE,2,3 {FireMacePL1}, S_MACEATK1_3, 0, 0);  // S_MACEATK1_2
  states[351] := MakeState(SPR_MACE,3,3 {FireMacePL1}, S_MACEATK1_4, 0, 0);  // S_MACEATK1_3
  states[352] := MakeState(SPR_MACE,4,3 {FireMacePL1}, S_MACEATK1_5, 0, 0);  // S_MACEATK1_4
  states[353] := MakeState(SPR_MACE,5,3 {FireMacePL1}, S_MACEATK1_6, 0, 0);  // S_MACEATK1_5
  states[354] := MakeState(SPR_MACE,2,4 {ReFire}, S_MACEATK1_7, 0, 0);  // S_MACEATK1_6
  states[355] := MakeState(SPR_MACE,3,4, S_MACEATK1_8, 0, 0);  // S_MACEATK1_7
  states[356] := MakeState(SPR_MACE,4,4, S_MACEATK1_9, 0, 0);  // S_MACEATK1_8
  states[357] := MakeState(SPR_MACE,5,4, S_MACEATK1_10, 0, 0);  // S_MACEATK1_9
  states[358] := MakeState(SPR_MACE,1,4, S_MACEREADY, 0, 0);  // S_MACEATK1_10
  states[359] := MakeState(SPR_MACE,1,4, S_MACEATK2_2, 0, 0);  // S_MACEATK2_1
  states[360] := MakeState(SPR_MACE,3,4 {FireMacePL2}, S_MACEATK2_3, 0, 0);  // S_MACEATK2_2
  states[361] := MakeState(SPR_MACE,1,4, S_MACEATK2_4, 0, 0);  // S_MACEATK2_3
  states[362] := MakeState(SPR_MACE,0,8 {ReFire}, S_MACEREADY, 0, 0);  // S_MACEATK2_4
  states[363] := MakeState(SPR_FX02,0,4 {MacePL1Check}, S_MACEFX1_2, 0, 0);  // S_MACEFX1_1
  states[364] := MakeState(SPR_FX02,1,4 {MacePL1Check}, S_MACEFX1_1, 0, 0);  // S_MACEFX1_2
  states[365] := MakeState(SPR_FX02,32773,4 {MaceBallImpact}, S_MACEFXI1_2, 0, 0);  // S_MACEFXI1_1
  states[366] := MakeState(SPR_FX02,32774,4, S_MACEFXI1_3, 0, 0);  // S_MACEFXI1_2
  states[367] := MakeState(SPR_FX02,32775,4, S_MACEFXI1_4, 0, 0);  // S_MACEFXI1_3
  states[368] := MakeState(SPR_FX02,32776,4, S_MACEFXI1_5, 0, 0);  // S_MACEFXI1_4
  states[369] := MakeState(SPR_FX02,32777,4, S_NULL, 0, 0);  // S_MACEFXI1_5
  states[370] := MakeState(SPR_FX02,2,4, S_MACEFX2_2, 0, 0);  // S_MACEFX2_1
  states[371] := MakeState(SPR_FX02,3,4, S_MACEFX2_1, 0, 0);  // S_MACEFX2_2
  states[372] := MakeState(SPR_FX02,32773,4 {MaceBallImpact2}, S_MACEFXI1_2, 0, 0);  // S_MACEFXI2_1
  states[373] := MakeState(SPR_FX02,0,4, S_MACEFX3_2, 0, 0);  // S_MACEFX3_1
  states[374] := MakeState(SPR_FX02,1,4, S_MACEFX3_1, 0, 0);  // S_MACEFX3_2
  states[375] := MakeState(SPR_FX02,4,99, S_MACEFX4_1, 0, 0);  // S_MACEFX4_1
  states[376] := MakeState(SPR_FX02,32770,4 {DeathBallImpact}, S_MACEFXI1_2, 0, 0);  // S_MACEFXI4_1
  states[377] := MakeState(SPR_WSKL,0,-1, S_NULL, 0, 0);  // S_WSKL
  states[378] := MakeState(SPR_HROD,0,1 {WeaponReady}, S_HORNRODREADY, 0, 0);  // S_HORNRODREADY
  states[379] := MakeState(SPR_HROD,0,1 {Lower}, S_HORNRODDOWN, 0, 0);  // S_HORNRODDOWN
  states[380] := MakeState(SPR_HROD,0,1 {Raise}, S_HORNRODUP, 0, 0);  // S_HORNRODUP
  states[381] := MakeState(SPR_HROD,0,4 {FireSkullRodPL1}, S_HORNRODATK1_2, 0, 0);  // S_HORNRODATK1_1
  states[382] := MakeState(SPR_HROD,1,4 {FireSkullRodPL1}, S_HORNRODATK1_3, 0, 0);  // S_HORNRODATK1_2
  states[383] := MakeState(SPR_HROD,1,0 {ReFire}, S_HORNRODREADY, 0, 0);  // S_HORNRODATK1_3
  states[384] := MakeState(SPR_HROD,2,2, S_HORNRODATK2_2, 0, 0);  // S_HORNRODATK2_1
  states[385] := MakeState(SPR_HROD,3,3, S_HORNRODATK2_3, 0, 0);  // S_HORNRODATK2_2
  states[386] := MakeState(SPR_HROD,4,2, S_HORNRODATK2_4, 0, 0);  // S_HORNRODATK2_3
  states[387] := MakeState(SPR_HROD,5,3, S_HORNRODATK2_5, 0, 0);  // S_HORNRODATK2_4
  states[388] := MakeState(SPR_HROD,6,4 {FireSkullRodPL2}, S_HORNRODATK2_6, 0, 0);  // S_HORNRODATK2_5
  states[389] := MakeState(SPR_HROD,5,2, S_HORNRODATK2_7, 0, 0);  // S_HORNRODATK2_6
  states[390] := MakeState(SPR_HROD,4,3, S_HORNRODATK2_8, 0, 0);  // S_HORNRODATK2_7
  states[391] := MakeState(SPR_HROD,3,2, S_HORNRODATK2_9, 0, 0);  // S_HORNRODATK2_8
  states[392] := MakeState(SPR_HROD,2,2 {ReFire}, S_HORNRODREADY, 0, 0);  // S_HORNRODATK2_9
  states[393] := MakeState(SPR_FX00,32768,6, S_HRODFX1_2, 0, 0);  // S_HRODFX1_1
  states[394] := MakeState(SPR_FX00,32769,6, S_HRODFX1_1, 0, 0);  // S_HRODFX1_2
  states[395] := MakeState(SPR_FX00,32775,5, S_HRODFXI1_2, 0, 0);  // S_HRODFXI1_1
  states[396] := MakeState(SPR_FX00,32776,5, S_HRODFXI1_3, 0, 0);  // S_HRODFXI1_2
  states[397] := MakeState(SPR_FX00,32777,4, S_HRODFXI1_4, 0, 0);  // S_HRODFXI1_3
  states[398] := MakeState(SPR_FX00,32778,4, S_HRODFXI1_5, 0, 0);  // S_HRODFXI1_4
  states[399] := MakeState(SPR_FX00,32779,3, S_HRODFXI1_6, 0, 0);  // S_HRODFXI1_5
  states[400] := MakeState(SPR_FX00,32780,3, S_NULL, 0, 0);  // S_HRODFXI1_6
  states[401] := MakeState(SPR_FX00,32770,3, S_HRODFX2_2, 0, 0);  // S_HRODFX2_1
  states[402] := MakeState(SPR_FX00,32771,3 {SkullRodPL2Seek}, S_HRODFX2_3, 0, 0);  // S_HRODFX2_2
  states[403] := MakeState(SPR_FX00,32772,3, S_HRODFX2_4, 0, 0);  // S_HRODFX2_3
  states[404] := MakeState(SPR_FX00,32773,3 {SkullRodPL2Seek}, S_HRODFX2_1, 0, 0);  // S_HRODFX2_4
  states[405] := MakeState(SPR_FX00,32775,5 {AddPlayerRain}, S_HRODFXI2_2, 0, 0);  // S_HRODFXI2_1
  states[406] := MakeState(SPR_FX00,32776,5, S_HRODFXI2_3, 0, 0);  // S_HRODFXI2_2
  states[407] := MakeState(SPR_FX00,32777,4, S_HRODFXI2_4, 0, 0);  // S_HRODFXI2_3
  states[408] := MakeState(SPR_FX00,32778,3, S_HRODFXI2_5, 0, 0);  // S_HRODFXI2_4
  states[409] := MakeState(SPR_FX00,32779,3, S_HRODFXI2_6, 0, 0);  // S_HRODFXI2_5
  states[410] := MakeState(SPR_FX00,32780,3, S_HRODFXI2_7, 0, 0);  // S_HRODFXI2_6
  states[411] := MakeState(SPR_FX00,6,1 {HideInCeiling}, S_HRODFXI2_8, 0, 0);  // S_HRODFXI2_7
  states[412] := MakeState(SPR_FX00,6,1 {SkullRodStorm}, S_HRODFXI2_8, 0, 0);  // S_HRODFXI2_8
  states[413] := MakeState(SPR_FX20,32768,-1, S_NULL, 0, 0);  // S_RAINPLR1_1
  states[414] := MakeState(SPR_FX21,32768,-1, S_NULL, 0, 0);  // S_RAINPLR2_1
  states[415] := MakeState(SPR_FX22,32768,-1, S_NULL, 0, 0);  // S_RAINPLR3_1
  states[416] := MakeState(SPR_FX23,32768,-1, S_NULL, 0, 0);  // S_RAINPLR4_1
  states[417] := MakeState(SPR_FX20,32769,4 {RainImpact}, S_RAINPLR1X_2, 0, 0);  // S_RAINPLR1X_1
  states[418] := MakeState(SPR_FX20,32770,4, S_RAINPLR1X_3, 0, 0);  // S_RAINPLR1X_2
  states[419] := MakeState(SPR_FX20,32771,4, S_RAINPLR1X_4, 0, 0);  // S_RAINPLR1X_3
  states[420] := MakeState(SPR_FX20,32772,4, S_RAINPLR1X_5, 0, 0);  // S_RAINPLR1X_4
  states[421] := MakeState(SPR_FX20,32773,4, S_NULL, 0, 0);  // S_RAINPLR1X_5
  states[422] := MakeState(SPR_FX21,32769,4 {RainImpact}, S_RAINPLR2X_2, 0, 0);  // S_RAINPLR2X_1
  states[423] := MakeState(SPR_FX21,32770,4, S_RAINPLR2X_3, 0, 0);  // S_RAINPLR2X_2
  states[424] := MakeState(SPR_FX21,32771,4, S_RAINPLR2X_4, 0, 0);  // S_RAINPLR2X_3
  states[425] := MakeState(SPR_FX21,32772,4, S_RAINPLR2X_5, 0, 0);  // S_RAINPLR2X_4
  states[426] := MakeState(SPR_FX21,32773,4, S_NULL, 0, 0);  // S_RAINPLR2X_5
  states[427] := MakeState(SPR_FX22,32769,4 {RainImpact}, S_RAINPLR3X_2, 0, 0);  // S_RAINPLR3X_1
  states[428] := MakeState(SPR_FX22,32770,4, S_RAINPLR3X_3, 0, 0);  // S_RAINPLR3X_2
  states[429] := MakeState(SPR_FX22,32771,4, S_RAINPLR3X_4, 0, 0);  // S_RAINPLR3X_3
  states[430] := MakeState(SPR_FX22,32772,4, S_RAINPLR3X_5, 0, 0);  // S_RAINPLR3X_4
  states[431] := MakeState(SPR_FX22,32773,4, S_NULL, 0, 0);  // S_RAINPLR3X_5
  states[432] := MakeState(SPR_FX23,32769,4 {RainImpact}, S_RAINPLR4X_2, 0, 0);  // S_RAINPLR4X_1
  states[433] := MakeState(SPR_FX23,32770,4, S_RAINPLR4X_3, 0, 0);  // S_RAINPLR4X_2
  states[434] := MakeState(SPR_FX23,32771,4, S_RAINPLR4X_4, 0, 0);  // S_RAINPLR4X_3
  states[435] := MakeState(SPR_FX23,32772,4, S_RAINPLR4X_5, 0, 0);  // S_RAINPLR4X_4
  states[436] := MakeState(SPR_FX23,32773,4, S_NULL, 0, 0);  // S_RAINPLR4X_5
  states[437] := MakeState(SPR_FX20,32774,4, S_RAINAIRXPLR1_2, 0, 0);  // S_RAINAIRXPLR1_1
  states[438] := MakeState(SPR_FX21,32774,4, S_RAINAIRXPLR2_2, 0, 0);  // S_RAINAIRXPLR2_1
  states[439] := MakeState(SPR_FX22,32774,4, S_RAINAIRXPLR3_2, 0, 0);  // S_RAINAIRXPLR3_1
  states[440] := MakeState(SPR_FX23,32774,4, S_RAINAIRXPLR4_2, 0, 0);  // S_RAINAIRXPLR4_1
  states[441] := MakeState(SPR_FX20,32775,4, S_RAINAIRXPLR1_3, 0, 0);  // S_RAINAIRXPLR1_2
  states[442] := MakeState(SPR_FX21,32775,4, S_RAINAIRXPLR2_3, 0, 0);  // S_RAINAIRXPLR2_2
  states[443] := MakeState(SPR_FX22,32775,4, S_RAINAIRXPLR3_3, 0, 0);  // S_RAINAIRXPLR3_2
  states[444] := MakeState(SPR_FX23,32775,4, S_RAINAIRXPLR4_3, 0, 0);  // S_RAINAIRXPLR4_2
  states[445] := MakeState(SPR_FX20,32776,4, S_NULL, 0, 0);  // S_RAINAIRXPLR1_3
  states[446] := MakeState(SPR_FX21,32776,4, S_NULL, 0, 0);  // S_RAINAIRXPLR2_3
  states[447] := MakeState(SPR_FX22,32776,4, S_NULL, 0, 0);  // S_RAINAIRXPLR3_3
  states[448] := MakeState(SPR_FX23,32776,4, S_NULL, 0, 0);  // S_RAINAIRXPLR4_3
  states[449] := MakeState(SPR_GWND,0,1 {WeaponReady}, S_GOLDWANDREADY, 0, 0);  // S_GOLDWANDREADY
  states[450] := MakeState(SPR_GWND,0,1 {Lower}, S_GOLDWANDDOWN, 0, 0);  // S_GOLDWANDDOWN
  states[451] := MakeState(SPR_GWND,0,1 {Raise}, S_GOLDWANDUP, 0, 0);  // S_GOLDWANDUP
  states[452] := MakeState(SPR_GWND,1,3, S_GOLDWANDATK1_2, 0, 0);  // S_GOLDWANDATK1_1
  states[453] := MakeState(SPR_GWND,2,5 {FireGoldWandPL1}, S_GOLDWANDATK1_3, 0, 0);  // S_GOLDWANDATK1_2
  states[454] := MakeState(SPR_GWND,3,3, S_GOLDWANDATK1_4, 0, 0);  // S_GOLDWANDATK1_3
  states[455] := MakeState(SPR_GWND,3,0 {ReFire}, S_GOLDWANDREADY, 0, 0);  // S_GOLDWANDATK1_4
  states[456] := MakeState(SPR_GWND,1,3, S_GOLDWANDATK2_2, 0, 0);  // S_GOLDWANDATK2_1
  states[457] := MakeState(SPR_GWND,2,4 {FireGoldWandPL2}, S_GOLDWANDATK2_3, 0, 0);  // S_GOLDWANDATK2_2
  states[458] := MakeState(SPR_GWND,3,3, S_GOLDWANDATK2_4, 0, 0);  // S_GOLDWANDATK2_3
  states[459] := MakeState(SPR_GWND,3,0 {ReFire}, S_GOLDWANDREADY, 0, 0);  // S_GOLDWANDATK2_4
  states[460] := MakeState(SPR_FX01,32768,6, S_GWANDFX1_2, 0, 0);  // S_GWANDFX1_1
  states[461] := MakeState(SPR_FX01,32769,6, S_GWANDFX1_1, 0, 0);  // S_GWANDFX1_2
  states[462] := MakeState(SPR_FX01,32772,3, S_GWANDFXI1_2, 0, 0);  // S_GWANDFXI1_1
  states[463] := MakeState(SPR_FX01,32773,3, S_GWANDFXI1_3, 0, 0);  // S_GWANDFXI1_2
  states[464] := MakeState(SPR_FX01,32774,3, S_GWANDFXI1_4, 0, 0);  // S_GWANDFXI1_3
  states[465] := MakeState(SPR_FX01,32775,3, S_NULL, 0, 0);  // S_GWANDFXI1_4
  states[466] := MakeState(SPR_FX01,32770,6, S_GWANDFX2_2, 0, 0);  // S_GWANDFX2_1
  states[467] := MakeState(SPR_FX01,32771,6, S_GWANDFX2_1, 0, 0);  // S_GWANDFX2_2
  states[468] := MakeState(SPR_PUF2,32768,3, S_GWANDPUFF1_2, 0, 0);  // S_GWANDPUFF1_1
  states[469] := MakeState(SPR_PUF2,32769,3, S_GWANDPUFF1_3, 0, 0);  // S_GWANDPUFF1_2
  states[470] := MakeState(SPR_PUF2,32770,3, S_GWANDPUFF1_4, 0, 0);  // S_GWANDPUFF1_3
  states[471] := MakeState(SPR_PUF2,32771,3, S_GWANDPUFF1_5, 0, 0);  // S_GWANDPUFF1_4
  states[472] := MakeState(SPR_PUF2,32772,3, S_NULL, 0, 0);  // S_GWANDPUFF1_5
  states[473] := MakeState(SPR_WPHX,0,-1, S_NULL, 0, 0);  // S_WPHX
  states[474] := MakeState(SPR_PHNX,0,1 {WeaponReady}, S_PHOENIXREADY, 0, 0);  // S_PHOENIXREADY
  states[475] := MakeState(SPR_PHNX,0,1 {Lower}, S_PHOENIXDOWN, 0, 0);  // S_PHOENIXDOWN
  states[476] := MakeState(SPR_PHNX,0,1 {Raise}, S_PHOENIXUP, 0, 0);  // S_PHOENIXUP
  states[477] := MakeState(SPR_PHNX,1,5, S_PHOENIXATK1_2, 0, 0);  // S_PHOENIXATK1_1
  states[478] := MakeState(SPR_PHNX,2,7 {FirePhoenixPL1}, S_PHOENIXATK1_3, 0, 0);  // S_PHOENIXATK1_2
  states[479] := MakeState(SPR_PHNX,3,4, S_PHOENIXATK1_4, 0, 0);  // S_PHOENIXATK1_3
  states[480] := MakeState(SPR_PHNX,1,4, S_PHOENIXATK1_5, 0, 0);  // S_PHOENIXATK1_4
  states[481] := MakeState(SPR_PHNX,1,0 {ReFire}, S_PHOENIXREADY, 0, 0);  // S_PHOENIXATK1_5
  states[482] := MakeState(SPR_PHNX,1,3 {InitPhoenixPL2}, S_PHOENIXATK2_2, 0, 0);  // S_PHOENIXATK2_1
  states[483] := MakeState(SPR_PHNX,32770,1 {FirePhoenixPL2}, S_PHOENIXATK2_3, 0, 0);  // S_PHOENIXATK2_2
  states[484] := MakeState(SPR_PHNX,1,4 {ReFire}, S_PHOENIXATK2_4, 0, 0);  // S_PHOENIXATK2_3
  states[485] := MakeState(SPR_PHNX,1,4 {ShutdownPhoenixPL2}, S_PHOENIXREADY, 0, 0);  // S_PHOENIXATK2_4
  states[486] := MakeState(SPR_FX04,32768,4 {PhoenixPuff}, S_PHOENIXFX1_1, 0, 0);  // S_PHOENIXFX1_1
  states[487] := MakeState(SPR_FX08,32768,6 {Explode}, S_PHOENIXFXI1_2, 0, 0);  // S_PHOENIXFXI1_1
  states[488] := MakeState(SPR_FX08,32769,5, S_PHOENIXFXI1_3, 0, 0);  // S_PHOENIXFXI1_2
  states[489] := MakeState(SPR_FX08,32770,5, S_PHOENIXFXI1_4, 0, 0);  // S_PHOENIXFXI1_3
  states[490] := MakeState(SPR_FX08,32771,4, S_PHOENIXFXI1_5, 0, 0);  // S_PHOENIXFXI1_4
  states[491] := MakeState(SPR_FX08,32772,4, S_PHOENIXFXI1_6, 0, 0);  // S_PHOENIXFXI1_5
  states[492] := MakeState(SPR_FX08,32773,4, S_PHOENIXFXI1_7, 0, 0);  // S_PHOENIXFXI1_6
  states[493] := MakeState(SPR_FX08,32774,4, S_PHOENIXFXI1_8, 0, 0);  // S_PHOENIXFXI1_7
  states[494] := MakeState(SPR_FX08,32775,4, S_NULL, 0, 0);  // S_PHOENIXFXI1_8
  states[495] := MakeState(SPR_FX04,1,4, S_PHOENIXPUFF2, 0, 0);  // S_PHOENIXPUFF1
  states[496] := MakeState(SPR_FX04,2,4, S_PHOENIXPUFF3, 0, 0);  // S_PHOENIXPUFF2
  states[497] := MakeState(SPR_FX04,3,4, S_PHOENIXPUFF4, 0, 0);  // S_PHOENIXPUFF3
  states[498] := MakeState(SPR_FX04,4,4, S_PHOENIXPUFF5, 0, 0);  // S_PHOENIXPUFF4
  states[499] := MakeState(SPR_FX04,5,4, S_NULL, 0, 0);  // S_PHOENIXPUFF5
  states[500] := MakeState(SPR_FX09,32768,2, S_PHOENIXFX2_2, 0, 0);  // S_PHOENIXFX2_1
  states[501] := MakeState(SPR_FX09,32769,2, S_PHOENIXFX2_3, 0, 0);  // S_PHOENIXFX2_2
  states[502] := MakeState(SPR_FX09,32768,2, S_PHOENIXFX2_4, 0, 0);  // S_PHOENIXFX2_3
  states[503] := MakeState(SPR_FX09,32769,2, S_PHOENIXFX2_5, 0, 0);  // S_PHOENIXFX2_4
  states[504] := MakeState(SPR_FX09,32768,2, S_PHOENIXFX2_6, 0, 0);  // S_PHOENIXFX2_5
  states[505] := MakeState(SPR_FX09,32769,2 {FlameEnd}, S_PHOENIXFX2_7, 0, 0);  // S_PHOENIXFX2_6
  states[506] := MakeState(SPR_FX09,32770,2, S_PHOENIXFX2_8, 0, 0);  // S_PHOENIXFX2_7
  states[507] := MakeState(SPR_FX09,32771,2, S_PHOENIXFX2_9, 0, 0);  // S_PHOENIXFX2_8
  states[508] := MakeState(SPR_FX09,32772,2, S_PHOENIXFX2_10, 0, 0);  // S_PHOENIXFX2_9
  states[509] := MakeState(SPR_FX09,32773,2, S_NULL, 0, 0);  // S_PHOENIXFX2_10
  states[510] := MakeState(SPR_FX09,32774,3, S_PHOENIXFXI2_2, 0, 0);  // S_PHOENIXFXI2_1
  states[511] := MakeState(SPR_FX09,32775,3 {FloatPuff}, S_PHOENIXFXI2_3, 0, 0);  // S_PHOENIXFXI2_2
  states[512] := MakeState(SPR_FX09,32776,4, S_PHOENIXFXI2_4, 0, 0);  // S_PHOENIXFXI2_3
  states[513] := MakeState(SPR_FX09,32777,5, S_PHOENIXFXI2_5, 0, 0);  // S_PHOENIXFXI2_4
  states[514] := MakeState(SPR_FX09,32778,5, S_NULL, 0, 0);  // S_PHOENIXFXI2_5
  states[515] := MakeState(SPR_WBOW,0,-1, S_NULL, 0, 0);  // S_WBOW
  states[516] := MakeState(SPR_CRBW,0,1 {WeaponReady}, S_CRBOW2, 0, 0);  // S_CRBOW1
  states[517] := MakeState(SPR_CRBW,0,1 {WeaponReady}, S_CRBOW3, 0, 0);  // S_CRBOW2
  states[518] := MakeState(SPR_CRBW,0,1 {WeaponReady}, S_CRBOW4, 0, 0);  // S_CRBOW3
  states[519] := MakeState(SPR_CRBW,0,1 {WeaponReady}, S_CRBOW5, 0, 0);  // S_CRBOW4
  states[520] := MakeState(SPR_CRBW,0,1 {WeaponReady}, S_CRBOW6, 0, 0);  // S_CRBOW5
  states[521] := MakeState(SPR_CRBW,0,1 {WeaponReady}, S_CRBOW7, 0, 0);  // S_CRBOW6
  states[522] := MakeState(SPR_CRBW,1,1 {WeaponReady}, S_CRBOW8, 0, 0);  // S_CRBOW7
  states[523] := MakeState(SPR_CRBW,1,1 {WeaponReady}, S_CRBOW9, 0, 0);  // S_CRBOW8
  states[524] := MakeState(SPR_CRBW,1,1 {WeaponReady}, S_CRBOW10, 0, 0);  // S_CRBOW9
  states[525] := MakeState(SPR_CRBW,1,1 {WeaponReady}, S_CRBOW11, 0, 0);  // S_CRBOW10
  states[526] := MakeState(SPR_CRBW,1,1 {WeaponReady}, S_CRBOW12, 0, 0);  // S_CRBOW11
  states[527] := MakeState(SPR_CRBW,1,1 {WeaponReady}, S_CRBOW13, 0, 0);  // S_CRBOW12
  states[528] := MakeState(SPR_CRBW,2,1 {WeaponReady}, S_CRBOW14, 0, 0);  // S_CRBOW13
  states[529] := MakeState(SPR_CRBW,2,1 {WeaponReady}, S_CRBOW15, 0, 0);  // S_CRBOW14
  states[530] := MakeState(SPR_CRBW,2,1 {WeaponReady}, S_CRBOW16, 0, 0);  // S_CRBOW15
  states[531] := MakeState(SPR_CRBW,2,1 {WeaponReady}, S_CRBOW17, 0, 0);  // S_CRBOW16
  states[532] := MakeState(SPR_CRBW,2,1 {WeaponReady}, S_CRBOW18, 0, 0);  // S_CRBOW17
  states[533] := MakeState(SPR_CRBW,2,1 {WeaponReady}, S_CRBOW1, 0, 0);  // S_CRBOW18
  states[534] := MakeState(SPR_CRBW,0,1 {Lower}, S_CRBOWDOWN, 0, 0);  // S_CRBOWDOWN
  states[535] := MakeState(SPR_CRBW,0,1 {Raise}, S_CRBOWUP, 0, 0);  // S_CRBOWUP
  states[536] := MakeState(SPR_CRBW,3,6 {FireCrossbowPL1}, S_CRBOWATK1_2, 0, 0);  // S_CRBOWATK1_1
  states[537] := MakeState(SPR_CRBW,4,3, S_CRBOWATK1_3, 0, 0);  // S_CRBOWATK1_2
  states[538] := MakeState(SPR_CRBW,5,3, S_CRBOWATK1_4, 0, 0);  // S_CRBOWATK1_3
  states[539] := MakeState(SPR_CRBW,6,3, S_CRBOWATK1_5, 0, 0);  // S_CRBOWATK1_4
  states[540] := MakeState(SPR_CRBW,7,3, S_CRBOWATK1_6, 0, 0);  // S_CRBOWATK1_5
  states[541] := MakeState(SPR_CRBW,0,4, S_CRBOWATK1_7, 0, 0);  // S_CRBOWATK1_6
  states[542] := MakeState(SPR_CRBW,1,4, S_CRBOWATK1_8, 0, 0);  // S_CRBOWATK1_7
  states[543] := MakeState(SPR_CRBW,2,5 {ReFire}, S_CRBOW1, 0, 0);  // S_CRBOWATK1_8
  states[544] := MakeState(SPR_CRBW,3,5 {FireCrossbowPL2}, S_CRBOWATK2_2, 0, 0);  // S_CRBOWATK2_1
  states[545] := MakeState(SPR_CRBW,4,3, S_CRBOWATK2_3, 0, 0);  // S_CRBOWATK2_2
  states[546] := MakeState(SPR_CRBW,5,2, S_CRBOWATK2_4, 0, 0);  // S_CRBOWATK2_3
  states[547] := MakeState(SPR_CRBW,6,3, S_CRBOWATK2_5, 0, 0);  // S_CRBOWATK2_4
  states[548] := MakeState(SPR_CRBW,7,2, S_CRBOWATK2_6, 0, 0);  // S_CRBOWATK2_5
  states[549] := MakeState(SPR_CRBW,0,3, S_CRBOWATK2_7, 0, 0);  // S_CRBOWATK2_6
  states[550] := MakeState(SPR_CRBW,1,3, S_CRBOWATK2_8, 0, 0);  // S_CRBOWATK2_7
  states[551] := MakeState(SPR_CRBW,2,4 {ReFire}, S_CRBOW1, 0, 0);  // S_CRBOWATK2_8
  states[552] := MakeState(SPR_FX03,32769,1, S_CRBOWFX1, 0, 0);  // S_CRBOWFX1
  states[553] := MakeState(SPR_FX03,32775,8, S_CRBOWFXI1_2, 0, 0);  // S_CRBOWFXI1_1
  states[554] := MakeState(SPR_FX03,32776,8, S_CRBOWFXI1_3, 0, 0);  // S_CRBOWFXI1_2
  states[555] := MakeState(SPR_FX03,32777,8, S_NULL, 0, 0);  // S_CRBOWFXI1_3
  states[556] := MakeState(SPR_FX03,32769,1 {BoltSpark}, S_CRBOWFX2, 0, 0);  // S_CRBOWFX2
  states[557] := MakeState(SPR_FX03,32768,1, S_CRBOWFX3, 0, 0);  // S_CRBOWFX3
  states[558] := MakeState(SPR_FX03,32770,8, S_CRBOWFXI3_2, 0, 0);  // S_CRBOWFXI3_1
  states[559] := MakeState(SPR_FX03,32771,8, S_CRBOWFXI3_3, 0, 0);  // S_CRBOWFXI3_2
  states[560] := MakeState(SPR_FX03,32772,8, S_NULL, 0, 0);  // S_CRBOWFXI3_3
  states[561] := MakeState(SPR_FX03,32773,8, S_CRBOWFX4_2, 0, 0);  // S_CRBOWFX4_1
  states[562] := MakeState(SPR_FX03,32774,8, S_NULL, 0, 0);  // S_CRBOWFX4_2
  states[563] := MakeState(SPR_BLOD,2,8, S_BLOOD2, 0, 0);  // S_BLOOD1
  states[564] := MakeState(SPR_BLOD,1,8, S_BLOOD3, 0, 0);  // S_BLOOD2
  states[565] := MakeState(SPR_BLOD,0,8, S_NULL, 0, 0);  // S_BLOOD3
  states[566] := MakeState(SPR_BLOD,2,8, S_BLOODSPLATTER2, 0, 0);  // S_BLOODSPLATTER1
  states[567] := MakeState(SPR_BLOD,1,8, S_BLOODSPLATTER3, 0, 0);  // S_BLOODSPLATTER2
  states[568] := MakeState(SPR_BLOD,0,8, S_NULL, 0, 0);  // S_BLOODSPLATTER3
  states[569] := MakeState(SPR_BLOD,0,6, S_NULL, 0, 0);  // S_BLOODSPLATTERX
  states[570] := MakeState(SPR_PLAY,0,-1, S_NULL, 0, 0);  // S_PLAY
  states[571] := MakeState(SPR_PLAY,0,4, S_PLAY_RUN2, 0, 0);  // S_PLAY_RUN1
  states[572] := MakeState(SPR_PLAY,1,4, S_PLAY_RUN3, 0, 0);  // S_PLAY_RUN2
  states[573] := MakeState(SPR_PLAY,2,4, S_PLAY_RUN4, 0, 0);  // S_PLAY_RUN3
  states[574] := MakeState(SPR_PLAY,3,4, S_PLAY_RUN1, 0, 0);  // S_PLAY_RUN4
  states[575] := MakeState(SPR_PLAY,4,12, S_PLAY, 0, 0);  // S_PLAY_ATK1
  states[576] := MakeState(SPR_PLAY,32773,6, S_PLAY_ATK1, 0, 0);  // S_PLAY_ATK2
  states[577] := MakeState(SPR_PLAY,6,4, S_PLAY_PAIN2, 0, 0);  // S_PLAY_PAIN
  states[578] := MakeState(SPR_PLAY,6,4 {Pain}, S_PLAY, 0, 0);  // S_PLAY_PAIN2
  states[579] := MakeState(SPR_PLAY,7,6, S_PLAY_DIE2, 0, 0);  // S_PLAY_DIE1
  states[580] := MakeState(SPR_PLAY,8,6 {Scream}, S_PLAY_DIE3, 0, 0);  // S_PLAY_DIE2
  states[581] := MakeState(SPR_PLAY,9,6, S_PLAY_DIE4, 0, 0);  // S_PLAY_DIE3
  states[582] := MakeState(SPR_PLAY,10,6, S_PLAY_DIE5, 0, 0);  // S_PLAY_DIE4
  states[583] := MakeState(SPR_PLAY,11,6 {NoBlocking}, S_PLAY_DIE6, 0, 0);  // S_PLAY_DIE5
  states[584] := MakeState(SPR_PLAY,12,6, S_PLAY_DIE7, 0, 0);  // S_PLAY_DIE6
  states[585] := MakeState(SPR_PLAY,13,6, S_PLAY_DIE8, 0, 0);  // S_PLAY_DIE7
  states[586] := MakeState(SPR_PLAY,14,6, S_PLAY_DIE9, 0, 0);  // S_PLAY_DIE8
  states[587] := MakeState(SPR_PLAY,15,-1 {AddPlayerCorpse}, S_NULL, 0, 0);  // S_PLAY_DIE9
  states[588] := MakeState(SPR_PLAY,16,5 {Scream}, S_PLAY_XDIE2, 0, 0);  // S_PLAY_XDIE1
  states[589] := MakeState(SPR_PLAY,17,5 {SkullPop}, S_PLAY_XDIE3, 0, 0);  // S_PLAY_XDIE2
  states[590] := MakeState(SPR_PLAY,18,5 {NoBlocking}, S_PLAY_XDIE4, 0, 0);  // S_PLAY_XDIE3
  states[591] := MakeState(SPR_PLAY,19,5, S_PLAY_XDIE5, 0, 0);  // S_PLAY_XDIE4
  states[592] := MakeState(SPR_PLAY,20,5, S_PLAY_XDIE6, 0, 0);  // S_PLAY_XDIE5
  states[593] := MakeState(SPR_PLAY,21,5, S_PLAY_XDIE7, 0, 0);  // S_PLAY_XDIE6
  states[594] := MakeState(SPR_PLAY,22,5, S_PLAY_XDIE8, 0, 0);  // S_PLAY_XDIE7
  states[595] := MakeState(SPR_PLAY,23,5, S_PLAY_XDIE9, 0, 0);  // S_PLAY_XDIE8
  states[596] := MakeState(SPR_PLAY,24,-1 {AddPlayerCorpse}, S_NULL, 0, 0);  // S_PLAY_XDIE9
  states[597] := MakeState(SPR_FDTH,32768,5 {FlameSnd}, S_PLAY_FDTH2, 0, 0);  // S_PLAY_FDTH1
  states[598] := MakeState(SPR_FDTH,32769,4, S_PLAY_FDTH3, 0, 0);  // S_PLAY_FDTH2
  states[599] := MakeState(SPR_FDTH,32770,5, S_PLAY_FDTH4, 0, 0);  // S_PLAY_FDTH3
  states[600] := MakeState(SPR_FDTH,32771,4 {Scream}, S_PLAY_FDTH5, 0, 0);  // S_PLAY_FDTH4
  states[601] := MakeState(SPR_FDTH,32772,5, S_PLAY_FDTH6, 0, 0);  // S_PLAY_FDTH5
  states[602] := MakeState(SPR_FDTH,32773,4, S_PLAY_FDTH7, 0, 0);  // S_PLAY_FDTH6
  states[603] := MakeState(SPR_FDTH,32774,5 {FlameSnd}, S_PLAY_FDTH8, 0, 0);  // S_PLAY_FDTH7
  states[604] := MakeState(SPR_FDTH,32775,4, S_PLAY_FDTH9, 0, 0);  // S_PLAY_FDTH8
  states[605] := MakeState(SPR_FDTH,32776,5, S_PLAY_FDTH10, 0, 0);  // S_PLAY_FDTH9
  states[606] := MakeState(SPR_FDTH,32777,4, S_PLAY_FDTH11, 0, 0);  // S_PLAY_FDTH10
  states[607] := MakeState(SPR_FDTH,32778,5, S_PLAY_FDTH12, 0, 0);  // S_PLAY_FDTH11
  states[608] := MakeState(SPR_FDTH,32779,4, S_PLAY_FDTH13, 0, 0);  // S_PLAY_FDTH12
  states[609] := MakeState(SPR_FDTH,32780,5, S_PLAY_FDTH14, 0, 0);  // S_PLAY_FDTH13
  states[610] := MakeState(SPR_FDTH,32781,4, S_PLAY_FDTH15, 0, 0);  // S_PLAY_FDTH14
  states[611] := MakeState(SPR_FDTH,32782,5 {NoBlocking}, S_PLAY_FDTH16, 0, 0);  // S_PLAY_FDTH15
  states[612] := MakeState(SPR_FDTH,32783,4, S_PLAY_FDTH17, 0, 0);  // S_PLAY_FDTH16
  states[613] := MakeState(SPR_FDTH,32784,5, S_PLAY_FDTH18, 0, 0);  // S_PLAY_FDTH17
  states[614] := MakeState(SPR_FDTH,32785,4, S_PLAY_FDTH19, 0, 0);  // S_PLAY_FDTH18
  states[615] := MakeState(SPR_ACLO,4,35 {CheckBurnGone}, S_PLAY_FDTH19, 0, 0);  // S_PLAY_FDTH19
  states[616] := MakeState(SPR_ACLO,4,8, S_NULL, 0, 0);  // S_PLAY_FDTH20
  states[617] := MakeState(SPR_BSKL,0,5 {CheckSkullFloor}, S_BLOODYSKULL2, 0, 0);  // S_BLOODYSKULL1
  states[618] := MakeState(SPR_BSKL,1,5 {CheckSkullFloor}, S_BLOODYSKULL3, 0, 0);  // S_BLOODYSKULL2
  states[619] := MakeState(SPR_BSKL,2,5 {CheckSkullFloor}, S_BLOODYSKULL4, 0, 0);  // S_BLOODYSKULL3
  states[620] := MakeState(SPR_BSKL,3,5 {CheckSkullFloor}, S_BLOODYSKULL5, 0, 0);  // S_BLOODYSKULL4
  states[621] := MakeState(SPR_BSKL,4,5 {CheckSkullFloor}, S_BLOODYSKULL1, 0, 0);  // S_BLOODYSKULL5
  states[622] := MakeState(SPR_BSKL,5,16 {CheckSkullDone}, S_BLOODYSKULLX1, 0, 0);  // S_BLOODYSKULLX1
  states[623] := MakeState(SPR_BSKL,5,1050, S_NULL, 0, 0);  // S_BLOODYSKULLX2
  states[624] := MakeState(SPR_CHKN,0,-1, S_NULL, 0, 0);  // S_CHICPLAY
  states[625] := MakeState(SPR_CHKN,0,3, S_CHICPLAY_RUN2, 0, 0);  // S_CHICPLAY_RUN1
  states[626] := MakeState(SPR_CHKN,1,3, S_CHICPLAY_RUN3, 0, 0);  // S_CHICPLAY_RUN2
  states[627] := MakeState(SPR_CHKN,0,3, S_CHICPLAY_RUN4, 0, 0);  // S_CHICPLAY_RUN3
  states[628] := MakeState(SPR_CHKN,1,3, S_CHICPLAY_RUN1, 0, 0);  // S_CHICPLAY_RUN4
  states[629] := MakeState(SPR_CHKN,2,12, S_CHICPLAY, 0, 0);  // S_CHICPLAY_ATK1
  states[630] := MakeState(SPR_CHKN,3,4 {Feathers}, S_CHICPLAY_PAIN2, 0, 0);  // S_CHICPLAY_PAIN
  states[631] := MakeState(SPR_CHKN,2,4 {Pain}, S_CHICPLAY, 0, 0);  // S_CHICPLAY_PAIN2
  states[632] := MakeState(SPR_CHKN,0,10 {ChicLook}, S_CHICKEN_LOOK2, 0, 0);  // S_CHICKEN_LOOK1
  states[633] := MakeState(SPR_CHKN,1,10 {ChicLook}, S_CHICKEN_LOOK1, 0, 0);  // S_CHICKEN_LOOK2
  states[634] := MakeState(SPR_CHKN,0,3 {ChicChase}, S_CHICKEN_WALK2, 0, 0);  // S_CHICKEN_WALK1
  states[635] := MakeState(SPR_CHKN,1,3 {ChicChase}, S_CHICKEN_WALK1, 0, 0);  // S_CHICKEN_WALK2
  states[636] := MakeState(SPR_CHKN,3,5 {Feathers}, S_CHICKEN_PAIN2, 0, 0);  // S_CHICKEN_PAIN1
  states[637] := MakeState(SPR_CHKN,2,5 {ChicPain}, S_CHICKEN_WALK1, 0, 0);  // S_CHICKEN_PAIN2
  states[638] := MakeState(SPR_CHKN,0,8 {FaceTarget}, S_CHICKEN_ATK2, 0, 0);  // S_CHICKEN_ATK1
  states[639] := MakeState(SPR_CHKN,2,10 {ChicAttack}, S_CHICKEN_WALK1, 0, 0);  // S_CHICKEN_ATK2
  states[640] := MakeState(SPR_CHKN,4,6 {Scream}, S_CHICKEN_DIE2, 0, 0);  // S_CHICKEN_DIE1
  states[641] := MakeState(SPR_CHKN,5,6 {Feathers}, S_CHICKEN_DIE3, 0, 0);  // S_CHICKEN_DIE2
  states[642] := MakeState(SPR_CHKN,6,6, S_CHICKEN_DIE4, 0, 0);  // S_CHICKEN_DIE3
  states[643] := MakeState(SPR_CHKN,7,6 {NoBlocking}, S_CHICKEN_DIE5, 0, 0);  // S_CHICKEN_DIE4
  states[644] := MakeState(SPR_CHKN,8,6, S_CHICKEN_DIE6, 0, 0);  // S_CHICKEN_DIE5
  states[645] := MakeState(SPR_CHKN,9,6, S_CHICKEN_DIE7, 0, 0);  // S_CHICKEN_DIE6
  states[646] := MakeState(SPR_CHKN,10,6, S_CHICKEN_DIE8, 0, 0);  // S_CHICKEN_DIE7
  states[647] := MakeState(SPR_CHKN,11,-1, S_NULL, 0, 0);  // S_CHICKEN_DIE8
  states[648] := MakeState(SPR_CHKN,12,3, S_FEATHER2, 0, 0);  // S_FEATHER1
  states[649] := MakeState(SPR_CHKN,13,3, S_FEATHER3, 0, 0);  // S_FEATHER2
  states[650] := MakeState(SPR_CHKN,14,3, S_FEATHER4, 0, 0);  // S_FEATHER3
  states[651] := MakeState(SPR_CHKN,15,3, S_FEATHER5, 0, 0);  // S_FEATHER4
  states[652] := MakeState(SPR_CHKN,16,3, S_FEATHER6, 0, 0);  // S_FEATHER5
  states[653] := MakeState(SPR_CHKN,15,3, S_FEATHER7, 0, 0);  // S_FEATHER6
  states[654] := MakeState(SPR_CHKN,14,3, S_FEATHER8, 0, 0);  // S_FEATHER7
  states[655] := MakeState(SPR_CHKN,13,3, S_FEATHER1, 0, 0);  // S_FEATHER8
  states[656] := MakeState(SPR_CHKN,13,6, S_NULL, 0, 0);  // S_FEATHERX
  states[657] := MakeState(SPR_MUMM,0,10 {Look}, S_MUMMY_LOOK2, 0, 0);  // S_MUMMY_LOOK1
  states[658] := MakeState(SPR_MUMM,1,10 {Look}, S_MUMMY_LOOK1, 0, 0);  // S_MUMMY_LOOK2
  states[659] := MakeState(SPR_MUMM,0,4 {Chase}, S_MUMMY_WALK2, 0, 0);  // S_MUMMY_WALK1
  states[660] := MakeState(SPR_MUMM,1,4 {Chase}, S_MUMMY_WALK3, 0, 0);  // S_MUMMY_WALK2
  states[661] := MakeState(SPR_MUMM,2,4 {Chase}, S_MUMMY_WALK4, 0, 0);  // S_MUMMY_WALK3
  states[662] := MakeState(SPR_MUMM,3,4 {Chase}, S_MUMMY_WALK1, 0, 0);  // S_MUMMY_WALK4
  states[663] := MakeState(SPR_MUMM,4,6 {FaceTarget}, S_MUMMY_ATK2, 0, 0);  // S_MUMMY_ATK1
  states[664] := MakeState(SPR_MUMM,5,6 {MummyAttack}, S_MUMMY_ATK3, 0, 0);  // S_MUMMY_ATK2
  states[665] := MakeState(SPR_MUMM,6,6 {FaceTarget}, S_MUMMY_WALK1, 0, 0);  // S_MUMMY_ATK3
  states[666] := MakeState(SPR_MUMM,23,5 {FaceTarget}, S_MUMMYL_ATK2, 0, 0);  // S_MUMMYL_ATK1
  states[667] := MakeState(SPR_MUMM,32792,5 {FaceTarget}, S_MUMMYL_ATK3, 0, 0);  // S_MUMMYL_ATK2
  states[668] := MakeState(SPR_MUMM,23,5 {FaceTarget}, S_MUMMYL_ATK4, 0, 0);  // S_MUMMYL_ATK3
  states[669] := MakeState(SPR_MUMM,32792,5 {FaceTarget}, S_MUMMYL_ATK5, 0, 0);  // S_MUMMYL_ATK4
  states[670] := MakeState(SPR_MUMM,23,5 {FaceTarget}, S_MUMMYL_ATK6, 0, 0);  // S_MUMMYL_ATK5
  states[671] := MakeState(SPR_MUMM,32792,15 {MummyAttack2}, S_MUMMY_WALK1, 0, 0);  // S_MUMMYL_ATK6
  states[672] := MakeState(SPR_MUMM,7,4, S_MUMMY_PAIN2, 0, 0);  // S_MUMMY_PAIN1
  states[673] := MakeState(SPR_MUMM,7,4 {Pain}, S_MUMMY_WALK1, 0, 0);  // S_MUMMY_PAIN2
  states[674] := MakeState(SPR_MUMM,8,5, S_MUMMY_DIE2, 0, 0);  // S_MUMMY_DIE1
  states[675] := MakeState(SPR_MUMM,9,5 {Scream}, S_MUMMY_DIE3, 0, 0);  // S_MUMMY_DIE2
  states[676] := MakeState(SPR_MUMM,10,5 {MummySoul}, S_MUMMY_DIE4, 0, 0);  // S_MUMMY_DIE3
  states[677] := MakeState(SPR_MUMM,11,5, S_MUMMY_DIE5, 0, 0);  // S_MUMMY_DIE4
  states[678] := MakeState(SPR_MUMM,12,5 {NoBlocking}, S_MUMMY_DIE6, 0, 0);  // S_MUMMY_DIE5
  states[679] := MakeState(SPR_MUMM,13,5, S_MUMMY_DIE7, 0, 0);  // S_MUMMY_DIE6
  states[680] := MakeState(SPR_MUMM,14,5, S_MUMMY_DIE8, 0, 0);  // S_MUMMY_DIE7
  states[681] := MakeState(SPR_MUMM,15,-1, S_NULL, 0, 0);  // S_MUMMY_DIE8
  states[682] := MakeState(SPR_MUMM,16,5, S_MUMMY_SOUL2, 0, 0);  // S_MUMMY_SOUL1
  states[683] := MakeState(SPR_MUMM,17,5, S_MUMMY_SOUL3, 0, 0);  // S_MUMMY_SOUL2
  states[684] := MakeState(SPR_MUMM,18,5, S_MUMMY_SOUL4, 0, 0);  // S_MUMMY_SOUL3
  states[685] := MakeState(SPR_MUMM,19,9, S_MUMMY_SOUL5, 0, 0);  // S_MUMMY_SOUL4
  states[686] := MakeState(SPR_MUMM,20,5, S_MUMMY_SOUL6, 0, 0);  // S_MUMMY_SOUL5
  states[687] := MakeState(SPR_MUMM,21,5, S_MUMMY_SOUL7, 0, 0);  // S_MUMMY_SOUL6
  states[688] := MakeState(SPR_MUMM,22,5, S_NULL, 0, 0);  // S_MUMMY_SOUL7
  states[689] := MakeState(SPR_FX15,32768,5 {ContMobjSound}, S_MUMMYFX1_2, 0, 0);  // S_MUMMYFX1_1
  states[690] := MakeState(SPR_FX15,32769,5 {MummyFX1Seek}, S_MUMMYFX1_3, 0, 0);  // S_MUMMYFX1_2
  states[691] := MakeState(SPR_FX15,32770,5, S_MUMMYFX1_4, 0, 0);  // S_MUMMYFX1_3
  states[692] := MakeState(SPR_FX15,32769,5 {MummyFX1Seek}, S_MUMMYFX1_1, 0, 0);  // S_MUMMYFX1_4
  states[693] := MakeState(SPR_FX15,32771,5, S_MUMMYFXI1_2, 0, 0);  // S_MUMMYFXI1_1
  states[694] := MakeState(SPR_FX15,32772,5, S_MUMMYFXI1_3, 0, 0);  // S_MUMMYFXI1_2
  states[695] := MakeState(SPR_FX15,32773,5, S_MUMMYFXI1_4, 0, 0);  // S_MUMMYFXI1_3
  states[696] := MakeState(SPR_FX15,32774,5, S_NULL, 0, 0);  // S_MUMMYFXI1_4
  states[697] := MakeState(SPR_BEAS,0,10 {Look}, S_BEAST_LOOK2, 0, 0);  // S_BEAST_LOOK1
  states[698] := MakeState(SPR_BEAS,1,10 {Look}, S_BEAST_LOOK1, 0, 0);  // S_BEAST_LOOK2
  states[699] := MakeState(SPR_BEAS,0,3 {Chase}, S_BEAST_WALK2, 0, 0);  // S_BEAST_WALK1
  states[700] := MakeState(SPR_BEAS,1,3 {Chase}, S_BEAST_WALK3, 0, 0);  // S_BEAST_WALK2
  states[701] := MakeState(SPR_BEAS,2,3 {Chase}, S_BEAST_WALK4, 0, 0);  // S_BEAST_WALK3
  states[702] := MakeState(SPR_BEAS,3,3 {Chase}, S_BEAST_WALK5, 0, 0);  // S_BEAST_WALK4
  states[703] := MakeState(SPR_BEAS,4,3 {Chase}, S_BEAST_WALK6, 0, 0);  // S_BEAST_WALK5
  states[704] := MakeState(SPR_BEAS,5,3 {Chase}, S_BEAST_WALK1, 0, 0);  // S_BEAST_WALK6
  states[705] := MakeState(SPR_BEAS,7,10 {FaceTarget}, S_BEAST_ATK2, 0, 0);  // S_BEAST_ATK1
  states[706] := MakeState(SPR_BEAS,8,10 {BeastAttack}, S_BEAST_WALK1, 0, 0);  // S_BEAST_ATK2
  states[707] := MakeState(SPR_BEAS,6,3, S_BEAST_PAIN2, 0, 0);  // S_BEAST_PAIN1
  states[708] := MakeState(SPR_BEAS,6,3 {Pain}, S_BEAST_WALK1, 0, 0);  // S_BEAST_PAIN2
  states[709] := MakeState(SPR_BEAS,17,6, S_BEAST_DIE2, 0, 0);  // S_BEAST_DIE1
  states[710] := MakeState(SPR_BEAS,18,6 {Scream}, S_BEAST_DIE3, 0, 0);  // S_BEAST_DIE2
  states[711] := MakeState(SPR_BEAS,19,6, S_BEAST_DIE4, 0, 0);  // S_BEAST_DIE3
  states[712] := MakeState(SPR_BEAS,20,6, S_BEAST_DIE5, 0, 0);  // S_BEAST_DIE4
  states[713] := MakeState(SPR_BEAS,21,6, S_BEAST_DIE6, 0, 0);  // S_BEAST_DIE5
  states[714] := MakeState(SPR_BEAS,22,6 {NoBlocking}, S_BEAST_DIE7, 0, 0);  // S_BEAST_DIE6
  states[715] := MakeState(SPR_BEAS,23,6, S_BEAST_DIE8, 0, 0);  // S_BEAST_DIE7
  states[716] := MakeState(SPR_BEAS,24,6, S_BEAST_DIE9, 0, 0);  // S_BEAST_DIE8
  states[717] := MakeState(SPR_BEAS,25,-1, S_NULL, 0, 0);  // S_BEAST_DIE9
  states[718] := MakeState(SPR_BEAS,9,5, S_BEAST_XDIE2, 0, 0);  // S_BEAST_XDIE1
  states[719] := MakeState(SPR_BEAS,10,6 {Scream}, S_BEAST_XDIE3, 0, 0);  // S_BEAST_XDIE2
  states[720] := MakeState(SPR_BEAS,11,5, S_BEAST_XDIE4, 0, 0);  // S_BEAST_XDIE3
  states[721] := MakeState(SPR_BEAS,12,6, S_BEAST_XDIE5, 0, 0);  // S_BEAST_XDIE4
  states[722] := MakeState(SPR_BEAS,13,5, S_BEAST_XDIE6, 0, 0);  // S_BEAST_XDIE5
  states[723] := MakeState(SPR_BEAS,14,6 {NoBlocking}, S_BEAST_XDIE7, 0, 0);  // S_BEAST_XDIE6
  states[724] := MakeState(SPR_BEAS,15,5, S_BEAST_XDIE8, 0, 0);  // S_BEAST_XDIE7
  states[725] := MakeState(SPR_BEAS,16,-1, S_NULL, 0, 0);  // S_BEAST_XDIE8
  states[726] := MakeState(SPR_FRB1,0,2 {BeastPuff}, S_BEASTBALL2, 0, 0);  // S_BEASTBALL1
  states[727] := MakeState(SPR_FRB1,0,2 {BeastPuff}, S_BEASTBALL3, 0, 0);  // S_BEASTBALL2
  states[728] := MakeState(SPR_FRB1,1,2 {BeastPuff}, S_BEASTBALL4, 0, 0);  // S_BEASTBALL3
  states[729] := MakeState(SPR_FRB1,1,2 {BeastPuff}, S_BEASTBALL5, 0, 0);  // S_BEASTBALL4
  states[730] := MakeState(SPR_FRB1,2,2 {BeastPuff}, S_BEASTBALL6, 0, 0);  // S_BEASTBALL5
  states[731] := MakeState(SPR_FRB1,2,2 {BeastPuff}, S_BEASTBALL1, 0, 0);  // S_BEASTBALL6
  states[732] := MakeState(SPR_FRB1,3,4, S_BEASTBALLX2, 0, 0);  // S_BEASTBALLX1
  states[733] := MakeState(SPR_FRB1,4,4, S_BEASTBALLX3, 0, 0);  // S_BEASTBALLX2
  states[734] := MakeState(SPR_FRB1,5,4, S_BEASTBALLX4, 0, 0);  // S_BEASTBALLX3
  states[735] := MakeState(SPR_FRB1,6,4, S_BEASTBALLX5, 0, 0);  // S_BEASTBALLX4
  states[736] := MakeState(SPR_FRB1,7,4, S_NULL, 0, 0);  // S_BEASTBALLX5
  states[737] := MakeState(SPR_FRB1,0,4, S_BURNBALL2, 0, 0);  // S_BURNBALL1
  states[738] := MakeState(SPR_FRB1,1,4, S_BURNBALL3, 0, 0);  // S_BURNBALL2
  states[739] := MakeState(SPR_FRB1,2,4, S_BURNBALL4, 0, 0);  // S_BURNBALL3
  states[740] := MakeState(SPR_FRB1,3,4, S_BURNBALL5, 0, 0);  // S_BURNBALL4
  states[741] := MakeState(SPR_FRB1,4,4, S_BURNBALL6, 0, 0);  // S_BURNBALL5
  states[742] := MakeState(SPR_FRB1,5,4, S_BURNBALL7, 0, 0);  // S_BURNBALL6
  states[743] := MakeState(SPR_FRB1,6,4, S_BURNBALL8, 0, 0);  // S_BURNBALL7
  states[744] := MakeState(SPR_FRB1,7,4, S_NULL, 0, 0);  // S_BURNBALL8
  states[745] := MakeState(SPR_FRB1,32768,4, S_BURNBALLFB2, 0, 0);  // S_BURNBALLFB1
  states[746] := MakeState(SPR_FRB1,32769,4, S_BURNBALLFB3, 0, 0);  // S_BURNBALLFB2
  states[747] := MakeState(SPR_FRB1,32770,4, S_BURNBALLFB4, 0, 0);  // S_BURNBALLFB3
  states[748] := MakeState(SPR_FRB1,32771,4, S_BURNBALLFB5, 0, 0);  // S_BURNBALLFB4
  states[749] := MakeState(SPR_FRB1,32772,4, S_BURNBALLFB6, 0, 0);  // S_BURNBALLFB5
  states[750] := MakeState(SPR_FRB1,32773,4, S_BURNBALLFB7, 0, 0);  // S_BURNBALLFB6
  states[751] := MakeState(SPR_FRB1,32774,4, S_BURNBALLFB8, 0, 0);  // S_BURNBALLFB7
  states[752] := MakeState(SPR_FRB1,32775,4, S_NULL, 0, 0);  // S_BURNBALLFB8
  states[753] := MakeState(SPR_FRB1,3,4, S_PUFFY2, 0, 0);  // S_PUFFY1
  states[754] := MakeState(SPR_FRB1,4,4, S_PUFFY3, 0, 0);  // S_PUFFY2
  states[755] := MakeState(SPR_FRB1,5,4, S_PUFFY4, 0, 0);  // S_PUFFY3
  states[756] := MakeState(SPR_FRB1,6,4, S_PUFFY5, 0, 0);  // S_PUFFY4
  states[757] := MakeState(SPR_FRB1,7,4, S_NULL, 0, 0);  // S_PUFFY5
  states[758] := MakeState(SPR_SNKE,0,10 {Look}, S_SNAKE_LOOK2, 0, 0);  // S_SNAKE_LOOK1
  states[759] := MakeState(SPR_SNKE,1,10 {Look}, S_SNAKE_LOOK1, 0, 0);  // S_SNAKE_LOOK2
  states[760] := MakeState(SPR_SNKE,0,4 {Chase}, S_SNAKE_WALK2, 0, 0);  // S_SNAKE_WALK1
  states[761] := MakeState(SPR_SNKE,1,4 {Chase}, S_SNAKE_WALK3, 0, 0);  // S_SNAKE_WALK2
  states[762] := MakeState(SPR_SNKE,2,4 {Chase}, S_SNAKE_WALK4, 0, 0);  // S_SNAKE_WALK3
  states[763] := MakeState(SPR_SNKE,3,4 {Chase}, S_SNAKE_WALK1, 0, 0);  // S_SNAKE_WALK4
  states[764] := MakeState(SPR_SNKE,5,5 {FaceTarget}, S_SNAKE_ATK2, 0, 0);  // S_SNAKE_ATK1
  states[765] := MakeState(SPR_SNKE,5,5 {FaceTarget}, S_SNAKE_ATK3, 0, 0);  // S_SNAKE_ATK2
  states[766] := MakeState(SPR_SNKE,5,4 {SnakeAttack}, S_SNAKE_ATK4, 0, 0);  // S_SNAKE_ATK3
  states[767] := MakeState(SPR_SNKE,5,4 {SnakeAttack}, S_SNAKE_ATK5, 0, 0);  // S_SNAKE_ATK4
  states[768] := MakeState(SPR_SNKE,5,4 {SnakeAttack}, S_SNAKE_ATK6, 0, 0);  // S_SNAKE_ATK5
  states[769] := MakeState(SPR_SNKE,5,5 {FaceTarget}, S_SNAKE_ATK7, 0, 0);  // S_SNAKE_ATK6
  states[770] := MakeState(SPR_SNKE,5,5 {FaceTarget}, S_SNAKE_ATK8, 0, 0);  // S_SNAKE_ATK7
  states[771] := MakeState(SPR_SNKE,5,5 {FaceTarget}, S_SNAKE_ATK9, 0, 0);  // S_SNAKE_ATK8
  states[772] := MakeState(SPR_SNKE,5,4 {SnakeAttack2}, S_SNAKE_WALK1, 0, 0);  // S_SNAKE_ATK9
  states[773] := MakeState(SPR_SNKE,4,3, S_SNAKE_PAIN2, 0, 0);  // S_SNAKE_PAIN1
  states[774] := MakeState(SPR_SNKE,4,3 {Pain}, S_SNAKE_WALK1, 0, 0);  // S_SNAKE_PAIN2
  states[775] := MakeState(SPR_SNKE,6,5, S_SNAKE_DIE2, 0, 0);  // S_SNAKE_DIE1
  states[776] := MakeState(SPR_SNKE,7,5 {Scream}, S_SNAKE_DIE3, 0, 0);  // S_SNAKE_DIE2
  states[777] := MakeState(SPR_SNKE,8,5, S_SNAKE_DIE4, 0, 0);  // S_SNAKE_DIE3
  states[778] := MakeState(SPR_SNKE,9,5, S_SNAKE_DIE5, 0, 0);  // S_SNAKE_DIE4
  states[779] := MakeState(SPR_SNKE,10,5, S_SNAKE_DIE6, 0, 0);  // S_SNAKE_DIE5
  states[780] := MakeState(SPR_SNKE,11,5, S_SNAKE_DIE7, 0, 0);  // S_SNAKE_DIE6
  states[781] := MakeState(SPR_SNKE,12,5 {NoBlocking}, S_SNAKE_DIE8, 0, 0);  // S_SNAKE_DIE7
  states[782] := MakeState(SPR_SNKE,13,5, S_SNAKE_DIE9, 0, 0);  // S_SNAKE_DIE8
  states[783] := MakeState(SPR_SNKE,14,5, S_SNAKE_DIE10, 0, 0);  // S_SNAKE_DIE9
  states[784] := MakeState(SPR_SNKE,15,-1, S_NULL, 0, 0);  // S_SNAKE_DIE10
  states[785] := MakeState(SPR_SNFX,32768,5, S_SNAKEPRO_A2, 0, 0);  // S_SNAKEPRO_A1
  states[786] := MakeState(SPR_SNFX,32769,5, S_SNAKEPRO_A3, 0, 0);  // S_SNAKEPRO_A2
  states[787] := MakeState(SPR_SNFX,32770,5, S_SNAKEPRO_A4, 0, 0);  // S_SNAKEPRO_A3
  states[788] := MakeState(SPR_SNFX,32771,5, S_SNAKEPRO_A1, 0, 0);  // S_SNAKEPRO_A4
  states[789] := MakeState(SPR_SNFX,32772,5, S_SNAKEPRO_AX2, 0, 0);  // S_SNAKEPRO_AX1
  states[790] := MakeState(SPR_SNFX,32773,5, S_SNAKEPRO_AX3, 0, 0);  // S_SNAKEPRO_AX2
  states[791] := MakeState(SPR_SNFX,32774,4, S_SNAKEPRO_AX4, 0, 0);  // S_SNAKEPRO_AX3
  states[792] := MakeState(SPR_SNFX,32775,3, S_SNAKEPRO_AX5, 0, 0);  // S_SNAKEPRO_AX4
  states[793] := MakeState(SPR_SNFX,32776,3, S_NULL, 0, 0);  // S_SNAKEPRO_AX5
  states[794] := MakeState(SPR_SNFX,32777,6, S_SNAKEPRO_B2, 0, 0);  // S_SNAKEPRO_B1
  states[795] := MakeState(SPR_SNFX,32778,6, S_SNAKEPRO_B1, 0, 0);  // S_SNAKEPRO_B2
  states[796] := MakeState(SPR_SNFX,32779,5, S_SNAKEPRO_BX2, 0, 0);  // S_SNAKEPRO_BX1
  states[797] := MakeState(SPR_SNFX,32780,5, S_SNAKEPRO_BX3, 0, 0);  // S_SNAKEPRO_BX2
  states[798] := MakeState(SPR_SNFX,32781,4, S_SNAKEPRO_BX4, 0, 0);  // S_SNAKEPRO_BX3
  states[799] := MakeState(SPR_SNFX,32782,3, S_NULL, 0, 0);  // S_SNAKEPRO_BX4
  states[800] := MakeState(SPR_HEAD,0,10 {Look}, S_HEAD_LOOK, 0, 0);  // S_HEAD_LOOK
  states[801] := MakeState(SPR_HEAD,0,4 {Chase}, S_HEAD_FLOAT, 0, 0);  // S_HEAD_FLOAT
  states[802] := MakeState(SPR_HEAD,0,5 {FaceTarget}, S_HEAD_ATK2, 0, 0);  // S_HEAD_ATK1
  states[803] := MakeState(SPR_HEAD,1,20 {HeadAttack}, S_HEAD_FLOAT, 0, 0);  // S_HEAD_ATK2
  states[804] := MakeState(SPR_HEAD,0,4, S_HEAD_PAIN2, 0, 0);  // S_HEAD_PAIN1
  states[805] := MakeState(SPR_HEAD,0,4 {Pain}, S_HEAD_FLOAT, 0, 0);  // S_HEAD_PAIN2
  states[806] := MakeState(SPR_HEAD,2,7, S_HEAD_DIE2, 0, 0);  // S_HEAD_DIE1
  states[807] := MakeState(SPR_HEAD,3,7 {Scream}, S_HEAD_DIE3, 0, 0);  // S_HEAD_DIE2
  states[808] := MakeState(SPR_HEAD,4,7, S_HEAD_DIE4, 0, 0);  // S_HEAD_DIE3
  states[809] := MakeState(SPR_HEAD,5,7, S_HEAD_DIE5, 0, 0);  // S_HEAD_DIE4
  states[810] := MakeState(SPR_HEAD,6,7 {NoBlocking}, S_HEAD_DIE6, 0, 0);  // S_HEAD_DIE5
  states[811] := MakeState(SPR_HEAD,7,7, S_HEAD_DIE7, 0, 0);  // S_HEAD_DIE6
  states[812] := MakeState(SPR_HEAD,8,-1 {BossDeath}, S_NULL, 0, 0);  // S_HEAD_DIE7
  states[813] := MakeState(SPR_FX05,0,6, S_HEADFX1_2, 0, 0);  // S_HEADFX1_1
  states[814] := MakeState(SPR_FX05,1,6, S_HEADFX1_3, 0, 0);  // S_HEADFX1_2
  states[815] := MakeState(SPR_FX05,2,6, S_HEADFX1_1, 0, 0);  // S_HEADFX1_3
  states[816] := MakeState(SPR_FX05,3,5 {HeadIceImpact}, S_HEADFXI1_2, 0, 0);  // S_HEADFXI1_1
  states[817] := MakeState(SPR_FX05,4,5, S_HEADFXI1_3, 0, 0);  // S_HEADFXI1_2
  states[818] := MakeState(SPR_FX05,5,5, S_HEADFXI1_4, 0, 0);  // S_HEADFXI1_3
  states[819] := MakeState(SPR_FX05,6,5, S_NULL, 0, 0);  // S_HEADFXI1_4
  states[820] := MakeState(SPR_FX05,7,6, S_HEADFX2_2, 0, 0);  // S_HEADFX2_1
  states[821] := MakeState(SPR_FX05,8,6, S_HEADFX2_3, 0, 0);  // S_HEADFX2_2
  states[822] := MakeState(SPR_FX05,9,6, S_HEADFX2_1, 0, 0);  // S_HEADFX2_3
  states[823] := MakeState(SPR_FX05,3,5, S_HEADFXI2_2, 0, 0);  // S_HEADFXI2_1
  states[824] := MakeState(SPR_FX05,4,5, S_HEADFXI2_3, 0, 0);  // S_HEADFXI2_2
  states[825] := MakeState(SPR_FX05,5,5, S_HEADFXI2_4, 0, 0);  // S_HEADFXI2_3
  states[826] := MakeState(SPR_FX05,6,5, S_NULL, 0, 0);  // S_HEADFXI2_4
  states[827] := MakeState(SPR_FX06,0,4 {HeadFireGrow}, S_HEADFX3_2, 0, 0);  // S_HEADFX3_1
  states[828] := MakeState(SPR_FX06,1,4 {HeadFireGrow}, S_HEADFX3_3, 0, 0);  // S_HEADFX3_2
  states[829] := MakeState(SPR_FX06,2,4 {HeadFireGrow}, S_HEADFX3_1, 0, 0);  // S_HEADFX3_3
  states[830] := MakeState(SPR_FX06,0,5, S_HEADFX3_5, 0, 0);  // S_HEADFX3_4
  states[831] := MakeState(SPR_FX06,1,5, S_HEADFX3_6, 0, 0);  // S_HEADFX3_5
  states[832] := MakeState(SPR_FX06,2,5, S_HEADFX3_4, 0, 0);  // S_HEADFX3_6
  states[833] := MakeState(SPR_FX06,3,5, S_HEADFXI3_2, 0, 0);  // S_HEADFXI3_1
  states[834] := MakeState(SPR_FX06,4,5, S_HEADFXI3_3, 0, 0);  // S_HEADFXI3_2
  states[835] := MakeState(SPR_FX06,5,5, S_HEADFXI3_4, 0, 0);  // S_HEADFXI3_3
  states[836] := MakeState(SPR_FX06,6,5, S_NULL, 0, 0);  // S_HEADFXI3_4
  states[837] := MakeState(SPR_FX07,3,3, S_HEADFX4_2, 0, 0);  // S_HEADFX4_1
  states[838] := MakeState(SPR_FX07,4,3, S_HEADFX4_3, 0, 0);  // S_HEADFX4_2
  states[839] := MakeState(SPR_FX07,5,3, S_HEADFX4_4, 0, 0);  // S_HEADFX4_3
  states[840] := MakeState(SPR_FX07,6,3, S_HEADFX4_5, 0, 0);  // S_HEADFX4_4
  states[841] := MakeState(SPR_FX07,0,3 {WhirlwindSeek}, S_HEADFX4_6, 0, 0);  // S_HEADFX4_5
  states[842] := MakeState(SPR_FX07,1,3 {WhirlwindSeek}, S_HEADFX4_7, 0, 0);  // S_HEADFX4_6
  states[843] := MakeState(SPR_FX07,2,3 {WhirlwindSeek}, S_HEADFX4_5, 0, 0);  // S_HEADFX4_7
  states[844] := MakeState(SPR_FX07,6,4, S_HEADFXI4_2, 0, 0);  // S_HEADFXI4_1
  states[845] := MakeState(SPR_FX07,5,4, S_HEADFXI4_3, 0, 0);  // S_HEADFXI4_2
  states[846] := MakeState(SPR_FX07,4,4, S_HEADFXI4_4, 0, 0);  // S_HEADFXI4_3
  states[847] := MakeState(SPR_FX07,3,4, S_NULL, 0, 0);  // S_HEADFXI4_4
  states[848] := MakeState(SPR_CLNK,0,10 {Look}, S_CLINK_LOOK2, 0, 0);  // S_CLINK_LOOK1
  states[849] := MakeState(SPR_CLNK,1,10 {Look}, S_CLINK_LOOK1, 0, 0);  // S_CLINK_LOOK2
  states[850] := MakeState(SPR_CLNK,0,3 {Chase}, S_CLINK_WALK2, 0, 0);  // S_CLINK_WALK1
  states[851] := MakeState(SPR_CLNK,1,3 {Chase}, S_CLINK_WALK3, 0, 0);  // S_CLINK_WALK2
  states[852] := MakeState(SPR_CLNK,2,3 {Chase}, S_CLINK_WALK4, 0, 0);  // S_CLINK_WALK3
  states[853] := MakeState(SPR_CLNK,3,3 {Chase}, S_CLINK_WALK1, 0, 0);  // S_CLINK_WALK4
  states[854] := MakeState(SPR_CLNK,4,5 {FaceTarget}, S_CLINK_ATK2, 0, 0);  // S_CLINK_ATK1
  states[855] := MakeState(SPR_CLNK,5,4 {FaceTarget}, S_CLINK_ATK3, 0, 0);  // S_CLINK_ATK2
  states[856] := MakeState(SPR_CLNK,6,7 {ClinkAttack}, S_CLINK_WALK1, 0, 0);  // S_CLINK_ATK3
  states[857] := MakeState(SPR_CLNK,7,3, S_CLINK_PAIN2, 0, 0);  // S_CLINK_PAIN1
  states[858] := MakeState(SPR_CLNK,7,3 {Pain}, S_CLINK_WALK1, 0, 0);  // S_CLINK_PAIN2
  states[859] := MakeState(SPR_CLNK,8,6, S_CLINK_DIE2, 0, 0);  // S_CLINK_DIE1
  states[860] := MakeState(SPR_CLNK,9,6, S_CLINK_DIE3, 0, 0);  // S_CLINK_DIE2
  states[861] := MakeState(SPR_CLNK,10,5 {Scream}, S_CLINK_DIE4, 0, 0);  // S_CLINK_DIE3
  states[862] := MakeState(SPR_CLNK,11,5 {NoBlocking}, S_CLINK_DIE5, 0, 0);  // S_CLINK_DIE4
  states[863] := MakeState(SPR_CLNK,12,5, S_CLINK_DIE6, 0, 0);  // S_CLINK_DIE5
  states[864] := MakeState(SPR_CLNK,13,5, S_CLINK_DIE7, 0, 0);  // S_CLINK_DIE6
  states[865] := MakeState(SPR_CLNK,14,-1, S_NULL, 0, 0);  // S_CLINK_DIE7
  states[866] := MakeState(SPR_WZRD,0,10 {Look}, S_WIZARD_LOOK2, 0, 0);  // S_WIZARD_LOOK1
  states[867] := MakeState(SPR_WZRD,1,10 {Look}, S_WIZARD_LOOK1, 0, 0);  // S_WIZARD_LOOK2
  states[868] := MakeState(SPR_WZRD,0,3 {Chase}, S_WIZARD_WALK2, 0, 0);  // S_WIZARD_WALK1
  states[869] := MakeState(SPR_WZRD,0,4 {Chase}, S_WIZARD_WALK3, 0, 0);  // S_WIZARD_WALK2
  states[870] := MakeState(SPR_WZRD,0,3 {Chase}, S_WIZARD_WALK4, 0, 0);  // S_WIZARD_WALK3
  states[871] := MakeState(SPR_WZRD,0,4 {Chase}, S_WIZARD_WALK5, 0, 0);  // S_WIZARD_WALK4
  states[872] := MakeState(SPR_WZRD,1,3 {Chase}, S_WIZARD_WALK6, 0, 0);  // S_WIZARD_WALK5
  states[873] := MakeState(SPR_WZRD,1,4 {Chase}, S_WIZARD_WALK7, 0, 0);  // S_WIZARD_WALK6
  states[874] := MakeState(SPR_WZRD,1,3 {Chase}, S_WIZARD_WALK8, 0, 0);  // S_WIZARD_WALK7
  states[875] := MakeState(SPR_WZRD,1,4 {Chase}, S_WIZARD_WALK1, 0, 0);  // S_WIZARD_WALK8
  states[876] := MakeState(SPR_WZRD,2,4 {WizAtk1}, S_WIZARD_ATK2, 0, 0);  // S_WIZARD_ATK1
  states[877] := MakeState(SPR_WZRD,2,4 {WizAtk2}, S_WIZARD_ATK3, 0, 0);  // S_WIZARD_ATK2
  states[878] := MakeState(SPR_WZRD,2,4 {WizAtk1}, S_WIZARD_ATK4, 0, 0);  // S_WIZARD_ATK3
  states[879] := MakeState(SPR_WZRD,2,4 {WizAtk2}, S_WIZARD_ATK5, 0, 0);  // S_WIZARD_ATK4
  states[880] := MakeState(SPR_WZRD,2,4 {WizAtk1}, S_WIZARD_ATK6, 0, 0);  // S_WIZARD_ATK5
  states[881] := MakeState(SPR_WZRD,2,4 {WizAtk2}, S_WIZARD_ATK7, 0, 0);  // S_WIZARD_ATK6
  states[882] := MakeState(SPR_WZRD,2,4 {WizAtk1}, S_WIZARD_ATK8, 0, 0);  // S_WIZARD_ATK7
  states[883] := MakeState(SPR_WZRD,2,4 {WizAtk2}, S_WIZARD_ATK9, 0, 0);  // S_WIZARD_ATK8
  states[884] := MakeState(SPR_WZRD,3,12 {WizAtk3}, S_WIZARD_WALK1, 0, 0);  // S_WIZARD_ATK9
  states[885] := MakeState(SPR_WZRD,4,3 {GhostOff}, S_WIZARD_PAIN2, 0, 0);  // S_WIZARD_PAIN1
  states[886] := MakeState(SPR_WZRD,4,3 {Pain}, S_WIZARD_WALK1, 0, 0);  // S_WIZARD_PAIN2
  states[887] := MakeState(SPR_WZRD,5,6 {GhostOff}, S_WIZARD_DIE2, 0, 0);  // S_WIZARD_DIE1
  states[888] := MakeState(SPR_WZRD,6,6 {Scream}, S_WIZARD_DIE3, 0, 0);  // S_WIZARD_DIE2
  states[889] := MakeState(SPR_WZRD,7,6, S_WIZARD_DIE4, 0, 0);  // S_WIZARD_DIE3
  states[890] := MakeState(SPR_WZRD,8,6, S_WIZARD_DIE5, 0, 0);  // S_WIZARD_DIE4
  states[891] := MakeState(SPR_WZRD,9,6 {NoBlocking}, S_WIZARD_DIE6, 0, 0);  // S_WIZARD_DIE5
  states[892] := MakeState(SPR_WZRD,10,6, S_WIZARD_DIE7, 0, 0);  // S_WIZARD_DIE6
  states[893] := MakeState(SPR_WZRD,11,6, S_WIZARD_DIE8, 0, 0);  // S_WIZARD_DIE7
  states[894] := MakeState(SPR_WZRD,12,-1, S_NULL, 0, 0);  // S_WIZARD_DIE8
  states[895] := MakeState(SPR_FX11,32768,6, S_WIZFX1_2, 0, 0);  // S_WIZFX1_1
  states[896] := MakeState(SPR_FX11,32769,6, S_WIZFX1_1, 0, 0);  // S_WIZFX1_2
  states[897] := MakeState(SPR_FX11,32770,5, S_WIZFXI1_2, 0, 0);  // S_WIZFXI1_1
  states[898] := MakeState(SPR_FX11,32771,5, S_WIZFXI1_3, 0, 0);  // S_WIZFXI1_2
  states[899] := MakeState(SPR_FX11,32772,5, S_WIZFXI1_4, 0, 0);  // S_WIZFXI1_3
  states[900] := MakeState(SPR_FX11,32773,5, S_WIZFXI1_5, 0, 0);  // S_WIZFXI1_4
  states[901] := MakeState(SPR_FX11,32774,5, S_NULL, 0, 0);  // S_WIZFXI1_5
  states[902] := MakeState(SPR_IMPX,0,10 {Look}, S_IMP_LOOK2, 0, 0);  // S_IMP_LOOK1
  states[903] := MakeState(SPR_IMPX,1,10 {Look}, S_IMP_LOOK3, 0, 0);  // S_IMP_LOOK2
  states[904] := MakeState(SPR_IMPX,2,10 {Look}, S_IMP_LOOK4, 0, 0);  // S_IMP_LOOK3
  states[905] := MakeState(SPR_IMPX,1,10 {Look}, S_IMP_LOOK1, 0, 0);  // S_IMP_LOOK4
  states[906] := MakeState(SPR_IMPX,0,3 {Chase}, S_IMP_FLY2, 0, 0);  // S_IMP_FLY1
  states[907] := MakeState(SPR_IMPX,0,3 {Chase}, S_IMP_FLY3, 0, 0);  // S_IMP_FLY2
  states[908] := MakeState(SPR_IMPX,1,3 {Chase}, S_IMP_FLY4, 0, 0);  // S_IMP_FLY3
  states[909] := MakeState(SPR_IMPX,1,3 {Chase}, S_IMP_FLY5, 0, 0);  // S_IMP_FLY4
  states[910] := MakeState(SPR_IMPX,2,3 {Chase}, S_IMP_FLY6, 0, 0);  // S_IMP_FLY5
  states[911] := MakeState(SPR_IMPX,2,3 {Chase}, S_IMP_FLY7, 0, 0);  // S_IMP_FLY6
  states[912] := MakeState(SPR_IMPX,1,3 {Chase}, S_IMP_FLY8, 0, 0);  // S_IMP_FLY7
  states[913] := MakeState(SPR_IMPX,1,3 {Chase}, S_IMP_FLY1, 0, 0);  // S_IMP_FLY8
  states[914] := MakeState(SPR_IMPX,3,6 {FaceTarget}, S_IMP_MEATK2, 0, 0);  // S_IMP_MEATK1
  states[915] := MakeState(SPR_IMPX,4,6 {FaceTarget}, S_IMP_MEATK3, 0, 0);  // S_IMP_MEATK2
  states[916] := MakeState(SPR_IMPX,5,6 {ImpMeAttack}, S_IMP_FLY1, 0, 0);  // S_IMP_MEATK3
  states[917] := MakeState(SPR_IMPX,0,10 {FaceTarget}, S_IMP_MSATK1_2, 0, 0);  // S_IMP_MSATK1_1
  states[918] := MakeState(SPR_IMPX,1,6 {ImpMsAttack}, S_IMP_MSATK1_3, 0, 0);  // S_IMP_MSATK1_2
  states[919] := MakeState(SPR_IMPX,2,6, S_IMP_MSATK1_4, 0, 0);  // S_IMP_MSATK1_3
  states[920] := MakeState(SPR_IMPX,1,6, S_IMP_MSATK1_5, 0, 0);  // S_IMP_MSATK1_4
  states[921] := MakeState(SPR_IMPX,0,6, S_IMP_MSATK1_6, 0, 0);  // S_IMP_MSATK1_5
  states[922] := MakeState(SPR_IMPX,1,6, S_IMP_MSATK1_3, 0, 0);  // S_IMP_MSATK1_6
  states[923] := MakeState(SPR_IMPX,3,6 {FaceTarget}, S_IMP_MSATK2_2, 0, 0);  // S_IMP_MSATK2_1
  states[924] := MakeState(SPR_IMPX,4,6 {FaceTarget}, S_IMP_MSATK2_3, 0, 0);  // S_IMP_MSATK2_2
  states[925] := MakeState(SPR_IMPX,5,6 {ImpMsAttack2}, S_IMP_FLY1, 0, 0);  // S_IMP_MSATK2_3
  states[926] := MakeState(SPR_IMPX,6,3, S_IMP_PAIN2, 0, 0);  // S_IMP_PAIN1
  states[927] := MakeState(SPR_IMPX,6,3 {Pain}, S_IMP_FLY1, 0, 0);  // S_IMP_PAIN2
  states[928] := MakeState(SPR_IMPX,6,4 {ImpDeath}, S_IMP_DIE2, 0, 0);  // S_IMP_DIE1
  states[929] := MakeState(SPR_IMPX,7,5, S_IMP_DIE2, 0, 0);  // S_IMP_DIE2
  states[930] := MakeState(SPR_IMPX,18,5 {ImpXDeath1}, S_IMP_XDIE2, 0, 0);  // S_IMP_XDIE1
  states[931] := MakeState(SPR_IMPX,19,5, S_IMP_XDIE3, 0, 0);  // S_IMP_XDIE2
  states[932] := MakeState(SPR_IMPX,20,5, S_IMP_XDIE4, 0, 0);  // S_IMP_XDIE3
  states[933] := MakeState(SPR_IMPX,21,5 {ImpXDeath2}, S_IMP_XDIE5, 0, 0);  // S_IMP_XDIE4
  states[934] := MakeState(SPR_IMPX,22,5, S_IMP_XDIE5, 0, 0);  // S_IMP_XDIE5
  states[935] := MakeState(SPR_IMPX,8,7 {ImpExplode}, S_IMP_CRASH2, 0, 0);  // S_IMP_CRASH1
  states[936] := MakeState(SPR_IMPX,9,7 {Scream}, S_IMP_CRASH3, 0, 0);  // S_IMP_CRASH2
  states[937] := MakeState(SPR_IMPX,10,7, S_IMP_CRASH4, 0, 0);  // S_IMP_CRASH3
  states[938] := MakeState(SPR_IMPX,11,-1, S_NULL, 0, 0);  // S_IMP_CRASH4
  states[939] := MakeState(SPR_IMPX,23,7, S_IMP_XCRASH2, 0, 0);  // S_IMP_XCRASH1
  states[940] := MakeState(SPR_IMPX,24,7, S_IMP_XCRASH3, 0, 0);  // S_IMP_XCRASH2
  states[941] := MakeState(SPR_IMPX,25,-1, S_NULL, 0, 0);  // S_IMP_XCRASH3
  states[942] := MakeState(SPR_IMPX,12,5, S_IMP_CHUNKA2, 0, 0);  // S_IMP_CHUNKA1
  states[943] := MakeState(SPR_IMPX,13,700, S_IMP_CHUNKA3, 0, 0);  // S_IMP_CHUNKA2
  states[944] := MakeState(SPR_IMPX,14,700, S_NULL, 0, 0);  // S_IMP_CHUNKA3
  states[945] := MakeState(SPR_IMPX,15,5, S_IMP_CHUNKB2, 0, 0);  // S_IMP_CHUNKB1
  states[946] := MakeState(SPR_IMPX,16,700, S_IMP_CHUNKB3, 0, 0);  // S_IMP_CHUNKB2
  states[947] := MakeState(SPR_IMPX,17,700, S_NULL, 0, 0);  // S_IMP_CHUNKB3
  states[948] := MakeState(SPR_FX10,32768,6, S_IMPFX2, 0, 0);  // S_IMPFX1
  states[949] := MakeState(SPR_FX10,32769,6, S_IMPFX3, 0, 0);  // S_IMPFX2
  states[950] := MakeState(SPR_FX10,32770,6, S_IMPFX1, 0, 0);  // S_IMPFX3
  states[951] := MakeState(SPR_FX10,32771,5, S_IMPFXI2, 0, 0);  // S_IMPFXI1
  states[952] := MakeState(SPR_FX10,32772,5, S_IMPFXI3, 0, 0);  // S_IMPFXI2
  states[953] := MakeState(SPR_FX10,32773,5, S_IMPFXI4, 0, 0);  // S_IMPFXI3
  states[954] := MakeState(SPR_FX10,32774,5, S_NULL, 0, 0);  // S_IMPFXI4
  states[955] := MakeState(SPR_KNIG,0,10 {Look}, S_KNIGHT_STND2, 0, 0);  // S_KNIGHT_STND1
  states[956] := MakeState(SPR_KNIG,1,10 {Look}, S_KNIGHT_STND1, 0, 0);  // S_KNIGHT_STND2
  states[957] := MakeState(SPR_KNIG,0,4 {Chase}, S_KNIGHT_WALK2, 0, 0);  // S_KNIGHT_WALK1
  states[958] := MakeState(SPR_KNIG,1,4 {Chase}, S_KNIGHT_WALK3, 0, 0);  // S_KNIGHT_WALK2
  states[959] := MakeState(SPR_KNIG,2,4 {Chase}, S_KNIGHT_WALK4, 0, 0);  // S_KNIGHT_WALK3
  states[960] := MakeState(SPR_KNIG,3,4 {Chase}, S_KNIGHT_WALK1, 0, 0);  // S_KNIGHT_WALK4
  states[961] := MakeState(SPR_KNIG,4,10 {FaceTarget}, S_KNIGHT_ATK2, 0, 0);  // S_KNIGHT_ATK1
  states[962] := MakeState(SPR_KNIG,5,8 {FaceTarget}, S_KNIGHT_ATK3, 0, 0);  // S_KNIGHT_ATK2
  states[963] := MakeState(SPR_KNIG,6,8 {KnightAttack}, S_KNIGHT_ATK4, 0, 0);  // S_KNIGHT_ATK3
  states[964] := MakeState(SPR_KNIG,4,10 {FaceTarget}, S_KNIGHT_ATK5, 0, 0);  // S_KNIGHT_ATK4
  states[965] := MakeState(SPR_KNIG,5,8 {FaceTarget}, S_KNIGHT_ATK6, 0, 0);  // S_KNIGHT_ATK5
  states[966] := MakeState(SPR_KNIG,6,8 {KnightAttack}, S_KNIGHT_WALK1, 0, 0);  // S_KNIGHT_ATK6
  states[967] := MakeState(SPR_KNIG,7,3, S_KNIGHT_PAIN2, 0, 0);  // S_KNIGHT_PAIN1
  states[968] := MakeState(SPR_KNIG,7,3 {Pain}, S_KNIGHT_WALK1, 0, 0);  // S_KNIGHT_PAIN2
  states[969] := MakeState(SPR_KNIG,8,6, S_KNIGHT_DIE2, 0, 0);  // S_KNIGHT_DIE1
  states[970] := MakeState(SPR_KNIG,9,6 {Scream}, S_KNIGHT_DIE3, 0, 0);  // S_KNIGHT_DIE2
  states[971] := MakeState(SPR_KNIG,10,6, S_KNIGHT_DIE4, 0, 0);  // S_KNIGHT_DIE3
  states[972] := MakeState(SPR_KNIG,11,6 {NoBlocking}, S_KNIGHT_DIE5, 0, 0);  // S_KNIGHT_DIE4
  states[973] := MakeState(SPR_KNIG,12,6, S_KNIGHT_DIE6, 0, 0);  // S_KNIGHT_DIE5
  states[974] := MakeState(SPR_KNIG,13,6, S_KNIGHT_DIE7, 0, 0);  // S_KNIGHT_DIE6
  states[975] := MakeState(SPR_KNIG,14,-1, S_NULL, 0, 0);  // S_KNIGHT_DIE7
  states[976] := MakeState(SPR_SPAX,32768,3 {ContMobjSound}, S_SPINAXE2, 0, 0);  // S_SPINAXE1
  states[977] := MakeState(SPR_SPAX,32769,3, S_SPINAXE3, 0, 0);  // S_SPINAXE2
  states[978] := MakeState(SPR_SPAX,32770,3, S_SPINAXE1, 0, 0);  // S_SPINAXE3
  states[979] := MakeState(SPR_SPAX,32771,6, S_SPINAXEX2, 0, 0);  // S_SPINAXEX1
  states[980] := MakeState(SPR_SPAX,32772,6, S_SPINAXEX3, 0, 0);  // S_SPINAXEX2
  states[981] := MakeState(SPR_SPAX,32773,6, S_NULL, 0, 0);  // S_SPINAXEX3
  states[982] := MakeState(SPR_RAXE,32768,5 {DripBlood}, S_REDAXE2, 0, 0);  // S_REDAXE1
  states[983] := MakeState(SPR_RAXE,32769,5 {DripBlood}, S_REDAXE1, 0, 0);  // S_REDAXE2
  states[984] := MakeState(SPR_RAXE,32770,6, S_REDAXEX2, 0, 0);  // S_REDAXEX1
  states[985] := MakeState(SPR_RAXE,32771,6, S_REDAXEX3, 0, 0);  // S_REDAXEX2
  states[986] := MakeState(SPR_RAXE,32772,6, S_NULL, 0, 0);  // S_REDAXEX3
  states[987] := MakeState(SPR_SRCR,0,10 {Look}, S_SRCR1_LOOK2, 0, 0);  // S_SRCR1_LOOK1
  states[988] := MakeState(SPR_SRCR,1,10 {Look}, S_SRCR1_LOOK1, 0, 0);  // S_SRCR1_LOOK2
  states[989] := MakeState(SPR_SRCR,0,5 {Sor1Chase}, S_SRCR1_WALK2, 0, 0);  // S_SRCR1_WALK1
  states[990] := MakeState(SPR_SRCR,1,5 {Sor1Chase}, S_SRCR1_WALK3, 0, 0);  // S_SRCR1_WALK2
  states[991] := MakeState(SPR_SRCR,2,5 {Sor1Chase}, S_SRCR1_WALK4, 0, 0);  // S_SRCR1_WALK3
  states[992] := MakeState(SPR_SRCR,3,5 {Sor1Chase}, S_SRCR1_WALK1, 0, 0);  // S_SRCR1_WALK4
  states[993] := MakeState(SPR_SRCR,16,6 {Sor1Pain}, S_SRCR1_WALK1, 0, 0);  // S_SRCR1_PAIN1
  states[994] := MakeState(SPR_SRCR,16,7 {FaceTarget}, S_SRCR1_ATK2, 0, 0);  // S_SRCR1_ATK1
  states[995] := MakeState(SPR_SRCR,17,6 {FaceTarget}, S_SRCR1_ATK3, 0, 0);  // S_SRCR1_ATK2
  states[996] := MakeState(SPR_SRCR,18,10 {Srcr1Attack}, S_SRCR1_WALK1, 0, 0);  // S_SRCR1_ATK3
  states[997] := MakeState(SPR_SRCR,18,10 {FaceTarget}, S_SRCR1_ATK5, 0, 0);  // S_SRCR1_ATK4
  states[998] := MakeState(SPR_SRCR,16,7 {FaceTarget}, S_SRCR1_ATK6, 0, 0);  // S_SRCR1_ATK5
  states[999] := MakeState(SPR_SRCR,17,6 {FaceTarget}, S_SRCR1_ATK7, 0, 0);  // S_SRCR1_ATK6
  states[1000] := MakeState(SPR_SRCR,18,10 {Srcr1Attack}, S_SRCR1_WALK1, 0, 0);  // S_SRCR1_ATK7
  states[1001] := MakeState(SPR_SRCR,4,7, S_SRCR1_DIE2, 0, 0);  // S_SRCR1_DIE1
  states[1002] := MakeState(SPR_SRCR,5,7 {Scream}, S_SRCR1_DIE3, 0, 0);  // S_SRCR1_DIE2
  states[1003] := MakeState(SPR_SRCR,6,7, S_SRCR1_DIE4, 0, 0);  // S_SRCR1_DIE3
  states[1004] := MakeState(SPR_SRCR,7,6, S_SRCR1_DIE5, 0, 0);  // S_SRCR1_DIE4
  states[1005] := MakeState(SPR_SRCR,8,6, S_SRCR1_DIE6, 0, 0);  // S_SRCR1_DIE5
  states[1006] := MakeState(SPR_SRCR,9,6, S_SRCR1_DIE7, 0, 0);  // S_SRCR1_DIE6
  states[1007] := MakeState(SPR_SRCR,10,6, S_SRCR1_DIE8, 0, 0);  // S_SRCR1_DIE7
  states[1008] := MakeState(SPR_SRCR,11,25 {SorZap}, S_SRCR1_DIE9, 0, 0);  // S_SRCR1_DIE8
  states[1009] := MakeState(SPR_SRCR,12,5, S_SRCR1_DIE10, 0, 0);  // S_SRCR1_DIE9
  states[1010] := MakeState(SPR_SRCR,13,5, S_SRCR1_DIE11, 0, 0);  // S_SRCR1_DIE10
  states[1011] := MakeState(SPR_SRCR,14,4, S_SRCR1_DIE12, 0, 0);  // S_SRCR1_DIE11
  states[1012] := MakeState(SPR_SRCR,11,20 {SorZap}, S_SRCR1_DIE13, 0, 0);  // S_SRCR1_DIE12
  states[1013] := MakeState(SPR_SRCR,12,5, S_SRCR1_DIE14, 0, 0);  // S_SRCR1_DIE13
  states[1014] := MakeState(SPR_SRCR,13,5, S_SRCR1_DIE15, 0, 0);  // S_SRCR1_DIE14
  states[1015] := MakeState(SPR_SRCR,14,4, S_SRCR1_DIE16, 0, 0);  // S_SRCR1_DIE15
  states[1016] := MakeState(SPR_SRCR,11,12, S_SRCR1_DIE17, 0, 0);  // S_SRCR1_DIE16
  states[1017] := MakeState(SPR_SRCR,15,-1 {SorcererRise}, S_NULL, 0, 0);  // S_SRCR1_DIE17
  states[1018] := MakeState(SPR_FX14,32768,6, S_SRCRFX1_2, 0, 0);  // S_SRCRFX1_1
  states[1019] := MakeState(SPR_FX14,32769,6, S_SRCRFX1_3, 0, 0);  // S_SRCRFX1_2
  states[1020] := MakeState(SPR_FX14,32770,6, S_SRCRFX1_1, 0, 0);  // S_SRCRFX1_3
  states[1021] := MakeState(SPR_FX14,32771,5, S_SRCRFXI1_2, 0, 0);  // S_SRCRFXI1_1
  states[1022] := MakeState(SPR_FX14,32772,5, S_SRCRFXI1_3, 0, 0);  // S_SRCRFXI1_2
  states[1023] := MakeState(SPR_FX14,32773,5, S_SRCRFXI1_4, 0, 0);  // S_SRCRFXI1_3
  states[1024] := MakeState(SPR_FX14,32774,5, S_SRCRFXI1_5, 0, 0);  // S_SRCRFXI1_4
  states[1025] := MakeState(SPR_FX14,32775,5, S_NULL, 0, 0);  // S_SRCRFXI1_5
  states[1026] := MakeState(SPR_SOR2,0,4, S_SOR2_RISE2, 0, 0);  // S_SOR2_RISE1
  states[1027] := MakeState(SPR_SOR2,1,4, S_SOR2_RISE3, 0, 0);  // S_SOR2_RISE2
  states[1028] := MakeState(SPR_SOR2,2,4 {SorRise}, S_SOR2_RISE4, 0, 0);  // S_SOR2_RISE3
  states[1029] := MakeState(SPR_SOR2,3,4, S_SOR2_RISE5, 0, 0);  // S_SOR2_RISE4
  states[1030] := MakeState(SPR_SOR2,4,4, S_SOR2_RISE6, 0, 0);  // S_SOR2_RISE5
  states[1031] := MakeState(SPR_SOR2,5,4, S_SOR2_RISE7, 0, 0);  // S_SOR2_RISE6
  states[1032] := MakeState(SPR_SOR2,6,12 {SorSightSnd}, S_SOR2_WALK1, 0, 0);  // S_SOR2_RISE7
  states[1033] := MakeState(SPR_SOR2,12,10 {Look}, S_SOR2_LOOK2, 0, 0);  // S_SOR2_LOOK1
  states[1034] := MakeState(SPR_SOR2,13,10 {Look}, S_SOR2_LOOK1, 0, 0);  // S_SOR2_LOOK2
  states[1035] := MakeState(SPR_SOR2,12,4 {Chase}, S_SOR2_WALK2, 0, 0);  // S_SOR2_WALK1
  states[1036] := MakeState(SPR_SOR2,13,4 {Chase}, S_SOR2_WALK3, 0, 0);  // S_SOR2_WALK2
  states[1037] := MakeState(SPR_SOR2,14,4 {Chase}, S_SOR2_WALK4, 0, 0);  // S_SOR2_WALK3
  states[1038] := MakeState(SPR_SOR2,15,4 {Chase}, S_SOR2_WALK1, 0, 0);  // S_SOR2_WALK4
  states[1039] := MakeState(SPR_SOR2,16,3, S_SOR2_PAIN2, 0, 0);  // S_SOR2_PAIN1
  states[1040] := MakeState(SPR_SOR2,16,6 {Pain}, S_SOR2_WALK1, 0, 0);  // S_SOR2_PAIN2
  states[1041] := MakeState(SPR_SOR2,17,9 {Srcr2Decide}, S_SOR2_ATK2, 0, 0);  // S_SOR2_ATK1
  states[1042] := MakeState(SPR_SOR2,18,9 {FaceTarget}, S_SOR2_ATK3, 0, 0);  // S_SOR2_ATK2
  states[1043] := MakeState(SPR_SOR2,19,20 {Srcr2Attack}, S_SOR2_WALK1, 0, 0);  // S_SOR2_ATK3
  states[1044] := MakeState(SPR_SOR2,11,6, S_SOR2_TELE2, 0, 0);  // S_SOR2_TELE1
  states[1045] := MakeState(SPR_SOR2,10,6, S_SOR2_TELE3, 0, 0);  // S_SOR2_TELE2
  states[1046] := MakeState(SPR_SOR2,9,6, S_SOR2_TELE4, 0, 0);  // S_SOR2_TELE3
  states[1047] := MakeState(SPR_SOR2,8,6, S_SOR2_TELE5, 0, 0);  // S_SOR2_TELE4
  states[1048] := MakeState(SPR_SOR2,7,6, S_SOR2_TELE6, 0, 0);  // S_SOR2_TELE5
  states[1049] := MakeState(SPR_SOR2,6,6, S_SOR2_WALK1, 0, 0);  // S_SOR2_TELE6
  states[1050] := MakeState(SPR_SDTH,0,8 {Sor2DthInit}, S_SOR2_DIE2, 0, 0);  // S_SOR2_DIE1
  states[1051] := MakeState(SPR_SDTH,1,8, S_SOR2_DIE3, 0, 0);  // S_SOR2_DIE2
  states[1052] := MakeState(SPR_SDTH,2,8 {SorDSph}, S_SOR2_DIE4, 0, 0);  // S_SOR2_DIE3
  states[1053] := MakeState(SPR_SDTH,3,7, S_SOR2_DIE5, 0, 0);  // S_SOR2_DIE4
  states[1054] := MakeState(SPR_SDTH,4,7, S_SOR2_DIE6, 0, 0);  // S_SOR2_DIE5
  states[1055] := MakeState(SPR_SDTH,5,7 {Sor2DthLoop}, S_SOR2_DIE7, 0, 0);  // S_SOR2_DIE6
  states[1056] := MakeState(SPR_SDTH,6,6 {SorDExp}, S_SOR2_DIE8, 0, 0);  // S_SOR2_DIE7
  states[1057] := MakeState(SPR_SDTH,7,6, S_SOR2_DIE9, 0, 0);  // S_SOR2_DIE8
  states[1058] := MakeState(SPR_SDTH,8,18, S_SOR2_DIE10, 0, 0);  // S_SOR2_DIE9
  states[1059] := MakeState(SPR_SDTH,9,6 {NoBlocking}, S_SOR2_DIE11, 0, 0);  // S_SOR2_DIE10
  states[1060] := MakeState(SPR_SDTH,10,6 {SorDBon}, S_SOR2_DIE12, 0, 0);  // S_SOR2_DIE11
  states[1061] := MakeState(SPR_SDTH,11,6, S_SOR2_DIE13, 0, 0);  // S_SOR2_DIE12
  states[1062] := MakeState(SPR_SDTH,12,6, S_SOR2_DIE14, 0, 0);  // S_SOR2_DIE13
  states[1063] := MakeState(SPR_SDTH,13,6, S_SOR2_DIE15, 0, 0);  // S_SOR2_DIE14
  states[1064] := MakeState(SPR_SDTH,14,-1 {BossDeath}, S_NULL, 0, 0);  // S_SOR2_DIE15
  states[1065] := MakeState(SPR_FX16,32768,3 {BlueSpark}, S_SOR2FX1_2, 0, 0);  // S_SOR2FX1_1
  states[1066] := MakeState(SPR_FX16,32769,3 {BlueSpark}, S_SOR2FX1_3, 0, 0);  // S_SOR2FX1_2
  states[1067] := MakeState(SPR_FX16,32770,3 {BlueSpark}, S_SOR2FX1_1, 0, 0);  // S_SOR2FX1_3
  states[1068] := MakeState(SPR_FX16,32774,5 {Explode}, S_SOR2FXI1_2, 0, 0);  // S_SOR2FXI1_1
  states[1069] := MakeState(SPR_FX16,32775,5, S_SOR2FXI1_3, 0, 0);  // S_SOR2FXI1_2
  states[1070] := MakeState(SPR_FX16,32776,5, S_SOR2FXI1_4, 0, 0);  // S_SOR2FXI1_3
  states[1071] := MakeState(SPR_FX16,32777,5, S_SOR2FXI1_5, 0, 0);  // S_SOR2FXI1_4
  states[1072] := MakeState(SPR_FX16,32778,5, S_SOR2FXI1_6, 0, 0);  // S_SOR2FXI1_5
  states[1073] := MakeState(SPR_FX16,32779,5, S_NULL, 0, 0);  // S_SOR2FXI1_6
  states[1074] := MakeState(SPR_FX16,32771,12, S_SOR2FXSPARK2, 0, 0);  // S_SOR2FXSPARK1
  states[1075] := MakeState(SPR_FX16,32772,12, S_SOR2FXSPARK3, 0, 0);  // S_SOR2FXSPARK2
  states[1076] := MakeState(SPR_FX16,32773,12, S_NULL, 0, 0);  // S_SOR2FXSPARK3
  states[1077] := MakeState(SPR_FX11,32768,35, S_SOR2FX2_2, 0, 0);  // S_SOR2FX2_1
  states[1078] := MakeState(SPR_FX11,32768,5 {GenWizard}, S_SOR2FX2_3, 0, 0);  // S_SOR2FX2_2
  states[1079] := MakeState(SPR_FX11,32769,5, S_SOR2FX2_2, 0, 0);  // S_SOR2FX2_3
  states[1080] := MakeState(SPR_FX11,32770,5, S_SOR2FXI2_2, 0, 0);  // S_SOR2FXI2_1
  states[1081] := MakeState(SPR_FX11,32771,5, S_SOR2FXI2_3, 0, 0);  // S_SOR2FXI2_2
  states[1082] := MakeState(SPR_FX11,32772,5, S_SOR2FXI2_4, 0, 0);  // S_SOR2FXI2_3
  states[1083] := MakeState(SPR_FX11,32773,5, S_SOR2FXI2_5, 0, 0);  // S_SOR2FXI2_4
  states[1084] := MakeState(SPR_FX11,32774,5, S_NULL, 0, 0);  // S_SOR2FXI2_5
  states[1085] := MakeState(SPR_SOR2,6,8, S_SOR2TELEFADE2, 0, 0);  // S_SOR2TELEFADE1
  states[1086] := MakeState(SPR_SOR2,7,6, S_SOR2TELEFADE3, 0, 0);  // S_SOR2TELEFADE2
  states[1087] := MakeState(SPR_SOR2,8,6, S_SOR2TELEFADE4, 0, 0);  // S_SOR2TELEFADE3
  states[1088] := MakeState(SPR_SOR2,9,6, S_SOR2TELEFADE5, 0, 0);  // S_SOR2TELEFADE4
  states[1089] := MakeState(SPR_SOR2,10,6, S_SOR2TELEFADE6, 0, 0);  // S_SOR2TELEFADE5
  states[1090] := MakeState(SPR_SOR2,11,6, S_NULL, 0, 0);  // S_SOR2TELEFADE6
  states[1091] := MakeState(SPR_MNTR,0,10 {Look}, S_MNTR_LOOK2, 0, 0);  // S_MNTR_LOOK1
  states[1092] := MakeState(SPR_MNTR,1,10 {Look}, S_MNTR_LOOK1, 0, 0);  // S_MNTR_LOOK2
  states[1093] := MakeState(SPR_MNTR,0,5 {Chase}, S_MNTR_WALK2, 0, 0);  // S_MNTR_WALK1
  states[1094] := MakeState(SPR_MNTR,1,5 {Chase}, S_MNTR_WALK3, 0, 0);  // S_MNTR_WALK2
  states[1095] := MakeState(SPR_MNTR,2,5 {Chase}, S_MNTR_WALK4, 0, 0);  // S_MNTR_WALK3
  states[1096] := MakeState(SPR_MNTR,3,5 {Chase}, S_MNTR_WALK1, 0, 0);  // S_MNTR_WALK4
  states[1097] := MakeState(SPR_MNTR,21,10 {FaceTarget}, S_MNTR_ATK1_2, 0, 0);  // S_MNTR_ATK1_1
  states[1098] := MakeState(SPR_MNTR,22,7 {FaceTarget}, S_MNTR_ATK1_3, 0, 0);  // S_MNTR_ATK1_2
  states[1099] := MakeState(SPR_MNTR,23,12 {MinotaurAtk1}, S_MNTR_WALK1, 0, 0);  // S_MNTR_ATK1_3
  states[1100] := MakeState(SPR_MNTR,21,10 {MinotaurDecide}, S_MNTR_ATK2_2, 0, 0);  // S_MNTR_ATK2_1
  states[1101] := MakeState(SPR_MNTR,24,4 {FaceTarget}, S_MNTR_ATK2_3, 0, 0);  // S_MNTR_ATK2_2
  states[1102] := MakeState(SPR_MNTR,25,9 {MinotaurAtk2}, S_MNTR_WALK1, 0, 0);  // S_MNTR_ATK2_3
  states[1103] := MakeState(SPR_MNTR,21,10 {FaceTarget}, S_MNTR_ATK3_2, 0, 0);  // S_MNTR_ATK3_1
  states[1104] := MakeState(SPR_MNTR,22,7 {FaceTarget}, S_MNTR_ATK3_3, 0, 0);  // S_MNTR_ATK3_2
  states[1105] := MakeState(SPR_MNTR,23,12 {MinotaurAtk3}, S_MNTR_WALK1, 0, 0);  // S_MNTR_ATK3_3
  states[1106] := MakeState(SPR_MNTR,23,12, S_MNTR_ATK3_1, 0, 0);  // S_MNTR_ATK3_4
  states[1107] := MakeState(SPR_MNTR,20,2 {MinotaurCharge}, S_MNTR_ATK4_1, 0, 0);  // S_MNTR_ATK4_1
  states[1108] := MakeState(SPR_MNTR,4,3, S_MNTR_PAIN2, 0, 0);  // S_MNTR_PAIN1
  states[1109] := MakeState(SPR_MNTR,4,6 {Pain}, S_MNTR_WALK1, 0, 0);  // S_MNTR_PAIN2
  states[1110] := MakeState(SPR_MNTR,5,6, S_MNTR_DIE2, 0, 0);  // S_MNTR_DIE1
  states[1111] := MakeState(SPR_MNTR,6,5, S_MNTR_DIE3, 0, 0);  // S_MNTR_DIE2
  states[1112] := MakeState(SPR_MNTR,7,6 {Scream}, S_MNTR_DIE4, 0, 0);  // S_MNTR_DIE3
  states[1113] := MakeState(SPR_MNTR,8,5, S_MNTR_DIE5, 0, 0);  // S_MNTR_DIE4
  states[1114] := MakeState(SPR_MNTR,9,6, S_MNTR_DIE6, 0, 0);  // S_MNTR_DIE5
  states[1115] := MakeState(SPR_MNTR,10,5, S_MNTR_DIE7, 0, 0);  // S_MNTR_DIE6
  states[1116] := MakeState(SPR_MNTR,11,6, S_MNTR_DIE8, 0, 0);  // S_MNTR_DIE7
  states[1117] := MakeState(SPR_MNTR,12,5 {NoBlocking}, S_MNTR_DIE9, 0, 0);  // S_MNTR_DIE8
  states[1118] := MakeState(SPR_MNTR,13,6, S_MNTR_DIE10, 0, 0);  // S_MNTR_DIE9
  states[1119] := MakeState(SPR_MNTR,14,5, S_MNTR_DIE11, 0, 0);  // S_MNTR_DIE10
  states[1120] := MakeState(SPR_MNTR,15,6, S_MNTR_DIE12, 0, 0);  // S_MNTR_DIE11
  states[1121] := MakeState(SPR_MNTR,16,5, S_MNTR_DIE13, 0, 0);  // S_MNTR_DIE12
  states[1122] := MakeState(SPR_MNTR,17,6, S_MNTR_DIE14, 0, 0);  // S_MNTR_DIE13
  states[1123] := MakeState(SPR_MNTR,18,5, S_MNTR_DIE15, 0, 0);  // S_MNTR_DIE14
  states[1124] := MakeState(SPR_MNTR,19,-1 {BossDeath}, S_NULL, 0, 0);  // S_MNTR_DIE15
  states[1125] := MakeState(SPR_FX12,32768,6, S_MNTRFX1_2, 0, 0);  // S_MNTRFX1_1
  states[1126] := MakeState(SPR_FX12,32769,6, S_MNTRFX1_1, 0, 0);  // S_MNTRFX1_2
  states[1127] := MakeState(SPR_FX12,32770,5, S_MNTRFXI1_2, 0, 0);  // S_MNTRFXI1_1
  states[1128] := MakeState(SPR_FX12,32771,5, S_MNTRFXI1_3, 0, 0);  // S_MNTRFXI1_2
  states[1129] := MakeState(SPR_FX12,32772,5, S_MNTRFXI1_4, 0, 0);  // S_MNTRFXI1_3
  states[1130] := MakeState(SPR_FX12,32773,5, S_MNTRFXI1_5, 0, 0);  // S_MNTRFXI1_4
  states[1131] := MakeState(SPR_FX12,32774,5, S_MNTRFXI1_6, 0, 0);  // S_MNTRFXI1_5
  states[1132] := MakeState(SPR_FX12,32775,5, S_NULL, 0, 0);  // S_MNTRFXI1_6
  states[1133] := MakeState(SPR_FX13,0,2 {MntrFloorFire}, S_MNTRFX2_1, 0, 0);  // S_MNTRFX2_1
  states[1134] := MakeState(SPR_FX13,32776,4 {Explode}, S_MNTRFXI2_2, 0, 0);  // S_MNTRFXI2_1
  states[1135] := MakeState(SPR_FX13,32777,4, S_MNTRFXI2_3, 0, 0);  // S_MNTRFXI2_2
  states[1136] := MakeState(SPR_FX13,32778,4, S_MNTRFXI2_4, 0, 0);  // S_MNTRFXI2_3
  states[1137] := MakeState(SPR_FX13,32779,4, S_MNTRFXI2_5, 0, 0);  // S_MNTRFXI2_4
  states[1138] := MakeState(SPR_FX13,32780,4, S_NULL, 0, 0);  // S_MNTRFXI2_5
  states[1139] := MakeState(SPR_FX13,32771,4, S_MNTRFX3_2, 0, 0);  // S_MNTRFX3_1
  states[1140] := MakeState(SPR_FX13,32770,4, S_MNTRFX3_3, 0, 0);  // S_MNTRFX3_2
  states[1141] := MakeState(SPR_FX13,32769,5, S_MNTRFX3_4, 0, 0);  // S_MNTRFX3_3
  states[1142] := MakeState(SPR_FX13,32770,5, S_MNTRFX3_5, 0, 0);  // S_MNTRFX3_4
  states[1143] := MakeState(SPR_FX13,32771,5, S_MNTRFX3_6, 0, 0);  // S_MNTRFX3_5
  states[1144] := MakeState(SPR_FX13,32772,5, S_MNTRFX3_7, 0, 0);  // S_MNTRFX3_6
  states[1145] := MakeState(SPR_FX13,32773,4, S_MNTRFX3_8, 0, 0);  // S_MNTRFX3_7
  states[1146] := MakeState(SPR_FX13,32774,4, S_MNTRFX3_9, 0, 0);  // S_MNTRFX3_8
  states[1147] := MakeState(SPR_FX13,32775,4, S_NULL, 0, 0);  // S_MNTRFX3_9
  states[1148] := MakeState(SPR_AKYY,32768,3, S_AKYY2, 0, 0);  // S_AKYY1
  states[1149] := MakeState(SPR_AKYY,32769,3, S_AKYY3, 0, 0);  // S_AKYY2
  states[1150] := MakeState(SPR_AKYY,32770,3, S_AKYY4, 0, 0);  // S_AKYY3
  states[1151] := MakeState(SPR_AKYY,32771,3, S_AKYY5, 0, 0);  // S_AKYY4
  states[1152] := MakeState(SPR_AKYY,32772,3, S_AKYY6, 0, 0);  // S_AKYY5
  states[1153] := MakeState(SPR_AKYY,32773,3, S_AKYY7, 0, 0);  // S_AKYY6
  states[1154] := MakeState(SPR_AKYY,32774,3, S_AKYY8, 0, 0);  // S_AKYY7
  states[1155] := MakeState(SPR_AKYY,32775,3, S_AKYY9, 0, 0);  // S_AKYY8
  states[1156] := MakeState(SPR_AKYY,32776,3, S_AKYY10, 0, 0);  // S_AKYY9
  states[1157] := MakeState(SPR_AKYY,32777,3, S_AKYY1, 0, 0);  // S_AKYY10
  states[1158] := MakeState(SPR_BKYY,32768,3, S_BKYY2, 0, 0);  // S_BKYY1
  states[1159] := MakeState(SPR_BKYY,32769,3, S_BKYY3, 0, 0);  // S_BKYY2
  states[1160] := MakeState(SPR_BKYY,32770,3, S_BKYY4, 0, 0);  // S_BKYY3
  states[1161] := MakeState(SPR_BKYY,32771,3, S_BKYY5, 0, 0);  // S_BKYY4
  states[1162] := MakeState(SPR_BKYY,32772,3, S_BKYY6, 0, 0);  // S_BKYY5
  states[1163] := MakeState(SPR_BKYY,32773,3, S_BKYY7, 0, 0);  // S_BKYY6
  states[1164] := MakeState(SPR_BKYY,32774,3, S_BKYY8, 0, 0);  // S_BKYY7
  states[1165] := MakeState(SPR_BKYY,32775,3, S_BKYY9, 0, 0);  // S_BKYY8
  states[1166] := MakeState(SPR_BKYY,32776,3, S_BKYY10, 0, 0);  // S_BKYY9
  states[1167] := MakeState(SPR_BKYY,32777,3, S_BKYY1, 0, 0);  // S_BKYY10
  states[1168] := MakeState(SPR_CKYY,32768,3, S_CKYY2, 0, 0);  // S_CKYY1
  states[1169] := MakeState(SPR_CKYY,32769,3, S_CKYY3, 0, 0);  // S_CKYY2
  states[1170] := MakeState(SPR_CKYY,32770,3, S_CKYY4, 0, 0);  // S_CKYY3
  states[1171] := MakeState(SPR_CKYY,32771,3, S_CKYY5, 0, 0);  // S_CKYY4
  states[1172] := MakeState(SPR_CKYY,32772,3, S_CKYY6, 0, 0);  // S_CKYY5
  states[1173] := MakeState(SPR_CKYY,32773,3, S_CKYY7, 0, 0);  // S_CKYY6
  states[1174] := MakeState(SPR_CKYY,32774,3, S_CKYY8, 0, 0);  // S_CKYY7
  states[1175] := MakeState(SPR_CKYY,32775,3, S_CKYY9, 0, 0);  // S_CKYY8
  states[1176] := MakeState(SPR_CKYY,32776,3, S_CKYY1, 0, 0);  // S_CKYY9
  states[1177] := MakeState(SPR_AMG1,0,-1, S_NULL, 0, 0);  // S_AMG1
  states[1178] := MakeState(SPR_AMG2,0,4, S_AMG2_2, 0, 0);  // S_AMG2_1
  states[1179] := MakeState(SPR_AMG2,1,4, S_AMG2_3, 0, 0);  // S_AMG2_2
  states[1180] := MakeState(SPR_AMG2,2,4, S_AMG2_1, 0, 0);  // S_AMG2_3
  states[1181] := MakeState(SPR_AMM1,0,-1, S_NULL, 0, 0);  // S_AMM1
  states[1182] := MakeState(SPR_AMM2,0,-1, S_NULL, 0, 0);  // S_AMM2
  states[1183] := MakeState(SPR_AMC1,0,-1, S_NULL, 0, 0);  // S_AMC1
  states[1184] := MakeState(SPR_AMC2,0,5, S_AMC2_2, 0, 0);  // S_AMC2_1
  states[1185] := MakeState(SPR_AMC2,1,5, S_AMC2_3, 0, 0);  // S_AMC2_2
  states[1186] := MakeState(SPR_AMC2,2,5, S_AMC2_1, 0, 0);  // S_AMC2_3
  states[1187] := MakeState(SPR_AMS1,0,5, S_AMS1_2, 0, 0);  // S_AMS1_1
  states[1188] := MakeState(SPR_AMS1,1,5, S_AMS1_1, 0, 0);  // S_AMS1_2
  states[1189] := MakeState(SPR_AMS2,0,5, S_AMS2_2, 0, 0);  // S_AMS2_1
  states[1190] := MakeState(SPR_AMS2,1,5, S_AMS2_1, 0, 0);  // S_AMS2_2
  states[1191] := MakeState(SPR_AMP1,0,4, S_AMP1_2, 0, 0);  // S_AMP1_1
  states[1192] := MakeState(SPR_AMP1,1,4, S_AMP1_3, 0, 0);  // S_AMP1_2
  states[1193] := MakeState(SPR_AMP1,2,4, S_AMP1_1, 0, 0);  // S_AMP1_3
  states[1194] := MakeState(SPR_AMP2,0,4, S_AMP2_2, 0, 0);  // S_AMP2_1
  states[1195] := MakeState(SPR_AMP2,1,4, S_AMP2_3, 0, 0);  // S_AMP2_2
  states[1196] := MakeState(SPR_AMP2,2,4, S_AMP2_1, 0, 0);  // S_AMP2_3
  states[1197] := MakeState(SPR_AMB1,0,4, S_AMB1_2, 0, 0);  // S_AMB1_1
  states[1198] := MakeState(SPR_AMB1,1,4, S_AMB1_3, 0, 0);  // S_AMB1_2
  states[1199] := MakeState(SPR_AMB1,2,4, S_AMB1_1, 0, 0);  // S_AMB1_3
  states[1200] := MakeState(SPR_AMB2,0,4, S_AMB2_2, 0, 0);  // S_AMB2_1
  states[1201] := MakeState(SPR_AMB2,1,4, S_AMB2_3, 0, 0);  // S_AMB2_2
  states[1202] := MakeState(SPR_AMB2,2,4, S_AMB2_1, 0, 0);  // S_AMB2_3
  states[1203] := MakeState(SPR_AMG1,0,100 {ESound}, S_SND_WIND, 0, 0);  // S_SND_WIND
  states[1204] := MakeState(SPR_AMG1,0,85 {ESound}, S_SND_WATERFALL, 0, 0);  // S_SND_WATERFALL

  GetMem(mobjinfo, ord(NUMMOBJTYPES) * SizeOf(mobjinfo_t));

  mobjinfo[0] := MakeObjInfo(    // MT_MISC0
    81,  // doomednum
    ord(S_ITEM_PTN1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[1] := MakeObjInfo(    // MT_ITEMSHIELD1
    85,  // doomednum
    ord(S_ITEM_SHLD1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[2] := MakeObjInfo(    // MT_ITEMSHIELD2
    31,  // doomednum
    ord(S_ITEM_SHD2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[3] := MakeObjInfo(    // MT_MISC1
    8,  // doomednum
    ord(S_ITEM_BAGH1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[4] := MakeObjInfo(    // MT_MISC2
    35,  // doomednum
    ord(S_ITEM_SPMP1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[5] := MakeObjInfo(    // MT_ARTIINVISIBILITY
    75,  // doomednum
    ord(S_ARTI_INVS1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_SHADOW|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[6] := MakeObjInfo(    // MT_MISC3
    82,  // doomednum
    ord(S_ARTI_PTN2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[7] := MakeObjInfo(    // MT_ARTIFLY
    83,  // doomednum
    ord(S_ARTI_SOAR1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[8] := MakeObjInfo(    // MT_ARTIINVULNERABILITY
    84,  // doomednum
    ord(S_ARTI_INVU1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[9] := MakeObjInfo(    // MT_ARTITOMEOFPOWER
    86,  // doomednum
    ord(S_ARTI_PWBK1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[10] := MakeObjInfo(    // MT_ARTIEGG
    30,  // doomednum
    ord(S_ARTI_EGGC1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[11] := MakeObjInfo(    // MT_EGGFX
    -1,  // doomednum
    ord(S_EGGFX1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_EGGFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    18,  // speed
    8,  // radius
    8,  // height
    100,  // mass
    1,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[12] := MakeObjInfo(    // MT_ARTISUPERHEAL
    32,  // doomednum
    ord(S_ARTI_SPHL1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[13] := MakeObjInfo(    // MT_MISC4
    33,  // doomednum
    ord(S_ARTI_TRCH1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[14] := MakeObjInfo(    // MT_MISC5
    34,  // doomednum
    ord(S_ARTI_FBMB1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[15] := MakeObjInfo(    // MT_FIREBOMB
    -1,  // doomednum
    ord(S_FIREBOMB1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_phohit},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOGRAVITY|MF_SHADOW,  // flags
    0  // flags2
  );

  mobjinfo[16] := MakeObjInfo(    // MT_ARTITELEPORT
    36,  // doomednum
    ord(S_ARTI_ATLP1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_COUNTITEM,  // flags
    0 //MF2_FLOATBOB  // flags2
  );

  mobjinfo[17] := MakeObjInfo(    // MT_POD
    2035,  // doomednum
    ord(S_POD_WAIT1),  // spawnstate
    45,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_POD_PAIN1),  // painstate
    255,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_POD_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_podexp},  // deathsound
    0,  // speed
    16,  // radius
    54,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID|MF_NOBLOOD|MF_SHOOTABLE|MF_DROPOFF,  // flags
    0 //MF2_WINDTHRUST|MF2_PUSHABLE|MF2_SLIDE|MF2_PASSMOBJ|MF2_TELESTOMP  // flags2
  );

  mobjinfo[18] := MakeObjInfo(    // MT_PODGOO
    -1,  // doomednum
    ord(S_PODGOO1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_PODGOOX),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    2,  // radius
    4,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF,  // flags
    0 //MF2_NOTELEPORT|MF2_LOGRAV|MF2_CANNOTPUSH  // flags2
  );

  mobjinfo[19] := MakeObjInfo(    // MT_PODGENERATOR
    43,  // doomednum
    ord(S_PODGENERATOR),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOSECTOR,  // flags
    0  // flags2
  );

  mobjinfo[20] := MakeObjInfo(    // MT_SPLASH
    -1,  // doomednum
    ord(S_SPLASH1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SPLASHX),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    2,  // radius
    4,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF,  // flags
    0 //MF2_NOTELEPORT|MF2_LOGRAV|MF2_CANNOTPUSH  // flags2
  );

  mobjinfo[21] := MakeObjInfo(    // MT_SPLASHBASE
    -1,  // doomednum
    ord(S_SPLASHBASE1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP,  // flags
    0  // flags2
  );

  mobjinfo[22] := MakeObjInfo(    // MT_LAVASPLASH
    -1,  // doomednum
    ord(S_LAVASPLASH1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP,  // flags
    0  // flags2
  );

  mobjinfo[23] := MakeObjInfo(    // MT_LAVASMOKE
    -1,  // doomednum
    ord(S_LAVASMOKE1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_SHADOW,  // flags
    0  // flags2
  );

  mobjinfo[24] := MakeObjInfo(    // MT_SLUDGECHUNK
    -1,  // doomednum
    ord(S_SLUDGECHUNK1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SLUDGECHUNKX),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    2,  // radius
    4,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF,  // flags
    0 //MF2_NOTELEPORT|MF2_LOGRAV|MF2_CANNOTPUSH  // flags2
  );

  mobjinfo[25] := MakeObjInfo(    // MT_SLUDGESPLASH
    -1,  // doomednum
    ord(S_SLUDGESPLASH1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP,  // flags
    0  // flags2
  );

  mobjinfo[26] := MakeObjInfo(    // MT_SKULLHANG70
    17,  // doomednum
    ord(S_SKULLHANG70_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    70,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[27] := MakeObjInfo(    // MT_SKULLHANG60
    24,  // doomednum
    ord(S_SKULLHANG60_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    60,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[28] := MakeObjInfo(    // MT_SKULLHANG45
    25,  // doomednum
    ord(S_SKULLHANG45_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    45,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[29] := MakeObjInfo(    // MT_SKULLHANG35
    26,  // doomednum
    ord(S_SKULLHANG35_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    35,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[30] := MakeObjInfo(    // MT_CHANDELIER
    28,  // doomednum
    ord(S_CHANDELIER1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    60,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[31] := MakeObjInfo(    // MT_SERPTORCH
    27,  // doomednum
    ord(S_SERPTORCH1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    12,  // radius
    54,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[32] := MakeObjInfo(    // MT_SMALLPILLAR
    29,  // doomednum
    ord(S_SMALLPILLAR),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    34,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[33] := MakeObjInfo(    // MT_STALAGMITESMALL
    37,  // doomednum
    ord(S_STALAGMITESMALL),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    8,  // radius
    32,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[34] := MakeObjInfo(    // MT_STALAGMITELARGE
    38,  // doomednum
    ord(S_STALAGMITELARGE),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    12,  // radius
    64,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[35] := MakeObjInfo(    // MT_STALACTITESMALL
    39,  // doomednum
    ord(S_STALACTITESMALL),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    8,  // radius
    36,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[36] := MakeObjInfo(    // MT_STALACTITELARGE
    40,  // doomednum
    ord(S_STALACTITELARGE),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    12,  // radius
    68,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[37] := MakeObjInfo(    // MT_MISC6
    76,  // doomednum
    ord(S_FIREBRAZIER1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    44,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[38] := MakeObjInfo(    // MT_BARREL
    44,  // doomednum
    ord(S_BARREL),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    12,  // radius
    32,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[39] := MakeObjInfo(    // MT_MISC7
    47,  // doomednum
    ord(S_BRPILLAR),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    14,  // radius
    128,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[40] := MakeObjInfo(    // MT_MISC8
    48,  // doomednum
    ord(S_MOSS1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    23,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[41] := MakeObjInfo(    // MT_MISC9
    49,  // doomednum
    ord(S_MOSS2),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    27,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[42] := MakeObjInfo(    // MT_MISC10
    50,  // doomednum
    ord(S_WALLTORCH1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[43] := MakeObjInfo(    // MT_MISC11
    51,  // doomednum
    ord(S_HANGINGCORPSE),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    8,  // radius
    104,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[44] := MakeObjInfo(    // MT_KEYGIZMOBLUE
    94,  // doomednum
    ord(S_KEYGIZMO1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    50,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[45] := MakeObjInfo(    // MT_KEYGIZMOGREEN
    95,  // doomednum
    ord(S_KEYGIZMO1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    50,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[46] := MakeObjInfo(    // MT_KEYGIZMOYELLOW
    96,  // doomednum
    ord(S_KEYGIZMO1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    50,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[47] := MakeObjInfo(    // MT_KEYGIZMOFLOAT
    -1,  // doomednum
    ord(S_KGZ_START),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[48] := MakeObjInfo(    // MT_MISC12
    87,  // doomednum
    ord(S_VOLCANO1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    12,  // radius
    20,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    0  // flags2
  );

  mobjinfo[49] := MakeObjInfo(    // MT_VOLCANOBLAST
    -1,  // doomednum
    ord(S_VOLCANOBALL1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_VOLCANOBALLX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_volhit},  // deathsound
    2,  // speed
    8,  // radius
    8,  // height
    100,  // mass
    2,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF,  // flags
    0 //MF2_LOGRAV|MF2_NOTELEPORT|MF2_FIREDAMAGE  // flags2
  );

  mobjinfo[50] := MakeObjInfo(    // MT_VOLCANOTBLAST
    -1,  // doomednum
    ord(S_VOLCANOTBALL1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_VOLCANOTBALLX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    2,  // speed
    8,  // radius
    6,  // height
    100,  // mass
    1,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF,  // flags
    0 //MF2_LOGRAV|MF2_NOTELEPORT|MF2_FIREDAMAGE  // flags2
  );

  mobjinfo[51] := MakeObjInfo(    // MT_TELEGLITGEN
    74,  // doomednum
    ord(S_TELEGLITGEN1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_NOSECTOR,  // flags
    0  // flags2
  );

  mobjinfo[52] := MakeObjInfo(    // MT_TELEGLITGEN2
    52,  // doomednum
    ord(S_TELEGLITGEN2),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_NOSECTOR,  // flags
    0  // flags2
  );

  mobjinfo[53] := MakeObjInfo(    // MT_TELEGLITTER
    -1,  // doomednum
    ord(S_TELEGLITTER1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE,  // flags
    0  // flags2
  );

  mobjinfo[54] := MakeObjInfo(    // MT_TELEGLITTER2
    -1,  // doomednum
    ord(S_TELEGLITTER2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE,  // flags
    0  // flags2
  );

  mobjinfo[55] := MakeObjInfo(    // MT_TFOG
    -1,  // doomednum
    ord(S_TFOG1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[56] := MakeObjInfo(    // MT_TELEPORTMAN
    14,  // doomednum
    ord(S_NULL),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOSECTOR,  // flags
    0  // flags2
  );

  mobjinfo[57] := MakeObjInfo(    // MT_STAFFPUFF
    -1,  // doomednum
    ord(S_STAFFPUFF1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_stfhit},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[58] := MakeObjInfo(    // MT_STAFFPUFF2
    -1,  // doomednum
    ord(S_STAFFPUFF2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_stfpow},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[59] := MakeObjInfo(    // MT_BEAKPUFF
    -1,  // doomednum
    ord(S_STAFFPUFF1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_chicatk},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[60] := MakeObjInfo(    // MT_MISC13
    2005,  // doomednum
    ord(S_WGNT),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[61] := MakeObjInfo(    // MT_GAUNTLETPUFF1
    -1,  // doomednum
    ord(S_GAUNTLETPUFF1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_SHADOW,  // flags
    0  // flags2
  );

  mobjinfo[62] := MakeObjInfo(    // MT_GAUNTLETPUFF2
    -1,  // doomednum
    ord(S_GAUNTLETPUFF2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_SHADOW,  // flags
    0  // flags2
  );

  mobjinfo[63] := MakeObjInfo(    // MT_MISC14
    53,  // doomednum
    ord(S_BLSR),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[64] := MakeObjInfo(    // MT_BLASTERFX1
    -1,  // doomednum
    ord(S_BLASTERFX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_BLASTERFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_blshit},  // deathsound
    184,  // speed
    12,  // radius
    8,  // height
    100,  // mass
    2,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[65] := MakeObjInfo(    // MT_BLASTERSMOKE
    -1,  // doomednum
    ord(S_BLASTERSMOKE1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_SHADOW,  // flags
    0 //|MF2_CANNOTPUSH  // flags2
  );

  mobjinfo[66] := MakeObjInfo(    // MT_RIPPER
    -1,  // doomednum
    ord(S_RIPPER1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_RIPPERX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_hrnhit},  // deathsound
    14,  // speed
    8,  // radius
    6,  // height
    100,  // mass
    1,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT|MF2_RIP  // flags2
  );

  mobjinfo[67] := MakeObjInfo(    // MT_BLASTERPUFF1
    -1,  // doomednum
    ord(S_BLASTERPUFF1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[68] := MakeObjInfo(    // MT_BLASTERPUFF2
    -1,  // doomednum
    ord(S_BLASTERPUFF2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[69] := MakeObjInfo(    // MT_WMACE
    2002,  // doomednum
    ord(S_WMCE),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[70] := MakeObjInfo(    // MT_MACEFX1
    -1,  // doomednum
    ord(S_MACEFX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_lobsht},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MACEFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    20,  // speed
    8,  // radius
    6,  // height
    100,  // mass
    2,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_FLOORBOUNCE|MF2_THRUGHOST|MF2_NOTELEPORT  // flags2
  );

  mobjinfo[71] := MakeObjInfo(    // MT_MACEFX2
    -1,  // doomednum
    ord(S_MACEFX2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MACEFXI2_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    10,  // speed
    8,  // radius
    6,  // height
    100,  // mass
    6,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF,  // flags
    0 //MF2_LOGRAV|MF2_FLOORBOUNCE|MF2_THRUGHOST|MF2_NOTELEPORT  // flags2
  );

  mobjinfo[72] := MakeObjInfo(    // MT_MACEFX3
    -1,  // doomednum
    ord(S_MACEFX3_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MACEFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    7,  // speed
    8,  // radius
    6,  // height
    100,  // mass
    4,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF,  // flags
    0 //MF2_LOGRAV|MF2_FLOORBOUNCE|MF2_THRUGHOST|MF2_NOTELEPORT  // flags2
  );

  mobjinfo[73] := MakeObjInfo(    // MT_MACEFX4
    -1,  // doomednum
    ord(S_MACEFX4_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MACEFXI4_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    7,  // speed
    8,  // radius
    6,  // height
    100,  // mass
    18,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF,  // flags
    0 //MF2_LOGRAV|MF2_FLOORBOUNCE|MF2_THRUGHOST|MF2_TELESTOMP  // flags2
  );

  mobjinfo[74] := MakeObjInfo(    // MT_WSKULLROD
    2004,  // doomednum
    ord(S_WSKL),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[75] := MakeObjInfo(    // MT_HORNRODFX1
    -1,  // doomednum
    ord(S_HRODFX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_hrnsht},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_HRODFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_hrnhit},  // deathsound
    22,  // speed
    12,  // radius
    8,  // height
    100,  // mass
    3,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_WINDTHRUST|MF2_NOTELEPORT  // flags2
  );

  mobjinfo[76] := MakeObjInfo(    // MT_HORNRODFX2
    -1,  // doomednum
    ord(S_HRODFX2_1),  // spawnstate
    4*35,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_hrnsht},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_HRODFXI2_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_ramphit},  // deathsound
    22,  // speed
    12,  // radius
    8,  // height
    100,  // mass
    10,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[77] := MakeObjInfo(    // MT_RAINPLR1
    -1,  // doomednum
    ord(S_RAINPLR1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_RAINPLR1X_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    12,  // speed
    5,  // radius
    12,  // height
    100,  // mass
    5,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[78] := MakeObjInfo(    // MT_RAINPLR2
    -1,  // doomednum
    ord(S_RAINPLR2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_RAINPLR2X_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    12,  // speed
    5,  // radius
    12,  // height
    100,  // mass
    5,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[79] := MakeObjInfo(    // MT_RAINPLR3
    -1,  // doomednum
    ord(S_RAINPLR3_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_RAINPLR3X_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    12,  // speed
    5,  // radius
    12,  // height
    100,  // mass
    5,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[80] := MakeObjInfo(    // MT_RAINPLR4
    -1,  // doomednum
    ord(S_RAINPLR4_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_RAINPLR4X_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    12,  // speed
    5,  // radius
    12,  // height
    100,  // mass
    5,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[81] := MakeObjInfo(    // MT_GOLDWANDFX1
    -1,  // doomednum
    ord(S_GWANDFX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_GWANDFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_gldhit},  // deathsound
    22,  // speed
    10,  // radius
    6,  // height
    100,  // mass
    2,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[82] := MakeObjInfo(    // MT_GOLDWANDFX2
    -1,  // doomednum
    ord(S_GWANDFX2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_GWANDFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    18,  // speed
    10,  // radius
    6,  // height
    100,  // mass
    1,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[83] := MakeObjInfo(    // MT_GOLDWANDPUFF1
    -1,  // doomednum
    ord(S_GWANDPUFF1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[84] := MakeObjInfo(    // MT_GOLDWANDPUFF2
    -1,  // doomednum
    ord(S_GWANDFXI1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[85] := MakeObjInfo(    // MT_WPHOENIXROD
    2003,  // doomednum
    ord(S_WPHX),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[86] := MakeObjInfo(    // MT_PHOENIXFX1
    -1,  // doomednum
    ord(S_PHOENIXFX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_phosht},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_PHOENIXFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_phohit},  // deathsound
    20,  // speed
    11,  // radius
    8,  // height
    100,  // mass
    20,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_THRUGHOST|MF2_NOTELEPORT  // flags2
  );

  mobjinfo[87] := MakeObjInfo(    // MT_PHOENIXPUFF
    -1,  // doomednum
    ord(S_PHOENIXPUFF1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_SHADOW,  // flags
    0 //MF2_NOTELEPORT|MF2_CANNOTPUSH  // flags2
  );

  mobjinfo[88] := MakeObjInfo(    // MT_PHOENIXFX2
    -1,  // doomednum
    ord(S_PHOENIXFX2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_PHOENIXFXI2_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    10,  // speed
    6,  // radius
    8,  // height
    100,  // mass
    2,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT|MF2_FIREDAMAGE  // flags2
  );

  mobjinfo[89] := MakeObjInfo(    // MT_MISC15
    2001,  // doomednum
    ord(S_WBOW),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[90] := MakeObjInfo(    // MT_CRBOWFX1
    -1,  // doomednum
    ord(S_CRBOWFX1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_bowsht},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_CRBOWFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_hrnhit},  // deathsound
    30,  // speed
    11,  // radius
    8,  // height
    100,  // mass
    10,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[91] := MakeObjInfo(    // MT_CRBOWFX2
    -1,  // doomednum
    ord(S_CRBOWFX2),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_bowsht},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_CRBOWFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_hrnhit},  // deathsound
    32,  // speed
    11,  // radius
    8,  // height
    100,  // mass
    6,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[92] := MakeObjInfo(    // MT_CRBOWFX3
    -1,  // doomednum
    ord(S_CRBOWFX3),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_CRBOWFXI3_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_hrnhit},  // deathsound
    20,  // speed
    11,  // radius
    8,  // height
    100,  // mass
    2,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_WINDTHRUST|MF2_THRUGHOST|MF2_NOTELEPORT  // flags2
  );

  mobjinfo[93] := MakeObjInfo(    // MT_CRBOWFX4
    -1,  // doomednum
    ord(S_CRBOWFX4_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP,  // flags
    0 //MF2_LOGRAV  // flags2
  );

  mobjinfo[94] := MakeObjInfo(    // MT_BLOOD
    -1,  // doomednum
    ord(S_BLOOD1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP,  // flags
    0  // flags2
  );

  mobjinfo[95] := MakeObjInfo(    // MT_BLOODSPLATTER
    -1,  // doomednum
    ord(S_BLOODSPLATTER1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_BLOODSPLATTERX),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    2,  // radius
    4,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF,  // flags
    0 //MF2_NOTELEPORT|MF2_CANNOTPUSH  // flags2
  );

  mobjinfo[96] := MakeObjInfo(    // MT_PLAYER
    -1,  // doomednum
    ord(S_PLAY),  // spawnstate
    100,  // spawnhealth
    ord(S_PLAY_RUN1),  // seestate
    0{sfx_None},  // seesound
    0,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_PLAY_PAIN),  // painstate
    255,  // painchance
    0{sfx_plrpai},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_PLAY_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_PLAY_DIE1),  // deathstate
    ord(S_PLAY_XDIE1),  // xdeathstate
    0{sfx_plrdth},  // deathsound
    0,  // speed
    16,  // radius
    56,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_DROPOFF|MF_PICKUP|MF_NOTDMATCH,  // flags
    0 //MF2_WINDTHRUST|MF2_FOOTCLIP|MF2_SLIDE|MF2_PASSMOBJ|MF2_TELESTOMP  // flags2
  );

  mobjinfo[97] := MakeObjInfo(    // MT_BLOODYSKULL
    -1,  // doomednum
    ord(S_BLOODYSKULL1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    4,  // radius
    4,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_DROPOFF,  // flags
    0 //MF2_LOGRAV|MF2_CANNOTPUSH  // flags2
  );

  mobjinfo[98] := MakeObjInfo(    // MT_CHICPLAYER
    -1,  // doomednum
    ord(S_CHICPLAY),  // spawnstate
    100,  // spawnhealth
    ord(S_CHICPLAY_RUN1),  // seestate
    0{sfx_None},  // seesound
    0,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_CHICPLAY_PAIN),  // painstate
    255,  // painchance
    0{sfx_chicpai},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_CHICPLAY_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_CHICKEN_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_chicdth},  // deathsound
    0,  // speed
    16,  // radius
    24,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_DROPOFF|MF_NOTDMATCH,  // flags
    0 //MF2_WINDTHRUST|MF2_SLIDE|MF2_PASSMOBJ|MF2_FOOTCLIP|MF2_LOGRAV|MF2_TELESTOMP  // flags2
  );

  mobjinfo[99] := MakeObjInfo(    // MT_CHICKEN
    -1,  // doomednum
    ord(S_CHICKEN_LOOK1),  // spawnstate
    10,  // spawnhealth
    ord(S_CHICKEN_WALK1),  // seestate
    0{sfx_chicpai},  // seesound
    8,  // reactiontime
    0{sfx_chicatk},  // attacksound
    ord(S_CHICKEN_PAIN1),  // painstate
    200,  // painchance
    0{sfx_chicpai},  // painsound
    ord(S_CHICKEN_ATK1),  // meleestate
    0,  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_CHICKEN_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_chicdth},  // deathsound
    4,  // speed
    9,  // radius
    22,  // height
    40,  // mass
    0,  // damage
    0{sfx_chicact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL|MF_DROPOFF,  // flags
    0 //MF2_WINDTHRUST|MF2_FOOTCLIP|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[100] := MakeObjInfo(    // MT_FEATHER
    -1,  // doomednum
    ord(S_FEATHER1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_FEATHERX),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    2,  // radius
    4,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF,  // flags
    0 //MF2_NOTELEPORT|MF2_LOGRAV|MF2_CANNOTPUSH|MF2_WINDTHRUST  // flags2
  );

  mobjinfo[101] := MakeObjInfo(    // MT_MUMMY
    68,  // doomednum
    ord(S_MUMMY_LOOK1),  // spawnstate
    80,  // spawnhealth
    ord(S_MUMMY_WALK1),  // seestate
    0{sfx_mumsit},  // seesound
    8,  // reactiontime
    0{sfx_mumat1},  // attacksound
    ord(S_MUMMY_PAIN1),  // painstate
    128,  // painchance
    0{sfx_mumpai},  // painsound
    ord(S_MUMMY_ATK1),  // meleestate
    0,  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MUMMY_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_mumdth},  // deathsound
    12,  // speed
    22,  // radius
    62,  // height
    75,  // mass
    0,  // damage
    0{sfx_mumact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    0 //MF2_FOOTCLIP|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[102] := MakeObjInfo(    // MT_MUMMYLEADER
    45,  // doomednum
    ord(S_MUMMY_LOOK1),  // spawnstate
    100,  // spawnhealth
    ord(S_MUMMY_WALK1),  // seestate
    0{sfx_mumsit},  // seesound
    8,  // reactiontime
    0{sfx_mumat1},  // attacksound
    ord(S_MUMMY_PAIN1),  // painstate
    64,  // painchance
    0{sfx_mumpai},  // painsound
    ord(S_MUMMY_ATK1),  // meleestate
    ord(S_MUMMYL_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MUMMY_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_mumdth},  // deathsound
    12,  // speed
    22,  // radius
    62,  // height
    75,  // mass
    0,  // damage
    0{sfx_mumact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    0 //MF2_FOOTCLIP|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[103] := MakeObjInfo(    // MT_MUMMYGHOST
    69,  // doomednum
    ord(S_MUMMY_LOOK1),  // spawnstate
    80,  // spawnhealth
    ord(S_MUMMY_WALK1),  // seestate
    0{sfx_mumsit},  // seesound
    8,  // reactiontime
    0{sfx_mumat1},  // attacksound
    ord(S_MUMMY_PAIN1),  // painstate
    128,  // painchance
    0{sfx_mumpai},  // painsound
    ord(S_MUMMY_ATK1),  // meleestate
    0,  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MUMMY_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_mumdth},  // deathsound
    12,  // speed
    22,  // radius
    62,  // height
    75,  // mass
    0,  // damage
    0{sfx_mumact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL|MF_SHADOW,  // flags
    0 //|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[104] := MakeObjInfo(    // MT_MUMMYLEADERGHOST
    46,  // doomednum
    ord(S_MUMMY_LOOK1),  // spawnstate
    100,  // spawnhealth
    ord(S_MUMMY_WALK1),  // seestate
    0{sfx_mumsit},  // seesound
    8,  // reactiontime
    0{sfx_mumat1},  // attacksound
    ord(S_MUMMY_PAIN1),  // painstate
    64,  // painchance
    0{sfx_mumpai},  // painsound
    ord(S_MUMMY_ATK1),  // meleestate
    ord(S_MUMMYL_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MUMMY_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_mumdth},  // deathsound
    12,  // speed
    22,  // radius
    62,  // height
    75,  // mass
    0,  // damage
    0{sfx_mumact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL|MF_SHADOW,  // flags
    0 //|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[105] := MakeObjInfo(    // MT_MUMMYSOUL
    -1,  // doomednum
    ord(S_MUMMY_SOUL1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY,  // flags
    0  // flags2
  );

  mobjinfo[106] := MakeObjInfo(    // MT_MUMMYFX1
    -1,  // doomednum
    ord(S_MUMMYFX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MUMMYFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    9,  // speed
    8,  // radius
    14,  // height
    100,  // mass
    4,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[107] := MakeObjInfo(    // MT_BEAST
    70,  // doomednum
    ord(S_BEAST_LOOK1),  // spawnstate
    220,  // spawnhealth
    ord(S_BEAST_WALK1),  // seestate
    0{sfx_bstsit},  // seesound
    8,  // reactiontime
    0{sfx_bstatk},  // attacksound
    ord(S_BEAST_PAIN1),  // painstate
    100,  // painchance
    0{sfx_bstpai},  // painsound
    0,  // meleestate
    ord(S_BEAST_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_BEAST_DIE1),  // deathstate
    ord(S_BEAST_XDIE1),  // xdeathstate
    0{sfx_bstdth},  // deathsound
    14,  // speed
    32,  // radius
    74,  // height
    200,  // mass
    0,  // damage
    0{sfx_bstact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    0 //|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[108] := MakeObjInfo(    // MT_BEASTBALL
    -1,  // doomednum
    ord(S_BEASTBALL1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_BEASTBALLX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    12,  // speed
    9,  // radius
    8,  // height
    100,  // mass
    4,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_WINDTHRUST|MF2_NOTELEPORT  // flags2
  );

  mobjinfo[109] := MakeObjInfo(    // MT_BURNBALL
    -1,  // doomednum
    ord(S_BURNBALL1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_BEASTBALLX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    10,  // speed
    6,  // radius
    8,  // height
    100,  // mass
    2,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[110] := MakeObjInfo(    // MT_BURNBALLFB
    -1,  // doomednum
    ord(S_BURNBALLFB1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_BEASTBALLX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    10,  // speed
    6,  // radius
    8,  // height
    100,  // mass
    2,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[111] := MakeObjInfo(    // MT_PUFFY
    -1,  // doomednum
    ord(S_PUFFY1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_PUFFY1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    10,  // speed
    6,  // radius
    8,  // height
    100,  // mass
    2,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY|MF_MISSILE,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[112] := MakeObjInfo(    // MT_SNAKE
    92,  // doomednum
    ord(S_SNAKE_LOOK1),  // spawnstate
    280,  // spawnhealth
    ord(S_SNAKE_WALK1),  // seestate
    0{sfx_snksit},  // seesound
    8,  // reactiontime
    0{sfx_snkatk},  // attacksound
    ord(S_SNAKE_PAIN1),  // painstate
    48,  // painchance
    0{sfx_snkpai},  // painsound
    0,  // meleestate
    ord(S_SNAKE_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SNAKE_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_snkdth},  // deathsound
    10,  // speed
    22,  // radius
    70,  // height
    100,  // mass
    0,  // damage
    0{sfx_snkact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    0 //|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[113] := MakeObjInfo(    // MT_SNAKEPRO_A
    -1,  // doomednum
    ord(S_SNAKEPRO_A1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SNAKEPRO_AX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    14,  // speed
    12,  // radius
    8,  // height
    100,  // mass
    1,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_WINDTHRUST|MF2_NOTELEPORT  // flags2
  );

  mobjinfo[114] := MakeObjInfo(    // MT_SNAKEPRO_B
    -1,  // doomednum
    ord(S_SNAKEPRO_B1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SNAKEPRO_BX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    14,  // speed
    12,  // radius
    8,  // height
    100,  // mass
    3,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[115] := MakeObjInfo(    // MT_HEAD
    6,  // doomednum
    ord(S_HEAD_LOOK),  // spawnstate
    700,  // spawnhealth
    ord(S_HEAD_FLOAT),  // seestate
    0{sfx_hedsit},  // seesound
    8,  // reactiontime
    0{sfx_hedat1},  // attacksound
    ord(S_HEAD_PAIN1),  // painstate
    32,  // painchance
    0{sfx_hedpai},  // painsound
    0,  // meleestate
    ord(S_HEAD_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_HEAD_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_heddth},  // deathsound
    6,  // speed
    40,  // radius
    72,  // height
    325,  // mass
    0,  // damage
    0{sfx_hedact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL|MF_NOBLOOD,  // flags
    0 //MF2_PASSMOBJ  // flags2
  );

  mobjinfo[116] := MakeObjInfo(    // MT_HEADFX1
    -1,  // doomednum
    ord(S_HEADFX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_HEADFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    13,  // speed
    12,  // radius
    6,  // height
    100,  // mass
    1,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT|MF2_THRUGHOST  // flags2
  );

  mobjinfo[117] := MakeObjInfo(    // MT_HEADFX2
    -1,  // doomednum
    ord(S_HEADFX2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_HEADFXI2_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    8,  // speed
    12,  // radius
    6,  // height
    100,  // mass
    3,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[118] := MakeObjInfo(    // MT_HEADFX3
    -1,  // doomednum
    ord(S_HEADFX3_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_HEADFXI3_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    10,  // speed
    14,  // radius
    12,  // height
    100,  // mass
    5,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_WINDTHRUST|MF2_NOTELEPORT  // flags2
  );

  mobjinfo[119] := MakeObjInfo(    // MT_WHIRLWIND
    -1,  // doomednum
    ord(S_HEADFX4_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_HEADFXI4_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    10,  // speed
    16,  // radius
    74,  // height
    100,  // mass
    1,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY|MF_SHADOW,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[120] := MakeObjInfo(    // MT_CLINK
    90,  // doomednum
    ord(S_CLINK_LOOK1),  // spawnstate
    150,  // spawnhealth
    ord(S_CLINK_WALK1),  // seestate
    0{sfx_clksit},  // seesound
    8,  // reactiontime
    0{sfx_clkatk},  // attacksound
    ord(S_CLINK_PAIN1),  // painstate
    32,  // painchance
    0{sfx_clkpai},  // painsound
    ord(S_CLINK_ATK1),  // meleestate
    0,  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_CLINK_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_clkdth},  // deathsound
    14,  // speed
    20,  // radius
    64,  // height
    75,  // mass
    0,  // damage
    0{sfx_clkact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL|MF_NOBLOOD,  // flags
    0 //|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[121] := MakeObjInfo(    // MT_WIZARD
    15,  // doomednum
    ord(S_WIZARD_LOOK1),  // spawnstate
    180,  // spawnhealth
    ord(S_WIZARD_WALK1),  // seestate
    0{sfx_wizsit},  // seesound
    8,  // reactiontime
    0{sfx_wizatk},  // attacksound
    ord(S_WIZARD_PAIN1),  // painstate
    64,  // painchance
    0{sfx_wizpai},  // painsound
    0,  // meleestate
    ord(S_WIZARD_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_WIZARD_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_wizdth},  // deathsound
    12,  // speed
    16,  // radius
    68,  // height
    100,  // mass
    0,  // damage
    0{sfx_wizact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL|MF_FLOAT|MF_NOGRAVITY,  // flags
    0 //MF2_PASSMOBJ  // flags2
  );

  mobjinfo[122] := MakeObjInfo(    // MT_WIZFX1
    -1,  // doomednum
    ord(S_WIZFX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_WIZFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    18,  // speed
    10,  // radius
    6,  // height
    100,  // mass
    3,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[123] := MakeObjInfo(    // MT_IMP
    66,  // doomednum
    ord(S_IMP_LOOK1),  // spawnstate
    40,  // spawnhealth
    ord(S_IMP_FLY1),  // seestate
    0{sfx_impsit},  // seesound
    8,  // reactiontime
    0{sfx_impat1},  // attacksound
    ord(S_IMP_PAIN1),  // painstate
    200,  // painchance
    0{sfx_imppai},  // painsound
    ord(S_IMP_MEATK1),  // meleestate
    ord(S_IMP_MSATK1_1),  // missilestate
    ord(S_IMP_CRASH1),  // crashstate
    ord(S_IMP_DIE1),  // deathstate
    ord(S_IMP_XDIE1),  // xdeathstate
    0{sfx_impdth},  // deathsound
    10,  // speed
    16,  // radius
    36,  // height
    50,  // mass
    0,  // damage
    0{sfx_impact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_FLOAT|MF_NOGRAVITY|MF_COUNTKILL,  // flags
    0 //MF2_SPAWNFLOAT|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[124] := MakeObjInfo(    // MT_IMPLEADER
    5,  // doomednum
    ord(S_IMP_LOOK1),  // spawnstate
    80,  // spawnhealth
    ord(S_IMP_FLY1),  // seestate
    0{sfx_impsit},  // seesound
    8,  // reactiontime
    0{sfx_impat2},  // attacksound
    ord(S_IMP_PAIN1),  // painstate
    200,  // painchance
    0{sfx_imppai},  // painsound
    0,  // meleestate
    ord(S_IMP_MSATK2_1),  // missilestate
    ord(S_IMP_CRASH1),  // crashstate
    ord(S_IMP_DIE1),  // deathstate
    ord(S_IMP_XDIE1),  // xdeathstate
    0{sfx_impdth},  // deathsound
    10,  // speed
    16,  // radius
    36,  // height
    50,  // mass
    0,  // damage
    0{sfx_impact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_FLOAT|MF_NOGRAVITY|MF_COUNTKILL,  // flags
    0 //MF2_SPAWNFLOAT|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[125] := MakeObjInfo(    // MT_IMPCHUNK1
    -1,  // doomednum
    ord(S_IMP_CHUNKA1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP,  // flags
    0  // flags2
  );

  mobjinfo[126] := MakeObjInfo(    // MT_IMPCHUNK2
    -1,  // doomednum
    ord(S_IMP_CHUNKB1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP,  // flags
    0  // flags2
  );

  mobjinfo[127] := MakeObjInfo(    // MT_IMPBALL
    -1,  // doomednum
    ord(S_IMPFX1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_IMPFXI1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    10,  // speed
    8,  // radius
    8,  // height
    100,  // mass
    1,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_WINDTHRUST|MF2_NOTELEPORT  // flags2
  );

  mobjinfo[128] := MakeObjInfo(    // MT_KNIGHT
    64,  // doomednum
    ord(S_KNIGHT_STND1),  // spawnstate
    200,  // spawnhealth
    ord(S_KNIGHT_WALK1),  // seestate
    0{sfx_kgtsit},  // seesound
    8,  // reactiontime
    0{sfx_kgtatk},  // attacksound
    ord(S_KNIGHT_PAIN1),  // painstate
    100,  // painchance
    0{sfx_kgtpai},  // painsound
    ord(S_KNIGHT_ATK1),  // meleestate
    ord(S_KNIGHT_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_KNIGHT_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_kgtdth},  // deathsound
    12,  // speed
    24,  // radius
    78,  // height
    150,  // mass
    0,  // damage
    0{sfx_kgtact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    0 //|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[129] := MakeObjInfo(    // MT_KNIGHTGHOST
    65,  // doomednum
    ord(S_KNIGHT_STND1),  // spawnstate
    200,  // spawnhealth
    ord(S_KNIGHT_WALK1),  // seestate
    0{sfx_kgtsit},  // seesound
    8,  // reactiontime
    0{sfx_kgtatk},  // attacksound
    ord(S_KNIGHT_PAIN1),  // painstate
    100,  // painchance
    0{sfx_kgtpai},  // painsound
    ord(S_KNIGHT_ATK1),  // meleestate
    ord(S_KNIGHT_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_KNIGHT_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_kgtdth},  // deathsound
    12,  // speed
    24,  // radius
    78,  // height
    150,  // mass
    0,  // damage
    0{sfx_kgtact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL|MF_SHADOW,  // flags
    0 //|MF2_PASSMOBJ  // flags2
  );

  mobjinfo[130] := MakeObjInfo(    // MT_KNIGHTAXE
    -1,  // doomednum
    ord(S_SPINAXE1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SPINAXEX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_hrnhit},  // deathsound
    9,  // speed
    10,  // radius
    8,  // height
    100,  // mass
    2,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_WINDTHRUST|MF2_NOTELEPORT|MF2_THRUGHOST  // flags2
  );

  mobjinfo[131] := MakeObjInfo(    // MT_REDAXE
    -1,  // doomednum
    ord(S_REDAXE1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_REDAXEX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_hrnhit},  // deathsound
    9,  // speed
    10,  // radius
    8,  // height
    100,  // mass
    7,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT|MF2_THRUGHOST  // flags2
  );

  mobjinfo[132] := MakeObjInfo(    // MT_SORCERER1
    7,  // doomednum
    ord(S_SRCR1_LOOK1),  // spawnstate
    2000,  // spawnhealth
    ord(S_SRCR1_WALK1),  // seestate
    0{sfx_sbtsit},  // seesound
    8,  // reactiontime
    0{sfx_sbtatk},  // attacksound
    ord(S_SRCR1_PAIN1),  // painstate
    56,  // painchance
    0{sfx_sbtpai},  // painsound
    0,  // meleestate
    ord(S_SRCR1_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SRCR1_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_sbtdth},  // deathsound
    16,  // speed
    28,  // radius
    100,  // height
    800,  // mass
    0,  // damage
    0{sfx_sbtact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    0 //|MF2_PASSMOBJ|MF2_BOSS  // flags2
  );

  mobjinfo[133] := MakeObjInfo(    // MT_SRCRFX1
    -1,  // doomednum
    ord(S_SRCRFX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SRCRFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    20,  // speed
    10,  // radius
    10,  // height
    100,  // mass
    10,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT|MF2_FIREDAMAGE  // flags2
  );

  mobjinfo[134] := MakeObjInfo(    // MT_SORCERER2
    -1,  // doomednum
    ord(S_SOR2_LOOK1),  // spawnstate
    3500,  // spawnhealth
    ord(S_SOR2_WALK1),  // seestate
    0{sfx_sorsit},  // seesound
    8,  // reactiontime
    0{sfx_soratk},  // attacksound
    ord(S_SOR2_PAIN1),  // painstate
    32,  // painchance
    0{sfx_sorpai},  // painsound
    0,  // meleestate
    ord(S_SOR2_ATK1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SOR2_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    14,  // speed
    16,  // radius
    70,  // height
    300,  // mass
    0,  // damage
    0{sfx_soract},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL|MF_DROPOFF,  // flags
    0 //|MF2_PASSMOBJ|MF2_BOSS  // flags2
  );

  mobjinfo[135] := MakeObjInfo(    // MT_SOR2FX1
    -1,  // doomednum
    ord(S_SOR2FX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SOR2FXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    20,  // speed
    10,  // radius
    6,  // height
    100,  // mass
    1,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[136] := MakeObjInfo(    // MT_SOR2FXSPARK
    -1,  // doomednum
    ord(S_SOR2FXSPARK1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT|MF2_CANNOTPUSH  // flags2
  );

  mobjinfo[137] := MakeObjInfo(    // MT_SOR2FX2
    -1,  // doomednum
    ord(S_SOR2FX2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_SOR2FXI2_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    6,  // speed
    10,  // radius
    6,  // height
    100,  // mass
    10,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT  // flags2
  );

  mobjinfo[138] := MakeObjInfo(    // MT_SOR2TELEFADE
    -1,  // doomednum
    ord(S_SOR2TELEFADE1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP,  // flags
    0  // flags2
  );

  mobjinfo[139] := MakeObjInfo(    // MT_MINOTAUR
    9,  // doomednum
    ord(S_MNTR_LOOK1),  // spawnstate
    3000,  // spawnhealth
    ord(S_MNTR_WALK1),  // seestate
    0{sfx_minsit},  // seesound
    8,  // reactiontime
    0{sfx_minat1},  // attacksound
    ord(S_MNTR_PAIN1),  // painstate
    25,  // painchance
    0{sfx_minpai},  // painsound
    ord(S_MNTR_ATK1_1),  // meleestate
    ord(S_MNTR_ATK2_1),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MNTR_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_mindth},  // deathsound
    16,  // speed
    28,  // radius
    100,  // height
    800,  // mass
    7,  // damage
    0{sfx_minact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL|MF_DROPOFF,  // flags
    0 //|MF2_PASSMOBJ|MF2_BOSS  // flags2
  );

  mobjinfo[140] := MakeObjInfo(    // MT_MNTRFX1
    -1,  // doomednum
    ord(S_MNTRFX1_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MNTRFXI1_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0,  // deathsound
    20,  // speed
    10,  // radius
    6,  // height
    100,  // mass
    3,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT|MF2_FIREDAMAGE  // flags2
  );

  mobjinfo[141] := MakeObjInfo(    // MT_MNTRFX2
    -1,  // doomednum
    ord(S_MNTRFX2_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MNTRFXI2_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_phohit},  // deathsound
    14,  // speed
    5,  // radius
    12,  // height
    100,  // mass
    4,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT|MF2_FIREDAMAGE  // flags2
  );

  mobjinfo[142] := MakeObjInfo(    // MT_MNTRFX3
    -1,  // doomednum
    ord(S_MNTRFX3_1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_MNTRFXI2_1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_phohit},  // deathsound
    0,  // speed
    8,  // radius
    16,  // height
    100,  // mass
    4,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    0 //MF2_NOTELEPORT|MF2_FIREDAMAGE  // flags2
  );

  mobjinfo[143] := MakeObjInfo(    // MT_AKYY
    73,  // doomednum
    ord(S_AKYY1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_NOTDMATCH,  // flags
    0  // flags2
  );

  mobjinfo[144] := MakeObjInfo(    // MT_BKYY
    79,  // doomednum
    ord(S_BKYY1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_NOTDMATCH,  // flags
    0  // flags2
  );

  mobjinfo[145] := MakeObjInfo(    // MT_CKEY
    80,  // doomednum
    ord(S_CKYY1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL|MF_NOTDMATCH,  // flags
    0  // flags2
  );

  mobjinfo[146] := MakeObjInfo(    // MT_AMGWNDWIMPY
    10,  // doomednum
    ord(S_AMG1),  // spawnstate
    0, //AMMO_GWND_WIMPY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[147] := MakeObjInfo(    // MT_AMGWNDHEFTY
    12,  // doomednum
    ord(S_AMG2_1),  // spawnstate
    0, //AMMO_GWND_HEFTY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[148] := MakeObjInfo(    // MT_AMMACEWIMPY
    13,  // doomednum
    ord(S_AMM1),  // spawnstate
    0, //AMMO_MACE_WIMPY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[149] := MakeObjInfo(    // MT_AMMACEHEFTY
    16,  // doomednum
    ord(S_AMM2),  // spawnstate
    0, //AMMO_MACE_HEFTY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[150] := MakeObjInfo(    // MT_AMCBOWWIMPY
    18,  // doomednum
    ord(S_AMC1),  // spawnstate
    0, //AMMO_CBOW_WIMPY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[151] := MakeObjInfo(    // MT_AMCBOWHEFTY
    19,  // doomednum
    ord(S_AMC2_1),  // spawnstate
    0, //AMMO_CBOW_HEFTY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[152] := MakeObjInfo(    // MT_AMSKRDWIMPY
    20,  // doomednum
    ord(S_AMS1_1),  // spawnstate
    0, //AMMO_SKRD_WIMPY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[153] := MakeObjInfo(    // MT_AMSKRDHEFTY
    21,  // doomednum
    ord(S_AMS2_1),  // spawnstate
    0, //AMMO_SKRD_HEFTY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[154] := MakeObjInfo(    // MT_AMPHRDWIMPY
    22,  // doomednum
    ord(S_AMP1_1),  // spawnstate
    0, //AMMO_PHRD_WIMPY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[155] := MakeObjInfo(    // MT_AMPHRDHEFTY
    23,  // doomednum
    ord(S_AMP2_1),  // spawnstate
    0, //AMMO_PHRD_HEFTY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[156] := MakeObjInfo(    // MT_AMBLSRWIMPY
    54,  // doomednum
    ord(S_AMB1_1),  // spawnstate
    0, //AMMO_BLSR_WIMPY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[157] := MakeObjInfo(    // MT_AMBLSRHEFTY
    55,  // doomednum
    ord(S_AMB2_1),  // spawnstate
    0, //AMMO_BLSR_HEFTY,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SPECIAL,  // flags
    0  // flags2
  );

  mobjinfo[158] := MakeObjInfo(    // MT_SOUNDWIND
    42,  // doomednum
    ord(S_SND_WIND),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOSECTOR,  // flags
    0  // flags2
  );

  mobjinfo[159] := MakeObjInfo(    // MT_SOUNDWATERFALL
    41,  // doomednum
    ord(S_SND_WATERFALL),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // crashstate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOSECTOR,  // flags
    0  // flags2
  );

  QuickSortmobjinfo;

  PositiveStart := 0;
  for i := 0 to Ord(NUMMOBJTYPES) - 1 do
    if mobjinfo[i].doomednum >= 0 then
      PositiveStart := i
    else
      break;

  IsInitialized := true;
end;

procedure Finalize;
begin
  if IsInitialized then
  begin
    FreeMem(states, ord(NUMSTATES) * SizeOf(state_t));
    FreeMem(mobjinfo, ord(NUMMOBJTYPES) * SizeOf(mobjinfo_t));
    IsInitialized := false;
  end;
end;

var i: integer;

initialization
  IsInitialized := false;
  for i := 0 to ord(NUMSPRITES) - 1 do
  begin
    sprnames[i].Key := GetWadSpriteKey(sprnames[i].Name);
    sprNamesLookUp[i].key := sprnames[i].Key;
    sprNamesLookUp[i].index := i;
  end;
  SortLookUpTable(sprNamesLookUp);

finalization
  Finalize;

end.
