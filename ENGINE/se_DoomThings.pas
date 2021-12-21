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
//  Doom things
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//------------------------------------------------------------------------------

{$I defs.inc}

unit se_DoomThings;

interface

uses
  se_IDWADThingsCommon;

const
  DOOMTHING_PLAYER1 = 1;
  DOOMTHING_PLAYER2 = 2;
  DOOMTHING_PLAYER3 = 3;
  DOOMTHING_PLAYER4 = 4;
  DOOMTHING_DEATHMATCH = 11;

// enhancements
  DOOMTHING_BLUECARD = 5;
  DOOMTHING_YELLOWCARD = 6;
  DOOMTHING_REDCARD = 13;
  DOOMTHING_BLUESKULLKEY = 40;
  DOOMTHING_YELLOWSKULLKEY = 39;
  DOOMTHING_REDSKULLKEY = 38;
  DOOMTHING_ARMBONUS1 = 2015;
  DOOMTHING_HLTBONUS1 = 2014;
  DOOMTHING_GREENARMOR = 2018;
  DOOMTHING_BLUEARMOR = 2019;
  DOOMTHING_STIMPACK = 2011;
  DOOMTHING_MEDKIT = 2012;
  DOOMTHING_SOULSPHERE = 2013;
  DOOMTHING_RADSUIT = 2025;
  DOOMTHING_MAP = 2026;
  DOOMTHING_BLURSPHERE = 2024;
  DOOMTHING_BESERK = 2023;
  DOOMTHING_INVULN = 2022;
  DOOMTHING_LITEAMP = 2045;

// weapons
  DOOMTHING_SHOTGUN = 2001;
  DOOMTHING_SUPERSHOTGUN = 82;
  DOOMTHING_CHAINGUN = 2002;
  DOOMTHING_LAUNCHER = 2003;
  DOOMTHING_PLASMAGUN = 2004;
  DOOMTHING_CHAINSAW = 2005;
  DOOMTHING_BFG9000 = 2006;
  DOOMTHING_AMMOCLIP = 2007;
  DOOMTHING_AMMOBOX = 2048;
  DOOMTHING_SHELLS = 2008;
  DOOMTHING_SHELLBOX = 2049;
  DOOMTHING_ROCKET = 2010;
  DOOMTHING_ROCKETBOX = 2046;
  DOOMTHING_ENERGYCELL = 2047;
  DOOMTHING_ENERGYPACK = 17;
  DOOMTHING_BACKPACK = 8;

// enemies
  DOOMTHING_SARGEANT = 9;
  DOOMTHING_TROOPER = 3004;
  DOOMTHING_IMP = 3001;
  DOOMTHING_DEMON = 3002;
  DOOMTHING_BARON = 3003;
  DOOMTHING_SPECTOR = 58;
  DOOMTHING_CACODEMON = 3005;
  DOOMTHING_LOSTSOUL = 3006;
  DOOMTHING_SPIDERBOSS = 7;
  DOOMTHING_CYBERDEMON = 16;
// From DOOM 2
  DOOMTHING_HEAVYWEAPONDUDE = 65;
  DOOMTHING_HELLKNIGHT = 69;
  DOOMTHING_ARACHNOTRON = 68;
  DOOMTHING_PAINELEMENTAL = 71;
  DOOMTHING_REEVANT = 66;
  DOOMTHING_MANCUBUS = 67;
  DOOMTHING_ARCHVILLE = 64;
  DOOMTHING_WOLFSOLDIER = 84;

// decorations
  DOOMTHING_BARREL = 2035;
  DOOMTHING_TECHCOLUMN = 48;
  DOOMTHING_TGREENPILLAR = 30;
  DOOMTHING_TREDPILLAR = 32;
  DOOMTHING_SGREENPILLAR = 31;
  DOOMTHING_SREDPILLAR = 33;
  DOOMTHING_PILLARHEART = 36;
  DOOMTHING_PILLARSKULL = 37;
  DOOMTHING_EYEINSYMBOL = 41;
  DOOMTHING_GREYTREE = 43;
  DOOMTHING_BROWNSTUB = 47;
  DOOMTHING_BROWNTREE = 54;

// decorations 2
  DOOMTHING_LAMP = 2028;
  DOOMTHING_CANDLE = 34;
  DOOMTHING_CANDELABRA = 35;
  DOOMTHING_TBLUETORCH = 44;
  DOOMTHING_TGREENTORCH = 45;
  DOOMTHING_TREDTORCH = 46;
  DOOMTHING_SBLUETORCH = 55;
  DOOMTHING_SGREENTORCH = 56;
  DOOMTHING_SREDTORCH = 57;

// decorations 3
  DOOMTHING_DEADPLAYER = 15;
  DOOMTHING_DEADTROOPER = 18;
  DOOMTHING_DEADSARGEANT = 19;
  DOOMTHING_DEADIMP = 20;
  DOOMTHING_DEADDEMON = 21;
  DOOMTHING_DEADCACODEMON = 22;
  DOOMTHING_DEADLOSTSOUL = 23;
  DOOMTHING_BONES = 10;
  DOOMTHING_BONES2 = 12;
  DOOMTHING_POOLOFBLOOD = 24;
  DOOMTHING_SKULLTOPPOLE = 27;
  DOOMTHING_HEADSKEWER = 28;
  DOOMTHING_PILEOFSKULLS = 29;
  DOOMTHING_IMPALEDBODY = 25;
  DOOMTHING_IMPALEDBODY2 = 26;
  DOOMTHING_SKULLSINFLAMES = 42;

// decorations 4
  DOOMTHING_HANGINGSWAYING = 49;
  DOOMTHING_HANGINGARMSOUT = 50;
  DOOMTHING_HANGINGONELEG = 51;
  DOOMTHING_HANGINGTORSO = 52;
  DOOMTHING_HANGINGLEG = 53;
  DOOMTHING_HANGINGSWAYING2 = 63;
  DOOMTHING_HANGINGARMSOUT2 = 59;
  DOOMTHING_HANGINGONELEG2 = 61;
  DOOMTHING_HANGINGTORSO2 = 60;
  DOOMTHING_HANGINGLEG2 = 62;

// teleport arrival
  DOOMTHING_TELEPORT = 14;

type
  spritenum_t = (
    SPR_TROO, SPR_SHTG, SPR_PUNG, SPR_PISG, SPR_PISF,
    SPR_SHTF, SPR_SHT2, SPR_CHGG, SPR_CHGF, SPR_MISG,
    SPR_MISF, SPR_SAWG, SPR_PLSG, SPR_PLSF, SPR_BFGG,
    SPR_BFGF, SPR_BLUD, SPR_PUFF, SPR_BAL1, SPR_BAL2,
    SPR_PLSS, SPR_PLSE, SPR_MISL, SPR_BFS1, SPR_BFE1,
    SPR_BFE2, SPR_TFOG, SPR_IFOG, SPR_PLAY, SPR_POSS,
    SPR_SPOS, SPR_VILE, SPR_FIRE, SPR_FATB, SPR_FBXP,
    SPR_SKEL, SPR_MANF, SPR_FATT, SPR_CPOS, SPR_SARG,
    SPR_HEAD, SPR_BAL7, SPR_BOSS, SPR_BOS2, SPR_SKUL,
    SPR_SPID, SPR_BSPI, SPR_APLS, SPR_APBX, SPR_CYBR,
    SPR_PAIN, SPR_SSWV, SPR_KEEN, SPR_BBRN, SPR_BOSF,
    SPR_ARM1, SPR_ARM2, SPR_BAR1, SPR_BEXP, SPR_FCAN,
    SPR_BON1, SPR_BON2, SPR_BKEY, SPR_RKEY, SPR_YKEY,
    SPR_BSKU, SPR_RSKU, SPR_YSKU, SPR_STIM, SPR_MEDI,
    SPR_SOUL, SPR_PINV, SPR_PSTR, SPR_PINS, SPR_MEGA,
    SPR_SUIT, SPR_PMAP, SPR_PVIS, SPR_CLIP, SPR_AMMO,
    SPR_ROCK, SPR_BROK, SPR_CELL, SPR_CELP, SPR_SHEL,
    SPR_SBOX, SPR_BPAK, SPR_BFUG, SPR_MGUN, SPR_CSAW,
    SPR_LAUN, SPR_PLAS, SPR_SHOT, SPR_SGN2, SPR_COLU,
    SPR_SMT2, SPR_GOR1, SPR_POL2, SPR_POL5, SPR_POL4,
    SPR_POL3, SPR_POL1, SPR_POL6, SPR_GOR2, SPR_GOR3,
    SPR_GOR4, SPR_GOR5, SPR_SMIT, SPR_COL1, SPR_COL2,
    SPR_COL3, SPR_COL4, SPR_CAND, SPR_CBRA, SPR_COL6,
    SPR_TRE1, SPR_TRE2, SPR_ELEC, SPR_CEYE, SPR_FSKU,
    SPR_COL5, SPR_TBLU, SPR_TGRN, SPR_TRED, SPR_SMBT,
    SPR_SMGT, SPR_SMRT, SPR_HDB1, SPR_HDB2, SPR_HDB3,
    SPR_HDB4, SPR_HDB5, SPR_HDB6, SPR_POB1, SPR_POB2,
    SPR_BRS1, SPR_TLMP, SPR_TLP2, NUMSPRITES
  );

  mobjtype_t = (
    MT_PLAYER,
    MT_POSSESSED,
    MT_SHOTGUY,
    MT_VILE,
    MT_FIRE,
    MT_UNDEAD,
    MT_TRACER,
    MT_SMOKE,
    MT_FATSO,
    MT_FATSHOT,
    MT_CHAINGUY,
    MT_TROOP,
    MT_SERGEANT,
    MT_SHADOWS,
    MT_HEAD,
    MT_BRUISER,
    MT_BRUISERSHOT,
    MT_KNIGHT,
    MT_SKULL,
    MT_SPIDER,
    MT_BABY,
    MT_CYBORG,
    MT_PAIN,
    MT_WOLFSS,
    MT_KEEN,
    MT_BOSSBRAIN,
    MT_BOSSSPIT,
    MT_BOSSTARGET,
    MT_SPAWNSHOT,
    MT_SPAWNFIRE,
    MT_BARREL,
    MT_TROOPSHOT,
    MT_HEADSHOT,
    MT_ROCKET,
    MT_PLASMA,
    MT_BFG,
    MT_ARACHPLAZ,
    MT_PUFF,
    MT_BLOOD,
    MT_TFOG,
    MT_IFOG,
    MT_TELEPORTMAN,
    MT_EXTRABFG,
    MT_MISC0,
    MT_MISC1,
    MT_MISC2,
    MT_MISC3,
    MT_MISC4,
    MT_MISC5,
    MT_MISC6,
    MT_MISC7,
    MT_MISC8,
    MT_MISC9,
    MT_MISC10,
    MT_MISC11,
    MT_MISC12,
    MT_INV,
    MT_MISC13,
    MT_INS,
    MT_MISC14,
    MT_MISC15,
    MT_MISC16,
    MT_MEGA,
    MT_CLIP,
    MT_MISC17,
    MT_MISC18,
    MT_MISC19,
    MT_MISC20,
    MT_MISC21,
    MT_MISC22,
    MT_MISC23,
    MT_MISC24,
    MT_MISC25,
    MT_CHAINGUN,
    MT_MISC26,
    MT_MISC27,
    MT_MISC28,
    MT_SHOTGUN,
    MT_SUPERSHOTGUN,
    MT_MISC29,
    MT_MISC30,
    MT_MISC31,
    MT_MISC32,
    MT_MISC33,
    MT_MISC34,
    MT_MISC35,
    MT_MISC36,
    MT_MISC37,
    MT_MISC38,
    MT_MISC39,
    MT_MISC40,
    MT_MISC41,
    MT_MISC42,
    MT_MISC43,
    MT_MISC44,
    MT_MISC45,
    MT_MISC46,
    MT_MISC47,
    MT_MISC48,
    MT_MISC49,
    MT_MISC50,
    MT_MISC51,
    MT_MISC52,
    MT_MISC53,
    MT_MISC54,
    MT_MISC55,
    MT_MISC56,
    MT_MISC57,
    MT_MISC58,
    MT_MISC59,
    MT_MISC60,
    MT_MISC61,
    MT_MISC62,
    MT_MISC63,
    MT_MISC64,
    MT_MISC65,
    MT_MISC66,
    MT_MISC67,
    MT_MISC68,
    MT_MISC69,
    MT_MISC70,
    MT_MISC71,
    MT_MISC72,
    MT_MISC73,
    MT_MISC74,
    MT_MISC75,
    MT_MISC76,
    MT_MISC77,
    MT_MISC78,
    MT_MISC79,
    MT_MISC80,
    MT_MISC81,
    MT_MISC82,
    MT_MISC83,
    MT_MISC84,
    MT_MISC85,
    MT_MISC86,
    NUMMOBJTYPES
  );

  statenum_t = (
    S_NULL,
    S_LIGHTDONE,
    S_PUNCH,
    S_PUNCHDOWN,
    S_PUNCHUP,
    S_PUNCH1,
    S_PUNCH2,
    S_PUNCH3,
    S_PUNCH4,
    S_PUNCH5,
    S_PISTOL,
    S_PISTOLDOWN,
    S_PISTOLUP,
    S_PISTOL1,
    S_PISTOL2,
    S_PISTOL3,
    S_PISTOL4,
    S_PISTOLFLASH,
    S_SGUN,
    S_SGUNDOWN,
    S_SGUNUP,
    S_SGUN1,
    S_SGUN2,
    S_SGUN3,
    S_SGUN4,
    S_SGUN5,
    S_SGUN6,
    S_SGUN7,
    S_SGUN8,
    S_SGUN9,
    S_SGUNFLASH1,
    S_SGUNFLASH2,
    S_DSGUN,
    S_DSGUNDOWN,
    S_DSGUNUP,
    S_DSGUN1,
    S_DSGUN2,
    S_DSGUN3,
    S_DSGUN4,
    S_DSGUN5,
    S_DSGUN6,
    S_DSGUN7,
    S_DSGUN8,
    S_DSGUN9,
    S_DSGUN10,
    S_DSNR1,
    S_DSNR2,
    S_DSGUNFLASH1,
    S_DSGUNFLASH2,
    S_CHAIN,
    S_CHAINDOWN,
    S_CHAINUP,
    S_CHAIN1,
    S_CHAIN2,
    S_CHAIN3,
    S_CHAINFLASH1,
    S_CHAINFLASH2,
    S_MISSILE,
    S_MISSILEDOWN,
    S_MISSILEUP,
    S_MISSILE1,
    S_MISSILE2,
    S_MISSILE3,
    S_MISSILEFLASH1,
    S_MISSILEFLASH2,
    S_MISSILEFLASH3,
    S_MISSILEFLASH4,
    S_SAW,
    S_SAWB,
    S_SAWDOWN,
    S_SAWUP,
    S_SAW1,
    S_SAW2,
    S_SAW3,
    S_PLASMA,
    S_PLASMADOWN,
    S_PLASMAUP,
    S_PLASMA1,
    S_PLASMA2,
    S_PLASMAFLASH1,
    S_PLASMAFLASH2,
    S_BFG,
    S_BFGDOWN,
    S_BFGUP,
    S_BFG1,
    S_BFG2,
    S_BFG3,
    S_BFG4,
    S_BFGFLASH1,
    S_BFGFLASH2,
    S_BLOOD1,
    S_BLOOD2,
    S_BLOOD3,
    S_PUFF1,
    S_PUFF2,
    S_PUFF3,
    S_PUFF4,
    S_TBALL1,
    S_TBALL2,
    S_TBALLX1,
    S_TBALLX2,
    S_TBALLX3,
    S_RBALL1,
    S_RBALL2,
    S_RBALLX1,
    S_RBALLX2,
    S_RBALLX3,
    S_PLASBALL,
    S_PLASBALL2,
    S_PLASEXP,
    S_PLASEXP2,
    S_PLASEXP3,
    S_PLASEXP4,
    S_PLASEXP5,
    S_ROCKET,
    S_BFGSHOT,
    S_BFGSHOT2,
    S_BFGLAND,
    S_BFGLAND2,
    S_BFGLAND3,
    S_BFGLAND4,
    S_BFGLAND5,
    S_BFGLAND6,
    S_BFGEXP,
    S_BFGEXP2,
    S_BFGEXP3,
    S_BFGEXP4,
    S_EXPLODE1,
    S_EXPLODE2,
    S_EXPLODE3,
    S_TFOG,
    S_TFOG01,
    S_TFOG02,
    S_TFOG2,
    S_TFOG3,
    S_TFOG4,
    S_TFOG5,
    S_TFOG6,
    S_TFOG7,
    S_TFOG8,
    S_TFOG9,
    S_TFOG10,
    S_IFOG,
    S_IFOG01,
    S_IFOG02,
    S_IFOG2,
    S_IFOG3,
    S_IFOG4,
    S_IFOG5,
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
    S_PLAY_XDIE1,
    S_PLAY_XDIE2,
    S_PLAY_XDIE3,
    S_PLAY_XDIE4,
    S_PLAY_XDIE5,
    S_PLAY_XDIE6,
    S_PLAY_XDIE7,
    S_PLAY_XDIE8,
    S_PLAY_XDIE9,
    S_POSS_STND,
    S_POSS_STND2,
    S_POSS_RUN1,
    S_POSS_RUN2,
    S_POSS_RUN3,
    S_POSS_RUN4,
    S_POSS_RUN5,
    S_POSS_RUN6,
    S_POSS_RUN7,
    S_POSS_RUN8,
    S_POSS_ATK1,
    S_POSS_ATK2,
    S_POSS_ATK3,
    S_POSS_PAIN,
    S_POSS_PAIN2,
    S_POSS_DIE1,
    S_POSS_DIE2,
    S_POSS_DIE3,
    S_POSS_DIE4,
    S_POSS_DIE5,
    S_POSS_XDIE1,
    S_POSS_XDIE2,
    S_POSS_XDIE3,
    S_POSS_XDIE4,
    S_POSS_XDIE5,
    S_POSS_XDIE6,
    S_POSS_XDIE7,
    S_POSS_XDIE8,
    S_POSS_XDIE9,
    S_POSS_RAISE1,
    S_POSS_RAISE2,
    S_POSS_RAISE3,
    S_POSS_RAISE4,
    S_SPOS_STND,
    S_SPOS_STND2,
    S_SPOS_RUN1,
    S_SPOS_RUN2,
    S_SPOS_RUN3,
    S_SPOS_RUN4,
    S_SPOS_RUN5,
    S_SPOS_RUN6,
    S_SPOS_RUN7,
    S_SPOS_RUN8,
    S_SPOS_ATK1,
    S_SPOS_ATK2,
    S_SPOS_ATK3,
    S_SPOS_PAIN,
    S_SPOS_PAIN2,
    S_SPOS_DIE1,
    S_SPOS_DIE2,
    S_SPOS_DIE3,
    S_SPOS_DIE4,
    S_SPOS_DIE5,
    S_SPOS_XDIE1,
    S_SPOS_XDIE2,
    S_SPOS_XDIE3,
    S_SPOS_XDIE4,
    S_SPOS_XDIE5,
    S_SPOS_XDIE6,
    S_SPOS_XDIE7,
    S_SPOS_XDIE8,
    S_SPOS_XDIE9,
    S_SPOS_RAISE1,
    S_SPOS_RAISE2,
    S_SPOS_RAISE3,
    S_SPOS_RAISE4,
    S_SPOS_RAISE5,
    S_VILE_STND,
    S_VILE_STND2,
    S_VILE_RUN1,
    S_VILE_RUN2,
    S_VILE_RUN3,
    S_VILE_RUN4,
    S_VILE_RUN5,
    S_VILE_RUN6,
    S_VILE_RUN7,
    S_VILE_RUN8,
    S_VILE_RUN9,
    S_VILE_RUN10,
    S_VILE_RUN11,
    S_VILE_RUN12,
    S_VILE_ATK1,
    S_VILE_ATK2,
    S_VILE_ATK3,
    S_VILE_ATK4,
    S_VILE_ATK5,
    S_VILE_ATK6,
    S_VILE_ATK7,
    S_VILE_ATK8,
    S_VILE_ATK9,
    S_VILE_ATK10,
    S_VILE_ATK11,
    S_VILE_HEAL1,
    S_VILE_HEAL2,
    S_VILE_HEAL3,
    S_VILE_PAIN,
    S_VILE_PAIN2,
    S_VILE_DIE1,
    S_VILE_DIE2,
    S_VILE_DIE3,
    S_VILE_DIE4,
    S_VILE_DIE5,
    S_VILE_DIE6,
    S_VILE_DIE7,
    S_VILE_DIE8,
    S_VILE_DIE9,
    S_VILE_DIE10,
    S_FIRE1,
    S_FIRE2,
    S_FIRE3,
    S_FIRE4,
    S_FIRE5,
    S_FIRE6,
    S_FIRE7,
    S_FIRE8,
    S_FIRE9,
    S_FIRE10,
    S_FIRE11,
    S_FIRE12,
    S_FIRE13,
    S_FIRE14,
    S_FIRE15,
    S_FIRE16,
    S_FIRE17,
    S_FIRE18,
    S_FIRE19,
    S_FIRE20,
    S_FIRE21,
    S_FIRE22,
    S_FIRE23,
    S_FIRE24,
    S_FIRE25,
    S_FIRE26,
    S_FIRE27,
    S_FIRE28,
    S_FIRE29,
    S_FIRE30,
    S_SMOKE1,
    S_SMOKE2,
    S_SMOKE3,
    S_SMOKE4,
    S_SMOKE5,
    S_TRACER,
    S_TRACER2,
    S_TRACEEXP1,
    S_TRACEEXP2,
    S_TRACEEXP3,
    S_SKEL_STND,
    S_SKEL_STND2,
    S_SKEL_RUN1,
    S_SKEL_RUN2,
    S_SKEL_RUN3,
    S_SKEL_RUN4,
    S_SKEL_RUN5,
    S_SKEL_RUN6,
    S_SKEL_RUN7,
    S_SKEL_RUN8,
    S_SKEL_RUN9,
    S_SKEL_RUN10,
    S_SKEL_RUN11,
    S_SKEL_RUN12,
    S_SKEL_FIST1,
    S_SKEL_FIST2,
    S_SKEL_FIST3,
    S_SKEL_FIST4,
    S_SKEL_MISS1,
    S_SKEL_MISS2,
    S_SKEL_MISS3,
    S_SKEL_MISS4,
    S_SKEL_PAIN,
    S_SKEL_PAIN2,
    S_SKEL_DIE1,
    S_SKEL_DIE2,
    S_SKEL_DIE3,
    S_SKEL_DIE4,
    S_SKEL_DIE5,
    S_SKEL_DIE6,
    S_SKEL_RAISE1,
    S_SKEL_RAISE2,
    S_SKEL_RAISE3,
    S_SKEL_RAISE4,
    S_SKEL_RAISE5,
    S_SKEL_RAISE6,
    S_FATSHOT1,
    S_FATSHOT2,
    S_FATSHOTX1,
    S_FATSHOTX2,
    S_FATSHOTX3,
    S_FATT_STND,
    S_FATT_STND2,
    S_FATT_RUN1,
    S_FATT_RUN2,
    S_FATT_RUN3,
    S_FATT_RUN4,
    S_FATT_RUN5,
    S_FATT_RUN6,
    S_FATT_RUN7,
    S_FATT_RUN8,
    S_FATT_RUN9,
    S_FATT_RUN10,
    S_FATT_RUN11,
    S_FATT_RUN12,
    S_FATT_ATK1,
    S_FATT_ATK2,
    S_FATT_ATK3,
    S_FATT_ATK4,
    S_FATT_ATK5,
    S_FATT_ATK6,
    S_FATT_ATK7,
    S_FATT_ATK8,
    S_FATT_ATK9,
    S_FATT_ATK10,
    S_FATT_PAIN,
    S_FATT_PAIN2,
    S_FATT_DIE1,
    S_FATT_DIE2,
    S_FATT_DIE3,
    S_FATT_DIE4,
    S_FATT_DIE5,
    S_FATT_DIE6,
    S_FATT_DIE7,
    S_FATT_DIE8,
    S_FATT_DIE9,
    S_FATT_DIE10,
    S_FATT_RAISE1,
    S_FATT_RAISE2,
    S_FATT_RAISE3,
    S_FATT_RAISE4,
    S_FATT_RAISE5,
    S_FATT_RAISE6,
    S_FATT_RAISE7,
    S_FATT_RAISE8,
    S_CPOS_STND,
    S_CPOS_STND2,
    S_CPOS_RUN1,
    S_CPOS_RUN2,
    S_CPOS_RUN3,
    S_CPOS_RUN4,
    S_CPOS_RUN5,
    S_CPOS_RUN6,
    S_CPOS_RUN7,
    S_CPOS_RUN8,
    S_CPOS_ATK1,
    S_CPOS_ATK2,
    S_CPOS_ATK3,
    S_CPOS_ATK4,
    S_CPOS_PAIN,
    S_CPOS_PAIN2,
    S_CPOS_DIE1,
    S_CPOS_DIE2,
    S_CPOS_DIE3,
    S_CPOS_DIE4,
    S_CPOS_DIE5,
    S_CPOS_DIE6,
    S_CPOS_DIE7,
    S_CPOS_XDIE1,
    S_CPOS_XDIE2,
    S_CPOS_XDIE3,
    S_CPOS_XDIE4,
    S_CPOS_XDIE5,
    S_CPOS_XDIE6,
    S_CPOS_RAISE1,
    S_CPOS_RAISE2,
    S_CPOS_RAISE3,
    S_CPOS_RAISE4,
    S_CPOS_RAISE5,
    S_CPOS_RAISE6,
    S_CPOS_RAISE7,
    S_TROO_STND,
    S_TROO_STND2,
    S_TROO_RUN1,
    S_TROO_RUN2,
    S_TROO_RUN3,
    S_TROO_RUN4,
    S_TROO_RUN5,
    S_TROO_RUN6,
    S_TROO_RUN7,
    S_TROO_RUN8,
    S_TROO_ATK1,
    S_TROO_ATK2,
    S_TROO_ATK3,
    S_TROO_PAIN,
    S_TROO_PAIN2,
    S_TROO_DIE1,
    S_TROO_DIE2,
    S_TROO_DIE3,
    S_TROO_DIE4,
    S_TROO_DIE5,
    S_TROO_XDIE1,
    S_TROO_XDIE2,
    S_TROO_XDIE3,
    S_TROO_XDIE4,
    S_TROO_XDIE5,
    S_TROO_XDIE6,
    S_TROO_XDIE7,
    S_TROO_XDIE8,
    S_TROO_RAISE1,
    S_TROO_RAISE2,
    S_TROO_RAISE3,
    S_TROO_RAISE4,
    S_TROO_RAISE5,
    S_SARG_STND,
    S_SARG_STND2,
    S_SARG_RUN1,
    S_SARG_RUN2,
    S_SARG_RUN3,
    S_SARG_RUN4,
    S_SARG_RUN5,
    S_SARG_RUN6,
    S_SARG_RUN7,
    S_SARG_RUN8,
    S_SARG_ATK1,
    S_SARG_ATK2,
    S_SARG_ATK3,
    S_SARG_PAIN,
    S_SARG_PAIN2,
    S_SARG_DIE1,
    S_SARG_DIE2,
    S_SARG_DIE3,
    S_SARG_DIE4,
    S_SARG_DIE5,
    S_SARG_DIE6,
    S_SARG_RAISE1,
    S_SARG_RAISE2,
    S_SARG_RAISE3,
    S_SARG_RAISE4,
    S_SARG_RAISE5,
    S_SARG_RAISE6,
    S_HEAD_STND,
    S_HEAD_RUN1,
    S_HEAD_ATK1,
    S_HEAD_ATK2,
    S_HEAD_ATK3,
    S_HEAD_PAIN,
    S_HEAD_PAIN2,
    S_HEAD_PAIN3,
    S_HEAD_DIE1,
    S_HEAD_DIE2,
    S_HEAD_DIE3,
    S_HEAD_DIE4,
    S_HEAD_DIE5,
    S_HEAD_DIE6,
    S_HEAD_RAISE1,
    S_HEAD_RAISE2,
    S_HEAD_RAISE3,
    S_HEAD_RAISE4,
    S_HEAD_RAISE5,
    S_HEAD_RAISE6,
    S_BRBALL1,
    S_BRBALL2,
    S_BRBALLX1,
    S_BRBALLX2,
    S_BRBALLX3,
    S_BOSS_STND,
    S_BOSS_STND2,
    S_BOSS_RUN1,
    S_BOSS_RUN2,
    S_BOSS_RUN3,
    S_BOSS_RUN4,
    S_BOSS_RUN5,
    S_BOSS_RUN6,
    S_BOSS_RUN7,
    S_BOSS_RUN8,
    S_BOSS_ATK1,
    S_BOSS_ATK2,
    S_BOSS_ATK3,
    S_BOSS_PAIN,
    S_BOSS_PAIN2,
    S_BOSS_DIE1,
    S_BOSS_DIE2,
    S_BOSS_DIE3,
    S_BOSS_DIE4,
    S_BOSS_DIE5,
    S_BOSS_DIE6,
    S_BOSS_DIE7,
    S_BOSS_RAISE1,
    S_BOSS_RAISE2,
    S_BOSS_RAISE3,
    S_BOSS_RAISE4,
    S_BOSS_RAISE5,
    S_BOSS_RAISE6,
    S_BOSS_RAISE7,
    S_BOS2_STND,
    S_BOS2_STND2,
    S_BOS2_RUN1,
    S_BOS2_RUN2,
    S_BOS2_RUN3,
    S_BOS2_RUN4,
    S_BOS2_RUN5,
    S_BOS2_RUN6,
    S_BOS2_RUN7,
    S_BOS2_RUN8,
    S_BOS2_ATK1,
    S_BOS2_ATK2,
    S_BOS2_ATK3,
    S_BOS2_PAIN,
    S_BOS2_PAIN2,
    S_BOS2_DIE1,
    S_BOS2_DIE2,
    S_BOS2_DIE3,
    S_BOS2_DIE4,
    S_BOS2_DIE5,
    S_BOS2_DIE6,
    S_BOS2_DIE7,
    S_BOS2_RAISE1,
    S_BOS2_RAISE2,
    S_BOS2_RAISE3,
    S_BOS2_RAISE4,
    S_BOS2_RAISE5,
    S_BOS2_RAISE6,
    S_BOS2_RAISE7,
    S_SKULL_STND,
    S_SKULL_STND2,
    S_SKULL_RUN1,
    S_SKULL_RUN2,
    S_SKULL_ATK1,
    S_SKULL_ATK2,
    S_SKULL_ATK3,
    S_SKULL_ATK4,
    S_SKULL_PAIN,
    S_SKULL_PAIN2,
    S_SKULL_DIE1,
    S_SKULL_DIE2,
    S_SKULL_DIE3,
    S_SKULL_DIE4,
    S_SKULL_DIE5,
    S_SKULL_DIE6,
    S_SPID_STND,
    S_SPID_STND2,
    S_SPID_RUN1,
    S_SPID_RUN2,
    S_SPID_RUN3,
    S_SPID_RUN4,
    S_SPID_RUN5,
    S_SPID_RUN6,
    S_SPID_RUN7,
    S_SPID_RUN8,
    S_SPID_RUN9,
    S_SPID_RUN10,
    S_SPID_RUN11,
    S_SPID_RUN12,
    S_SPID_ATK1,
    S_SPID_ATK2,
    S_SPID_ATK3,
    S_SPID_ATK4,
    S_SPID_PAIN,
    S_SPID_PAIN2,
    S_SPID_DIE1,
    S_SPID_DIE2,
    S_SPID_DIE3,
    S_SPID_DIE4,
    S_SPID_DIE5,
    S_SPID_DIE6,
    S_SPID_DIE7,
    S_SPID_DIE8,
    S_SPID_DIE9,
    S_SPID_DIE10,
    S_SPID_DIE11,
    S_BSPI_STND,
    S_BSPI_STND2,
    S_BSPI_SIGHT,
    S_BSPI_RUN1,
    S_BSPI_RUN2,
    S_BSPI_RUN3,
    S_BSPI_RUN4,
    S_BSPI_RUN5,
    S_BSPI_RUN6,
    S_BSPI_RUN7,
    S_BSPI_RUN8,
    S_BSPI_RUN9,
    S_BSPI_RUN10,
    S_BSPI_RUN11,
    S_BSPI_RUN12,
    S_BSPI_ATK1,
    S_BSPI_ATK2,
    S_BSPI_ATK3,
    S_BSPI_ATK4,
    S_BSPI_PAIN,
    S_BSPI_PAIN2,
    S_BSPI_DIE1,
    S_BSPI_DIE2,
    S_BSPI_DIE3,
    S_BSPI_DIE4,
    S_BSPI_DIE5,
    S_BSPI_DIE6,
    S_BSPI_DIE7,
    S_BSPI_RAISE1,
    S_BSPI_RAISE2,
    S_BSPI_RAISE3,
    S_BSPI_RAISE4,
    S_BSPI_RAISE5,
    S_BSPI_RAISE6,
    S_BSPI_RAISE7,
    S_ARACH_PLAZ,
    S_ARACH_PLAZ2,
    S_ARACH_PLEX,
    S_ARACH_PLEX2,
    S_ARACH_PLEX3,
    S_ARACH_PLEX4,
    S_ARACH_PLEX5,
    S_CYBER_STND,
    S_CYBER_STND2,
    S_CYBER_RUN1,
    S_CYBER_RUN2,
    S_CYBER_RUN3,
    S_CYBER_RUN4,
    S_CYBER_RUN5,
    S_CYBER_RUN6,
    S_CYBER_RUN7,
    S_CYBER_RUN8,
    S_CYBER_ATK1,
    S_CYBER_ATK2,
    S_CYBER_ATK3,
    S_CYBER_ATK4,
    S_CYBER_ATK5,
    S_CYBER_ATK6,
    S_CYBER_PAIN,
    S_CYBER_DIE1,
    S_CYBER_DIE2,
    S_CYBER_DIE3,
    S_CYBER_DIE4,
    S_CYBER_DIE5,
    S_CYBER_DIE6,
    S_CYBER_DIE7,
    S_CYBER_DIE8,
    S_CYBER_DIE9,
    S_CYBER_DIE10,
    S_PAIN_STND,
    S_PAIN_RUN1,
    S_PAIN_RUN2,
    S_PAIN_RUN3,
    S_PAIN_RUN4,
    S_PAIN_RUN5,
    S_PAIN_RUN6,
    S_PAIN_ATK1,
    S_PAIN_ATK2,
    S_PAIN_ATK3,
    S_PAIN_ATK4,
    S_PAIN_PAIN,
    S_PAIN_PAIN2,
    S_PAIN_DIE1,
    S_PAIN_DIE2,
    S_PAIN_DIE3,
    S_PAIN_DIE4,
    S_PAIN_DIE5,
    S_PAIN_DIE6,
    S_PAIN_RAISE1,
    S_PAIN_RAISE2,
    S_PAIN_RAISE3,
    S_PAIN_RAISE4,
    S_PAIN_RAISE5,
    S_PAIN_RAISE6,
    S_SSWV_STND,
    S_SSWV_STND2,
    S_SSWV_RUN1,
    S_SSWV_RUN2,
    S_SSWV_RUN3,
    S_SSWV_RUN4,
    S_SSWV_RUN5,
    S_SSWV_RUN6,
    S_SSWV_RUN7,
    S_SSWV_RUN8,
    S_SSWV_ATK1,
    S_SSWV_ATK2,
    S_SSWV_ATK3,
    S_SSWV_ATK4,
    S_SSWV_ATK5,
    S_SSWV_ATK6,
    S_SSWV_PAIN,
    S_SSWV_PAIN2,
    S_SSWV_DIE1,
    S_SSWV_DIE2,
    S_SSWV_DIE3,
    S_SSWV_DIE4,
    S_SSWV_DIE5,
    S_SSWV_XDIE1,
    S_SSWV_XDIE2,
    S_SSWV_XDIE3,
    S_SSWV_XDIE4,
    S_SSWV_XDIE5,
    S_SSWV_XDIE6,
    S_SSWV_XDIE7,
    S_SSWV_XDIE8,
    S_SSWV_XDIE9,
    S_SSWV_RAISE1,
    S_SSWV_RAISE2,
    S_SSWV_RAISE3,
    S_SSWV_RAISE4,
    S_SSWV_RAISE5,
    S_KEENSTND,
    S_COMMKEEN,
    S_COMMKEEN2,
    S_COMMKEEN3,
    S_COMMKEEN4,
    S_COMMKEEN5,
    S_COMMKEEN6,
    S_COMMKEEN7,
    S_COMMKEEN8,
    S_COMMKEEN9,
    S_COMMKEEN10,
    S_COMMKEEN11,
    S_COMMKEEN12,
    S_KEENPAIN,
    S_KEENPAIN2,
    S_BRAIN,
    S_BRAIN_PAIN,
    S_BRAIN_DIE1,
    S_BRAIN_DIE2,
    S_BRAIN_DIE3,
    S_BRAIN_DIE4,
    S_BRAINEYE,
    S_BRAINEYESEE,
    S_BRAINEYE1,
    S_SPAWN1,
    S_SPAWN2,
    S_SPAWN3,
    S_SPAWN4,
    S_SPAWNFIRE1,
    S_SPAWNFIRE2,
    S_SPAWNFIRE3,
    S_SPAWNFIRE4,
    S_SPAWNFIRE5,
    S_SPAWNFIRE6,
    S_SPAWNFIRE7,
    S_SPAWNFIRE8,
    S_BRAINEXPLODE1,
    S_BRAINEXPLODE2,
    S_BRAINEXPLODE3,
    S_ARM1,
    S_ARM1A,
    S_ARM2,
    S_ARM2A,
    S_BAR1,
    S_BAR2,
    S_BEXP,
    S_BEXP2,
    S_BEXP3,
    S_BEXP4,
    S_BEXP5,
    S_BBAR1,
    S_BBAR2,
    S_BBAR3,
    S_BON1,
    S_BON1A,
    S_BON1B,
    S_BON1C,
    S_BON1D,
    S_BON1E,
    S_BON2,
    S_BON2A,
    S_BON2B,
    S_BON2C,
    S_BON2D,
    S_BON2E,
    S_BKEY,
    S_BKEY2,
    S_RKEY,
    S_RKEY2,
    S_YKEY,
    S_YKEY2,
    S_BSKULL,
    S_BSKULL2,
    S_RSKULL,
    S_RSKULL2,
    S_YSKULL,
    S_YSKULL2,
    S_STIM,
    S_MEDI,
    S_SOUL,
    S_SOUL2,
    S_SOUL3,
    S_SOUL4,
    S_SOUL5,
    S_SOUL6,
    S_PINV,
    S_PINV2,
    S_PINV3,
    S_PINV4,
    S_PSTR,
    S_PINS,
    S_PINS2,
    S_PINS3,
    S_PINS4,
    S_MEGA,
    S_MEGA2,
    S_MEGA3,
    S_MEGA4,
    S_SUIT,
    S_PMAP,
    S_PMAP2,
    S_PMAP3,
    S_PMAP4,
    S_PMAP5,
    S_PMAP6,
    S_PVIS,
    S_PVIS2,
    S_CLIP,
    S_AMMO,
    S_ROCK,
    S_BROK,
    S_CELL,
    S_CELP,
    S_SHEL,
    S_SBOX,
    S_BPAK,
    S_BFUG,
    S_MGUN,
    S_CSAW,
    S_LAUN,
    S_PLAS,
    S_SHOT,
    S_SHOT2,
    S_COLU,
    S_STALAG,
    S_BLOODYTWITCH,
    S_BLOODYTWITCH2,
    S_BLOODYTWITCH3,
    S_BLOODYTWITCH4,
    S_DEADTORSO,
    S_DEADBOTTOM,
    S_HEADSONSTICK,
    S_GIBS,
    S_HEADONASTICK,
    S_HEADCANDLES,
    S_HEADCANDLES2,
    S_DEADSTICK,
    S_LIVESTICK,
    S_LIVESTICK2,
    S_MEAT2,
    S_MEAT3,
    S_MEAT4,
    S_MEAT5,
    S_STALAGTITE,
    S_TALLGRNCOL,
    S_SHRTGRNCOL,
    S_TALLREDCOL,
    S_SHRTREDCOL,
    S_CANDLESTIK,
    S_CANDELABRA,
    S_SKULLCOL,
    S_TORCHTREE,
    S_BIGTREE,
    S_TECHPILLAR,
    S_EVILEYE,
    S_EVILEYE2,
    S_EVILEYE3,
    S_EVILEYE4,
    S_FLOATSKULL,
    S_FLOATSKULL2,
    S_FLOATSKULL3,
    S_HEARTCOL,
    S_HEARTCOL2,
    S_BLUETORCH,
    S_BLUETORCH2,
    S_BLUETORCH3,
    S_BLUETORCH4,
    S_GREENTORCH,
    S_GREENTORCH2,
    S_GREENTORCH3,
    S_GREENTORCH4,
    S_REDTORCH,
    S_REDTORCH2,
    S_REDTORCH3,
    S_REDTORCH4,
    S_BTORCHSHRT,
    S_BTORCHSHRT2,
    S_BTORCHSHRT3,
    S_BTORCHSHRT4,
    S_GTORCHSHRT,
    S_GTORCHSHRT2,
    S_GTORCHSHRT3,
    S_GTORCHSHRT4,
    S_RTORCHSHRT,
    S_RTORCHSHRT2,
    S_RTORCHSHRT3,
    S_RTORCHSHRT4,
    S_HANGNOGUTS,
    S_HANGBNOBRAIN,
    S_HANGTLOOKDN,
    S_HANGTSKULL,
    S_HANGTLOOKUP,
    S_HANGTNOBRAIN,
    S_COLONGIBS,
    S_SMALLPOOL,
    S_BRAINSTEM,
    S_TECHLAMP,
    S_TECHLAMP2,
    S_TECHLAMP3,
    S_TECHLAMP4,
    S_TECH2LAMP,
    S_TECH2LAMP2,
    S_TECH2LAMP3,
    S_TECH2LAMP4,
    NUMSTATES
  );

  state_t = record
    sprite: spritenum_t;
    frame: longint;
    tics: longint;
  // void    (*action) ();
    nextstate: statenum_t;
    misc1,
    misc2: longint;
  end;

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
    raisestate: integer;
  end;

var
  sprNamesLookUp: array [0..ord(NUMSPRITES) - 1] of TLookUpRec;

const
  sprnames: array[0..ord(NUMSPRITES) - 1] of TSprite = (
    (Name: 'TROO'; Width: 64; Height: 57),
    (Name: 'SHTG'; Width: -1; Height: -1),
    (Name: 'PUNG'; Width: -1; Height: -1),
    (Name: 'PISG'; Width: -1; Height: -1),
    (Name: 'PISF'; Width: -1; Height: -1),
    (Name: 'SHTF'; Width: -1; Height: -1),
    (Name: 'SHT2'; Width: -1; Height: -1),
    (Name: 'CHGG'; Width: -1; Height: -1),
    (Name: 'CHGF'; Width: -1; Height: -1),
    (Name: 'MISG'; Width: -1; Height: -1),

    (Name: 'MISF'; Width: -1; Height: -1),
    (Name: 'SAWG'; Width: -1; Height: -1),
    (Name: 'PLSG'; Width: -1; Height: -1),
    (Name: 'PLSF'; Width: -1; Height: -1),
    (Name: 'BFGG'; Width: -1; Height: -1),
    (Name: 'BFGF'; Width: -1; Height: -1),
    (Name: 'BLUD'; Width: -1; Height: -1),
    (Name: 'PUFF'; Width: -1; Height: -1),
    (Name: 'BAL1'; Width: -1; Height: -1),
    (Name: 'BAL2'; Width: -1; Height: -1),

    (Name: 'PLSS'; Width: -1; Height: -1),
    (Name: 'PLSE'; Width: -1; Height: -1),
    (Name: 'MISL'; Width: -1; Height: -1),
    (Name: 'BFS1'; Width: -1; Height: -1),
    (Name: 'BFE1'; Width: -1; Height: -1),
    (Name: 'BFE2'; Width: -1; Height: -1),
    (Name: 'TFOG'; Width: -1; Height: -1),
    (Name: 'IFOG'; Width: -1; Height: -1),
    (Name: 'PLAY'; Width: 64; Height: 56),
    (Name: 'POSS'; Width: 64; Height: 55),

    (Name: 'SPOS'; Width: 64; Height: 55),
    (Name: 'VILE'; Width: 80; Height: 76),
    (Name: 'FIRE'; Width: -1; Height: -1),
    (Name: 'FATB'; Width: -1; Height: -1),
    (Name: 'FBXP'; Width: -1; Height: -1),
    (Name: 'SKEL'; Width: 64; Height: 90),
    (Name: 'MANF'; Width: -1; Height: -1),
    (Name: 'FATT'; Width: 80; Height: 66),
    (Name: 'CPOS'; Width: 42; Height: 59),
    (Name: 'SARG'; Width: 40; Height: 56),

    (Name: 'HEAD'; Width: 80; Height: 66),
    (Name: 'BAL7'; Width: -1; Height: -1),
    (Name: 'BOSS'; Width: 44; Height: 76),
    (Name: 'BOS2'; Width: 41; Height: 73),
    (Name: 'SKUL'; Width: 68; Height: 33),
    (Name: 'SPID'; Width:256; Height:110),
    (Name: 'BSPI'; Width: 99; Height: 55),
    (Name: 'APLS'; Width: -1; Height: -1),
    (Name: 'APBX'; Width: -1; Height: -1),
    (Name: 'CYBR'; Width: 82; Height:110),

    (Name: 'PAIN'; Width: 42; Height: 59),
    (Name: 'SSWV'; Width: 33; Height: 56),
    (Name: 'KEEN'; Width: 16; Height: 51),
    (Name: 'BBRN'; Width: 64; Height:110),
    (Name: 'BOSF'; Width: -1; Height: -1),
    (Name: 'ARM1'; Width: 32; Height: 17),
    (Name: 'ARM2'; Width: 32; Height: 17),
    (Name: 'BAR1'; Width: 32; Height: 32),
    (Name: 'BEXP'; Width: -1; Height: -1),
    (Name: 'FCAN'; Width: 37; Height: 53),

    (Name: 'BON1'; Width: 16; Height: 18),
    (Name: 'BON2'; Width: 16; Height: 16),
    (Name: 'BKEY'; Width: 16; Height: 16),
    (Name: 'RKEY'; Width: 16; Height: 16),
    (Name: 'YKEY'; Width: 16; Height: 16),
    (Name: 'BSKU'; Width: 16; Height: 16),
    (Name: 'RSKU'; Width: 16; Height: 16),
    (Name: 'YSKU'; Width: 16; Height: 16),
    (Name: 'STIM'; Width: 16; Height: 15),
    (Name: 'MEDI'; Width: 32; Height: 19),

    (Name: 'SOUL'; Width: 32; Height: 32),
    (Name: 'PINV'; Width: 25; Height: 25),
    (Name: 'PSTR'; Width: 32; Height: 19),
    (Name: 'PINS'; Width: 25; Height: 25),
    (Name: 'MEGA'; Width: 30; Height: 26),
    (Name: 'SUIT'; Width: 24; Height: 47),
    (Name: 'PMAP'; Width: 28; Height: 27),
    (Name: 'PVIS'; Width: 28; Height: 13),
    (Name: 'CLIP'; Width: 16; Height: 11),
    (Name: 'AMMO'; Width: 32; Height: 16),

    (Name: 'ROCK'; Width: 12; Height: 27),
    (Name: 'BROK'; Width: 64; Height: 21),
    (Name: 'CELL'; Width: 32; Height: 12),
    (Name: 'CELP'; Width: 32; Height: 21),
    (Name: 'SHEL'; Width: 32; Height:  7),
    (Name: 'SBOX'; Width: 32; Height: 12),
    (Name: 'BPAK'; Width: 32; Height: 29),
    (Name: 'BFUG'; Width: 64; Height: 33),
    (Name: 'MGUN'; Width: 64; Height: 16),
    (Name: 'CSAW'; Width: 64; Height: 24),

    (Name: 'LAUN'; Width: 64; Height: 16),
    (Name: 'PLAS'; Width: 64; Height: 16),
    (Name: 'SHOT'; Width: 64; Height: 12),
    (Name: 'SGN2'; Width: 64; Height: 16),
    (Name: 'COLU'; Width: 32; Height: 48),
    (Name: 'SMT2'; Width: -1; Height: -1),
    (Name: 'GOR1'; Width: 64; Height: 68),
    (Name: 'POL2'; Width: 41; Height: 67),
    (Name: 'POL5'; Width: 64; Height: 10),
    (Name: 'POL4'; Width: 41; Height: 56),

    (Name: 'POL3'; Width: 41; Height: 43),
    (Name: 'POL1'; Width: 40; Height: 66),
    (Name: 'POL6'; Width: 38; Height: 66),
    (Name: 'GOR2'; Width: 41; Height: 84),
    (Name: 'GOR3'; Width: 39; Height: 79),
    (Name: 'GOR4'; Width: 18; Height: 67),
    (Name: 'GOR5'; Width: 16; Height: 53),
    (Name: 'SMIT'; Width: 47; Height: 47),
    (Name: 'COL1'; Width: -1; Height: -1),
    (Name: 'COL2'; Width: 35; Height: 40),

    (Name: 'COL3'; Width: 64; Height: 53),
    (Name: 'COL4'; Width: 64; Height: 40),
    (Name: 'CAND'; Width: 16; Height: 15),
    (Name: 'CBRA'; Width: 32; Height: 61),
    (Name: 'COL6'; Width: 64; Height: 49),
    (Name: 'TRE1'; Width: 51; Height: 70),
    (Name: 'TRE2'; Width:124; Height:124),
    (Name: 'ELEC'; Width: 64; Height:128),
    (Name: 'CEYE'; Width: 64; Height: 60),
    (Name: 'FSKU'; Width: -1; Height: -1),

    (Name: 'COL5'; Width: 35; Height: 45),
    (Name: 'TBLU'; Width: 26; Height: 96),
    (Name: 'TGRN'; Width: 26; Height: 96),
    (Name: 'TRED'; Width: 26; Height: 96),
    (Name: 'SMBT'; Width: 18; Height: 73),
    (Name: 'SMGT'; Width: 18; Height: 73),
    (Name: 'SMRT'; Width: 18; Height: 73),
    (Name: 'HDB1'; Width: 22; Height: 88),
    (Name: 'HDB2'; Width: 22; Height: 85),
    (Name: 'HDB3'; Width: 22; Height: 64),

    (Name: 'HDB4'; Width: 22; Height: 64),
    (Name: 'HDB5'; Width: 22; Height: 57),
    (Name: 'HDB6'; Width: -1; Height: -1),
    (Name: 'POB1'; Width: 64; Height:  8),
    (Name: 'POB2'; Width: 32; Height:  3),
    (Name: 'BRS1'; Width: -1; Height: -1),
    (Name: 'TLMP'; Width: -1; Height: -1),
    (Name: 'TLP2'; Width: -1; Height: -1)
  );

type
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

function GetThingTextureAnimLength(const th: integer): integer;

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
    raisestate: integer): mobjinfo_t;

procedure Initialize;

procedure Finalize;

const
  DoomFlatAnims: array[0..8] of TTextureAnim = (
    (NumAnims: 3; Speed: 8; Anims: ('NUKAGE1', 'NUKAGE2', 'NUKAGE3', '', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('FWATER1', 'FWATER2', 'FWATER3', 'FWATER4', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('SWATER1', 'SWATER2', 'SWATER3', 'SWATER4', '', '', '', '')),
    (NumAnims: 3; Speed: 8; Anims: ('BLOOD1',  'BLOOD2',  'BLOOD3',  '', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('RROCK05', 'RROCK06', 'RROCK07', 'RROCK08', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('SLIME01', 'SLIME02', 'SLIME03', 'SLIME04', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('SLIME05', 'SLIME06', 'SLIME07', 'SLIME08', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('SLIME09', 'SLIME10', 'SLIME11', 'SLIME12', '', '', '', '')),
    (NumAnims: 0; Speed:-1; Anims: ('',        '',        '',        '', '', '', '', ''))
  );

  DoomWallAnims: array[0..13] of TTextureAnim = (
    (NumAnims: 4; Speed: 8; Anims: ('BLODGR1',  'BLODGR2',  'BLODGR3',  'BLODGR4', '', '', '', '')),
    (NumAnims: 3; Speed: 8; Anims: ('SLADRIP1', 'SLADRIP2', 'SLADRIP3', '', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('BLODRIP1', 'BLODRIP2', 'BLODRIP3', 'BLODRIP4', '', '', '', '')),
    (NumAnims: 3; Speed: 8; Anims: ('FIREWALA', 'FIREWALB', 'FIREWALL', '', '', '', '', '')),
    (NumAnims: 3; Speed: 8; Anims: ('GSTFONT1', 'GSTFONT2', 'GSTFONT3', '', '', '', '', '')),
    (NumAnims: 2; Speed: 8; Anims: ('FIRELAV3', 'FIRELAVA', '', '', '', '', '', '')),
    (NumAnims: 3; Speed: 8; Anims: ('FIREMAG1', 'FIREMAG2', 'FIREMAG3', '', '', '', '', '')),
    (NumAnims: 2; Speed: 8; Anims: ('FIREBLU1', 'FIREBLU2', '', '', '', '', '', '')),
    (NumAnims: 3; Speed: 8; Anims: ('ROCKRED1', 'ROCKRED2', 'ROCKRED3', '', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('BFALL1',   'BFALL2',   'BFALL3',   'BFALL4', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('SFALL1',   'SFALL2',   'SFALL3',   'SFALL4', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('WFALL1',   'WFALL2',   'WFALL3',   'WFALL4', '', '', '', '')),
    (NumAnims: 4; Speed: 8; Anims: ('DBRAIN1',  'DBRAIN2',  'DBRAIN3',  'DBRAIN4', '', '', '', '')),
    (NumAnims: 0; Speed:-1; Anims: ('',        '',        '',        '', '', '', '', ''))
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

{function GetThingTextureSubFix(const th: integer; var txName: string): integer;
var i: integer;
begin
  for i := 0 to ord(NUMMOBJTYPES) - 1 do
    if mobjinfo[i].doomednum = th then
    begin
      txName := sprnames[ord(states[mobjinfo[i].spawnstate].sprite)].Name;
      Result := i;
      exit;
    end;
  Result := -1;
  txName := '';
end;}


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
    raisestate: integer): mobjinfo_t;
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
  Result.raisestate := raisestate;
end;

var
  IsInitialized: boolean;

procedure Initialize;
var
  i: integer;
begin
  if IsInitialized then exit;

  GetMem(states, ord(NUMSTATES) * SizeOf(state_t));

  states[0] := MakeState(SPR_TROO,0,-1, S_NULL, 0, 0);  // S_NULL
  states[1] := MakeState(SPR_SHTG,4,0 {A_Light0},S_NULL, 0, 0);  // S_LIGHTDONE
  states[2] := MakeState(SPR_PUNG,0,1 {A_WeaponReady},S_PUNCH, 0, 0);  // S_PUNCH
  states[3] := MakeState(SPR_PUNG,0,1 {A_Lower},S_PUNCHDOWN, 0, 0);  // S_PUNCHDOWN
  states[4] := MakeState(SPR_PUNG,0,1 {A_Raise},S_PUNCHUP, 0, 0);  // S_PUNCHUP
  states[5] := MakeState(SPR_PUNG,1,4, S_PUNCH2, 0, 0);    // S_PUNCH1
  states[6] := MakeState(SPR_PUNG,2,4 {A_Punch},S_PUNCH3, 0, 0);  // S_PUNCH2
  states[7] := MakeState(SPR_PUNG,3,5, S_PUNCH4, 0, 0);    // S_PUNCH3
  states[8] := MakeState(SPR_PUNG,2,4, S_PUNCH5, 0, 0);    // S_PUNCH4
  states[9] := MakeState(SPR_PUNG,1,5 {A_ReFire},S_PUNCH, 0, 0);  // S_PUNCH5
  states[10] := MakeState(SPR_PISG,0,1 {A_WeaponReady},S_PISTOL, 0, 0);// S_PISTOL
  states[11] := MakeState(SPR_PISG,0,1 {A_Lower},S_PISTOLDOWN, 0, 0);  // S_PISTOLDOWN
  states[12] := MakeState(SPR_PISG,0,1 {A_Raise},S_PISTOLUP, 0, 0);  // S_PISTOLUP
  states[13] := MakeState(SPR_PISG,0,4, S_PISTOL2, 0, 0);  // S_PISTOL1
  states[14] := MakeState(SPR_PISG,1,6 {A_FirePistol},S_PISTOL3, 0, 0);// S_PISTOL2
  states[15] := MakeState(SPR_PISG,2,4, S_PISTOL4, 0, 0);  // S_PISTOL3
  states[16] := MakeState(SPR_PISG,1,5 {A_ReFire},S_PISTOL, 0, 0);  // S_PISTOL4
  states[17] := MakeState(SPR_PISF,32768,7 {A_Light1},S_LIGHTDONE, 0, 0);  // S_PISTOLFLASH
  states[18] := MakeState(SPR_SHTG,0,1 {A_WeaponReady},S_SGUN, 0, 0);  // S_SGUN
  states[19] := MakeState(SPR_SHTG,0,1 {A_Lower},S_SGUNDOWN, 0, 0);  // S_SGUNDOWN
  states[20] := MakeState(SPR_SHTG,0,1 {A_Raise},S_SGUNUP, 0, 0);  // S_SGUNUP
  states[21] := MakeState(SPR_SHTG,0,3, S_SGUN2, 0, 0);  // S_SGUN1
  states[22] := MakeState(SPR_SHTG,0,7 {A_FireShotgun},S_SGUN3, 0, 0);  // S_SGUN2
  states[23] := MakeState(SPR_SHTG,1,5, S_SGUN4, 0, 0);  // S_SGUN3
  states[24] := MakeState(SPR_SHTG,2,5, S_SGUN5, 0, 0);  // S_SGUN4
  states[25] := MakeState(SPR_SHTG,3,4, S_SGUN6, 0, 0);  // S_SGUN5
  states[26] := MakeState(SPR_SHTG,2,5, S_SGUN7, 0, 0);  // S_SGUN6
  states[27] := MakeState(SPR_SHTG,1,5, S_SGUN8, 0, 0);  // S_SGUN7
  states[28] := MakeState(SPR_SHTG,0,3, S_SGUN9, 0, 0);  // S_SGUN8
  states[29] := MakeState(SPR_SHTG,0,7 {A_ReFire},S_SGUN, 0, 0);  // S_SGUN9
  states[30] := MakeState(SPR_SHTF,32768,4 {A_Light1},S_SGUNFLASH2, 0, 0);  // S_SGUNFLASH1
  states[31] := MakeState(SPR_SHTF,32769,3 {A_Light2},S_LIGHTDONE, 0, 0);  // S_SGUNFLASH2
  states[32] := MakeState(SPR_SHT2,0,1 {A_WeaponReady},S_DSGUN, 0, 0);  // S_DSGUN
  states[33] := MakeState(SPR_SHT2,0,1 {A_Lower},S_DSGUNDOWN, 0, 0);  // S_DSGUNDOWN
  states[34] := MakeState(SPR_SHT2,0,1 {A_Raise},S_DSGUNUP, 0, 0);  // S_DSGUNUP
  states[35] := MakeState(SPR_SHT2,0,3, S_DSGUN2, 0, 0);  // S_DSGUN1
  states[36] := MakeState(SPR_SHT2,0,7 {A_FireShotgun2},S_DSGUN3, 0, 0);  // S_DSGUN2
  states[37] := MakeState(SPR_SHT2,1,7, S_DSGUN4, 0, 0);  // S_DSGUN3
  states[38] := MakeState(SPR_SHT2,2,7 {A_CheckReload},S_DSGUN5, 0, 0);  // S_DSGUN4
  states[39] := MakeState(SPR_SHT2,3,7 {A_OpenShotgun2},S_DSGUN6, 0, 0);  // S_DSGUN5
  states[40] := MakeState(SPR_SHT2,4,7, S_DSGUN7, 0, 0);  // S_DSGUN6
  states[41] := MakeState(SPR_SHT2,5,7 {A_LoadShotgun2},S_DSGUN8, 0, 0);  // S_DSGUN7
  states[42] := MakeState(SPR_SHT2,6,6, S_DSGUN9, 0, 0);  // S_DSGUN8
  states[43] := MakeState(SPR_SHT2,7,6 {A_CloseShotgun2},S_DSGUN10, 0, 0);  // S_DSGUN9
  states[44] := MakeState(SPR_SHT2,0,5 {A_ReFire},S_DSGUN, 0, 0);  // S_DSGUN10
  states[45] := MakeState(SPR_SHT2,1,7, S_DSNR2, 0, 0);  // S_DSNR1
  states[46] := MakeState(SPR_SHT2,0,3, S_DSGUNDOWN, 0, 0);  // S_DSNR2
  states[47] := MakeState(SPR_SHT2,32776,5 {A_Light1},S_DSGUNFLASH2, 0, 0);  // S_DSGUNFLASH1
  states[48] := MakeState(SPR_SHT2,32777,4 {A_Light2},S_LIGHTDONE, 0, 0);  // S_DSGUNFLASH2
  states[49] := MakeState(SPR_CHGG,0,1 {A_WeaponReady},S_CHAIN, 0, 0);  // S_CHAIN
  states[50] := MakeState(SPR_CHGG,0,1 {A_Lower},S_CHAINDOWN, 0, 0);  // S_CHAINDOWN
  states[51] := MakeState(SPR_CHGG,0,1 {A_Raise},S_CHAINUP, 0, 0);  // S_CHAINUP
  states[52] := MakeState(SPR_CHGG,0,4 {A_FireCGun},S_CHAIN2, 0, 0);  // S_CHAIN1
  states[53] := MakeState(SPR_CHGG,1,4 {A_FireCGun},S_CHAIN3, 0, 0);  // S_CHAIN2
  states[54] := MakeState(SPR_CHGG,1,0 {A_ReFire},S_CHAIN, 0, 0);  // S_CHAIN3
  states[55] := MakeState(SPR_CHGF,32768,5 {A_Light1},S_LIGHTDONE, 0, 0);  // S_CHAINFLASH1
  states[56] := MakeState(SPR_CHGF,32769,5 {A_Light2},S_LIGHTDONE, 0, 0);  // S_CHAINFLASH2
  states[57] := MakeState(SPR_MISG,0,1 {A_WeaponReady},S_MISSILE, 0, 0);  // S_MISSILE
  states[58] := MakeState(SPR_MISG,0,1 {A_Lower},S_MISSILEDOWN, 0, 0);  // S_MISSILEDOWN
  states[59] := MakeState(SPR_MISG,0,1 {A_Raise},S_MISSILEUP, 0, 0);  // S_MISSILEUP
  states[60] := MakeState(SPR_MISG,1,8 {A_GunFlash},S_MISSILE2, 0, 0);  // S_MISSILE1
  states[61] := MakeState(SPR_MISG,1,12 {A_FireMissile},S_MISSILE3, 0, 0);  // S_MISSILE2
  states[62] := MakeState(SPR_MISG,1,0 {A_ReFire},S_MISSILE, 0, 0);  // S_MISSILE3
  states[63] := MakeState(SPR_MISF,32768,3 {A_Light1},S_MISSILEFLASH2, 0, 0);  // S_MISSILEFLASH1
  states[64] := MakeState(SPR_MISF,32769,4, S_MISSILEFLASH3, 0, 0);  // S_MISSILEFLASH2
  states[65] := MakeState(SPR_MISF,32770,4 {A_Light2},S_MISSILEFLASH4, 0, 0);  // S_MISSILEFLASH3
  states[66] := MakeState(SPR_MISF,32771,4 {A_Light2},S_LIGHTDONE, 0, 0);  // S_MISSILEFLASH4
  states[67] := MakeState(SPR_SAWG,2,4 {A_WeaponReady},S_SAWB, 0, 0);  // S_SAW
  states[68] := MakeState(SPR_SAWG,3,4 {A_WeaponReady},S_SAW, 0, 0);  // S_SAWB
  states[69] := MakeState(SPR_SAWG,2,1 {A_Lower},S_SAWDOWN, 0, 0);  // S_SAWDOWN
  states[70] := MakeState(SPR_SAWG,2,1 {A_Raise},S_SAWUP, 0, 0);  // S_SAWUP
  states[71] := MakeState(SPR_SAWG,0,4 {A_Saw},S_SAW2, 0, 0);  // S_SAW1
  states[72] := MakeState(SPR_SAWG,1,4 {A_Saw},S_SAW3, 0, 0);  // S_SAW2
  states[73] := MakeState(SPR_SAWG,1,0 {A_ReFire},S_SAW, 0, 0);  // S_SAW3
  states[74] := MakeState(SPR_PLSG,0,1 {A_WeaponReady},S_PLASMA, 0, 0);  // S_PLASMA
  states[75] := MakeState(SPR_PLSG,0,1 {A_Lower},S_PLASMADOWN, 0, 0);  // S_PLASMADOWN
  states[76] := MakeState(SPR_PLSG,0,1 {A_Raise},S_PLASMAUP, 0, 0);  // S_PLASMAUP
  states[77] := MakeState(SPR_PLSG,0,3 {A_FirePlasma},S_PLASMA2, 0, 0);  // S_PLASMA1
  states[78] := MakeState(SPR_PLSG,1,20 {A_ReFire},S_PLASMA, 0, 0);  // S_PLASMA2
  states[79] := MakeState(SPR_PLSF,32768,4 {A_Light1},S_LIGHTDONE, 0, 0);  // S_PLASMAFLASH1
  states[80] := MakeState(SPR_PLSF,32769,4 {A_Light1},S_LIGHTDONE, 0, 0);  // S_PLASMAFLASH2
  states[81] := MakeState(SPR_BFGG,0,1 {A_WeaponReady},S_BFG, 0, 0);  // S_BFG
  states[82] := MakeState(SPR_BFGG,0,1 {A_Lower},S_BFGDOWN, 0, 0);  // S_BFGDOWN
  states[83] := MakeState(SPR_BFGG,0,1 {A_Raise},S_BFGUP, 0, 0);  // S_BFGUP
  states[84] := MakeState(SPR_BFGG,0,20 {A_BFGsound},S_BFG2, 0, 0);  // S_BFG1
  states[85] := MakeState(SPR_BFGG,1,10 {A_GunFlash},S_BFG3, 0, 0);  // S_BFG2
  states[86] := MakeState(SPR_BFGG,1,10 {A_FireBFG},S_BFG4, 0, 0);  // S_BFG3
  states[87] := MakeState(SPR_BFGG,1,20 {A_ReFire},S_BFG, 0, 0);  // S_BFG4
  states[88] := MakeState(SPR_BFGF,32768,11 {A_Light1},S_BFGFLASH2, 0, 0);  // S_BFGFLASH1
  states[89] := MakeState(SPR_BFGF,32769,6 {A_Light2},S_LIGHTDONE, 0, 0);  // S_BFGFLASH2
  states[90] := MakeState(SPR_BLUD,2,8, S_BLOOD2, 0, 0);  // S_BLOOD1
  states[91] := MakeState(SPR_BLUD,1,8, S_BLOOD3, 0, 0);  // S_BLOOD2
  states[92] := MakeState(SPR_BLUD,0,8, S_NULL, 0, 0);  // S_BLOOD3
  states[93] := MakeState(SPR_PUFF,32768,4, S_PUFF2, 0, 0);  // S_PUFF1
  states[94] := MakeState(SPR_PUFF,1,4, S_PUFF3, 0, 0);  // S_PUFF2
  states[95] := MakeState(SPR_PUFF,2,4, S_PUFF4, 0, 0);  // S_PUFF3
  states[96] := MakeState(SPR_PUFF,3,4, S_NULL, 0, 0);  // S_PUFF4
  states[97] := MakeState(SPR_BAL1,32768,4, S_TBALL2, 0, 0);  // S_TBALL1
  states[98] := MakeState(SPR_BAL1,32769,4, S_TBALL1, 0, 0);  // S_TBALL2
  states[99] := MakeState(SPR_BAL1,32770,6, S_TBALLX2, 0, 0);  // S_TBALLX1
  states[100] := MakeState(SPR_BAL1,32771,6, S_TBALLX3, 0, 0);  // S_TBALLX2
  states[101] := MakeState(SPR_BAL1,32772,6, S_NULL, 0, 0);  // S_TBALLX3
  states[102] := MakeState(SPR_BAL2,32768,4, S_RBALL2, 0, 0);  // S_RBALL1
  states[103] := MakeState(SPR_BAL2,32769,4, S_RBALL1, 0, 0);  // S_RBALL2
  states[104] := MakeState(SPR_BAL2,32770,6, S_RBALLX2, 0, 0);  // S_RBALLX1
  states[105] := MakeState(SPR_BAL2,32771,6, S_RBALLX3, 0, 0);  // S_RBALLX2
  states[106] := MakeState(SPR_BAL2,32772,6, S_NULL, 0, 0);  // S_RBALLX3
  states[107] := MakeState(SPR_PLSS,32768,6, S_PLASBALL2, 0, 0);  // S_PLASBALL
  states[108] := MakeState(SPR_PLSS,32769,6, S_PLASBALL, 0, 0);  // S_PLASBALL2
  states[109] := MakeState(SPR_PLSE,32768,4, S_PLASEXP2, 0, 0);  // S_PLASEXP
  states[110] := MakeState(SPR_PLSE,32769,4, S_PLASEXP3, 0, 0);  // S_PLASEXP2
  states[111] := MakeState(SPR_PLSE,32770,4, S_PLASEXP4, 0, 0);  // S_PLASEXP3
  states[112] := MakeState(SPR_PLSE,32771,4, S_PLASEXP5, 0, 0);  // S_PLASEXP4
  states[113] := MakeState(SPR_PLSE,32772,4, S_NULL, 0, 0);  // S_PLASEXP5
  states[114] := MakeState(SPR_MISL,32768,1, S_ROCKET, 0, 0);  // S_ROCKET
  states[115] := MakeState(SPR_BFS1,32768,4, S_BFGSHOT2, 0, 0);  // S_BFGSHOT
  states[116] := MakeState(SPR_BFS1,32769,4, S_BFGSHOT, 0, 0);  // S_BFGSHOT2
  states[117] := MakeState(SPR_BFE1,32768,8, S_BFGLAND2, 0, 0);  // S_BFGLAND
  states[118] := MakeState(SPR_BFE1,32769,8, S_BFGLAND3, 0, 0);  // S_BFGLAND2
  states[119] := MakeState(SPR_BFE1,32770,8 {A_BFGSpray},S_BFGLAND4, 0, 0);  // S_BFGLAND3
  states[120] := MakeState(SPR_BFE1,32771,8, S_BFGLAND5, 0, 0);  // S_BFGLAND4
  states[121] := MakeState(SPR_BFE1,32772,8, S_BFGLAND6, 0, 0);  // S_BFGLAND5
  states[122] := MakeState(SPR_BFE1,32773,8, S_NULL, 0, 0);  // S_BFGLAND6
  states[123] := MakeState(SPR_BFE2,32768,8, S_BFGEXP2, 0, 0);  // S_BFGEXP
  states[124] := MakeState(SPR_BFE2,32769,8, S_BFGEXP3, 0, 0);  // S_BFGEXP2
  states[125] := MakeState(SPR_BFE2,32770,8, S_BFGEXP4, 0, 0);  // S_BFGEXP3
  states[126] := MakeState(SPR_BFE2,32771,8, S_NULL, 0, 0);  // S_BFGEXP4
  states[127] := MakeState(SPR_MISL,32769,8 {A_Explode},S_EXPLODE2, 0, 0);  // S_EXPLODE1
  states[128] := MakeState(SPR_MISL,32770,6, S_EXPLODE3, 0, 0);  // S_EXPLODE2
  states[129] := MakeState(SPR_MISL,32771,4, S_NULL, 0, 0);  // S_EXPLODE3
  states[130] := MakeState(SPR_TFOG,32768,6, S_TFOG01, 0, 0);  // S_TFOG
  states[131] := MakeState(SPR_TFOG,32769,6, S_TFOG02, 0, 0);  // S_TFOG01
  states[132] := MakeState(SPR_TFOG,32768,6, S_TFOG2, 0, 0);  // S_TFOG02
  states[133] := MakeState(SPR_TFOG,32769,6, S_TFOG3, 0, 0);  // S_TFOG2
  states[134] := MakeState(SPR_TFOG,32770,6, S_TFOG4, 0, 0);  // S_TFOG3
  states[135] := MakeState(SPR_TFOG,32771,6, S_TFOG5, 0, 0);  // S_TFOG4
  states[136] := MakeState(SPR_TFOG,32772,6, S_TFOG6, 0, 0);  // S_TFOG5
  states[137] := MakeState(SPR_TFOG,32773,6, S_TFOG7, 0, 0);  // S_TFOG6
  states[138] := MakeState(SPR_TFOG,32774,6, S_TFOG8, 0, 0);  // S_TFOG7
  states[139] := MakeState(SPR_TFOG,32775,6, S_TFOG9, 0, 0);  // S_TFOG8
  states[140] := MakeState(SPR_TFOG,32776,6, S_TFOG10, 0, 0);  // S_TFOG9
  states[141] := MakeState(SPR_TFOG,32777,6, S_NULL, 0, 0);  // S_TFOG10
  states[142] := MakeState(SPR_IFOG,32768,6, S_IFOG01, 0, 0);  // S_IFOG
  states[143] := MakeState(SPR_IFOG,32769,6, S_IFOG02, 0, 0);  // S_IFOG01
  states[144] := MakeState(SPR_IFOG,32768,6, S_IFOG2, 0, 0);  // S_IFOG02
  states[145] := MakeState(SPR_IFOG,32769,6, S_IFOG3, 0, 0);  // S_IFOG2
  states[146] := MakeState(SPR_IFOG,32770,6, S_IFOG4, 0, 0);  // S_IFOG3
  states[147] := MakeState(SPR_IFOG,32771,6, S_IFOG5, 0, 0);  // S_IFOG4
  states[148] := MakeState(SPR_IFOG,32772,6, S_NULL, 0, 0);  // S_IFOG5
  states[149] := MakeState(SPR_PLAY,0,-1, S_NULL, 0, 0);  // S_PLAY
  states[150] := MakeState(SPR_PLAY,0,4, S_PLAY_RUN2, 0, 0);  // S_PLAY_RUN1
  states[151] := MakeState(SPR_PLAY,1,4, S_PLAY_RUN3, 0, 0);  // S_PLAY_RUN2
  states[152] := MakeState(SPR_PLAY,2,4, S_PLAY_RUN4, 0, 0);  // S_PLAY_RUN3
  states[153] := MakeState(SPR_PLAY,3,4, S_PLAY_RUN1, 0, 0);  // S_PLAY_RUN4
  states[154] := MakeState(SPR_PLAY,4,12, S_PLAY, 0, 0);  // S_PLAY_ATK1
  states[155] := MakeState(SPR_PLAY,32773,6, S_PLAY_ATK1, 0, 0);  // S_PLAY_ATK2
  states[156] := MakeState(SPR_PLAY,6,4, S_PLAY_PAIN2, 0, 0);  // S_PLAY_PAIN
  states[157] := MakeState(SPR_PLAY,6,4 {A_Pain},S_PLAY, 0, 0);  // S_PLAY_PAIN2
  states[158] := MakeState(SPR_PLAY,7,10, S_PLAY_DIE2, 0, 0);  // S_PLAY_DIE1
  states[159] := MakeState(SPR_PLAY,8,10 {A_PlayerScream},S_PLAY_DIE3, 0, 0);  // S_PLAY_DIE2
  states[160] := MakeState(SPR_PLAY,9,10 {A_Fall},S_PLAY_DIE4, 0, 0);  // S_PLAY_DIE3
  states[161] := MakeState(SPR_PLAY,10,10, S_PLAY_DIE5, 0, 0);  // S_PLAY_DIE4
  states[162] := MakeState(SPR_PLAY,11,10, S_PLAY_DIE6, 0, 0);  // S_PLAY_DIE5
  states[163] := MakeState(SPR_PLAY,12,10, S_PLAY_DIE7, 0, 0);  // S_PLAY_DIE6
  states[164] := MakeState(SPR_PLAY,13,-1, S_NULL, 0, 0);  // S_PLAY_DIE7
  states[165] := MakeState(SPR_PLAY,14,5, S_PLAY_XDIE2, 0, 0);  // S_PLAY_XDIE1
  states[166] := MakeState(SPR_PLAY,15,5 {A_XScream},S_PLAY_XDIE3, 0, 0);  // S_PLAY_XDIE2
  states[167] := MakeState(SPR_PLAY,16,5 {A_Fall},S_PLAY_XDIE4, 0, 0);  // S_PLAY_XDIE3
  states[168] := MakeState(SPR_PLAY,17,5, S_PLAY_XDIE5, 0, 0);  // S_PLAY_XDIE4
  states[169] := MakeState(SPR_PLAY,18,5, S_PLAY_XDIE6, 0, 0);  // S_PLAY_XDIE5
  states[170] := MakeState(SPR_PLAY,19,5, S_PLAY_XDIE7, 0, 0);  // S_PLAY_XDIE6
  states[171] := MakeState(SPR_PLAY,20,5, S_PLAY_XDIE8, 0, 0);  // S_PLAY_XDIE7
  states[172] := MakeState(SPR_PLAY,21,5, S_PLAY_XDIE9, 0, 0);  // S_PLAY_XDIE8
  states[173] := MakeState(SPR_PLAY,22,-1, S_NULL, 0, 0);  // S_PLAY_XDIE9
  states[174] := MakeState(SPR_POSS,0,10 {A_Look},S_POSS_STND2, 0, 0);  // S_POSS_STND
  states[175] := MakeState(SPR_POSS,1,10 {A_Look},S_POSS_STND, 0, 0);  // S_POSS_STND2
  states[176] := MakeState(SPR_POSS,0,4 {A_Chase},S_POSS_RUN2, 0, 0);  // S_POSS_RUN1
  states[177] := MakeState(SPR_POSS,0,4 {A_Chase},S_POSS_RUN3, 0, 0);  // S_POSS_RUN2
  states[178] := MakeState(SPR_POSS,1,4 {A_Chase},S_POSS_RUN4, 0, 0);  // S_POSS_RUN3
  states[179] := MakeState(SPR_POSS,1,4 {A_Chase},S_POSS_RUN5, 0, 0);  // S_POSS_RUN4
  states[180] := MakeState(SPR_POSS,2,4 {A_Chase},S_POSS_RUN6, 0, 0);  // S_POSS_RUN5
  states[181] := MakeState(SPR_POSS,2,4 {A_Chase},S_POSS_RUN7, 0, 0);  // S_POSS_RUN6
  states[182] := MakeState(SPR_POSS,3,4 {A_Chase},S_POSS_RUN8, 0, 0);  // S_POSS_RUN7
  states[183] := MakeState(SPR_POSS,3,4 {A_Chase},S_POSS_RUN1, 0, 0);  // S_POSS_RUN8
  states[184] := MakeState(SPR_POSS,4,10 {A_FaceTarget},S_POSS_ATK2, 0, 0);  // S_POSS_ATK1
  states[185] := MakeState(SPR_POSS,5,8 {A_PosAttack},S_POSS_ATK3, 0, 0);  // S_POSS_ATK2
  states[186] := MakeState(SPR_POSS,4,8, S_POSS_RUN1, 0, 0);  // S_POSS_ATK3
  states[187] := MakeState(SPR_POSS,6,3, S_POSS_PAIN2, 0, 0);  // S_POSS_PAIN
  states[188] := MakeState(SPR_POSS,6,3 {A_Pain},S_POSS_RUN1, 0, 0);  // S_POSS_PAIN2
  states[189] := MakeState(SPR_POSS,7,5, S_POSS_DIE2, 0, 0);  // S_POSS_DIE1
  states[190] := MakeState(SPR_POSS,8,5 {A_Scream},S_POSS_DIE3, 0, 0);  // S_POSS_DIE2
  states[191] := MakeState(SPR_POSS,9,5 {A_Fall},S_POSS_DIE4, 0, 0);  // S_POSS_DIE3
  states[192] := MakeState(SPR_POSS,10,5, S_POSS_DIE5, 0, 0);  // S_POSS_DIE4
  states[193] := MakeState(SPR_POSS,11,-1, S_NULL, 0, 0);  // S_POSS_DIE5
  states[194] := MakeState(SPR_POSS,12,5, S_POSS_XDIE2, 0, 0);  // S_POSS_XDIE1
  states[195] := MakeState(SPR_POSS,13,5 {A_XScream},S_POSS_XDIE3, 0, 0);  // S_POSS_XDIE2
  states[196] := MakeState(SPR_POSS,14,5 {A_Fall},S_POSS_XDIE4, 0, 0);  // S_POSS_XDIE3
  states[197] := MakeState(SPR_POSS,15,5, S_POSS_XDIE5, 0, 0);  // S_POSS_XDIE4
  states[198] := MakeState(SPR_POSS,16,5, S_POSS_XDIE6, 0, 0);  // S_POSS_XDIE5
  states[199] := MakeState(SPR_POSS,17,5, S_POSS_XDIE7, 0, 0);  // S_POSS_XDIE6
  states[200] := MakeState(SPR_POSS,18,5, S_POSS_XDIE8, 0, 0);  // S_POSS_XDIE7
  states[201] := MakeState(SPR_POSS,19,5, S_POSS_XDIE9, 0, 0);  // S_POSS_XDIE8
  states[202] := MakeState(SPR_POSS,20,-1, S_NULL, 0, 0);  // S_POSS_XDIE9
  states[203] := MakeState(SPR_POSS,10,5, S_POSS_RAISE2, 0, 0);  // S_POSS_RAISE1
  states[204] := MakeState(SPR_POSS,9,5, S_POSS_RAISE3, 0, 0);  // S_POSS_RAISE2
  states[205] := MakeState(SPR_POSS,8,5, S_POSS_RAISE4, 0, 0);  // S_POSS_RAISE3
  states[206] := MakeState(SPR_POSS,7,5, S_POSS_RUN1, 0, 0);  // S_POSS_RAISE4
  states[207] := MakeState(SPR_SPOS,0,10 {A_Look},S_SPOS_STND2, 0, 0);  // S_SPOS_STND
  states[208] := MakeState(SPR_SPOS,1,10 {A_Look},S_SPOS_STND, 0, 0);  // S_SPOS_STND2
  states[209] := MakeState(SPR_SPOS,0,3 {A_Chase},S_SPOS_RUN2, 0, 0);  // S_SPOS_RUN1
  states[210] := MakeState(SPR_SPOS,0,3 {A_Chase},S_SPOS_RUN3, 0, 0);  // S_SPOS_RUN2
  states[211] := MakeState(SPR_SPOS,1,3 {A_Chase},S_SPOS_RUN4, 0, 0);  // S_SPOS_RUN3
  states[212] := MakeState(SPR_SPOS,1,3 {A_Chase},S_SPOS_RUN5, 0, 0);  // S_SPOS_RUN4
  states[213] := MakeState(SPR_SPOS,2,3 {A_Chase},S_SPOS_RUN6, 0, 0);  // S_SPOS_RUN5
  states[214] := MakeState(SPR_SPOS,2,3 {A_Chase},S_SPOS_RUN7, 0, 0);  // S_SPOS_RUN6
  states[215] := MakeState(SPR_SPOS,3,3 {A_Chase},S_SPOS_RUN8, 0, 0);  // S_SPOS_RUN7
  states[216] := MakeState(SPR_SPOS,3,3 {A_Chase},S_SPOS_RUN1, 0, 0);  // S_SPOS_RUN8
  states[217] := MakeState(SPR_SPOS,4,10 {A_FaceTarget},S_SPOS_ATK2, 0, 0);  // S_SPOS_ATK1
  states[218] := MakeState(SPR_SPOS,32773,10 {A_SPosAttack},S_SPOS_ATK3, 0, 0);  // S_SPOS_ATK2
  states[219] := MakeState(SPR_SPOS,4,10, S_SPOS_RUN1, 0, 0);  // S_SPOS_ATK3
  states[220] := MakeState(SPR_SPOS,6,3, S_SPOS_PAIN2, 0, 0);  // S_SPOS_PAIN
  states[221] := MakeState(SPR_SPOS,6,3 {A_Pain},S_SPOS_RUN1, 0, 0);  // S_SPOS_PAIN2
  states[222] := MakeState(SPR_SPOS,7,5, S_SPOS_DIE2, 0, 0);  // S_SPOS_DIE1
  states[223] := MakeState(SPR_SPOS,8,5 {A_Scream},S_SPOS_DIE3, 0, 0);  // S_SPOS_DIE2
  states[224] := MakeState(SPR_SPOS,9,5 {A_Fall},S_SPOS_DIE4, 0, 0);  // S_SPOS_DIE3
  states[225] := MakeState(SPR_SPOS,10,5, S_SPOS_DIE5, 0, 0);  // S_SPOS_DIE4
  states[226] := MakeState(SPR_SPOS,11,-1, S_NULL, 0, 0);  // S_SPOS_DIE5
  states[227] := MakeState(SPR_SPOS,12,5, S_SPOS_XDIE2, 0, 0);  // S_SPOS_XDIE1
  states[228] := MakeState(SPR_SPOS,13,5 {A_XScream},S_SPOS_XDIE3, 0, 0);  // S_SPOS_XDIE2
  states[229] := MakeState(SPR_SPOS,14,5 {A_Fall},S_SPOS_XDIE4, 0, 0);  // S_SPOS_XDIE3
  states[230] := MakeState(SPR_SPOS,15,5, S_SPOS_XDIE5, 0, 0);  // S_SPOS_XDIE4
  states[231] := MakeState(SPR_SPOS,16,5, S_SPOS_XDIE6, 0, 0);  // S_SPOS_XDIE5
  states[232] := MakeState(SPR_SPOS,17,5, S_SPOS_XDIE7, 0, 0);  // S_SPOS_XDIE6
  states[233] := MakeState(SPR_SPOS,18,5, S_SPOS_XDIE8, 0, 0);  // S_SPOS_XDIE7
  states[234] := MakeState(SPR_SPOS,19,5, S_SPOS_XDIE9, 0, 0);  // S_SPOS_XDIE8
  states[235] := MakeState(SPR_SPOS,20,-1, S_NULL, 0, 0);  // S_SPOS_XDIE9
  states[236] := MakeState(SPR_SPOS,11,5, S_SPOS_RAISE2, 0, 0);  // S_SPOS_RAISE1
  states[237] := MakeState(SPR_SPOS,10,5, S_SPOS_RAISE3, 0, 0);  // S_SPOS_RAISE2
  states[238] := MakeState(SPR_SPOS,9,5, S_SPOS_RAISE4, 0, 0);  // S_SPOS_RAISE3
  states[239] := MakeState(SPR_SPOS,8,5, S_SPOS_RAISE5, 0, 0);  // S_SPOS_RAISE4
  states[240] := MakeState(SPR_SPOS,7,5, S_SPOS_RUN1, 0, 0);  // S_SPOS_RAISE5
  states[241] := MakeState(SPR_VILE,0,10 {A_Look},S_VILE_STND2, 0, 0);  // S_VILE_STND
  states[242] := MakeState(SPR_VILE,1,10 {A_Look},S_VILE_STND, 0, 0);  // S_VILE_STND2
  states[243] := MakeState(SPR_VILE,0,2 {A_VileChase},S_VILE_RUN2, 0, 0);  // S_VILE_RUN1
  states[244] := MakeState(SPR_VILE,0,2 {A_VileChase},S_VILE_RUN3, 0, 0);  // S_VILE_RUN2
  states[245] := MakeState(SPR_VILE,1,2 {A_VileChase},S_VILE_RUN4, 0, 0);  // S_VILE_RUN3
  states[246] := MakeState(SPR_VILE,1,2 {A_VileChase},S_VILE_RUN5, 0, 0);  // S_VILE_RUN4
  states[247] := MakeState(SPR_VILE,2,2 {A_VileChase},S_VILE_RUN6, 0, 0);  // S_VILE_RUN5
  states[248] := MakeState(SPR_VILE,2,2 {A_VileChase},S_VILE_RUN7, 0, 0);  // S_VILE_RUN6
  states[249] := MakeState(SPR_VILE,3,2 {A_VileChase},S_VILE_RUN8, 0, 0);  // S_VILE_RUN7
  states[250] := MakeState(SPR_VILE,3,2 {A_VileChase},S_VILE_RUN9, 0, 0);  // S_VILE_RUN8
  states[251] := MakeState(SPR_VILE,4,2 {A_VileChase},S_VILE_RUN10, 0, 0);  // S_VILE_RUN9
  states[252] := MakeState(SPR_VILE,4,2 {A_VileChase},S_VILE_RUN11, 0, 0);  // S_VILE_RUN10
  states[253] := MakeState(SPR_VILE,5,2 {A_VileChase},S_VILE_RUN12, 0, 0);  // S_VILE_RUN11
  states[254] := MakeState(SPR_VILE,5,2 {A_VileChase},S_VILE_RUN1, 0, 0);  // S_VILE_RUN12
  states[255] := MakeState(SPR_VILE,32774,0 {A_VileStart},S_VILE_ATK2, 0, 0);  // S_VILE_ATK1
  states[256] := MakeState(SPR_VILE,32774,10 {A_FaceTarget},S_VILE_ATK3, 0, 0);  // S_VILE_ATK2
  states[257] := MakeState(SPR_VILE,32775,8 {A_VileTarget},S_VILE_ATK4, 0, 0);  // S_VILE_ATK3
  states[258] := MakeState(SPR_VILE,32776,8 {A_FaceTarget},S_VILE_ATK5, 0, 0);  // S_VILE_ATK4
  states[259] := MakeState(SPR_VILE,32777,8 {A_FaceTarget},S_VILE_ATK6, 0, 0);  // S_VILE_ATK5
  states[260] := MakeState(SPR_VILE,32778,8 {A_FaceTarget},S_VILE_ATK7, 0, 0);  // S_VILE_ATK6
  states[261] := MakeState(SPR_VILE,32779,8 {A_FaceTarget},S_VILE_ATK8, 0, 0);  // S_VILE_ATK7
  states[262] := MakeState(SPR_VILE,32780,8 {A_FaceTarget},S_VILE_ATK9, 0, 0);  // S_VILE_ATK8
  states[263] := MakeState(SPR_VILE,32781,8 {A_FaceTarget},S_VILE_ATK10, 0, 0);  // S_VILE_ATK9
  states[264] := MakeState(SPR_VILE,32782,8 {A_VileAttack},S_VILE_ATK11, 0, 0);  // S_VILE_ATK10
  states[265] := MakeState(SPR_VILE,32783,20, S_VILE_RUN1, 0, 0);  // S_VILE_ATK11
  states[266] := MakeState(SPR_VILE,32794,10, S_VILE_HEAL2, 0, 0);  // S_VILE_HEAL1
  states[267] := MakeState(SPR_VILE,32795,10, S_VILE_HEAL3, 0, 0);  // S_VILE_HEAL2
  states[268] := MakeState(SPR_VILE,32796,10, S_VILE_RUN1, 0, 0);  // S_VILE_HEAL3
  states[269] := MakeState(SPR_VILE,16,5, S_VILE_PAIN2, 0, 0);  // S_VILE_PAIN
  states[270] := MakeState(SPR_VILE,16,5 {A_Pain},S_VILE_RUN1, 0, 0);  // S_VILE_PAIN2
  states[271] := MakeState(SPR_VILE,16,7, S_VILE_DIE2, 0, 0);  // S_VILE_DIE1
  states[272] := MakeState(SPR_VILE,17,7 {A_Scream},S_VILE_DIE3, 0, 0);  // S_VILE_DIE2
  states[273] := MakeState(SPR_VILE,18,7 {A_Fall},S_VILE_DIE4, 0, 0);  // S_VILE_DIE3
  states[274] := MakeState(SPR_VILE,19,7, S_VILE_DIE5, 0, 0);  // S_VILE_DIE4
  states[275] := MakeState(SPR_VILE,20,7, S_VILE_DIE6, 0, 0);  // S_VILE_DIE5
  states[276] := MakeState(SPR_VILE,21,7, S_VILE_DIE7, 0, 0);  // S_VILE_DIE6
  states[277] := MakeState(SPR_VILE,22,7, S_VILE_DIE8, 0, 0);  // S_VILE_DIE7
  states[278] := MakeState(SPR_VILE,23,5, S_VILE_DIE9, 0, 0);  // S_VILE_DIE8
  states[279] := MakeState(SPR_VILE,24,5, S_VILE_DIE10, 0, 0);  // S_VILE_DIE9
  states[280] := MakeState(SPR_VILE,25,-1, S_NULL, 0, 0);  // S_VILE_DIE10
  states[281] := MakeState(SPR_FIRE,32768,2 {A_StartFire},S_FIRE2, 0, 0);  // S_FIRE1
  states[282] := MakeState(SPR_FIRE,32769,2 {A_Fire},S_FIRE3, 0, 0);  // S_FIRE2
  states[283] := MakeState(SPR_FIRE,32768,2 {A_Fire},S_FIRE4, 0, 0);  // S_FIRE3
  states[284] := MakeState(SPR_FIRE,32769,2 {A_Fire},S_FIRE5, 0, 0);  // S_FIRE4
  states[285] := MakeState(SPR_FIRE,32770,2 {A_FireCrackle},S_FIRE6, 0, 0);  // S_FIRE5
  states[286] := MakeState(SPR_FIRE,32769,2 {A_Fire},S_FIRE7, 0, 0);  // S_FIRE6
  states[287] := MakeState(SPR_FIRE,32770,2 {A_Fire},S_FIRE8, 0, 0);  // S_FIRE7
  states[288] := MakeState(SPR_FIRE,32769,2 {A_Fire},S_FIRE9, 0, 0);  // S_FIRE8
  states[289] := MakeState(SPR_FIRE,32770,2 {A_Fire},S_FIRE10, 0, 0);  // S_FIRE9
  states[290] := MakeState(SPR_FIRE,32771,2 {A_Fire},S_FIRE11, 0, 0);  // S_FIRE10
  states[291] := MakeState(SPR_FIRE,32770,2 {A_Fire},S_FIRE12, 0, 0);  // S_FIRE11
  states[292] := MakeState(SPR_FIRE,32771,2 {A_Fire},S_FIRE13, 0, 0);  // S_FIRE12
  states[293] := MakeState(SPR_FIRE,32770,2 {A_Fire},S_FIRE14, 0, 0);  // S_FIRE13
  states[294] := MakeState(SPR_FIRE,32771,2 {A_Fire},S_FIRE15, 0, 0);  // S_FIRE14
  states[295] := MakeState(SPR_FIRE,32772,2 {A_Fire},S_FIRE16, 0, 0);  // S_FIRE15
  states[296] := MakeState(SPR_FIRE,32771,2 {A_Fire},S_FIRE17, 0, 0);  // S_FIRE16
  states[297] := MakeState(SPR_FIRE,32772,2 {A_Fire},S_FIRE18, 0, 0);  // S_FIRE17
  states[298] := MakeState(SPR_FIRE,32771,2 {A_Fire},S_FIRE19, 0, 0);  // S_FIRE18
  states[299] := MakeState(SPR_FIRE,32772,2 {A_FireCrackle},S_FIRE20, 0, 0);  // S_FIRE19
  states[300] := MakeState(SPR_FIRE,32773,2 {A_Fire},S_FIRE21, 0, 0);  // S_FIRE20
  states[301] := MakeState(SPR_FIRE,32772,2 {A_Fire},S_FIRE22, 0, 0);  // S_FIRE21
  states[302] := MakeState(SPR_FIRE,32773,2 {A_Fire},S_FIRE23, 0, 0);  // S_FIRE22
  states[303] := MakeState(SPR_FIRE,32772,2 {A_Fire},S_FIRE24, 0, 0);  // S_FIRE23
  states[304] := MakeState(SPR_FIRE,32773,2 {A_Fire},S_FIRE25, 0, 0);  // S_FIRE24
  states[305] := MakeState(SPR_FIRE,32774,2 {A_Fire},S_FIRE26, 0, 0);  // S_FIRE25
  states[306] := MakeState(SPR_FIRE,32775,2 {A_Fire},S_FIRE27, 0, 0);  // S_FIRE26
  states[307] := MakeState(SPR_FIRE,32774,2 {A_Fire},S_FIRE28, 0, 0);  // S_FIRE27
  states[308] := MakeState(SPR_FIRE,32775,2 {A_Fire},S_FIRE29, 0, 0);  // S_FIRE28
  states[309] := MakeState(SPR_FIRE,32774,2 {A_Fire},S_FIRE30, 0, 0);  // S_FIRE29
  states[310] := MakeState(SPR_FIRE,32775,2 {A_Fire},S_NULL, 0, 0);  // S_FIRE30
  states[311] := MakeState(SPR_PUFF,1,4, S_SMOKE2, 0, 0);  // S_SMOKE1
  states[312] := MakeState(SPR_PUFF,2,4, S_SMOKE3, 0, 0);  // S_SMOKE2
  states[313] := MakeState(SPR_PUFF,1,4, S_SMOKE4, 0, 0);  // S_SMOKE3
  states[314] := MakeState(SPR_PUFF,2,4, S_SMOKE5, 0, 0);  // S_SMOKE4
  states[315] := MakeState(SPR_PUFF,3,4, S_NULL, 0, 0);  // S_SMOKE5
  states[316] := MakeState(SPR_FATB,32768,2 {A_Tracer},S_TRACER2, 0, 0);  // S_TRACER
  states[317] := MakeState(SPR_FATB,32769,2 {A_Tracer},S_TRACER, 0, 0);  // S_TRACER2
  states[318] := MakeState(SPR_FBXP,32768,8, S_TRACEEXP2, 0, 0);  // S_TRACEEXP1
  states[319] := MakeState(SPR_FBXP,32769,6, S_TRACEEXP3, 0, 0);  // S_TRACEEXP2
  states[320] := MakeState(SPR_FBXP,32770,4, S_NULL, 0, 0);  // S_TRACEEXP3
  states[321] := MakeState(SPR_SKEL,0,10 {A_Look},S_SKEL_STND2, 0, 0);  // S_SKEL_STND
  states[322] := MakeState(SPR_SKEL,1,10 {A_Look},S_SKEL_STND, 0, 0);  // S_SKEL_STND2
  states[323] := MakeState(SPR_SKEL,0,2 {A_Chase},S_SKEL_RUN2, 0, 0);  // S_SKEL_RUN1
  states[324] := MakeState(SPR_SKEL,0,2 {A_Chase},S_SKEL_RUN3, 0, 0);  // S_SKEL_RUN2
  states[325] := MakeState(SPR_SKEL,1,2 {A_Chase},S_SKEL_RUN4, 0, 0);  // S_SKEL_RUN3
  states[326] := MakeState(SPR_SKEL,1,2 {A_Chase},S_SKEL_RUN5, 0, 0);  // S_SKEL_RUN4
  states[327] := MakeState(SPR_SKEL,2,2 {A_Chase},S_SKEL_RUN6, 0, 0);  // S_SKEL_RUN5
  states[328] := MakeState(SPR_SKEL,2,2 {A_Chase},S_SKEL_RUN7, 0, 0);  // S_SKEL_RUN6
  states[329] := MakeState(SPR_SKEL,3,2 {A_Chase},S_SKEL_RUN8, 0, 0);  // S_SKEL_RUN7
  states[330] := MakeState(SPR_SKEL,3,2 {A_Chase},S_SKEL_RUN9, 0, 0);  // S_SKEL_RUN8
  states[331] := MakeState(SPR_SKEL,4,2 {A_Chase},S_SKEL_RUN10, 0, 0);  // S_SKEL_RUN9
  states[332] := MakeState(SPR_SKEL,4,2 {A_Chase},S_SKEL_RUN11, 0, 0);  // S_SKEL_RUN10
  states[333] := MakeState(SPR_SKEL,5,2 {A_Chase},S_SKEL_RUN12, 0, 0);  // S_SKEL_RUN11
  states[334] := MakeState(SPR_SKEL,5,2 {A_Chase},S_SKEL_RUN1, 0, 0);  // S_SKEL_RUN12
  states[335] := MakeState(SPR_SKEL,6,0 {A_FaceTarget},S_SKEL_FIST2, 0, 0);  // S_SKEL_FIST1
  states[336] := MakeState(SPR_SKEL,6,6 {A_SkelWhoosh},S_SKEL_FIST3, 0, 0);  // S_SKEL_FIST2
  states[337] := MakeState(SPR_SKEL,7,6 {A_FaceTarget},S_SKEL_FIST4, 0, 0);  // S_SKEL_FIST3
  states[338] := MakeState(SPR_SKEL,8,6 {A_SkelFist},S_SKEL_RUN1, 0, 0);  // S_SKEL_FIST4
  states[339] := MakeState(SPR_SKEL,32777,0 {A_FaceTarget},S_SKEL_MISS2, 0, 0);  // S_SKEL_MISS1
  states[340] := MakeState(SPR_SKEL,32777,10 {A_FaceTarget},S_SKEL_MISS3, 0, 0);  // S_SKEL_MISS2
  states[341] := MakeState(SPR_SKEL,10,10 {A_SkelMissile},S_SKEL_MISS4, 0, 0);  // S_SKEL_MISS3
  states[342] := MakeState(SPR_SKEL,10,10 {A_FaceTarget},S_SKEL_RUN1, 0, 0);  // S_SKEL_MISS4
  states[343] := MakeState(SPR_SKEL,11,5, S_SKEL_PAIN2, 0, 0);  // S_SKEL_PAIN
  states[344] := MakeState(SPR_SKEL,11,5 {A_Pain},S_SKEL_RUN1, 0, 0);  // S_SKEL_PAIN2
  states[345] := MakeState(SPR_SKEL,11,7, S_SKEL_DIE2, 0, 0);  // S_SKEL_DIE1
  states[346] := MakeState(SPR_SKEL,12,7, S_SKEL_DIE3, 0, 0);  // S_SKEL_DIE2
  states[347] := MakeState(SPR_SKEL,13,7 {A_Scream},S_SKEL_DIE4, 0, 0);  // S_SKEL_DIE3
  states[348] := MakeState(SPR_SKEL,14,7 {A_Fall},S_SKEL_DIE5, 0, 0);  // S_SKEL_DIE4
  states[349] := MakeState(SPR_SKEL,15,7, S_SKEL_DIE6, 0, 0);  // S_SKEL_DIE5
  states[350] := MakeState(SPR_SKEL,16,-1, S_NULL, 0, 0);  // S_SKEL_DIE6
  states[351] := MakeState(SPR_SKEL,16,5, S_SKEL_RAISE2, 0, 0);  // S_SKEL_RAISE1
  states[352] := MakeState(SPR_SKEL,15,5, S_SKEL_RAISE3, 0, 0);  // S_SKEL_RAISE2
  states[353] := MakeState(SPR_SKEL,14,5, S_SKEL_RAISE4, 0, 0);  // S_SKEL_RAISE3
  states[354] := MakeState(SPR_SKEL,13,5, S_SKEL_RAISE5, 0, 0);  // S_SKEL_RAISE4
  states[355] := MakeState(SPR_SKEL,12,5, S_SKEL_RAISE6, 0, 0);  // S_SKEL_RAISE5
  states[356] := MakeState(SPR_SKEL,11,5, S_SKEL_RUN1, 0, 0);  // S_SKEL_RAISE6
  states[357] := MakeState(SPR_MANF,32768,4, S_FATSHOT2, 0, 0);  // S_FATSHOT1
  states[358] := MakeState(SPR_MANF,32769,4, S_FATSHOT1, 0, 0);  // S_FATSHOT2
  states[359] := MakeState(SPR_MISL,32769,8, S_FATSHOTX2, 0, 0);  // S_FATSHOTX1
  states[360] := MakeState(SPR_MISL,32770,6, S_FATSHOTX3, 0, 0);  // S_FATSHOTX2
  states[361] := MakeState(SPR_MISL,32771,4, S_NULL, 0, 0);  // S_FATSHOTX3
  states[362] := MakeState(SPR_FATT,0,15 {A_Look},S_FATT_STND2, 0, 0);  // S_FATT_STND
  states[363] := MakeState(SPR_FATT,1,15 {A_Look},S_FATT_STND, 0, 0);  // S_FATT_STND2
  states[364] := MakeState(SPR_FATT,0,4 {A_Chase},S_FATT_RUN2, 0, 0);  // S_FATT_RUN1
  states[365] := MakeState(SPR_FATT,0,4 {A_Chase},S_FATT_RUN3, 0, 0);  // S_FATT_RUN2
  states[366] := MakeState(SPR_FATT,1,4 {A_Chase},S_FATT_RUN4, 0, 0);  // S_FATT_RUN3
  states[367] := MakeState(SPR_FATT,1,4 {A_Chase},S_FATT_RUN5, 0, 0);  // S_FATT_RUN4
  states[368] := MakeState(SPR_FATT,2,4 {A_Chase},S_FATT_RUN6, 0, 0);  // S_FATT_RUN5
  states[369] := MakeState(SPR_FATT,2,4 {A_Chase},S_FATT_RUN7, 0, 0);  // S_FATT_RUN6
  states[370] := MakeState(SPR_FATT,3,4 {A_Chase},S_FATT_RUN8, 0, 0);  // S_FATT_RUN7
  states[371] := MakeState(SPR_FATT,3,4 {A_Chase},S_FATT_RUN9, 0, 0);  // S_FATT_RUN8
  states[372] := MakeState(SPR_FATT,4,4 {A_Chase},S_FATT_RUN10, 0, 0);  // S_FATT_RUN9
  states[373] := MakeState(SPR_FATT,4,4 {A_Chase},S_FATT_RUN11, 0, 0);  // S_FATT_RUN10
  states[374] := MakeState(SPR_FATT,5,4 {A_Chase},S_FATT_RUN12, 0, 0);  // S_FATT_RUN11
  states[375] := MakeState(SPR_FATT,5,4 {A_Chase},S_FATT_RUN1, 0, 0);  // S_FATT_RUN12
  states[376] := MakeState(SPR_FATT,6,20 {A_FatRaise},S_FATT_ATK2, 0, 0);  // S_FATT_ATK1
  states[377] := MakeState(SPR_FATT,32775,10 {A_FatAttack1},S_FATT_ATK3, 0, 0);  // S_FATT_ATK2
  states[378] := MakeState(SPR_FATT,8,5 {A_FaceTarget},S_FATT_ATK4, 0, 0);  // S_FATT_ATK3
  states[379] := MakeState(SPR_FATT,6,5 {A_FaceTarget},S_FATT_ATK5, 0, 0);  // S_FATT_ATK4
  states[380] := MakeState(SPR_FATT,32775,10 {A_FatAttack2},S_FATT_ATK6, 0, 0);  // S_FATT_ATK5
  states[381] := MakeState(SPR_FATT,8,5 {A_FaceTarget},S_FATT_ATK7, 0, 0);  // S_FATT_ATK6
  states[382] := MakeState(SPR_FATT,6,5 {A_FaceTarget},S_FATT_ATK8, 0, 0);  // S_FATT_ATK7
  states[383] := MakeState(SPR_FATT,32775,10 {A_FatAttack3},S_FATT_ATK9, 0, 0);  // S_FATT_ATK8
  states[384] := MakeState(SPR_FATT,8,5 {A_FaceTarget},S_FATT_ATK10, 0, 0);  // S_FATT_ATK9
  states[385] := MakeState(SPR_FATT,6,5 {A_FaceTarget},S_FATT_RUN1, 0, 0);  // S_FATT_ATK10
  states[386] := MakeState(SPR_FATT,9,3, S_FATT_PAIN2, 0, 0);  // S_FATT_PAIN
  states[387] := MakeState(SPR_FATT,9,3 {A_Pain},S_FATT_RUN1, 0, 0);  // S_FATT_PAIN2
  states[388] := MakeState(SPR_FATT,10,6, S_FATT_DIE2, 0, 0);  // S_FATT_DIE1
  states[389] := MakeState(SPR_FATT,11,6 {A_Scream},S_FATT_DIE3, 0, 0);  // S_FATT_DIE2
  states[390] := MakeState(SPR_FATT,12,6 {A_Fall},S_FATT_DIE4, 0, 0);  // S_FATT_DIE3
  states[391] := MakeState(SPR_FATT,13,6, S_FATT_DIE5, 0, 0);  // S_FATT_DIE4
  states[392] := MakeState(SPR_FATT,14,6, S_FATT_DIE6, 0, 0);  // S_FATT_DIE5
  states[393] := MakeState(SPR_FATT,15,6, S_FATT_DIE7, 0, 0);  // S_FATT_DIE6
  states[394] := MakeState(SPR_FATT,16,6, S_FATT_DIE8, 0, 0);  // S_FATT_DIE7
  states[395] := MakeState(SPR_FATT,17,6, S_FATT_DIE9, 0, 0);  // S_FATT_DIE8
  states[396] := MakeState(SPR_FATT,18,6, S_FATT_DIE10, 0, 0);  // S_FATT_DIE9
  states[397] := MakeState(SPR_FATT,19,-1 {A_BossDeath},S_NULL, 0, 0);  // S_FATT_DIE10
  states[398] := MakeState(SPR_FATT,17,5, S_FATT_RAISE2, 0, 0);  // S_FATT_RAISE1
  states[399] := MakeState(SPR_FATT,16,5, S_FATT_RAISE3, 0, 0);  // S_FATT_RAISE2
  states[400] := MakeState(SPR_FATT,15,5, S_FATT_RAISE4, 0, 0);  // S_FATT_RAISE3
  states[401] := MakeState(SPR_FATT,14,5, S_FATT_RAISE5, 0, 0);  // S_FATT_RAISE4
  states[402] := MakeState(SPR_FATT,13,5, S_FATT_RAISE6, 0, 0);  // S_FATT_RAISE5
  states[403] := MakeState(SPR_FATT,12,5, S_FATT_RAISE7, 0, 0);  // S_FATT_RAISE6
  states[404] := MakeState(SPR_FATT,11,5, S_FATT_RAISE8, 0, 0);  // S_FATT_RAISE7
  states[405] := MakeState(SPR_FATT,10,5, S_FATT_RUN1, 0, 0);  // S_FATT_RAISE8
  states[406] := MakeState(SPR_CPOS,0,10 {A_Look},S_CPOS_STND2, 0, 0);  // S_CPOS_STND
  states[407] := MakeState(SPR_CPOS,1,10 {A_Look},S_CPOS_STND, 0, 0);  // S_CPOS_STND2
  states[408] := MakeState(SPR_CPOS,0,3 {A_Chase},S_CPOS_RUN2, 0, 0);  // S_CPOS_RUN1
  states[409] := MakeState(SPR_CPOS,0,3 {A_Chase},S_CPOS_RUN3, 0, 0);  // S_CPOS_RUN2
  states[410] := MakeState(SPR_CPOS,1,3 {A_Chase},S_CPOS_RUN4, 0, 0);  // S_CPOS_RUN3
  states[411] := MakeState(SPR_CPOS,1,3 {A_Chase},S_CPOS_RUN5, 0, 0);  // S_CPOS_RUN4
  states[412] := MakeState(SPR_CPOS,2,3 {A_Chase},S_CPOS_RUN6, 0, 0);  // S_CPOS_RUN5
  states[413] := MakeState(SPR_CPOS,2,3 {A_Chase},S_CPOS_RUN7, 0, 0);  // S_CPOS_RUN6
  states[414] := MakeState(SPR_CPOS,3,3 {A_Chase},S_CPOS_RUN8, 0, 0);  // S_CPOS_RUN7
  states[415] := MakeState(SPR_CPOS,3,3 {A_Chase},S_CPOS_RUN1, 0, 0);  // S_CPOS_RUN8
  states[416] := MakeState(SPR_CPOS,4,10 {A_FaceTarget},S_CPOS_ATK2, 0, 0);  // S_CPOS_ATK1
  states[417] := MakeState(SPR_CPOS,32773,4 {A_CPosAttack},S_CPOS_ATK3, 0, 0);  // S_CPOS_ATK2
  states[418] := MakeState(SPR_CPOS,32772,4 {A_CPosAttack},S_CPOS_ATK4, 0, 0);  // S_CPOS_ATK3
  states[419] := MakeState(SPR_CPOS,5,1 {A_CPosRefire},S_CPOS_ATK2, 0, 0);  // S_CPOS_ATK4
  states[420] := MakeState(SPR_CPOS,6,3, S_CPOS_PAIN2, 0, 0);  // S_CPOS_PAIN
  states[421] := MakeState(SPR_CPOS,6,3 {A_Pain},S_CPOS_RUN1, 0, 0);  // S_CPOS_PAIN2
  states[422] := MakeState(SPR_CPOS,7,5, S_CPOS_DIE2, 0, 0);  // S_CPOS_DIE1
  states[423] := MakeState(SPR_CPOS,8,5 {A_Scream},S_CPOS_DIE3, 0, 0);  // S_CPOS_DIE2
  states[424] := MakeState(SPR_CPOS,9,5 {A_Fall},S_CPOS_DIE4, 0, 0);  // S_CPOS_DIE3
  states[425] := MakeState(SPR_CPOS,10,5, S_CPOS_DIE5, 0, 0);  // S_CPOS_DIE4
  states[426] := MakeState(SPR_CPOS,11,5, S_CPOS_DIE6, 0, 0);  // S_CPOS_DIE5
  states[427] := MakeState(SPR_CPOS,12,5, S_CPOS_DIE7, 0, 0);  // S_CPOS_DIE6
  states[428] := MakeState(SPR_CPOS,13,-1, S_NULL, 0, 0);  // S_CPOS_DIE7
  states[429] := MakeState(SPR_CPOS,14,5, S_CPOS_XDIE2, 0, 0);  // S_CPOS_XDIE1
  states[430] := MakeState(SPR_CPOS,15,5 {A_XScream},S_CPOS_XDIE3, 0, 0);  // S_CPOS_XDIE2
  states[431] := MakeState(SPR_CPOS,16,5 {A_Fall},S_CPOS_XDIE4, 0, 0);  // S_CPOS_XDIE3
  states[432] := MakeState(SPR_CPOS,17,5, S_CPOS_XDIE5, 0, 0);  // S_CPOS_XDIE4
  states[433] := MakeState(SPR_CPOS,18,5, S_CPOS_XDIE6, 0, 0);  // S_CPOS_XDIE5
  states[434] := MakeState(SPR_CPOS,19,-1, S_NULL, 0, 0);  // S_CPOS_XDIE6
  states[435] := MakeState(SPR_CPOS,13,5, S_CPOS_RAISE2, 0, 0);  // S_CPOS_RAISE1
  states[436] := MakeState(SPR_CPOS,12,5, S_CPOS_RAISE3, 0, 0);  // S_CPOS_RAISE2
  states[437] := MakeState(SPR_CPOS,11,5, S_CPOS_RAISE4, 0, 0);  // S_CPOS_RAISE3
  states[438] := MakeState(SPR_CPOS,10,5, S_CPOS_RAISE5, 0, 0);  // S_CPOS_RAISE4
  states[439] := MakeState(SPR_CPOS,9,5, S_CPOS_RAISE6, 0, 0);  // S_CPOS_RAISE5
  states[440] := MakeState(SPR_CPOS,8,5, S_CPOS_RAISE7, 0, 0);  // S_CPOS_RAISE6
  states[441] := MakeState(SPR_CPOS,7,5, S_CPOS_RUN1, 0, 0);  // S_CPOS_RAISE7
  states[442] := MakeState(SPR_TROO,0,10 {A_Look},S_TROO_STND2, 0, 0);  // S_TROO_STND
  states[443] := MakeState(SPR_TROO,1,10 {A_Look},S_TROO_STND, 0, 0);  // S_TROO_STND2
  states[444] := MakeState(SPR_TROO,0,3 {A_Chase},S_TROO_RUN2, 0, 0);  // S_TROO_RUN1
  states[445] := MakeState(SPR_TROO,0,3 {A_Chase},S_TROO_RUN3, 0, 0);  // S_TROO_RUN2
  states[446] := MakeState(SPR_TROO,1,3 {A_Chase},S_TROO_RUN4, 0, 0);  // S_TROO_RUN3
  states[447] := MakeState(SPR_TROO,1,3 {A_Chase},S_TROO_RUN5, 0, 0);  // S_TROO_RUN4
  states[448] := MakeState(SPR_TROO,2,3 {A_Chase},S_TROO_RUN6, 0, 0);  // S_TROO_RUN5
  states[449] := MakeState(SPR_TROO,2,3 {A_Chase},S_TROO_RUN7, 0, 0);  // S_TROO_RUN6
  states[450] := MakeState(SPR_TROO,3,3 {A_Chase},S_TROO_RUN8, 0, 0);  // S_TROO_RUN7
  states[451] := MakeState(SPR_TROO,3,3 {A_Chase},S_TROO_RUN1, 0, 0);  // S_TROO_RUN8
  states[452] := MakeState(SPR_TROO,4,8 {A_FaceTarget},S_TROO_ATK2, 0, 0);  // S_TROO_ATK1
  states[453] := MakeState(SPR_TROO,5,8 {A_FaceTarget},S_TROO_ATK3, 0, 0);  // S_TROO_ATK2
  states[454] := MakeState(SPR_TROO,6,6 {A_TroopAttack},S_TROO_RUN1, 0, 0);  // S_TROO_ATK3
  states[455] := MakeState(SPR_TROO,7,2, S_TROO_PAIN2, 0, 0);  // S_TROO_PAIN
  states[456] := MakeState(SPR_TROO,7,2 {A_Pain},S_TROO_RUN1, 0, 0);  // S_TROO_PAIN2
  states[457] := MakeState(SPR_TROO,8,8, S_TROO_DIE2, 0, 0);  // S_TROO_DIE1
  states[458] := MakeState(SPR_TROO,9,8 {A_Scream},S_TROO_DIE3, 0, 0);  // S_TROO_DIE2
  states[459] := MakeState(SPR_TROO,10,6, S_TROO_DIE4, 0, 0);  // S_TROO_DIE3
  states[460] := MakeState(SPR_TROO,11,6 {A_Fall},S_TROO_DIE5, 0, 0);  // S_TROO_DIE4
  states[461] := MakeState(SPR_TROO,12,-1, S_NULL, 0, 0);  // S_TROO_DIE5
  states[462] := MakeState(SPR_TROO,13,5, S_TROO_XDIE2, 0, 0);  // S_TROO_XDIE1
  states[463] := MakeState(SPR_TROO,14,5 {A_XScream},S_TROO_XDIE3, 0, 0);  // S_TROO_XDIE2
  states[464] := MakeState(SPR_TROO,15,5, S_TROO_XDIE4, 0, 0);  // S_TROO_XDIE3
  states[465] := MakeState(SPR_TROO,16,5 {A_Fall},S_TROO_XDIE5, 0, 0);  // S_TROO_XDIE4
  states[466] := MakeState(SPR_TROO,17,5, S_TROO_XDIE6, 0, 0);  // S_TROO_XDIE5
  states[467] := MakeState(SPR_TROO,18,5, S_TROO_XDIE7, 0, 0);  // S_TROO_XDIE6
  states[468] := MakeState(SPR_TROO,19,5, S_TROO_XDIE8, 0, 0);  // S_TROO_XDIE7
  states[469] := MakeState(SPR_TROO,20,-1, S_NULL, 0, 0);  // S_TROO_XDIE8
  states[470] := MakeState(SPR_TROO,12,8, S_TROO_RAISE2, 0, 0);  // S_TROO_RAISE1
  states[471] := MakeState(SPR_TROO,11,8, S_TROO_RAISE3, 0, 0);  // S_TROO_RAISE2
  states[472] := MakeState(SPR_TROO,10,6, S_TROO_RAISE4, 0, 0);  // S_TROO_RAISE3
  states[473] := MakeState(SPR_TROO,9,6, S_TROO_RAISE5, 0, 0);  // S_TROO_RAISE4
  states[474] := MakeState(SPR_TROO,8,6, S_TROO_RUN1, 0, 0);  // S_TROO_RAISE5
  states[475] := MakeState(SPR_SARG,0,10 {A_Look},S_SARG_STND2, 0, 0);  // S_SARG_STND
  states[476] := MakeState(SPR_SARG,1,10 {A_Look},S_SARG_STND, 0, 0);  // S_SARG_STND2
  states[477] := MakeState(SPR_SARG,0,2 {A_Chase},S_SARG_RUN2, 0, 0);  // S_SARG_RUN1
  states[478] := MakeState(SPR_SARG,0,2 {A_Chase},S_SARG_RUN3, 0, 0);  // S_SARG_RUN2
  states[479] := MakeState(SPR_SARG,1,2 {A_Chase},S_SARG_RUN4, 0, 0);  // S_SARG_RUN3
  states[480] := MakeState(SPR_SARG,1,2 {A_Chase},S_SARG_RUN5, 0, 0);  // S_SARG_RUN4
  states[481] := MakeState(SPR_SARG,2,2 {A_Chase},S_SARG_RUN6, 0, 0);  // S_SARG_RUN5
  states[482] := MakeState(SPR_SARG,2,2 {A_Chase},S_SARG_RUN7, 0, 0);  // S_SARG_RUN6
  states[483] := MakeState(SPR_SARG,3,2 {A_Chase},S_SARG_RUN8, 0, 0);  // S_SARG_RUN7
  states[484] := MakeState(SPR_SARG,3,2 {A_Chase},S_SARG_RUN1, 0, 0);  // S_SARG_RUN8
  states[485] := MakeState(SPR_SARG,4,8 {A_FaceTarget},S_SARG_ATK2, 0, 0);  // S_SARG_ATK1
  states[486] := MakeState(SPR_SARG,5,8 {A_FaceTarget},S_SARG_ATK3, 0, 0);  // S_SARG_ATK2
  states[487] := MakeState(SPR_SARG,6,8 {A_SargAttack},S_SARG_RUN1, 0, 0);  // S_SARG_ATK3
  states[488] := MakeState(SPR_SARG,7,2, S_SARG_PAIN2, 0, 0);  // S_SARG_PAIN
  states[489] := MakeState(SPR_SARG,7,2 {A_Pain},S_SARG_RUN1, 0, 0);  // S_SARG_PAIN2
  states[490] := MakeState(SPR_SARG,8,8, S_SARG_DIE2, 0, 0);  // S_SARG_DIE1
  states[491] := MakeState(SPR_SARG,9,8 {A_Scream},S_SARG_DIE3, 0, 0);  // S_SARG_DIE2
  states[492] := MakeState(SPR_SARG,10,4, S_SARG_DIE4, 0, 0);  // S_SARG_DIE3
  states[493] := MakeState(SPR_SARG,11,4 {A_Fall},S_SARG_DIE5, 0, 0);  // S_SARG_DIE4
  states[494] := MakeState(SPR_SARG,12,4, S_SARG_DIE6, 0, 0);  // S_SARG_DIE5
  states[495] := MakeState(SPR_SARG,13,-1, S_NULL, 0, 0);  // S_SARG_DIE6
  states[496] := MakeState(SPR_SARG,13,5, S_SARG_RAISE2, 0, 0);  // S_SARG_RAISE1
  states[497] := MakeState(SPR_SARG,12,5, S_SARG_RAISE3, 0, 0);  // S_SARG_RAISE2
  states[498] := MakeState(SPR_SARG,11,5, S_SARG_RAISE4, 0, 0);  // S_SARG_RAISE3
  states[499] := MakeState(SPR_SARG,10,5, S_SARG_RAISE5, 0, 0);  // S_SARG_RAISE4
  states[500] := MakeState(SPR_SARG,9,5, S_SARG_RAISE6, 0, 0);  // S_SARG_RAISE5
  states[501] := MakeState(SPR_SARG,8,5, S_SARG_RUN1, 0, 0);  // S_SARG_RAISE6
  states[502] := MakeState(SPR_HEAD,0,10 {A_Look},S_HEAD_STND, 0, 0);  // S_HEAD_STND
  states[503] := MakeState(SPR_HEAD,0,3 {A_Chase},S_HEAD_RUN1, 0, 0);  // S_HEAD_RUN1
  states[504] := MakeState(SPR_HEAD,1,5 {A_FaceTarget},S_HEAD_ATK2, 0, 0);  // S_HEAD_ATK1
  states[505] := MakeState(SPR_HEAD,2,5 {A_FaceTarget},S_HEAD_ATK3, 0, 0);  // S_HEAD_ATK2
  states[506] := MakeState(SPR_HEAD,32771,5 {A_HeadAttack},S_HEAD_RUN1, 0, 0);  // S_HEAD_ATK3
  states[507] := MakeState(SPR_HEAD,4,3, S_HEAD_PAIN2, 0, 0);  // S_HEAD_PAIN
  states[508] := MakeState(SPR_HEAD,4,3 {A_Pain},S_HEAD_PAIN3, 0, 0);  // S_HEAD_PAIN2
  states[509] := MakeState(SPR_HEAD,5,6, S_HEAD_RUN1, 0, 0);  // S_HEAD_PAIN3
  states[510] := MakeState(SPR_HEAD,6,8, S_HEAD_DIE2, 0, 0);  // S_HEAD_DIE1
  states[511] := MakeState(SPR_HEAD,7,8 {A_Scream},S_HEAD_DIE3, 0, 0);  // S_HEAD_DIE2
  states[512] := MakeState(SPR_HEAD,8,8, S_HEAD_DIE4, 0, 0);  // S_HEAD_DIE3
  states[513] := MakeState(SPR_HEAD,9,8, S_HEAD_DIE5, 0, 0);  // S_HEAD_DIE4
  states[514] := MakeState(SPR_HEAD,10,8 {A_Fall},S_HEAD_DIE6, 0, 0);  // S_HEAD_DIE5
  states[515] := MakeState(SPR_HEAD,11,-1, S_NULL, 0, 0);  // S_HEAD_DIE6
  states[516] := MakeState(SPR_HEAD,11,8, S_HEAD_RAISE2, 0, 0);  // S_HEAD_RAISE1
  states[517] := MakeState(SPR_HEAD,10,8, S_HEAD_RAISE3, 0, 0);  // S_HEAD_RAISE2
  states[518] := MakeState(SPR_HEAD,9,8, S_HEAD_RAISE4, 0, 0);  // S_HEAD_RAISE3
  states[519] := MakeState(SPR_HEAD,8,8, S_HEAD_RAISE5, 0, 0);  // S_HEAD_RAISE4
  states[520] := MakeState(SPR_HEAD,7,8, S_HEAD_RAISE6, 0, 0);  // S_HEAD_RAISE5
  states[521] := MakeState(SPR_HEAD,6,8, S_HEAD_RUN1, 0, 0);  // S_HEAD_RAISE6
  states[522] := MakeState(SPR_BAL7,32768,4, S_BRBALL2, 0, 0);  // S_BRBALL1
  states[523] := MakeState(SPR_BAL7,32769,4, S_BRBALL1, 0, 0);  // S_BRBALL2
  states[524] := MakeState(SPR_BAL7,32770,6, S_BRBALLX2, 0, 0);  // S_BRBALLX1
  states[525] := MakeState(SPR_BAL7,32771,6, S_BRBALLX3, 0, 0);  // S_BRBALLX2
  states[526] := MakeState(SPR_BAL7,32772,6, S_NULL, 0, 0);  // S_BRBALLX3
  states[527] := MakeState(SPR_BOSS,0,10 {A_Look},S_BOSS_STND2, 0, 0);  // S_BOSS_STND
  states[528] := MakeState(SPR_BOSS,1,10 {A_Look},S_BOSS_STND, 0, 0);  // S_BOSS_STND2
  states[529] := MakeState(SPR_BOSS,0,3 {A_Chase},S_BOSS_RUN2, 0, 0);  // S_BOSS_RUN1
  states[530] := MakeState(SPR_BOSS,0,3 {A_Chase},S_BOSS_RUN3, 0, 0);  // S_BOSS_RUN2
  states[531] := MakeState(SPR_BOSS,1,3 {A_Chase},S_BOSS_RUN4, 0, 0);  // S_BOSS_RUN3
  states[532] := MakeState(SPR_BOSS,1,3 {A_Chase},S_BOSS_RUN5, 0, 0);  // S_BOSS_RUN4
  states[533] := MakeState(SPR_BOSS,2,3 {A_Chase},S_BOSS_RUN6, 0, 0);  // S_BOSS_RUN5
  states[534] := MakeState(SPR_BOSS,2,3 {A_Chase},S_BOSS_RUN7, 0, 0);  // S_BOSS_RUN6
  states[535] := MakeState(SPR_BOSS,3,3 {A_Chase},S_BOSS_RUN8, 0, 0);  // S_BOSS_RUN7
  states[536] := MakeState(SPR_BOSS,3,3 {A_Chase},S_BOSS_RUN1, 0, 0);  // S_BOSS_RUN8
  states[537] := MakeState(SPR_BOSS,4,8 {A_FaceTarget},S_BOSS_ATK2, 0, 0);  // S_BOSS_ATK1
  states[538] := MakeState(SPR_BOSS,5,8 {A_FaceTarget},S_BOSS_ATK3, 0, 0);  // S_BOSS_ATK2
  states[539] := MakeState(SPR_BOSS,6,8 {A_BruisAttack},S_BOSS_RUN1, 0, 0);  // S_BOSS_ATK3
  states[540] := MakeState(SPR_BOSS,7,2, S_BOSS_PAIN2, 0, 0);  // S_BOSS_PAIN
  states[541] := MakeState(SPR_BOSS,7,2 {A_Pain},S_BOSS_RUN1, 0, 0);  // S_BOSS_PAIN2
  states[542] := MakeState(SPR_BOSS,8,8, S_BOSS_DIE2, 0, 0);  // S_BOSS_DIE1
  states[543] := MakeState(SPR_BOSS,9,8 {A_Scream},S_BOSS_DIE3, 0, 0);  // S_BOSS_DIE2
  states[544] := MakeState(SPR_BOSS,10,8, S_BOSS_DIE4, 0, 0);  // S_BOSS_DIE3
  states[545] := MakeState(SPR_BOSS,11,8 {A_Fall},S_BOSS_DIE5, 0, 0);  // S_BOSS_DIE4
  states[546] := MakeState(SPR_BOSS,12,8, S_BOSS_DIE6, 0, 0);  // S_BOSS_DIE5
  states[547] := MakeState(SPR_BOSS,13,8, S_BOSS_DIE7, 0, 0);  // S_BOSS_DIE6
  states[548] := MakeState(SPR_BOSS,14,-1 {A_BossDeath},S_NULL, 0, 0);  // S_BOSS_DIE7
  states[549] := MakeState(SPR_BOSS,14,8, S_BOSS_RAISE2, 0, 0);  // S_BOSS_RAISE1
  states[550] := MakeState(SPR_BOSS,13,8, S_BOSS_RAISE3, 0, 0);  // S_BOSS_RAISE2
  states[551] := MakeState(SPR_BOSS,12,8, S_BOSS_RAISE4, 0, 0);  // S_BOSS_RAISE3
  states[552] := MakeState(SPR_BOSS,11,8, S_BOSS_RAISE5, 0, 0);  // S_BOSS_RAISE4
  states[553] := MakeState(SPR_BOSS,10,8, S_BOSS_RAISE6, 0, 0);  // S_BOSS_RAISE5
  states[554] := MakeState(SPR_BOSS,9,8, S_BOSS_RAISE7, 0, 0);  // S_BOSS_RAISE6
  states[555] := MakeState(SPR_BOSS,8,8, S_BOSS_RUN1, 0, 0);  // S_BOSS_RAISE7
  states[556] := MakeState(SPR_BOS2,0,10 {A_Look},S_BOS2_STND2, 0, 0);  // S_BOS2_STND
  states[557] := MakeState(SPR_BOS2,1,10 {A_Look},S_BOS2_STND, 0, 0);  // S_BOS2_STND2
  states[558] := MakeState(SPR_BOS2,0,3 {A_Chase},S_BOS2_RUN2, 0, 0);  // S_BOS2_RUN1
  states[559] := MakeState(SPR_BOS2,0,3 {A_Chase},S_BOS2_RUN3, 0, 0);  // S_BOS2_RUN2
  states[560] := MakeState(SPR_BOS2,1,3 {A_Chase},S_BOS2_RUN4, 0, 0);  // S_BOS2_RUN3
  states[561] := MakeState(SPR_BOS2,1,3 {A_Chase},S_BOS2_RUN5, 0, 0);  // S_BOS2_RUN4
  states[562] := MakeState(SPR_BOS2,2,3 {A_Chase},S_BOS2_RUN6, 0, 0);  // S_BOS2_RUN5
  states[563] := MakeState(SPR_BOS2,2,3 {A_Chase},S_BOS2_RUN7, 0, 0);  // S_BOS2_RUN6
  states[564] := MakeState(SPR_BOS2,3,3 {A_Chase},S_BOS2_RUN8, 0, 0);  // S_BOS2_RUN7
  states[565] := MakeState(SPR_BOS2,3,3 {A_Chase},S_BOS2_RUN1, 0, 0);  // S_BOS2_RUN8
  states[566] := MakeState(SPR_BOS2,4,8 {A_FaceTarget},S_BOS2_ATK2, 0, 0);  // S_BOS2_ATK1
  states[567] := MakeState(SPR_BOS2,5,8 {A_FaceTarget},S_BOS2_ATK3, 0, 0);  // S_BOS2_ATK2
  states[568] := MakeState(SPR_BOS2,6,8 {A_BruisAttack},S_BOS2_RUN1, 0, 0);  // S_BOS2_ATK3
  states[569] := MakeState(SPR_BOS2,7,2, S_BOS2_PAIN2, 0, 0);  // S_BOS2_PAIN
  states[570] := MakeState(SPR_BOS2,7,2 {A_Pain},S_BOS2_RUN1, 0, 0);  // S_BOS2_PAIN2
  states[571] := MakeState(SPR_BOS2,8,8, S_BOS2_DIE2, 0, 0);  // S_BOS2_DIE1
  states[572] := MakeState(SPR_BOS2,9,8 {A_Scream},S_BOS2_DIE3, 0, 0);  // S_BOS2_DIE2
  states[573] := MakeState(SPR_BOS2,10,8, S_BOS2_DIE4, 0, 0);  // S_BOS2_DIE3
  states[574] := MakeState(SPR_BOS2,11,8 {A_Fall},S_BOS2_DIE5, 0, 0);  // S_BOS2_DIE4
  states[575] := MakeState(SPR_BOS2,12,8, S_BOS2_DIE6, 0, 0);  // S_BOS2_DIE5
  states[576] := MakeState(SPR_BOS2,13,8, S_BOS2_DIE7, 0, 0);  // S_BOS2_DIE6
  states[577] := MakeState(SPR_BOS2,14,-1, S_NULL, 0, 0);  // S_BOS2_DIE7
  states[578] := MakeState(SPR_BOS2,14,8, S_BOS2_RAISE2, 0, 0);  // S_BOS2_RAISE1
  states[579] := MakeState(SPR_BOS2,13,8, S_BOS2_RAISE3, 0, 0);  // S_BOS2_RAISE2
  states[580] := MakeState(SPR_BOS2,12,8, S_BOS2_RAISE4, 0, 0);  // S_BOS2_RAISE3
  states[581] := MakeState(SPR_BOS2,11,8, S_BOS2_RAISE5, 0, 0);  // S_BOS2_RAISE4
  states[582] := MakeState(SPR_BOS2,10,8, S_BOS2_RAISE6, 0, 0);  // S_BOS2_RAISE5
  states[583] := MakeState(SPR_BOS2,9,8, S_BOS2_RAISE7, 0, 0);  // S_BOS2_RAISE6
  states[584] := MakeState(SPR_BOS2,8,8, S_BOS2_RUN1, 0, 0);  // S_BOS2_RAISE7
  states[585] := MakeState(SPR_SKUL,32768,10 {A_Look},S_SKULL_STND2, 0, 0);  // S_SKULL_STND
  states[586] := MakeState(SPR_SKUL,32769,10 {A_Look},S_SKULL_STND, 0, 0);  // S_SKULL_STND2
  states[587] := MakeState(SPR_SKUL,32768,6 {A_Chase},S_SKULL_RUN2, 0, 0);  // S_SKULL_RUN1
  states[588] := MakeState(SPR_SKUL,32769,6 {A_Chase},S_SKULL_RUN1, 0, 0);  // S_SKULL_RUN2
  states[589] := MakeState(SPR_SKUL,32770,10 {A_FaceTarget},S_SKULL_ATK2, 0, 0);  // S_SKULL_ATK1
  states[590] := MakeState(SPR_SKUL,32771,4 {A_SkullAttack},S_SKULL_ATK3, 0, 0);  // S_SKULL_ATK2
  states[591] := MakeState(SPR_SKUL,32770,4, S_SKULL_ATK4, 0, 0);  // S_SKULL_ATK3
  states[592] := MakeState(SPR_SKUL,32771,4, S_SKULL_ATK3, 0, 0);  // S_SKULL_ATK4
  states[593] := MakeState(SPR_SKUL,32772,3, S_SKULL_PAIN2, 0, 0);  // S_SKULL_PAIN
  states[594] := MakeState(SPR_SKUL,32772,3 {A_Pain},S_SKULL_RUN1, 0, 0);  // S_SKULL_PAIN2
  states[595] := MakeState(SPR_SKUL,32773,6, S_SKULL_DIE2, 0, 0);  // S_SKULL_DIE1
  states[596] := MakeState(SPR_SKUL,32774,6 {A_Scream},S_SKULL_DIE3, 0, 0);  // S_SKULL_DIE2
  states[597] := MakeState(SPR_SKUL,32775,6, S_SKULL_DIE4, 0, 0);  // S_SKULL_DIE3
  states[598] := MakeState(SPR_SKUL,32776,6 {A_Fall},S_SKULL_DIE5, 0, 0);  // S_SKULL_DIE4
  states[599] := MakeState(SPR_SKUL,9,6, S_SKULL_DIE6, 0, 0);  // S_SKULL_DIE5
  states[600] := MakeState(SPR_SKUL,10,6, S_NULL, 0, 0);  // S_SKULL_DIE6
  states[601] := MakeState(SPR_SPID,0,10 {A_Look},S_SPID_STND2, 0, 0);  // S_SPID_STND
  states[602] := MakeState(SPR_SPID,1,10 {A_Look},S_SPID_STND, 0, 0);  // S_SPID_STND2
  states[603] := MakeState(SPR_SPID,0,3 {A_Metal},S_SPID_RUN2, 0, 0);  // S_SPID_RUN1
  states[604] := MakeState(SPR_SPID,0,3 {A_Chase},S_SPID_RUN3, 0, 0);  // S_SPID_RUN2
  states[605] := MakeState(SPR_SPID,1,3 {A_Chase},S_SPID_RUN4, 0, 0);  // S_SPID_RUN3
  states[606] := MakeState(SPR_SPID,1,3 {A_Chase},S_SPID_RUN5, 0, 0);  // S_SPID_RUN4
  states[607] := MakeState(SPR_SPID,2,3 {A_Metal},S_SPID_RUN6, 0, 0);  // S_SPID_RUN5
  states[608] := MakeState(SPR_SPID,2,3 {A_Chase},S_SPID_RUN7, 0, 0);  // S_SPID_RUN6
  states[609] := MakeState(SPR_SPID,3,3 {A_Chase},S_SPID_RUN8, 0, 0);  // S_SPID_RUN7
  states[610] := MakeState(SPR_SPID,3,3 {A_Chase},S_SPID_RUN9, 0, 0);  // S_SPID_RUN8
  states[611] := MakeState(SPR_SPID,4,3 {A_Metal},S_SPID_RUN10, 0, 0);  // S_SPID_RUN9
  states[612] := MakeState(SPR_SPID,4,3 {A_Chase},S_SPID_RUN11, 0, 0);  // S_SPID_RUN10
  states[613] := MakeState(SPR_SPID,5,3 {A_Chase},S_SPID_RUN12, 0, 0);  // S_SPID_RUN11
  states[614] := MakeState(SPR_SPID,5,3 {A_Chase},S_SPID_RUN1, 0, 0);  // S_SPID_RUN12
  states[615] := MakeState(SPR_SPID,32768,20 {A_FaceTarget},S_SPID_ATK2, 0, 0);  // S_SPID_ATK1
  states[616] := MakeState(SPR_SPID,32774,4 {A_SPosAttack},S_SPID_ATK3, 0, 0);  // S_SPID_ATK2
  states[617] := MakeState(SPR_SPID,32775,4 {A_SPosAttack},S_SPID_ATK4, 0, 0);  // S_SPID_ATK3
  states[618] := MakeState(SPR_SPID,32775,1 {A_SpidRefire},S_SPID_ATK2, 0, 0);  // S_SPID_ATK4
  states[619] := MakeState(SPR_SPID,8,3, S_SPID_PAIN2, 0, 0);  // S_SPID_PAIN
  states[620] := MakeState(SPR_SPID,8,3 {A_Pain},S_SPID_RUN1, 0, 0);  // S_SPID_PAIN2
  states[621] := MakeState(SPR_SPID,9,20 {A_Scream},S_SPID_DIE2, 0, 0);  // S_SPID_DIE1
  states[622] := MakeState(SPR_SPID,10,10 {A_Fall},S_SPID_DIE3, 0, 0);  // S_SPID_DIE2
  states[623] := MakeState(SPR_SPID,11,10, S_SPID_DIE4, 0, 0);  // S_SPID_DIE3
  states[624] := MakeState(SPR_SPID,12,10, S_SPID_DIE5, 0, 0);  // S_SPID_DIE4
  states[625] := MakeState(SPR_SPID,13,10, S_SPID_DIE6, 0, 0);  // S_SPID_DIE5
  states[626] := MakeState(SPR_SPID,14,10, S_SPID_DIE7, 0, 0);  // S_SPID_DIE6
  states[627] := MakeState(SPR_SPID,15,10, S_SPID_DIE8, 0, 0);  // S_SPID_DIE7
  states[628] := MakeState(SPR_SPID,16,10, S_SPID_DIE9, 0, 0);  // S_SPID_DIE8
  states[629] := MakeState(SPR_SPID,17,10, S_SPID_DIE10, 0, 0);  // S_SPID_DIE9
  states[630] := MakeState(SPR_SPID,18,30, S_SPID_DIE11, 0, 0);  // S_SPID_DIE10
  states[631] := MakeState(SPR_SPID,18,-1 {A_BossDeath},S_NULL, 0, 0);  // S_SPID_DIE11
  states[632] := MakeState(SPR_BSPI,0,10 {A_Look},S_BSPI_STND2, 0, 0);  // S_BSPI_STND
  states[633] := MakeState(SPR_BSPI,1,10 {A_Look},S_BSPI_STND, 0, 0);  // S_BSPI_STND2
  states[634] := MakeState(SPR_BSPI,0,20, S_BSPI_RUN1, 0, 0);  // S_BSPI_SIGHT
  states[635] := MakeState(SPR_BSPI,0,3 {A_BabyMetal},S_BSPI_RUN2, 0, 0);  // S_BSPI_RUN1
  states[636] := MakeState(SPR_BSPI,0,3 {A_Chase},S_BSPI_RUN3, 0, 0);  // S_BSPI_RUN2
  states[637] := MakeState(SPR_BSPI,1,3 {A_Chase},S_BSPI_RUN4, 0, 0);  // S_BSPI_RUN3
  states[638] := MakeState(SPR_BSPI,1,3 {A_Chase},S_BSPI_RUN5, 0, 0);  // S_BSPI_RUN4
  states[639] := MakeState(SPR_BSPI,2,3 {A_Chase},S_BSPI_RUN6, 0, 0);  // S_BSPI_RUN5
  states[640] := MakeState(SPR_BSPI,2,3 {A_Chase},S_BSPI_RUN7, 0, 0);  // S_BSPI_RUN6
  states[641] := MakeState(SPR_BSPI,3,3 {A_BabyMetal},S_BSPI_RUN8, 0, 0);  // S_BSPI_RUN7
  states[642] := MakeState(SPR_BSPI,3,3 {A_Chase},S_BSPI_RUN9, 0, 0);  // S_BSPI_RUN8
  states[643] := MakeState(SPR_BSPI,4,3 {A_Chase},S_BSPI_RUN10, 0, 0);  // S_BSPI_RUN9
  states[644] := MakeState(SPR_BSPI,4,3 {A_Chase},S_BSPI_RUN11, 0, 0);  // S_BSPI_RUN10
  states[645] := MakeState(SPR_BSPI,5,3 {A_Chase},S_BSPI_RUN12, 0, 0);  // S_BSPI_RUN11
  states[646] := MakeState(SPR_BSPI,5,3 {A_Chase},S_BSPI_RUN1, 0, 0);  // S_BSPI_RUN12
  states[647] := MakeState(SPR_BSPI,32768,20 {A_FaceTarget},S_BSPI_ATK2, 0, 0);  // S_BSPI_ATK1
  states[648] := MakeState(SPR_BSPI,32774,4 {A_BspiAttack},S_BSPI_ATK3, 0, 0);  // S_BSPI_ATK2
  states[649] := MakeState(SPR_BSPI,32775,4, S_BSPI_ATK4, 0, 0);  // S_BSPI_ATK3
  states[650] := MakeState(SPR_BSPI,32775,1 {A_SpidRefire},S_BSPI_ATK2, 0, 0);  // S_BSPI_ATK4
  states[651] := MakeState(SPR_BSPI,8,3, S_BSPI_PAIN2, 0, 0);  // S_BSPI_PAIN
  states[652] := MakeState(SPR_BSPI,8,3 {A_Pain},S_BSPI_RUN1, 0, 0);  // S_BSPI_PAIN2
  states[653] := MakeState(SPR_BSPI,9,20 {A_Scream},S_BSPI_DIE2, 0, 0);  // S_BSPI_DIE1
  states[654] := MakeState(SPR_BSPI,10,7 {A_Fall},S_BSPI_DIE3, 0, 0);  // S_BSPI_DIE2
  states[655] := MakeState(SPR_BSPI,11,7, S_BSPI_DIE4, 0, 0);  // S_BSPI_DIE3
  states[656] := MakeState(SPR_BSPI,12,7, S_BSPI_DIE5, 0, 0);  // S_BSPI_DIE4
  states[657] := MakeState(SPR_BSPI,13,7, S_BSPI_DIE6, 0, 0);  // S_BSPI_DIE5
  states[658] := MakeState(SPR_BSPI,14,7, S_BSPI_DIE7, 0, 0);  // S_BSPI_DIE6
  states[659] := MakeState(SPR_BSPI,15,-1 {A_BossDeath},S_NULL, 0, 0);  // S_BSPI_DIE7
  states[660] := MakeState(SPR_BSPI,15,5, S_BSPI_RAISE2, 0, 0);  // S_BSPI_RAISE1
  states[661] := MakeState(SPR_BSPI,14,5, S_BSPI_RAISE3, 0, 0);  // S_BSPI_RAISE2
  states[662] := MakeState(SPR_BSPI,13,5, S_BSPI_RAISE4, 0, 0);  // S_BSPI_RAISE3
  states[663] := MakeState(SPR_BSPI,12,5, S_BSPI_RAISE5, 0, 0);  // S_BSPI_RAISE4
  states[664] := MakeState(SPR_BSPI,11,5, S_BSPI_RAISE6, 0, 0);  // S_BSPI_RAISE5
  states[665] := MakeState(SPR_BSPI,10,5, S_BSPI_RAISE7, 0, 0);  // S_BSPI_RAISE6
  states[666] := MakeState(SPR_BSPI,9,5, S_BSPI_RUN1, 0, 0);  // S_BSPI_RAISE7
  states[667] := MakeState(SPR_APLS,32768,5, S_ARACH_PLAZ2, 0, 0);  // S_ARACH_PLAZ
  states[668] := MakeState(SPR_APLS,32769,5, S_ARACH_PLAZ, 0, 0);  // S_ARACH_PLAZ2
  states[669] := MakeState(SPR_APBX,32768,5, S_ARACH_PLEX2, 0, 0);  // S_ARACH_PLEX
  states[670] := MakeState(SPR_APBX,32769,5, S_ARACH_PLEX3, 0, 0);  // S_ARACH_PLEX2
  states[671] := MakeState(SPR_APBX,32770,5, S_ARACH_PLEX4, 0, 0);  // S_ARACH_PLEX3
  states[672] := MakeState(SPR_APBX,32771,5, S_ARACH_PLEX5, 0, 0);  // S_ARACH_PLEX4
  states[673] := MakeState(SPR_APBX,32772,5, S_NULL, 0, 0);  // S_ARACH_PLEX5
  states[674] := MakeState(SPR_CYBR,0,10 {A_Look},S_CYBER_STND2, 0, 0);  // S_CYBER_STND
  states[675] := MakeState(SPR_CYBR,1,10 {A_Look},S_CYBER_STND, 0, 0);  // S_CYBER_STND2
  states[676] := MakeState(SPR_CYBR,0,3 {A_Hoof},S_CYBER_RUN2, 0, 0);  // S_CYBER_RUN1
  states[677] := MakeState(SPR_CYBR,0,3 {A_Chase},S_CYBER_RUN3, 0, 0);  // S_CYBER_RUN2
  states[678] := MakeState(SPR_CYBR,1,3 {A_Chase},S_CYBER_RUN4, 0, 0);  // S_CYBER_RUN3
  states[679] := MakeState(SPR_CYBR,1,3 {A_Chase},S_CYBER_RUN5, 0, 0);  // S_CYBER_RUN4
  states[680] := MakeState(SPR_CYBR,2,3 {A_Chase},S_CYBER_RUN6, 0, 0);  // S_CYBER_RUN5
  states[681] := MakeState(SPR_CYBR,2,3 {A_Chase},S_CYBER_RUN7, 0, 0);  // S_CYBER_RUN6
  states[682] := MakeState(SPR_CYBR,3,3 {A_Metal},S_CYBER_RUN8, 0, 0);  // S_CYBER_RUN7
  states[683] := MakeState(SPR_CYBR,3,3 {A_Chase},S_CYBER_RUN1, 0, 0);  // S_CYBER_RUN8
  states[684] := MakeState(SPR_CYBR,4,6 {A_FaceTarget},S_CYBER_ATK2, 0, 0);  // S_CYBER_ATK1
  states[685] := MakeState(SPR_CYBR,5,12 {A_CyberAttack},S_CYBER_ATK3, 0, 0);  // S_CYBER_ATK2
  states[686] := MakeState(SPR_CYBR,4,12 {A_FaceTarget},S_CYBER_ATK4, 0, 0);  // S_CYBER_ATK3
  states[687] := MakeState(SPR_CYBR,5,12 {A_CyberAttack},S_CYBER_ATK5, 0, 0);  // S_CYBER_ATK4
  states[688] := MakeState(SPR_CYBR,4,12 {A_FaceTarget},S_CYBER_ATK6, 0, 0);  // S_CYBER_ATK5
  states[689] := MakeState(SPR_CYBR,5,12 {A_CyberAttack},S_CYBER_RUN1, 0, 0);  // S_CYBER_ATK6
  states[690] := MakeState(SPR_CYBR,6,10 {A_Pain},S_CYBER_RUN1, 0, 0);  // S_CYBER_PAIN
  states[691] := MakeState(SPR_CYBR,7,10, S_CYBER_DIE2, 0, 0);  // S_CYBER_DIE1
  states[692] := MakeState(SPR_CYBR,8,10 {A_Scream},S_CYBER_DIE3, 0, 0);  // S_CYBER_DIE2
  states[693] := MakeState(SPR_CYBR,9,10, S_CYBER_DIE4, 0, 0);  // S_CYBER_DIE3
  states[694] := MakeState(SPR_CYBR,10,10, S_CYBER_DIE5, 0, 0);  // S_CYBER_DIE4
  states[695] := MakeState(SPR_CYBR,11,10, S_CYBER_DIE6, 0, 0);  // S_CYBER_DIE5
  states[696] := MakeState(SPR_CYBR,12,10 {A_Fall},S_CYBER_DIE7, 0, 0);  // S_CYBER_DIE6
  states[697] := MakeState(SPR_CYBR,13,10, S_CYBER_DIE8, 0, 0);  // S_CYBER_DIE7
  states[698] := MakeState(SPR_CYBR,14,10, S_CYBER_DIE9, 0, 0);  // S_CYBER_DIE8
  states[699] := MakeState(SPR_CYBR,15,30, S_CYBER_DIE10, 0, 0);  // S_CYBER_DIE9
  states[700] := MakeState(SPR_CYBR,15,-1 {A_BossDeath},S_NULL, 0, 0);  // S_CYBER_DIE10
  states[701] := MakeState(SPR_PAIN,0,10 {A_Look},S_PAIN_STND, 0, 0);  // S_PAIN_STND
  states[702] := MakeState(SPR_PAIN,0,3 {A_Chase},S_PAIN_RUN2, 0, 0);  // S_PAIN_RUN1
  states[703] := MakeState(SPR_PAIN,0,3 {A_Chase},S_PAIN_RUN3, 0, 0);  // S_PAIN_RUN2
  states[704] := MakeState(SPR_PAIN,1,3 {A_Chase},S_PAIN_RUN4, 0, 0);  // S_PAIN_RUN3
  states[705] := MakeState(SPR_PAIN,1,3 {A_Chase},S_PAIN_RUN5, 0, 0);  // S_PAIN_RUN4
  states[706] := MakeState(SPR_PAIN,2,3 {A_Chase},S_PAIN_RUN6, 0, 0);  // S_PAIN_RUN5
  states[707] := MakeState(SPR_PAIN,2,3 {A_Chase},S_PAIN_RUN1, 0, 0);  // S_PAIN_RUN6
  states[708] := MakeState(SPR_PAIN,3,5 {A_FaceTarget},S_PAIN_ATK2, 0, 0);  // S_PAIN_ATK1
  states[709] := MakeState(SPR_PAIN,4,5 {A_FaceTarget},S_PAIN_ATK3, 0, 0);  // S_PAIN_ATK2
  states[710] := MakeState(SPR_PAIN,32773,5 {A_FaceTarget},S_PAIN_ATK4, 0, 0);  // S_PAIN_ATK3
  states[711] := MakeState(SPR_PAIN,32773,0 {A_PainAttack},S_PAIN_RUN1, 0, 0);  // S_PAIN_ATK4
  states[712] := MakeState(SPR_PAIN,6,6, S_PAIN_PAIN2, 0, 0);  // S_PAIN_PAIN
  states[713] := MakeState(SPR_PAIN,6,6 {A_Pain},S_PAIN_RUN1, 0, 0);  // S_PAIN_PAIN2
  states[714] := MakeState(SPR_PAIN,32775,8, S_PAIN_DIE2, 0, 0);  // S_PAIN_DIE1
  states[715] := MakeState(SPR_PAIN,32776,8 {A_Scream},S_PAIN_DIE3, 0, 0);  // S_PAIN_DIE2
  states[716] := MakeState(SPR_PAIN,32777,8, S_PAIN_DIE4, 0, 0);  // S_PAIN_DIE3
  states[717] := MakeState(SPR_PAIN,32778,8, S_PAIN_DIE5, 0, 0);  // S_PAIN_DIE4
  states[718] := MakeState(SPR_PAIN,32779,8 {A_PainDie},S_PAIN_DIE6, 0, 0);  // S_PAIN_DIE5
  states[719] := MakeState(SPR_PAIN,32780,8, S_NULL, 0, 0);  // S_PAIN_DIE6
  states[720] := MakeState(SPR_PAIN,12,8, S_PAIN_RAISE2, 0, 0);  // S_PAIN_RAISE1
  states[721] := MakeState(SPR_PAIN,11,8, S_PAIN_RAISE3, 0, 0);  // S_PAIN_RAISE2
  states[722] := MakeState(SPR_PAIN,10,8, S_PAIN_RAISE4, 0, 0);  // S_PAIN_RAISE3
  states[723] := MakeState(SPR_PAIN,9,8, S_PAIN_RAISE5, 0, 0);  // S_PAIN_RAISE4
  states[724] := MakeState(SPR_PAIN,8,8, S_PAIN_RAISE6, 0, 0);  // S_PAIN_RAISE5
  states[725] := MakeState(SPR_PAIN,7,8, S_PAIN_RUN1, 0, 0);  // S_PAIN_RAISE6
  states[726] := MakeState(SPR_SSWV,0,10 {A_Look},S_SSWV_STND2, 0, 0);  // S_SSWV_STND
  states[727] := MakeState(SPR_SSWV,1,10 {A_Look},S_SSWV_STND, 0, 0);  // S_SSWV_STND2
  states[728] := MakeState(SPR_SSWV,0,3 {A_Chase},S_SSWV_RUN2, 0, 0);  // S_SSWV_RUN1
  states[729] := MakeState(SPR_SSWV,0,3 {A_Chase},S_SSWV_RUN3, 0, 0);  // S_SSWV_RUN2
  states[730] := MakeState(SPR_SSWV,1,3 {A_Chase},S_SSWV_RUN4, 0, 0);  // S_SSWV_RUN3
  states[731] := MakeState(SPR_SSWV,1,3 {A_Chase},S_SSWV_RUN5, 0, 0);  // S_SSWV_RUN4
  states[732] := MakeState(SPR_SSWV,2,3 {A_Chase},S_SSWV_RUN6, 0, 0);  // S_SSWV_RUN5
  states[733] := MakeState(SPR_SSWV,2,3 {A_Chase},S_SSWV_RUN7, 0, 0);  // S_SSWV_RUN6
  states[734] := MakeState(SPR_SSWV,3,3 {A_Chase},S_SSWV_RUN8, 0, 0);  // S_SSWV_RUN7
  states[735] := MakeState(SPR_SSWV,3,3 {A_Chase},S_SSWV_RUN1, 0, 0);  // S_SSWV_RUN8
  states[736] := MakeState(SPR_SSWV,4,10 {A_FaceTarget},S_SSWV_ATK2, 0, 0);  // S_SSWV_ATK1
  states[737] := MakeState(SPR_SSWV,5,10 {A_FaceTarget},S_SSWV_ATK3, 0, 0);  // S_SSWV_ATK2
  states[738] := MakeState(SPR_SSWV,32774,4 {A_CPosAttack},S_SSWV_ATK4, 0, 0);  // S_SSWV_ATK3
  states[739] := MakeState(SPR_SSWV,5,6 {A_FaceTarget},S_SSWV_ATK5, 0, 0);  // S_SSWV_ATK4
  states[740] := MakeState(SPR_SSWV,32774,4 {A_CPosAttack},S_SSWV_ATK6, 0, 0);  // S_SSWV_ATK5
  states[741] := MakeState(SPR_SSWV,5,1 {A_CPosRefire},S_SSWV_ATK2, 0, 0);  // S_SSWV_ATK6
  states[742] := MakeState(SPR_SSWV,7,3, S_SSWV_PAIN2, 0, 0);  // S_SSWV_PAIN
  states[743] := MakeState(SPR_SSWV,7,3 {A_Pain},S_SSWV_RUN1, 0, 0);  // S_SSWV_PAIN2
  states[744] := MakeState(SPR_SSWV,8,5, S_SSWV_DIE2, 0, 0);  // S_SSWV_DIE1
  states[745] := MakeState(SPR_SSWV,9,5 {A_Scream},S_SSWV_DIE3, 0, 0);  // S_SSWV_DIE2
  states[746] := MakeState(SPR_SSWV,10,5 {A_Fall},S_SSWV_DIE4, 0, 0);  // S_SSWV_DIE3
  states[747] := MakeState(SPR_SSWV,11,5, S_SSWV_DIE5, 0, 0);  // S_SSWV_DIE4
  states[748] := MakeState(SPR_SSWV,12,-1, S_NULL, 0, 0);  // S_SSWV_DIE5
  states[749] := MakeState(SPR_SSWV,13,5, S_SSWV_XDIE2, 0, 0);  // S_SSWV_XDIE1
  states[750] := MakeState(SPR_SSWV,14,5 {A_XScream},S_SSWV_XDIE3, 0, 0);  // S_SSWV_XDIE2
  states[751] := MakeState(SPR_SSWV,15,5 {A_Fall},S_SSWV_XDIE4, 0, 0);  // S_SSWV_XDIE3
  states[752] := MakeState(SPR_SSWV,16,5, S_SSWV_XDIE5, 0, 0);  // S_SSWV_XDIE4
  states[753] := MakeState(SPR_SSWV,17,5, S_SSWV_XDIE6, 0, 0);  // S_SSWV_XDIE5
  states[754] := MakeState(SPR_SSWV,18,5, S_SSWV_XDIE7, 0, 0);  // S_SSWV_XDIE6
  states[755] := MakeState(SPR_SSWV,19,5, S_SSWV_XDIE8, 0, 0);  // S_SSWV_XDIE7
  states[756] := MakeState(SPR_SSWV,20,5, S_SSWV_XDIE9, 0, 0);  // S_SSWV_XDIE8
  states[757] := MakeState(SPR_SSWV,21,-1, S_NULL, 0, 0);  // S_SSWV_XDIE9
  states[758] := MakeState(SPR_SSWV,12,5, S_SSWV_RAISE2, 0, 0);  // S_SSWV_RAISE1
  states[759] := MakeState(SPR_SSWV,11,5, S_SSWV_RAISE3, 0, 0);  // S_SSWV_RAISE2
  states[760] := MakeState(SPR_SSWV,10,5, S_SSWV_RAISE4, 0, 0);  // S_SSWV_RAISE3
  states[761] := MakeState(SPR_SSWV,9,5, S_SSWV_RAISE5, 0, 0);  // S_SSWV_RAISE4
  states[762] := MakeState(SPR_SSWV,8,5, S_SSWV_RUN1, 0, 0);  // S_SSWV_RAISE5
  states[763] := MakeState(SPR_KEEN,0,-1, S_KEENSTND, 0, 0);  // S_KEENSTND
  states[764] := MakeState(SPR_KEEN,0,6, S_COMMKEEN2, 0, 0);  // S_COMMKEEN
  states[765] := MakeState(SPR_KEEN,1,6, S_COMMKEEN3, 0, 0);  // S_COMMKEEN2
  states[766] := MakeState(SPR_KEEN,2,6 {A_Scream},S_COMMKEEN4, 0, 0);  // S_COMMKEEN3
  states[767] := MakeState(SPR_KEEN,3,6, S_COMMKEEN5, 0, 0);  // S_COMMKEEN4
  states[768] := MakeState(SPR_KEEN,4,6, S_COMMKEEN6, 0, 0);  // S_COMMKEEN5
  states[769] := MakeState(SPR_KEEN,5,6, S_COMMKEEN7, 0, 0);  // S_COMMKEEN6
  states[770] := MakeState(SPR_KEEN,6,6, S_COMMKEEN8, 0, 0);  // S_COMMKEEN7
  states[771] := MakeState(SPR_KEEN,7,6, S_COMMKEEN9, 0, 0);  // S_COMMKEEN8
  states[772] := MakeState(SPR_KEEN,8,6, S_COMMKEEN10, 0, 0);  // S_COMMKEEN9
  states[773] := MakeState(SPR_KEEN,9,6, S_COMMKEEN11, 0, 0);  // S_COMMKEEN10
  states[774] := MakeState(SPR_KEEN,10,6 {A_KeenDie},S_COMMKEEN12, 0, 0);// S_COMMKEEN11
  states[775] := MakeState(SPR_KEEN,11,-1, S_NULL, 0, 0);    // S_COMMKEEN12
  states[776] := MakeState(SPR_KEEN,12,4, S_KEENPAIN2, 0, 0);  // S_KEENPAIN
  states[777] := MakeState(SPR_KEEN,12,8 {A_Pain},S_KEENSTND, 0, 0);  // S_KEENPAIN2
  states[778] := MakeState(SPR_BBRN,0,-1, S_NULL, 0, 0);    // S_BRAIN
  states[779] := MakeState(SPR_BBRN,1,36 {A_BrainPain},S_BRAIN, 0, 0);  // S_BRAIN_PAIN
  states[780] := MakeState(SPR_BBRN,0,100 {A_BrainScream},S_BRAIN_DIE2, 0, 0);  // S_BRAIN_DIE1
  states[781] := MakeState(SPR_BBRN,0,10, S_BRAIN_DIE3, 0, 0);  // S_BRAIN_DIE2
  states[782] := MakeState(SPR_BBRN,0,10, S_BRAIN_DIE4, 0, 0);  // S_BRAIN_DIE3
  states[783] := MakeState(SPR_BBRN,0,-1 {A_BrainDie},S_NULL, 0, 0);  // S_BRAIN_DIE4
  states[784] := MakeState(SPR_SSWV,0,10 {A_Look},S_BRAINEYE, 0, 0);  // S_BRAINEYE
  states[785] := MakeState(SPR_SSWV,0,181 {A_BrainAwake},S_BRAINEYE1, 0, 0);  // S_BRAINEYESEE
  states[786] := MakeState(SPR_SSWV,0,150 {A_BrainSpit},S_BRAINEYE1, 0, 0);  // S_BRAINEYE1
  states[787] := MakeState(SPR_BOSF,32768,3 {A_SpawnSound},S_SPAWN2, 0, 0);  // S_SPAWN1
  states[788] := MakeState(SPR_BOSF,32769,3 {A_SpawnFly},S_SPAWN3, 0, 0);  // S_SPAWN2
  states[789] := MakeState(SPR_BOSF,32770,3 {A_SpawnFly},S_SPAWN4, 0, 0);  // S_SPAWN3
  states[790] := MakeState(SPR_BOSF,32771,3 {A_SpawnFly},S_SPAWN1, 0, 0);  // S_SPAWN4
  states[791] := MakeState(SPR_FIRE,32768,4 {A_Fire},S_SPAWNFIRE2, 0, 0);  // S_SPAWNFIRE1
  states[792] := MakeState(SPR_FIRE,32769,4 {A_Fire},S_SPAWNFIRE3, 0, 0);  // S_SPAWNFIRE2
  states[793] := MakeState(SPR_FIRE,32770,4 {A_Fire},S_SPAWNFIRE4, 0, 0);  // S_SPAWNFIRE3
  states[794] := MakeState(SPR_FIRE,32771,4 {A_Fire},S_SPAWNFIRE5, 0, 0);  // S_SPAWNFIRE4
  states[795] := MakeState(SPR_FIRE,32772,4 {A_Fire},S_SPAWNFIRE6, 0, 0);  // S_SPAWNFIRE5
  states[796] := MakeState(SPR_FIRE,32773,4 {A_Fire},S_SPAWNFIRE7, 0, 0);  // S_SPAWNFIRE6
  states[797] := MakeState(SPR_FIRE,32774,4 {A_Fire},S_SPAWNFIRE8, 0, 0);  // S_SPAWNFIRE7
  states[798] := MakeState(SPR_FIRE,32775,4 {A_Fire},S_NULL, 0, 0);    // S_SPAWNFIRE8
  states[799] := MakeState(SPR_MISL,32769,10, S_BRAINEXPLODE2, 0, 0);  // S_BRAINEXPLODE1
  states[800] := MakeState(SPR_MISL,32770,10, S_BRAINEXPLODE3, 0, 0);  // S_BRAINEXPLODE2
  states[801] := MakeState(SPR_MISL,32771,10 {A_BrainExplode},S_NULL, 0, 0);  // S_BRAINEXPLODE3
  states[802] := MakeState(SPR_ARM1,0,6, S_ARM1A, 0, 0);  // S_ARM1
  states[803] := MakeState(SPR_ARM1,32769,7, S_ARM1, 0, 0);  // S_ARM1A
  states[804] := MakeState(SPR_ARM2,0,6, S_ARM2A, 0, 0);  // S_ARM2
  states[805] := MakeState(SPR_ARM2,32769,6, S_ARM2, 0, 0);  // S_ARM2A
  states[806] := MakeState(SPR_BAR1,0,6, S_BAR2, 0, 0);  // S_BAR1
  states[807] := MakeState(SPR_BAR1,1,6, S_BAR1, 0, 0);  // S_BAR2
  states[808] := MakeState(SPR_BEXP,32768,5, S_BEXP2, 0, 0);  // S_BEXP
  states[809] := MakeState(SPR_BEXP,32769,5 {A_Scream},S_BEXP3, 0, 0);  // S_BEXP2
  states[810] := MakeState(SPR_BEXP,32770,5, S_BEXP4, 0, 0);  // S_BEXP3
  states[811] := MakeState(SPR_BEXP,32771,10 {A_Explode},S_BEXP5, 0, 0);  // S_BEXP4
  states[812] := MakeState(SPR_BEXP,32772,10, S_NULL, 0, 0);  // S_BEXP5
  states[813] := MakeState(SPR_FCAN,32768,4, S_BBAR2, 0, 0);  // S_BBAR1
  states[814] := MakeState(SPR_FCAN,32769,4, S_BBAR3, 0, 0);  // S_BBAR2
  states[815] := MakeState(SPR_FCAN,32770,4, S_BBAR1, 0, 0);  // S_BBAR3
  states[816] := MakeState(SPR_BON1,0,6, S_BON1A, 0, 0);  // S_BON1
  states[817] := MakeState(SPR_BON1,1,6, S_BON1B, 0, 0);  // S_BON1A
  states[818] := MakeState(SPR_BON1,2,6, S_BON1C, 0, 0);  // S_BON1B
  states[819] := MakeState(SPR_BON1,3,6, S_BON1D, 0, 0);  // S_BON1C
  states[820] := MakeState(SPR_BON1,2,6, S_BON1E, 0, 0);  // S_BON1D
  states[821] := MakeState(SPR_BON1,1,6, S_BON1, 0, 0);  // S_BON1E
  states[822] := MakeState(SPR_BON2,0,6, S_BON2A, 0, 0);  // S_BON2
  states[823] := MakeState(SPR_BON2,1,6, S_BON2B, 0, 0);  // S_BON2A
  states[824] := MakeState(SPR_BON2,2,6, S_BON2C, 0, 0);  // S_BON2B
  states[825] := MakeState(SPR_BON2,3,6, S_BON2D, 0, 0);  // S_BON2C
  states[826] := MakeState(SPR_BON2,2,6, S_BON2E, 0, 0);  // S_BON2D
  states[827] := MakeState(SPR_BON2,1,6, S_BON2, 0, 0);  // S_BON2E
  states[828] := MakeState(SPR_BKEY,0,10, S_BKEY2, 0, 0);  // S_BKEY
  states[829] := MakeState(SPR_BKEY,32769,10, S_BKEY, 0, 0);  // S_BKEY2
  states[830] := MakeState(SPR_RKEY,0,10, S_RKEY2, 0, 0);  // S_RKEY
  states[831] := MakeState(SPR_RKEY,32769,10, S_RKEY, 0, 0);  // S_RKEY2
  states[832] := MakeState(SPR_YKEY,0,10, S_YKEY2, 0, 0);  // S_YKEY
  states[833] := MakeState(SPR_YKEY,32769,10, S_YKEY, 0, 0);  // S_YKEY2
  states[834] := MakeState(SPR_BSKU,0,10, S_BSKULL2, 0, 0);  // S_BSKULL
  states[835] := MakeState(SPR_BSKU,32769,10, S_BSKULL, 0, 0);  // S_BSKULL2
  states[836] := MakeState(SPR_RSKU,0,10, S_RSKULL2, 0, 0);  // S_RSKULL
  states[837] := MakeState(SPR_RSKU,32769,10, S_RSKULL, 0, 0);  // S_RSKULL2
  states[838] := MakeState(SPR_YSKU,0,10, S_YSKULL2, 0, 0);  // S_YSKULL
  states[839] := MakeState(SPR_YSKU,32769,10, S_YSKULL, 0, 0);  // S_YSKULL2
  states[840] := MakeState(SPR_STIM,0,-1, S_NULL, 0, 0);  // S_STIM
  states[841] := MakeState(SPR_MEDI,0,-1, S_NULL, 0, 0);  // S_MEDI
  states[842] := MakeState(SPR_SOUL,32768,6, S_SOUL2, 0, 0);  // S_SOUL
  states[843] := MakeState(SPR_SOUL,32769,6, S_SOUL3, 0, 0);  // S_SOUL2
  states[844] := MakeState(SPR_SOUL,32770,6, S_SOUL4, 0, 0);  // S_SOUL3
  states[845] := MakeState(SPR_SOUL,32771,6, S_SOUL5, 0, 0);  // S_SOUL4
  states[846] := MakeState(SPR_SOUL,32770,6, S_SOUL6, 0, 0);  // S_SOUL5
  states[847] := MakeState(SPR_SOUL,32769,6, S_SOUL, 0, 0);  // S_SOUL6
  states[848] := MakeState(SPR_PINV,32768,6, S_PINV2, 0, 0);  // S_PINV
  states[849] := MakeState(SPR_PINV,32769,6, S_PINV3, 0, 0);  // S_PINV2
  states[850] := MakeState(SPR_PINV,32770,6, S_PINV4, 0, 0);  // S_PINV3
  states[851] := MakeState(SPR_PINV,32771,6, S_PINV, 0, 0);  // S_PINV4
  states[852] := MakeState(SPR_PSTR,32768,-1, S_NULL, 0, 0);  // S_PSTR
  states[853] := MakeState(SPR_PINS,32768,6, S_PINS2, 0, 0);  // S_PINS
  states[854] := MakeState(SPR_PINS,32769,6, S_PINS3, 0, 0);  // S_PINS2
  states[855] := MakeState(SPR_PINS,32770,6, S_PINS4, 0, 0);  // S_PINS3
  states[856] := MakeState(SPR_PINS,32771,6, S_PINS, 0, 0);  // S_PINS4
  states[857] := MakeState(SPR_MEGA,32768,6, S_MEGA2, 0, 0);  // S_MEGA
  states[858] := MakeState(SPR_MEGA,32769,6, S_MEGA3, 0, 0);  // S_MEGA2
  states[859] := MakeState(SPR_MEGA,32770,6, S_MEGA4, 0, 0);  // S_MEGA3
  states[860] := MakeState(SPR_MEGA,32771,6, S_MEGA, 0, 0);  // S_MEGA4
  states[861] := MakeState(SPR_SUIT,32768,-1, S_NULL, 0, 0);  // S_SUIT
  states[862] := MakeState(SPR_PMAP,32768,6, S_PMAP2, 0, 0);  // S_PMAP
  states[863] := MakeState(SPR_PMAP,32769,6, S_PMAP3, 0, 0);  // S_PMAP2
  states[864] := MakeState(SPR_PMAP,32770,6, S_PMAP4, 0, 0);  // S_PMAP3
  states[865] := MakeState(SPR_PMAP,32771,6, S_PMAP5, 0, 0);  // S_PMAP4
  states[866] := MakeState(SPR_PMAP,32770,6, S_PMAP6, 0, 0);  // S_PMAP5
  states[867] := MakeState(SPR_PMAP,32769,6, S_PMAP, 0, 0);  // S_PMAP6
  states[868] := MakeState(SPR_PVIS,32768,6, S_PVIS2, 0, 0);  // S_PVIS
  states[869] := MakeState(SPR_PVIS,1,6, S_PVIS, 0, 0);  // S_PVIS2
  states[870] := MakeState(SPR_CLIP,0,-1, S_NULL, 0, 0);  // S_CLIP
  states[871] := MakeState(SPR_AMMO,0,-1, S_NULL, 0, 0);  // S_AMMO
  states[872] := MakeState(SPR_ROCK,0,-1, S_NULL, 0, 0);  // S_ROCK
  states[873] := MakeState(SPR_BROK,0,-1, S_NULL, 0, 0);  // S_BROK
  states[874] := MakeState(SPR_CELL,0,-1, S_NULL, 0, 0);  // S_CELL
  states[875] := MakeState(SPR_CELP,0,-1, S_NULL, 0, 0);  // S_CELP
  states[876] := MakeState(SPR_SHEL,0,-1, S_NULL, 0, 0);  // S_SHEL
  states[877] := MakeState(SPR_SBOX,0,-1, S_NULL, 0, 0);  // S_SBOX
  states[878] := MakeState(SPR_BPAK,0,-1, S_NULL, 0, 0);  // S_BPAK
  states[879] := MakeState(SPR_BFUG,0,-1, S_NULL, 0, 0);  // S_BFUG
  states[880] := MakeState(SPR_MGUN,0,-1, S_NULL, 0, 0);  // S_MGUN
  states[881] := MakeState(SPR_CSAW,0,-1, S_NULL, 0, 0);  // S_CSAW
  states[882] := MakeState(SPR_LAUN,0,-1, S_NULL, 0, 0);  // S_LAUN
  states[883] := MakeState(SPR_PLAS,0,-1, S_NULL, 0, 0);  // S_PLAS
  states[884] := MakeState(SPR_SHOT,0,-1, S_NULL, 0, 0);  // S_SHOT
  states[885] := MakeState(SPR_SGN2,0,-1, S_NULL, 0, 0);  // S_SHOT2
  states[886] := MakeState(SPR_COLU,32768,-1, S_NULL, 0, 0);  // S_COLU
  states[887] := MakeState(SPR_SMT2,0,-1, S_NULL, 0, 0);  // S_STALAG
  states[888] := MakeState(SPR_GOR1,0,10, S_BLOODYTWITCH2, 0, 0);  // S_BLOODYTWITCH
  states[889] := MakeState(SPR_GOR1,1,15, S_BLOODYTWITCH3, 0, 0);  // S_BLOODYTWITCH2
  states[890] := MakeState(SPR_GOR1,2,8, S_BLOODYTWITCH4, 0, 0);  // S_BLOODYTWITCH3
  states[891] := MakeState(SPR_GOR1,1,6, S_BLOODYTWITCH, 0, 0);  // S_BLOODYTWITCH4
  states[892] := MakeState(SPR_PLAY,13,-1, S_NULL, 0, 0);  // S_DEADTORSO
  states[893] := MakeState(SPR_PLAY,18,-1, S_NULL, 0, 0);  // S_DEADBOTTOM
  states[894] := MakeState(SPR_POL2,0,-1, S_NULL, 0, 0);  // S_HEADSONSTICK
  states[895] := MakeState(SPR_POL5,0,-1, S_NULL, 0, 0);  // S_GIBS
  states[896] := MakeState(SPR_POL4,0,-1, S_NULL, 0, 0);  // S_HEADONASTICK
  states[897] := MakeState(SPR_POL3,32768,6, S_HEADCANDLES2, 0, 0);  // S_HEADCANDLES
  states[898] := MakeState(SPR_POL3,32769,6, S_HEADCANDLES, 0, 0);  // S_HEADCANDLES2
  states[899] := MakeState(SPR_POL1,0,-1, S_NULL, 0, 0);  // S_DEADSTICK
  states[900] := MakeState(SPR_POL6,0,6, S_LIVESTICK2, 0, 0);  // S_LIVESTICK
  states[901] := MakeState(SPR_POL6,1,8, S_LIVESTICK, 0, 0);  // S_LIVESTICK2
  states[902] := MakeState(SPR_GOR2,0,-1, S_NULL, 0, 0);  // S_MEAT2
  states[903] := MakeState(SPR_GOR3,0,-1, S_NULL, 0, 0);  // S_MEAT3
  states[904] := MakeState(SPR_GOR4,0,-1, S_NULL, 0, 0);  // S_MEAT4
  states[905] := MakeState(SPR_GOR5,0,-1, S_NULL, 0, 0);  // S_MEAT5
  states[906] := MakeState(SPR_SMIT,0,-1, S_NULL, 0, 0);  // S_STALAGTITE
  states[907] := MakeState(SPR_COL1,0,-1, S_NULL, 0, 0);  // S_TALLGRNCOL
  states[908] := MakeState(SPR_COL2,0,-1, S_NULL, 0, 0);  // S_SHRTGRNCOL
  states[909] := MakeState(SPR_COL3,0,-1, S_NULL, 0, 0);  // S_TALLREDCOL
  states[910] := MakeState(SPR_COL4,0,-1, S_NULL, 0, 0);  // S_SHRTREDCOL
  states[911] := MakeState(SPR_CAND,32768,-1, S_NULL, 0, 0);  // S_CANDLESTIK
  states[912] := MakeState(SPR_CBRA,32768,-1, S_NULL, 0, 0);  // S_CANDELABRA
  states[913] := MakeState(SPR_COL6,0,-1, S_NULL, 0, 0);  // S_SKULLCOL
  states[914] := MakeState(SPR_TRE1,0,-1, S_NULL, 0, 0);  // S_TORCHTREE
  states[915] := MakeState(SPR_TRE2,0,-1, S_NULL, 0, 0);  // S_BIGTREE
  states[916] := MakeState(SPR_ELEC,0,-1, S_NULL, 0, 0);  // S_TECHPILLAR
  states[917] := MakeState(SPR_CEYE,32768,6, S_EVILEYE2, 0, 0);  // S_EVILEYE
  states[918] := MakeState(SPR_CEYE,32769,6, S_EVILEYE3, 0, 0);  // S_EVILEYE2
  states[919] := MakeState(SPR_CEYE,32770,6, S_EVILEYE4, 0, 0);  // S_EVILEYE3
  states[920] := MakeState(SPR_CEYE,32769,6, S_EVILEYE, 0, 0);  // S_EVILEYE4
  states[921] := MakeState(SPR_FSKU,32768,6, S_FLOATSKULL2, 0, 0);  // S_FLOATSKULL
  states[922] := MakeState(SPR_FSKU,32769,6, S_FLOATSKULL3, 0, 0);  // S_FLOATSKULL2
  states[923] := MakeState(SPR_FSKU,32770,6, S_FLOATSKULL, 0, 0);  // S_FLOATSKULL3
  states[924] := MakeState(SPR_COL5,0,14, S_HEARTCOL2, 0, 0);  // S_HEARTCOL
  states[925] := MakeState(SPR_COL5,1,14, S_HEARTCOL, 0, 0);  // S_HEARTCOL2
  states[926] := MakeState(SPR_TBLU,32768,4, S_BLUETORCH2, 0, 0);  // S_BLUETORCH
  states[927] := MakeState(SPR_TBLU,32769,4, S_BLUETORCH3, 0, 0);  // S_BLUETORCH2
  states[928] := MakeState(SPR_TBLU,32770,4, S_BLUETORCH4, 0, 0);  // S_BLUETORCH3
  states[929] := MakeState(SPR_TBLU,32771,4, S_BLUETORCH, 0, 0);  // S_BLUETORCH4
  states[930] := MakeState(SPR_TGRN,32768,4, S_GREENTORCH2, 0, 0);  // S_GREENTORCH
  states[931] := MakeState(SPR_TGRN,32769,4, S_GREENTORCH3, 0, 0);  // S_GREENTORCH2
  states[932] := MakeState(SPR_TGRN,32770,4, S_GREENTORCH4, 0, 0);  // S_GREENTORCH3
  states[933] := MakeState(SPR_TGRN,32771,4, S_GREENTORCH, 0, 0);  // S_GREENTORCH4
  states[934] := MakeState(SPR_TRED,32768,4, S_REDTORCH2, 0, 0);  // S_REDTORCH
  states[935] := MakeState(SPR_TRED,32769,4, S_REDTORCH3, 0, 0);  // S_REDTORCH2
  states[936] := MakeState(SPR_TRED,32770,4, S_REDTORCH4, 0, 0);  // S_REDTORCH3
  states[937] := MakeState(SPR_TRED,32771,4, S_REDTORCH, 0, 0);  // S_REDTORCH4
  states[938] := MakeState(SPR_SMBT,32768,4, S_BTORCHSHRT2, 0, 0);  // S_BTORCHSHRT
  states[939] := MakeState(SPR_SMBT,32769,4, S_BTORCHSHRT3, 0, 0);  // S_BTORCHSHRT2
  states[940] := MakeState(SPR_SMBT,32770,4, S_BTORCHSHRT4, 0, 0);  // S_BTORCHSHRT3
  states[941] := MakeState(SPR_SMBT,32771,4, S_BTORCHSHRT, 0, 0);  // S_BTORCHSHRT4
  states[942] := MakeState(SPR_SMGT,32768,4, S_GTORCHSHRT2, 0, 0);  // S_GTORCHSHRT
  states[943] := MakeState(SPR_SMGT,32769,4, S_GTORCHSHRT3, 0, 0);  // S_GTORCHSHRT2
  states[944] := MakeState(SPR_SMGT,32770,4, S_GTORCHSHRT4, 0, 0);  // S_GTORCHSHRT3
  states[945] := MakeState(SPR_SMGT,32771,4, S_GTORCHSHRT, 0, 0);  // S_GTORCHSHRT4
  states[946] := MakeState(SPR_SMRT,32768,4, S_RTORCHSHRT2, 0, 0);  // S_RTORCHSHRT
  states[947] := MakeState(SPR_SMRT,32769,4, S_RTORCHSHRT3, 0, 0);  // S_RTORCHSHRT2
  states[948] := MakeState(SPR_SMRT,32770,4, S_RTORCHSHRT4, 0, 0);  // S_RTORCHSHRT3
  states[949] := MakeState(SPR_SMRT,32771,4, S_RTORCHSHRT, 0, 0);  // S_RTORCHSHRT4
  states[950] := MakeState(SPR_HDB1,0,-1, S_NULL, 0, 0);  // S_HANGNOGUTS
  states[951] := MakeState(SPR_HDB2,0,-1, S_NULL, 0, 0);  // S_HANGBNOBRAIN
  states[952] := MakeState(SPR_HDB3,0,-1, S_NULL, 0, 0);  // S_HANGTLOOKDN
  states[953] := MakeState(SPR_HDB4,0,-1, S_NULL, 0, 0);  // S_HANGTSKULL
  states[954] := MakeState(SPR_HDB5,0,-1, S_NULL, 0, 0);  // S_HANGTLOOKUP
  states[955] := MakeState(SPR_HDB6,0,-1, S_NULL, 0, 0);  // S_HANGTNOBRAIN
  states[956] := MakeState(SPR_POB1,0,-1, S_NULL, 0, 0);  // S_COLONGIBS
  states[957] := MakeState(SPR_POB2,0,-1, S_NULL, 0, 0);  // S_SMALLPOOL
  states[958] := MakeState(SPR_BRS1,0,-1, S_NULL, 0, 0);    // S_BRAINSTEM
  states[959] := MakeState(SPR_TLMP,32768,4, S_TECHLAMP2, 0, 0);  // S_TECHLAMP
  states[960] := MakeState(SPR_TLMP,32769,4, S_TECHLAMP3, 0, 0);  // S_TECHLAMP2
  states[961] := MakeState(SPR_TLMP,32770,4, S_TECHLAMP4, 0, 0);  // S_TECHLAMP3
  states[962] := MakeState(SPR_TLMP,32771,4, S_TECHLAMP, 0, 0);  // S_TECHLAMP4
  states[963] := MakeState(SPR_TLP2,32768,4, S_TECH2LAMP2, 0, 0);  // S_TECH2LAMP
  states[964] := MakeState(SPR_TLP2,32769,4, S_TECH2LAMP3, 0, 0);  // S_TECH2LAMP2
  states[965] := MakeState(SPR_TLP2,32770,4, S_TECH2LAMP4, 0, 0);  // S_TECH2LAMP3
  states[966] := MakeState(SPR_TLP2,32771,4, S_TECH2LAMP, 0, 0);  // S_TECH2LAMP4


  GetMem(mobjinfo, ord(NUMMOBJTYPES) * SizeOf(mobjinfo_t));

  mobjinfo[0] := MakeObjInfo(    // MT_PLAYER
    -1,  // doomednum
    ord(S_PLAY),  // spawnstate
    100,  // spawnhealth
    ord(S_PLAY_RUN1),  // seestate
    0{sfx_None},  // seesound
    0,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_PLAY_PAIN),  // painstate
    255,  // painchance
    0{sfx_plpain},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_PLAY_ATK1),  // missilestate
    ord(S_PLAY_DIE1),  // deathstate
    ord(S_PLAY_XDIE1),  // xdeathstate
    0{sfx_pldeth},  // deathsound
    0,  // speed
    16,  // radius
    56,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_DROPOFF|MF_PICKUP|MF_NOTDMATCH,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[1] := MakeObjInfo(    // MT_POSSESSED
    3004,  // doomednum
    ord(S_POSS_STND),  // spawnstate
    20,  // spawnhealth
    ord(S_POSS_RUN1),  // seestate
    0{sfx_posit1},  // seesound
    8,  // reactiontime
    0{sfx_pistol},  // attacksound
    ord(S_POSS_PAIN),  // painstate
    200,  // painchance
    0{sfx_popain},  // painsound
    0,  // meleestate
    ord(S_POSS_ATK1),  // missilestate
    ord(S_POSS_DIE1),  // deathstate
    ord(S_POSS_XDIE1),  // xdeathstate
    0{sfx_podth1},  // deathsound
    8,  // speed
    20,  // radius
    56,  // height
    100,  // mass
    0,  // damage
    0{sfx_posact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_POSS_RAISE1) // raisestate
  );

  mobjinfo[2] := MakeObjInfo(    // MT_SHOTGUY
    9,  // doomednum
    ord(S_SPOS_STND),  // spawnstate
    30,  // spawnhealth
    ord(S_SPOS_RUN1),  // seestate
    0{sfx_posit2},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_SPOS_PAIN),  // painstate
    170,  // painchance
    0{sfx_popain},  // painsound
    0,  // meleestate
    ord(S_SPOS_ATK1),  // missilestate
    ord(S_SPOS_DIE1),  // deathstate
    ord(S_SPOS_XDIE1),  // xdeathstate
    0{sfx_podth2},  // deathsound
    8,  // speed
    20,  // radius
    56,  // height
    100,  // mass
    0,  // damage
    0{sfx_posact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_SPOS_RAISE1) // raisestate
  );

  mobjinfo[3] := MakeObjInfo(    // MT_VILE
    64,  // doomednum
    ord(S_VILE_STND),  // spawnstate
    700,  // spawnhealth
    ord(S_VILE_RUN1),  // seestate
    0{sfx_vilsit},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_VILE_PAIN),  // painstate
    10,  // painchance
    0{sfx_vipain},  // painsound
    0,  // meleestate
    ord(S_VILE_ATK1),  // missilestate
    ord(S_VILE_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_vildth},  // deathsound
    15,  // speed
    20,  // radius
    56,  // height
    500,  // mass
    0,  // damage
    0{sfx_vilact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[4] := MakeObjInfo(    // MT_FIRE
    -1,  // doomednum
    ord(S_FIRE1),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[5] := MakeObjInfo(    // MT_UNDEAD
    66,  // doomednum
    ord(S_SKEL_STND),  // spawnstate
    300,  // spawnhealth
    ord(S_SKEL_RUN1),  // seestate
    0{sfx_skesit},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_SKEL_PAIN),  // painstate
    100,  // painchance
    0{sfx_popain},  // painsound
    ord(S_SKEL_FIST1),  // meleestate
    ord(S_SKEL_MISS1),  // missilestate
    ord(S_SKEL_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_skedth},  // deathsound
    10,  // speed
    20,  // radius
    56,  // height
    500,  // mass
    0,  // damage
    0{sfx_skeact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_SKEL_RAISE1) // raisestate
  );

  mobjinfo[6] := MakeObjInfo(    // MT_TRACER
    -1,  // doomednum
    ord(S_TRACER),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_skeatk},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_TRACEEXP1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_barexp},  // deathsound
    10,  // speed
    11,  // radius
    8,  // height
    100,  // mass
    10,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[7] := MakeObjInfo(    // MT_SMOKE
    -1,  // doomednum
    ord(S_SMOKE1),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[8] := MakeObjInfo(    // MT_FATSO
    67,  // doomednum
    ord(S_FATT_STND),  // spawnstate
    600,  // spawnhealth
    ord(S_FATT_RUN1),  // seestate
    0{sfx_mansit},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_FATT_PAIN),  // painstate
    80,  // painchance
    0{sfx_mnpain},  // painsound
    0,  // meleestate
    ord(S_FATT_ATK1),  // missilestate
    ord(S_FATT_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_mandth},  // deathsound
    8,  // speed
    48,  // radius
    64,  // height
    1000,  // mass
    0,  // damage
    0{sfx_posact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_FATT_RAISE1) // raisestate
  );

  mobjinfo[9] := MakeObjInfo(    // MT_FATSHOT
    -1,  // doomednum
    ord(S_FATSHOT1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_firsht},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_FATSHOTX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_firxpl},  // deathsound
    20,  // speed
    6,  // radius
    8,  // height
    100,  // mass
    8,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[10] := MakeObjInfo(    // MT_CHAINGUY
    65,  // doomednum
    ord(S_CPOS_STND),  // spawnstate
    70,  // spawnhealth
    ord(S_CPOS_RUN1),  // seestate
    0{sfx_posit2},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_CPOS_PAIN),  // painstate
    170,  // painchance
    0{sfx_popain},  // painsound
    0,  // meleestate
    ord(S_CPOS_ATK1),  // missilestate
    ord(S_CPOS_DIE1),  // deathstate
    ord(S_CPOS_XDIE1),  // xdeathstate
    0{sfx_podth2},  // deathsound
    8,  // speed
    20,  // radius
    56,  // height
    100,  // mass
    0,  // damage
    0{sfx_posact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_CPOS_RAISE1) // raisestate
  );

  mobjinfo[11] := MakeObjInfo(    // MT_TROOP
    3001,  // doomednum
    ord(S_TROO_STND),  // spawnstate
    60,  // spawnhealth
    ord(S_TROO_RUN1),  // seestate
    0{sfx_bgsit1},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_TROO_PAIN),  // painstate
    200,  // painchance
    0{sfx_popain},  // painsound
    ord(S_TROO_ATK1),  // meleestate
    ord(S_TROO_ATK1),  // missilestate
    ord(S_TROO_DIE1),  // deathstate
    ord(S_TROO_XDIE1),  // xdeathstate
    0{sfx_bgdth1},  // deathsound
    8,  // speed
    20,  // radius
    56,  // height
    100,  // mass
    0,  // damage
    0{sfx_bgact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_TROO_RAISE1) // raisestate
  );

  mobjinfo[12] := MakeObjInfo(    // MT_SERGEANT
    3002,  // doomednum
    ord(S_SARG_STND),  // spawnstate
    150,  // spawnhealth
    ord(S_SARG_RUN1),  // seestate
    0{sfx_sgtsit},  // seesound
    8,  // reactiontime
    0{sfx_sgtatk},  // attacksound
    ord(S_SARG_PAIN),  // painstate
    180,  // painchance
    0{sfx_dmpain},  // painsound
    ord(S_SARG_ATK1),  // meleestate
    0,  // missilestate
    ord(S_SARG_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_sgtdth},  // deathsound
    10,  // speed
    30,  // radius
    56,  // height
    400,  // mass
    0,  // damage
    0{sfx_dmact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_SARG_RAISE1) // raisestate
  );

  mobjinfo[13] := MakeObjInfo(    // MT_SHADOWS
    58,  // doomednum
    ord(S_SARG_STND),  // spawnstate
    150,  // spawnhealth
    ord(S_SARG_RUN1),  // seestate
    0{sfx_sgtsit},  // seesound
    8,  // reactiontime
    0{sfx_sgtatk},  // attacksound
    ord(S_SARG_PAIN),  // painstate
    180,  // painchance
    0{sfx_dmpain},  // painsound
    ord(S_SARG_ATK1),  // meleestate
    0,  // missilestate
    ord(S_SARG_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_sgtdth},  // deathsound
    10,  // speed
    30,  // radius
    56,  // height
    400,  // mass
    0,  // damage
    0{sfx_dmact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_SHADOW|MF_COUNTKILL,  // flags
    ord(S_SARG_RAISE1) // raisestate
  );

  mobjinfo[14] := MakeObjInfo(    // MT_HEAD
    3005,  // doomednum
    ord(S_HEAD_STND),  // spawnstate
    400,  // spawnhealth
    ord(S_HEAD_RUN1),  // seestate
    0{sfx_cacsit},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_HEAD_PAIN),  // painstate
    128,  // painchance
    0{sfx_dmpain},  // painsound
    0,  // meleestate
    ord(S_HEAD_ATK1),  // missilestate
    ord(S_HEAD_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_cacdth},  // deathsound
    8,  // speed
    31,  // radius
    56,  // height
    400,  // mass
    0,  // damage
    0{sfx_dmact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_FLOAT|MF_NOGRAVITY|MF_COUNTKILL,  // flags
    ord(S_HEAD_RAISE1) // raisestate
  );

  mobjinfo[15] := MakeObjInfo(    // MT_BRUISER
    3003,  // doomednum
    ord(S_BOSS_STND),  // spawnstate
    1000,  // spawnhealth
    ord(S_BOSS_RUN1),  // seestate
    0{sfx_brssit},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_BOSS_PAIN),  // painstate
    50,  // painchance
    0{sfx_dmpain},  // painsound
    ord(S_BOSS_ATK1),  // meleestate
    ord(S_BOSS_ATK1),  // missilestate
    ord(S_BOSS_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_brsdth},  // deathsound
    8,  // speed
    24,  // radius
    64,  // height
    1000,  // mass
    0,  // damage
    0{sfx_dmact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_BOSS_RAISE1) // raisestate
  );

  mobjinfo[16] := MakeObjInfo(    // MT_BRUISERSHOT
    -1,  // doomednum
    ord(S_BRBALL1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_firsht},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_BRBALLX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_firxpl},  // deathsound
    15,  // speed
    6,  // radius
    8,  // height
    100,  // mass
    8,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[17] := MakeObjInfo(    // MT_KNIGHT
    69,  // doomednum
    ord(S_BOS2_STND),  // spawnstate
    500,  // spawnhealth
    ord(S_BOS2_RUN1),  // seestate
    0{sfx_kntsit},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_BOS2_PAIN),  // painstate
    50,  // painchance
    0{sfx_dmpain},  // painsound
    ord(S_BOS2_ATK1),  // meleestate
    ord(S_BOS2_ATK1),  // missilestate
    ord(S_BOS2_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_kntdth},  // deathsound
    8,  // speed
    24,  // radius
    64,  // height
    1000,  // mass
    0,  // damage
    0{sfx_dmact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_BOS2_RAISE1) // raisestate
  );

  mobjinfo[18] := MakeObjInfo(    // MT_SKULL
    3006,  // doomednum
    ord(S_SKULL_STND),  // spawnstate
    100,  // spawnhealth
    ord(S_SKULL_RUN1),  // seestate
    0,  // seesound
    8,  // reactiontime
    0{sfx_sklatk},  // attacksound
    ord(S_SKULL_PAIN),  // painstate
    256,  // painchance
    0{sfx_dmpain},  // painsound
    0,  // meleestate
    ord(S_SKULL_ATK1),  // missilestate
    ord(S_SKULL_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_firxpl},  // deathsound
    8,  // speed
    16,  // radius
    56,  // height
    50,  // mass
    3,  // damage
    0{sfx_dmact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_FLOAT|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[19] := MakeObjInfo(    // MT_SPIDER
    7,  // doomednum
    ord(S_SPID_STND),  // spawnstate
    3000,  // spawnhealth
    ord(S_SPID_RUN1),  // seestate
    0{sfx_spisit},  // seesound
    8,  // reactiontime
    0{sfx_shotgn},  // attacksound
    ord(S_SPID_PAIN),  // painstate
    40,  // painchance
    0{sfx_dmpain},  // painsound
    0,  // meleestate
    ord(S_SPID_ATK1),  // missilestate
    ord(S_SPID_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_spidth},  // deathsound
    12,  // speed
    128,  // radius
    100,  // height
    1000,  // mass
    0,  // damage
    0{sfx_dmact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[20] := MakeObjInfo(    // MT_BABY
    68,  // doomednum
    ord(S_BSPI_STND),  // spawnstate
    500,  // spawnhealth
    ord(S_BSPI_SIGHT),  // seestate
    0{sfx_bspsit},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_BSPI_PAIN),  // painstate
    128,  // painchance
    0{sfx_dmpain},  // painsound
    0,  // meleestate
    ord(S_BSPI_ATK1),  // missilestate
    ord(S_BSPI_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_bspdth},  // deathsound
    12,  // speed
    64,  // radius
    64,  // height
    600,  // mass
    0,  // damage
    0{sfx_bspact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_BSPI_RAISE1) // raisestate
  );

  mobjinfo[21] := MakeObjInfo(    // MT_CYBORG
    16,  // doomednum
    ord(S_CYBER_STND),  // spawnstate
    4000,  // spawnhealth
    ord(S_CYBER_RUN1),  // seestate
    0{sfx_cybsit},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_CYBER_PAIN),  // painstate
    20,  // painchance
    0{sfx_dmpain},  // painsound
    0,  // meleestate
    ord(S_CYBER_ATK1),  // missilestate
    ord(S_CYBER_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_cybdth},  // deathsound
    16,  // speed
    40,  // radius
    110,  // height
    1000,  // mass
    0,  // damage
    0{sfx_dmact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[22] := MakeObjInfo(    // MT_PAIN
    71,  // doomednum
    ord(S_PAIN_STND),  // spawnstate
    400,  // spawnhealth
    ord(S_PAIN_RUN1),  // seestate
    0{sfx_pesit},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_PAIN_PAIN),  // painstate
    128,  // painchance
    0{sfx_pepain},  // painsound
    0,  // meleestate
    ord(S_PAIN_ATK1),  // missilestate
    ord(S_PAIN_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_pedth},  // deathsound
    8,  // speed
    31,  // radius
    56,  // height
    400,  // mass
    0,  // damage
    0{sfx_dmact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_FLOAT|MF_NOGRAVITY|MF_COUNTKILL,  // flags
    ord(S_PAIN_RAISE1) // raisestate
  );

  mobjinfo[23] := MakeObjInfo(    // MT_WOLFSS
    84,  // doomednum
    ord(S_SSWV_STND),  // spawnstate
    50,  // spawnhealth
    ord(S_SSWV_RUN1),  // seestate
    0{sfx_sssit},  // seesound
    8,  // reactiontime
    0,  // attacksound
    ord(S_SSWV_PAIN),  // painstate
    170,  // painchance
    0{sfx_popain},  // painsound
    0,  // meleestate
    ord(S_SSWV_ATK1),  // missilestate
    ord(S_SSWV_DIE1),  // deathstate
    ord(S_SSWV_XDIE1),  // xdeathstate
    0{sfx_ssdth},  // deathsound
    8,  // speed
    20,  // radius
    56,  // height
    100,  // mass
    0,  // damage
    0{sfx_posact},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_SSWV_RAISE1) // raisestate
  );

  mobjinfo[24] := MakeObjInfo(    // MT_KEEN
    72,  // doomednum
    ord(S_KEENSTND),  // spawnstate
    100,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_KEENPAIN),  // painstate
    256,  // painchance
    0{sfx_keenpn},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_COMMKEEN),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_keendt},  // deathsound
    0,  // speed
    16,  // radius
    72,  // height
    10000000,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY|MF_SHOOTABLE|MF_COUNTKILL,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[25] := MakeObjInfo(    // MT_BOSSBRAIN
    88,  // doomednum
    ord(S_BRAIN),  // spawnstate
    250,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_BRAIN_PAIN),  // painstate
    255,  // painchance
    0{sfx_bospn},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_BRAIN_DIE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_bosdth},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    10000000,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[26] := MakeObjInfo(    // MT_BOSSSPIT
    89,  // doomednum
    ord(S_BRAINEYE),  // spawnstate
    1000,  // spawnhealth
    ord(S_BRAINEYESEE),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    32,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOSECTOR,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[27] := MakeObjInfo(    // MT_BOSSTARGET
    87,  // doomednum
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    32,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_NOSECTOR,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[28] := MakeObjInfo(    // MT_SPAWNSHOT
    -1,  // doomednum
    ord(S_SPAWN1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_bospit},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_firxpl},  // deathsound
    10,  // speed
    6,  // radius
    32,  // height
    100,  // mass
    3,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY|MF_NOCLIP,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[29] := MakeObjInfo(    // MT_SPAWNFIRE
    -1,  // doomednum
    ord(S_SPAWNFIRE1),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[30] := MakeObjInfo(    // MT_BARREL
    2035,  // doomednum
    ord(S_BAR1),  // spawnstate
    20,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_None},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_BEXP),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_barexp},  // deathsound
    0,  // speed
    10,  // radius
    42,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID|MF_SHOOTABLE|MF_NOBLOOD,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[31] := MakeObjInfo(    // MT_TROOPSHOT
    -1,  // doomednum
    ord(S_TBALL1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_firsht},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_TBALLX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_firxpl},  // deathsound
    10,  // speed
    6,  // radius
    8,  // height
    100,  // mass
    3,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[32] := MakeObjInfo(    // MT_HEADSHOT
    -1,  // doomednum
    ord(S_RBALL1),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_firsht},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_RBALLX1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_firxpl},  // deathsound
    10,  // speed
    6,  // radius
    8,  // height
    100,  // mass
    5,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[33] := MakeObjInfo(    // MT_ROCKET
    -1,  // doomednum
    ord(S_ROCKET),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_rlaunc},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_EXPLODE1),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_barexp},  // deathsound
    20,  // speed
    11,  // radius
    8,  // height
    100,  // mass
    20,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[34] := MakeObjInfo(    // MT_PLASMA
    -1,  // doomednum
    ord(S_PLASBALL),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_plasma},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_PLASEXP),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_firxpl},  // deathsound
    25,  // speed
    13,  // radius
    8,  // height
    100,  // mass
    5,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[35] := MakeObjInfo(    // MT_BFG
    -1,  // doomednum
    ord(S_BFGSHOT),  // spawnstate
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
    ord(S_BFGLAND),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_rxplod},  // deathsound
    25,  // speed
    13,  // radius
    8,  // height
    100,  // mass
    100,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[36] := MakeObjInfo(    // MT_ARACHPLAZ
    -1,  // doomednum
    ord(S_ARACH_PLAZ),  // spawnstate
    1000,  // spawnhealth
    ord(S_NULL),  // seestate
    0{sfx_plasma},  // seesound
    8,  // reactiontime
    0{sfx_None},  // attacksound
    ord(S_NULL),  // painstate
    0,  // painchance
    0{sfx_None},  // painsound
    ord(S_NULL),  // meleestate
    ord(S_NULL),  // missilestate
    ord(S_ARACH_PLEX),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_firxpl},  // deathsound
    25,  // speed
    13,  // radius
    8,  // height
    100,  // mass
    5,  // damage
    0{sfx_None},  // activesound
    0, //MF_NOBLOCKMAP|MF_MISSILE|MF_DROPOFF|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[37] := MakeObjInfo(    // MT_PUFF
    -1,  // doomednum
    ord(S_PUFF1),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[38] := MakeObjInfo(    // MT_BLOOD
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[39] := MakeObjInfo(    // MT_TFOG
    -1,  // doomednum
    ord(S_TFOG),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[40] := MakeObjInfo(    // MT_IFOG
    -1,  // doomednum
    ord(S_IFOG),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[41] := MakeObjInfo(    // MT_TELEPORTMAN
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[42] := MakeObjInfo(    // MT_EXTRABFG
    -1,  // doomednum
    ord(S_BFGEXP),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[43] := MakeObjInfo(    // MT_MISC0
    2018,  // doomednum
    ord(S_ARM1),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[44] := MakeObjInfo(    // MT_MISC1
    2019,  // doomednum
    ord(S_ARM2),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[45] := MakeObjInfo(    // MT_MISC2
    2014,  // doomednum
    ord(S_BON1),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[46] := MakeObjInfo(    // MT_MISC3
    2015,  // doomednum
    ord(S_BON2),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[47] := MakeObjInfo(    // MT_MISC4
    5,  // doomednum
    ord(S_BKEY),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[48] := MakeObjInfo(    // MT_MISC5
    13,  // doomednum
    ord(S_RKEY),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[49] := MakeObjInfo(    // MT_MISC6
    6,  // doomednum
    ord(S_YKEY),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[50] := MakeObjInfo(    // MT_MISC7
    39,  // doomednum
    ord(S_YSKULL),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[51] := MakeObjInfo(    // MT_MISC8
    38,  // doomednum
    ord(S_RSKULL),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[52] := MakeObjInfo(    // MT_MISC9
    40,  // doomednum
    ord(S_BSKULL),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[53] := MakeObjInfo(    // MT_MISC10
    2011,  // doomednum
    ord(S_STIM),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[54] := MakeObjInfo(    // MT_MISC11
    2012,  // doomednum
    ord(S_MEDI),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[55] := MakeObjInfo(    // MT_MISC12
    2013,  // doomednum
    ord(S_SOUL),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[56] := MakeObjInfo(    // MT_INV
    2022,  // doomednum
    ord(S_PINV),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[57] := MakeObjInfo(    // MT_MISC13
    2023,  // doomednum
    ord(S_PSTR),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[58] := MakeObjInfo(    // MT_INS
    2024,  // doomednum
    ord(S_PINS),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[59] := MakeObjInfo(    // MT_MISC14
    2025,  // doomednum
    ord(S_SUIT),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[60] := MakeObjInfo(    // MT_MISC15
    2026,  // doomednum
    ord(S_PMAP),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[61] := MakeObjInfo(    // MT_MISC16
    2045,  // doomednum
    ord(S_PVIS),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[62] := MakeObjInfo(    // MT_MEGA
    83,  // doomednum
    ord(S_MEGA),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[63] := MakeObjInfo(    // MT_CLIP
    2007,  // doomednum
    ord(S_CLIP),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[64] := MakeObjInfo(    // MT_MISC17
    2048,  // doomednum
    ord(S_AMMO),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[65] := MakeObjInfo(    // MT_MISC18
    2010,  // doomednum
    ord(S_ROCK),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[66] := MakeObjInfo(    // MT_MISC19
    2046,  // doomednum
    ord(S_BROK),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[67] := MakeObjInfo(    // MT_MISC20
    2047,  // doomednum
    ord(S_CELL),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[68] := MakeObjInfo(    // MT_MISC21
    17,  // doomednum
    ord(S_CELP),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[69] := MakeObjInfo(    // MT_MISC22
    2008,  // doomednum
    ord(S_SHEL),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[70] := MakeObjInfo(    // MT_MISC23
    2049,  // doomednum
    ord(S_SBOX),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[71] := MakeObjInfo(    // MT_MISC24
    8,  // doomednum
    ord(S_BPAK),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[72] := MakeObjInfo(    // MT_MISC25
    2006,  // doomednum
    ord(S_BFUG),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[73] := MakeObjInfo(    // MT_CHAINGUN
    2002,  // doomednum
    ord(S_MGUN),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[74] := MakeObjInfo(    // MT_MISC26
    2005,  // doomednum
    ord(S_CSAW),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[75] := MakeObjInfo(    // MT_MISC27
    2003,  // doomednum
    ord(S_LAUN),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[76] := MakeObjInfo(    // MT_MISC28
    2004,  // doomednum
    ord(S_PLAS),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[77] := MakeObjInfo(    // MT_SHOTGUN
    2001,  // doomednum
    ord(S_SHOT),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[78] := MakeObjInfo(    // MT_SUPERSHOTGUN
    82,  // doomednum
    ord(S_SHOT2),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[79] := MakeObjInfo(    // MT_MISC29
    85,  // doomednum
    ord(S_TECHLAMP),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[80] := MakeObjInfo(    // MT_MISC30
    86,  // doomednum
    ord(S_TECH2LAMP),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[81] := MakeObjInfo(    // MT_MISC31
    2028,  // doomednum
    ord(S_COLU),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    52,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[82] := MakeObjInfo(    // MT_MISC32
    30,  // doomednum
    ord(S_TALLGRNCOL),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[83] := MakeObjInfo(    // MT_MISC33
    31,  // doomednum
    ord(S_SHRTGRNCOL),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[84] := MakeObjInfo(    // MT_MISC34
    32,  // doomednum
    ord(S_TALLREDCOL),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[85] := MakeObjInfo(    // MT_MISC35
    33,  // doomednum
    ord(S_SHRTREDCOL),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[86] := MakeObjInfo(    // MT_MISC36
    37,  // doomednum
    ord(S_SKULLCOL),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[87] := MakeObjInfo(    // MT_MISC37
    36,  // doomednum
    ord(S_HEARTCOL),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[88] := MakeObjInfo(    // MT_MISC38
    41,  // doomednum
    ord(S_EVILEYE),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[89] := MakeObjInfo(    // MT_MISC39
    42,  // doomednum
    ord(S_FLOATSKULL),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[90] := MakeObjInfo(    // MT_MISC40
    43,  // doomednum
    ord(S_TORCHTREE),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[91] := MakeObjInfo(    // MT_MISC41
    44,  // doomednum
    ord(S_BLUETORCH),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[92] := MakeObjInfo(    // MT_MISC42
    45,  // doomednum
    ord(S_GREENTORCH),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[93] := MakeObjInfo(    // MT_MISC43
    46,  // doomednum
    ord(S_REDTORCH),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[94] := MakeObjInfo(    // MT_MISC44
    55,  // doomednum
    ord(S_BTORCHSHRT),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[95] := MakeObjInfo(    // MT_MISC45
    56,  // doomednum
    ord(S_GTORCHSHRT),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[96] := MakeObjInfo(    // MT_MISC46
    57,  // doomednum
    ord(S_RTORCHSHRT),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[97] := MakeObjInfo(    // MT_MISC47
    47,  // doomednum
    ord(S_STALAGTITE),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[98] := MakeObjInfo(    // MT_MISC48
    48,  // doomednum
    ord(S_TECHPILLAR),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[99] := MakeObjInfo(    // MT_MISC49
    34,  // doomednum
    ord(S_CANDLESTIK),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[100] := MakeObjInfo(    // MT_MISC50
    35,  // doomednum
    ord(S_CANDELABRA),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[101] := MakeObjInfo(    // MT_MISC51
    49,  // doomednum
    ord(S_BLOODYTWITCH),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    68,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[102] := MakeObjInfo(    // MT_MISC52
    50,  // doomednum
    ord(S_MEAT2),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    84,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[103] := MakeObjInfo(    // MT_MISC53
    51,  // doomednum
    ord(S_MEAT3),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    84,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[104] := MakeObjInfo(    // MT_MISC54
    52,  // doomednum
    ord(S_MEAT4),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    68,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[105] := MakeObjInfo(    // MT_MISC55
    53,  // doomednum
    ord(S_MEAT5),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    52,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[106] := MakeObjInfo(    // MT_MISC56
    59,  // doomednum
    ord(S_MEAT2),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    84,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[107] := MakeObjInfo(    // MT_MISC57
    60,  // doomednum
    ord(S_MEAT4),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    68,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[108] := MakeObjInfo(    // MT_MISC58
    61,  // doomednum
    ord(S_MEAT3),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    52,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[109] := MakeObjInfo(    // MT_MISC59
    62,  // doomednum
    ord(S_MEAT5),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    52,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[110] := MakeObjInfo(    // MT_MISC60
    63,  // doomednum
    ord(S_BLOODYTWITCH),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    68,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[111] := MakeObjInfo(    // MT_MISC61
    22,  // doomednum
    ord(S_HEAD_DIE6),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[112] := MakeObjInfo(    // MT_MISC62
    15,  // doomednum
    ord(S_PLAY_DIE7),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[113] := MakeObjInfo(    // MT_MISC63
    18,  // doomednum
    ord(S_POSS_DIE5),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[114] := MakeObjInfo(    // MT_MISC64
    21,  // doomednum
    ord(S_SARG_DIE6),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[115] := MakeObjInfo(    // MT_MISC65
    23,  // doomednum
    ord(S_SKULL_DIE6),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[116] := MakeObjInfo(    // MT_MISC66
    20,  // doomednum
    ord(S_TROO_DIE5),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[117] := MakeObjInfo(    // MT_MISC67
    19,  // doomednum
    ord(S_SPOS_DIE5),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[118] := MakeObjInfo(    // MT_MISC68
    10,  // doomednum
    ord(S_PLAY_XDIE9),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[119] := MakeObjInfo(    // MT_MISC69
    12,  // doomednum
    ord(S_PLAY_XDIE9),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[120] := MakeObjInfo(    // MT_MISC70
    28,  // doomednum
    ord(S_HEADSONSTICK),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[121] := MakeObjInfo(    // MT_MISC71
    24,  // doomednum
    ord(S_GIBS),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    20,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[122] := MakeObjInfo(    // MT_MISC72
    27,  // doomednum
    ord(S_HEADONASTICK),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[123] := MakeObjInfo(    // MT_MISC73
    29,  // doomednum
    ord(S_HEADCANDLES),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[124] := MakeObjInfo(    // MT_MISC74
    25,  // doomednum
    ord(S_DEADSTICK),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[125] := MakeObjInfo(    // MT_MISC75
    26,  // doomednum
    ord(S_LIVESTICK),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[126] := MakeObjInfo(    // MT_MISC76
    54,  // doomednum
    ord(S_BIGTREE),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    32,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[127] := MakeObjInfo(    // MT_MISC77
    70,  // doomednum
    ord(S_BBAR1),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    16,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    0, //MF_SOLID,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[128] := MakeObjInfo(    // MT_MISC78
    73,  // doomednum
    ord(S_HANGNOGUTS),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    88,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[129] := MakeObjInfo(    // MT_MISC79
    74,  // doomednum
    ord(S_HANGBNOBRAIN),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    88,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[130] := MakeObjInfo(    // MT_MISC80
    75,  // doomednum
    ord(S_HANGTLOOKDN),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    64,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[131] := MakeObjInfo(    // MT_MISC81
    76,  // doomednum
    ord(S_HANGTSKULL),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    64,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[132] := MakeObjInfo(    // MT_MISC82
    77,  // doomednum
    ord(S_HANGTLOOKUP),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    64,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[133] := MakeObjInfo(    // MT_MISC83
    78,  // doomednum
    ord(S_HANGTNOBRAIN),  // spawnstate
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
    ord(S_NULL),  // deathstate
    ord(S_NULL),  // xdeathstate
    0{sfx_None},  // deathsound
    0,  // speed
    16,  // radius
    64,  // height
    100,  // mass
    0,  // damage
    0{sfx_None},  // activesound
    MF_SPAWNCEILING, //MF_SOLID|MF_SPAWNCEILING|MF_NOGRAVITY,  // flags
    ord(S_NULL) // raisestate
  );

  mobjinfo[134] := MakeObjInfo(    // MT_MISC84
    79,  // doomednum
    ord(S_COLONGIBS),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[135] := MakeObjInfo(    // MT_MISC85
    80,  // doomednum
    ord(S_SMALLPOOL),  // spawnstate
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
    ord(S_NULL) // raisestate
  );

  mobjinfo[136] := MakeObjInfo(    // MT_MISC86
    81,  // doomednum
    ord(S_BRAINSTEM),  // spawnstate
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
    ord(S_NULL) // raisestate
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
