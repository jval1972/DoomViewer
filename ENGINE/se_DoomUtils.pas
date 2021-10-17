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
//  Surfaces Engine (SE) Doom Utils
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//------------------------------------------------------------------------------

{$I defs.inc}

unit se_DoomUtils;

interface

{$IFNDEF NO_IDSOFTGAMESSUPPORT}
uses
  Windows, SysUtils, Classes, se_Main, Graphics, se_DXDUtils, se_MyD3DUtils,
  se_DoomTypes, se_DXClasses;

type
  TIntValue = smallint; // if we set this as integer then some problems appears to inf.du & inf.dv
// runtime data types (se GetSectorsLines, GetSectorLines, ...) }
  PDoomSectorLine = ^TDoomSectorLine;
  TDoomSectorLine = record
   case integer of
    0: (
      start: smallint;    // from this vertex ...
      _end: smallint;     // ... to this vertex
      sector: smallint;   // Τομέας που αντιστοιχεί στο Line
      segment: smallint;  // Τμήμα της γραμμής (για μη συνεχόμενους sectors)
       );
    1: (
      start_end: integer;
      sector_segment: integer;
        );

{    start: integer;    // from this vertex ...
    _end: integer;     // ... to this vertex
    sector: integer;   // Τομέας που αντιστοιχεί στο Line
    segment: integer;  // Τμήμα της γραμμής (για μη συνεχόμενους sectors)}
  end;
  PDoomSectorLines = ^TDoomSectorLines;
  TDoomSectorLines = array[0..$FFFE] of TDoomSectorLine;
  PDoomSectorLinesArray = ^TDoomSectorLinesArray;
  TDoomSectorLinesArray = record
    NumSectors: integer;
    Sectors: array[0..$FFFE] of PDoomSectorLines;
    NumSectorsLines: array[0..$FFFE] of integer;
  end;

// True if inf is a map name, eg E1M1, MAP01 ...
function isDoomMap(inf: TDoomDirEntry): boolean;

// Populate s with all maps inside the WAD (FileName)
function GetDoomWADMaps(FileName: TFileName; s: TStrings): integer;

procedure ReadTextureData(FileName: TFileName; var lTexturesInfo: PDoomTexturesInfo;
  var typ: TIDSoftWADType; var numTextures{$IFNDEF NO_DOOMTHINGS}, numSprites{$ENDIF}: integer);

procedure ClearTextureData(
  var lTexturesInfo: PDoomTexturesInfo; numTextures: integer);

// Read map
procedure ReadMapData(FileName: TFileName; MapName: string;
  var lThings: PDoomThings; var numThings: integer;
  var lLineDefs: PDoomLineDefs; var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs; var numSideDefs: integer;
  var lVertexes: PDoomVertexes; var numVertexes: integer;
  var lSegs: PDoomSegs; var numSegs: integer;
  var lSubSectors: PDoomSubSectors; var numSubSectors: integer;
  var lSectors: PDoomSectors; var numSectors: integer;
  forceType: TIDSoftWADType = idUnknown); overload;

// Read map
procedure ReadMapData(FileName: TFileName; MapName: string;
  var lThings: PDoomThings; var numThings: integer;
  var lLineDefs: PDoomLineDefs; var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs; var numSideDefs: integer;
  var lVertexes: PDoomVertexes; var numVertexes: integer;
  var lSectors: PDoomSectors; var numSectors: integer;
  forceType: TIDSoftWADType = idUnknown); overload;

// Free memory
procedure ClearMapData(
  var lThings: PDoomThings; var numThings: integer;
  var lLineDefs: PDoomLineDefs; var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs; var numSideDefs: integer;
  var lVertexes: PDoomVertexes; var numVertexes: integer;
  var lSegs: PDoomSegs; var numSegs: integer;
  var lSubSectors: PDoomSubSectors; var numSubSectors: integer;
  var lSectors: PDoomSectors; var numSectors: integer); overload;

// Free memory
procedure ClearMapData(
  var lThings: PDoomThings; var numThings: integer;
  var lLineDefs: PDoomLineDefs; var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs; var numSideDefs: integer;
  var lVertexes: PDoomVertexes; var numVertexes: integer;
  var lSectors: PDoomSectors; var numSectors: integer); overload;

// 2d preview of map MapName (Filename = wad file)
procedure Preview2DWADMap(FileName: TFileName; MapName: string;
  C: TCanvas; X, Y: integer; fScale: single = 1.0); overload;

procedure Preview2DWADMap(
  lLineDefs: PDoomLineDefs; numLineDefs: integer;
  lVertexes: PDoomVertexes; numVertexes: integer;
  lSegs: PDoomSegs; numSegs: integer;
  lSubSectors: PDoomSubSectors; numSubSectors: integer;
  C: TCanvas; X, Y: integer; fScale: single = 1.0); overload;

procedure Preview2DWADMap(
  lLineDefs: PDoomLineDefs; numLineDefs: integer;
  lVertexes: PDoomVertexes; numVertexes: integer;
  lSegs: PDoomSegs; numSegs: integer;
  lSubSectors: PDoomSubSectors; numSubSectors: integer;
  bmp: TBitmap; fScale: single = 1.0); overload;

procedure Preview2DWADMap(FileName: TFileName; MapName: string;
  C: TCanvas; X, Y: integer;
  var xShift, yShift: single; fScale: single = 1.0); overload;

procedure Preview2DWADMap(
  lLineDefs: PDoomLineDefs; numLineDefs: integer;
  lVertexes: PDoomVertexes; numVertexes: integer;
  lSegs: PDoomSegs; numSegs: integer;
  lSubSectors: PDoomSubSectors; numSubSectors: integer;
  C: TCanvas; X, Y: integer;
  var xShift, yShift: single; fScale: single = 1.0;
  doSegments: boolean = False); overload;

procedure Preview2DWADMap(
  lLineDefs: PDoomLineDefs; numLineDefs: integer;
  lVertexes: PDoomVertexes; numVertexes: integer;
  lSegs: PDoomSegs; numSegs: integer;
  lSubSectors: PDoomSubSectors; numSubSectors: integer;
  bmp: TBitmap;
  var xShift, yShift: single; fScale: single = 1.0;
  doSegments: boolean = False); overload;

function GetMapData(AScene: TD3DScene;
  MainWAD, PWAD: TFileName; MapName: string;
  Factor: integer = DEFDOOMIMPORTFACTOR; lFactor: Single = DEFDOOMIMPORTLFACTOR;
  PrepareOptimizer: boolean = True
{$IFNDEF NO_DOOMTHINGS}
  ; doThings: boolean = True
{$ENDIF}
  ; forceTyp: TIDSoftWADType = idUnknown
  ): TIDSoftWADType; overload;

procedure GetMapData(AScene: TD3DScene;
  var lThings: PDoomThings; var numThings: integer;
  var lLineDefs: PDoomLineDefs; var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs; var numSideDefs: integer;
  var lVertexes: PDoomVertexes; var numVertexes: integer;
  var lSectors: PDoomSectors; var numSectors: integer;
  var dir: PDoomDirectory; var numEntries: integer;
  MainWAD, PWAD: TFileName; MapName: string;
  Factor: integer = DEFDOOMIMPORTFACTOR; lFactor: Single = DEFDOOMIMPORTLFACTOR;
  PrepareOptimizer: boolean = True
{$IFNDEF NO_DOOMTHINGS}
  ; doThings: boolean = True
{$ENDIF}
  ; forceTyp: TIDSoftWADType = idUnknown
  ); overload;

{$IFNDEF NO_D3DSECTORCOLLECTIONS}
procedure GetSectorData(AScene: TD3DScene;
  var lThings: PDoomThings; var numThings: integer;
  var lLineDefs: PDoomLineDefs; var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs; var numSideDefs: integer;
  var lVertexes: PDoomVertexes; var numVertexes: integer;
  var lSectors: PDoomSectors; var numSectors: integer;
  MainWAD, PWAD: TFileName; MapName: string;
  Factor: integer = DEFDOOMIMPORTFACTOR; lFactor: Single = DEFDOOMIMPORTLFACTOR;
  doTextures: boolean = True); overload;

procedure GetSectorData(AScene: TD3DScene;
  MainWAD, PWAD: TFileName; MapName: string;
  Factor: integer = DEFDOOMIMPORTFACTOR; lFactor: Single = DEFDOOMIMPORTLFACTOR;
  doTextures: boolean = True); overload;

procedure GetSectorData(inf: PD3DSectorCollectionInfo2;
  MainWAD, PWAD: TFileName; MapName: string;
  Factor: integer = DEFDOOMIMPORTFACTOR; lFactor: Single = DEFDOOMIMPORTLFACTOR); overload;
{$ENDIF}

procedure CacheWADTextures(AScene: TD3DScene; MainWAD, PWAD: TFileName; TextureNames: TDXStringList;
  dir: PDoomDirectory = nil; numEntries: integer = -1;
  wadType: TIDSoftWADType = idUnknown;
  lTexturesInfo: PDoomTexturesInfo = nil;
  numTextures: integer = -1);

procedure AdjustWadDirectory(const dir: PDoomDirectory; const numEntries: integer);

procedure AdjustPatchNames(const pPatches: PPatchNames; const numEntries: integer);

procedure InitWADDIRCache;

procedure FreeWADDIRCache;

function ReadWadDirectory(FileName: TFileName; var dir: PDoomDirectory;
  var numEntries: integer; doSearchCache: boolean = True): TIDSoftWADType; overload;

function GetWadType(FileName: TFileName): TIDSoftWADType; overload;

function GetWadType(dir: PDoomDirectory; var numEntries: integer): TIDSoftWADType; overload;

function SearchEntry(Entry: string; dir: PDoomDirectory;
  const numEntries: integer; var d: TDoomDirEntry): boolean;

function ReadEntry(WAD: string; Entry: string; var p: Pointer; var size: integer;
  dir: PDoomDirectory = nil; numEntries: integer = -1): boolean;

function DoomEntryName(const Entry: TDoomCharArray; fileCheck: boolean = True): string; overload;

function DoomEntryNamesEqual(const Entry1, Entry2: TDoomCharArray): boolean; overload;

function DoomEntryNamesEqual(const Entry1, Entry2, Entry3: TDoomCharArray): boolean; overload;

function DoomEntryNamesEqual(const Entry1, Entry2, Entry3, Entry4: TDoomCharArray): boolean; overload;

function DoomStringName(const Entry: string): TDoomCharArray;

function GetWadLinkDescription(const WADFileName: string; Entry: string): string;
// eg C:\DOOM.WAD & FLAT_1 returns '->C:\DOOM.WAD::FLAT_1'

function IsWadLinkInfo(const inf: string): boolean;

function GetWadLinkEntryName(const inf: string): string;

function GetWadLinkInfo(const inf: string; var WADFileName: string; var Entry: string): boolean;
// split inf, eg if inf='->C:\DOOM.WAD::FLAT_1' returns 'C:\DOOM.WAD' & 'FLAT_1'

{$IFNDEF NO_DOOMTHINGS}
function GetPredefinedTextureDimentions(typ: TIDSoftWADType; tex: string;
  var w, h: integer; var animEnd: char): boolean;
{$ENDIF}

function GetDoomSkyTexture(typ: TIDSoftWADType; MapName: string): string;

procedure QuickSortDoomThings(hThings: PDoomThings; const numThings: Integer);

procedure QuickSortDoomDirectory(DIR: PDoomDirectory; const numEntries: Integer);

function SearchSortedDoomDirectory(DIR: PDoomDirectory; const numEntries: Integer;
  const EntryName: TDoomCharArray): integer;

function GetSortedDoomDirectoryEntries(DIR: PDoomDirectory; const numEntries: Integer;
  const EntryPrefix: string; var Entries: TDXStringList): integer;

procedure QuickSortTexturesInfo(const lTexturesInfo: PDoomTexturesInfo;
  const numTextures: Integer);

function SearchSortedTexturesInfo(const lTexturesInfo: PDoomTexturesInfo;
  const numTextures: Integer; const EntryName: TDoomCharArray): integer;

function GetMapName(MainWAD: TFileName; MapName: string;
  wadtype: TIDSoftWADType = idUnknown): string;

const
  rsPWAD = 'PWAD';
  rsIWAD = 'IWAD';
  rsThings = 'THINGS';
  rsLineDefs = 'LINEDEFS';
  rsSideDefs = 'SIDEDEFS';
  rsVertexes = 'VERTEXES';
  rsSegs = 'SEGS';
  rsSubSectors = 'SSECTORS';
  rsSectors = 'SECTORS';
  rsTexture1 = 'TEXTURE1';
  rsTexture2 = 'TEXTURE2';
  rsTexture3 = 'TEXTURE3';
  rsPNAMES = 'PNAMES';
  rsF_SKY = 'F_SKY';
  rsF_SKY1 = 'F_SKY1';
  rsF_FmtSKY = 'F_SKY00%d';
  rsDoomFlag = 'M_DOOM';
  rsHereticFlag = 'MAPE1';
  rsHexenFlag = 'BEHAVIOR';
  rsStrifeFlag = 'D_STRIFE';
  rsStrifeFlag2 = 'M_STRIFE';
  rsNewFlag = 'SCRIPTS';
  rsBMPExt = '.BMP';
  rsPal = 'PAL';
  rsPlayPal = 'PLAYPAL';
  rsF_START = 'F_START';
  rsF_END = 'F_END';
  rsFF_START = 'FF_START';
  rsFF_END = 'FF_END';
  rsP_START = 'P_START';
  rsP_END = 'P_END';
  rsPP_START = 'PP_START';
  rsPP_END = 'PP_END';
  rsS_START = 'S_START';
  rsS_END = 'S_END';
  rsSS_START = 'SS_START';
  rsSS_END = 'SS_END';
  rsWADExt = 'WAD';
  rsFmtDOOMLINKDESCRIPTION = '->%s::%s'; {eg '->C:\DOOM.WAD::FLAT_1' }
  rsFmtDOOMLINKDESCRIPTION1 = '->';
  rsFmtDOOMLINKDESCRIPTION2 = '::';
  rsFmtMapNotFound = 'Map %s can not be found in file %s.';
  rsFmtInvalidWAD = 'File %s is invalid.';
{$ENDIF}

implementation

{$IFNDEF NO_IDSOFTGAMESSUPPORT}

uses
  Math, se_DirectX, se_D3DUtils, se_DoomScriptEngine
{$IFNDEF NO_DOOMTHINGS}
     ,se_DoomThings, se_HereticThings, se_HexenThings, se_StrifeThings ,se_IDWADThingsCommon
{$ENDIF}
     ;

function GetMapName(MainWAD: TFileName; MapName: string;
  wadtype: TIDSoftWADType = idUnknown): string;
var
  typ: TIDSoftWADType;
  mapnum: integer;
  isDoom2: boolean;
  isTNT: boolean;
  isPLUTONIA: boolean;
  len: integer;
  SC: TDoomScriptEngine;
  num: integer;
  done: boolean;
  sEOF: boolean;
begin
  Result := UpperCase(MapName);
  len := Length(Result);
  if (len < 4) or (len > 5) then
    Exit;

  if wadtype = idUnKnown then
    typ := GetWADType(MainWAD)
  else
    typ := wadtype;

  isDoom2 := False;
  isTNT := False;
  isPLUTONIA := False;

  if len = 4 then
    mapnum := StrToIntDef(Result[2], 0) * 10 + StrToIntDef(Result[4], 0)
  else
  begin
    if typ = iddoom then
    begin
      isDoom2 := True;
      if UpperCase(ExtractFileName(MainWAD)) = 'TNT.WAD' then
        isTNT := True
      else if UpperCase(ExtractFileName(MainWAD)) = 'PLUTONIA.WAD' then
        isPLUTONIA := True;
    end;
    mapnum := StrToIntDef(Result[4] + Result[5], 0)
  end;

  if mapnum = 0 then
    Exit;

  done := False;
  SC := TDoomScriptEngine.Create(MainWAD, MAPINFO_SCRIPT_NAME);
  try
    while SC.GetString do
    begin
      if not SC.Compare('MAP') then
      begin
        SC.ScriptError;
        Break;
      end;
      SC.MustGetNumber;
      num := SC.Number;
      if (num < 1) or (num > 99) then
      begin
        SC.ScriptError;
        Break;
      end;
      if num = mapnum then
      begin
        SC.MustGetString;
        Result := SC.Token;
        done := True;
        Break;
      end;
      repeat
        sEOF := not SC.GetString;
        if sEOF then
          Break;
      until SC.Compare('MAP');
      if sEOF then
        Break;
      SC.UnGet;
    end;
  finally
    SC.Free;
  end;

  if done then
    Exit;

  case typ of
    iddoom:
      begin
        if not isDoom2 then
        begin
          case mapnum of
            11: Result := 'Hangar';
            12: Result := 'Nuclear Plant';
            13: Result := 'Toxin Refinery';
            14: Result := 'Command Control';
            15: Result := 'Phobos Lab';
            16: Result := 'Central Processing';
            17: Result := 'Computer Station';
            18: Result := 'Phobos Anomaly';
            19: Result := 'Military Base';

            21: Result := 'Deimos Anomaly';
            22: Result := 'Containment Area';
            23: Result := 'Refinery';
            24: Result := 'Deimos Lab';
            25: Result := 'Command Center';
            26: Result := 'Halls of the Damned';
            27: Result := 'Spawning Vats';
            28: Result := 'Tower of Babel';
            29: Result := 'Fortress of Mystery';

            31: Result := 'Hell Keep';
            32: Result := 'Slough of Despair';
            33: Result := 'Pandemonium';
            34: Result := 'House of Pain';
            35: Result := 'Unholy Cathedral';
            36: Result := 'Mt. Erebus';
            37: Result := 'Limbo';
            38: Result := 'Dis';
            39: Result := 'Warrens';

            41: Result := 'Hell Beneath';
            42: Result := 'Perfect Hatred';
            43: Result := 'Sever The Wicked';
            44: Result := 'Unruly Evil';
            45: Result := 'They Will Repent';
            46: Result := 'Against Thee Wickedly';
            47: Result := 'And Hell Followed';
            48: Result := 'Unto The Cruel';
            49: Result := 'Fear';
          else
            Exit;
          end;
          Result := MapName + ': ' + Result;
        end
        else
        begin
          if isPLUTONIA then
          begin
            case mapnum of
               1: Result := 'congo';
               2: Result := 'well of souls';
               3: Result := 'aztec';
               4: Result := 'caged';
               5: Result := 'ghost town';
               6: Result := 'baron''s lair';
               7: Result := 'caughtyard';
               8: Result := 'realm';
               9: Result := 'abattoire';
              10: Result := 'onslaught';
              11: Result := 'hunted';

              12: Result := 'speed';
              13: Result := 'the crypt';
              14: Result := 'genesis';
              15: Result := 'the twilight';
              16: Result := 'the omen';
              17: Result := 'compound';
              18: Result := 'neurosphere';
              19: Result := 'nme';
              20: Result := 'the death domain';

              21: Result := 'slayer';
              22: Result := 'impossible mission';
              23: Result := 'tombstone';
              24: Result := 'the final frontier';
              25: Result := 'the temple of darkness';
              26: Result := 'bunker';
              27: Result := 'anti-christ';
              28: Result := 'the sewers';
              29: Result := 'odyssey of noises';
              30: Result := 'the gateway of hell';

              31: Result := 'cyberden';
              32: Result := 'go 2 it';
            else
              Exit;
            end;
          end
          else if isTNT then
          begin
            case mapnum of
               1: Result := 'system control';
               2: Result := 'human bbq';
               3: Result := 'power control';
               4: Result := 'wormhole';
               5: Result := 'hanger';
               6: Result := 'open season';
               7: Result := 'prison';
               8: Result := 'metal';
               9: Result := 'stronghold';
              10: Result := 'redemption';
              11: Result := 'storage facility';

              12: Result := 'crater';
              13: Result := 'nukage processing';
              14: Result := 'steel works';
              15: Result := 'dead zone';
              16: Result := 'deepest reaches';
              17: Result := 'processing area';
              18: Result := 'mill';
              19: Result := 'shipping/respawning';
              20: Result := 'central processing';

              21: Result := 'administration center';
              22: Result := 'habitat';
              23: Result := 'lunar mining project';
              24: Result := 'quarry';
              25: Result := 'baron''s den';
              26: Result := 'ballistyx';
              27: Result := 'mount pain';
              28: Result := 'heck';
              29: Result := 'river styx';
              30: Result := 'last call';

              31: Result := 'pharaoh';
              32: Result := 'caribbean';
            else
              Exit;
            end;
          end
          else
          begin
            case mapnum of
               1: Result := 'entryway';
               2: Result := 'underhalls';
               3: Result := 'the gantlet';
               4: Result := 'the focus';
               5: Result := 'the waste tunnels';
               6: Result := 'the crusher';
               7: Result := 'dead simple';
               8: Result := 'tricks and traps';
               9: Result := 'the pit';
              10: Result := 'refueling base';
              11: Result := '''o'' of destruction!';

              12: Result := 'the factory';
              13: Result := 'downtown';
              14: Result := 'the inmost dens';
              15: Result := 'industrial zone';
              16: Result := 'suburbs';
              17: Result := 'tenements';
              18: Result := 'the courtyard';
              19: Result := 'the citadel';
              20: Result := 'gotcha!';

              21: Result := 'nirvana';
              22: Result := 'the catacombs';
              23: Result := 'barrels o'' fun';
              24: Result := 'the chasm';
              25: Result := 'bloodfalls';
              26: Result := 'the abandoned mines';
              27: Result := 'monster condo';
              28: Result := 'the spirit world';
              29: Result := 'the living end';
              30: Result := 'icon of sin';

              31: Result := 'wolfenstein';
              32: Result := 'grosse';
            else
              Exit;
            end;
          end;
          Result := 'level ' + IntToStr(mapnum) + ': ' + Result;
        end;
      end;
    idHeretic:
      begin
        case mapnum of
          11: Result := 'THE DOCKS';
          12: Result := 'THE DUNGEONS';
          13: Result := 'THE GATEHOUSE';
          14: Result := 'THE GUARD TOWER';
          15: Result := 'THE CITADEL';
          16: Result := 'THE CATHEDRAL';
          17: Result := 'THE CRYPTS';
          18: Result := 'HELL''S MAW';
          19: Result := 'THE GRAVEYARD';
          // EPISODE 2 - HELL'S MAW
          21: Result := 'THE CRATER';
          22: Result := 'THE LAVA PITS';
          23: Result := 'THE RIVER OF FIRE';
          24: Result := 'THE ICE GROTTO';
          25: Result := 'THE CATACOMBS';
          26: Result := 'THE LABYRINTH';
          27: Result := 'THE GREAT HALL';
          28: Result := 'THE PORTALS OF CHAOS';
          29: Result := 'THE GLACIER';
          // EPISODE 3 - THE DOME OF D'SPARIL
          31: Result := 'THE STOREHOUSE';
          32: Result := 'THE CESSPOOL';
          33: Result := 'THE CONFLUENCE';
          34: Result := 'THE AZURE FORTRESS';
          35: Result := 'THE OPHIDIAN LAIR';
          36: Result := 'THE HALLS OF FEAR';
          37: Result := 'THE CHASM';
          38: Result := 'D''SPARIL''S KEEP';
          39: Result := 'THE AQUIFER';
          // EPISODE 4: THE OSSUARY
          41: Result := 'CATAFALQUE';
          42: Result := 'BLOCKHOUSE';
          43: Result := 'AMBULATORY';
          44: Result := 'SEPULCHER';
          45: Result := 'GREAT STAIR';
          46: Result := 'HALLS OF THE APOSTATE';
          47: Result := 'RAMPARTS OF PERDITION';
          48: Result := 'SHATTERED BRIDGE';
          49: Result := 'MAUSOLEUM';
          // EPISODE 5: THE STAGNANT DEMESNE
          51: Result := 'OCHRE CLIFFS';
          52: Result := 'RAPIDS';
          53: Result := 'QUAY';
          54: Result := 'COURTYARD';
          55: Result := 'HYDRATYR';
          56: Result := 'COLONNADE';
          57: Result := 'FOETID MANSE';
          58: Result := 'FIELD OF JUDGEMENT';
          59: Result := 'SKEIN OF D''SPARIL';
          61,
          62,
          63: Result := 'DEATHMATCH LEVEL';
        else
          Exit;
        end;
        Result := MapName + ':  ' + Result;
      end;
    idHexen:
      begin
        case mapnum of
           1: Result := 'WINNOWING HALL';
           2: Result := 'SEVEN PORTALS';
           3: Result := 'GUARDIAN OF ICE';
           4: Result := 'GUARDIAN OF FIRE';
           5: Result := 'GUARDIAN OF STEEL';
           6: Result := 'BRIGHT CRUCIBLE';
           7: Result := 'SHADOW WOOD';
           8: Result := 'DARKMERE';
           9: Result := 'CAVES OF CIRCE';
          10: Result := 'WASTELANDS';
          11: Result := 'SACRED GROVE';
          12: Result := 'HYPOSTYLE';
          13: Result := 'SHADOW WOOD';
          14: Result := 'SWAMP DEMO';
          21: Result := 'FORSAKEN OUTPOST';
          22: Result := 'CASTLE OF GRIEF';
          23: Result := 'GIBBET';
          24: Result := 'EFFLUVIUM';
          25: Result := 'DUNGEONS';
          26: Result := 'DESOLATE GARDEN';
          27: Result := 'HERESIARCH''S SEMINARY';
          28: Result := 'DRAGON CHAPEL';
          29: Result := 'NADA';
          30: Result := 'GRIFFIN CHAPEL';
          31: Result := 'DEATHWIND CHAPEL';
          32: Result := 'ORCHARD OF LAMENTATIONS';
          33: Result := 'SILENT REFECTORY';
          34: Result := 'WOLF CHAPEL';
          35: Result := 'NECROPOLIS';
          36: Result := 'ZEDEK''S TOMB';
          37: Result := 'MENELKIR''S TOMB';
          38: Result := 'TRADUCTUS'' TOMB';
          39: Result := 'VIVARIUM';
          40: Result := 'DARK CRUCIBLE';
          42: Result := 'ERIC''S WHIRLWIND O'' DEATH';
          43: Result := 'MAYA';
          50: Result := 'THE BADLANDS';
          51: Result := 'CAVES OF ASCENSION';
          52: Result := 'LOWER CRYPTS';
          53: Result := 'THE HYPOSTYLE HALL';
          54: Result := 'THE SANCTORIUM';
          55: Result := 'THE ATHENAEUM';
          56: Result := 'THE CLERIC''S CITADEL';
          60: Result := 'PROGRAMMER MAP';
          90: Result := 'BGOKEY';
          92: Result := 'PAUL MAP';
          93: Result := 'PAUL MAP2';
          95: Result := 'CJR@RAVENSOFT.COM';
          96: Result := 'SOUND DEVELOPMENT MAP';
        else
          Exit;
        end;
        Result := 'level ' + IntToStr(mapnum) + ': ' + Result;
      end;
    idStrife,
    idStrife2:
      begin
        if mapnum = 33 then
          Result := 'AREA  1: Sanctuary'
        else if mapnum = 34 then
          Result := 'AREA  2: Town'
        else if mapnum = 35 then
          Result := 'AREA  3: Movement Base'
        else case (mapnum mod 32) of
           1: Result := 'AREA  1: sanctuary';
           2: Result := 'AREA  2: town';
           3: Result := 'AREA  3: front base';
           4: Result := 'AREA  4: power station';
           5: Result := 'AREA  5: prison';
           6: Result := 'AREA  6: sewers';
           7: Result := 'AREA  7: castle';
           8: Result := 'AREA  8: Audience Chamber';
           9: Result := 'AREA  9: Castle: Programmer''s Keep';
          10: Result := 'AREA 10: New Front Base';
          11: Result := 'AREA 11: Borderlands';

          12: Result := 'AREA 12: the temple of the oracle';
          13: Result := 'AREA 13: Catacombs';
          14: Result := 'AREA 14: mines';
          15: Result := 'AREA 15: Fortress: Administration';
          16: Result := 'AREA 16: Fortress: Bishop''s Tower';
          17: Result := 'AREA 17: Fortress: The Bailey';
          18: Result := 'AREA 18: Fortress: Stores';
          19: Result := 'AREA 19: Fortress: Security Complex';
          20: Result := 'AREA 20: Factory: Receiving';

          21: Result := 'AREA 21: Factory: Manufacturing';
          22: Result := 'AREA 22: Factory: Forge';
          23: Result := 'AREA 23: Order Commons';
          24: Result := 'AREA 24: Factory: Conversion Chapel';
          25: Result := 'AREA 25: Catacombs: Ruined Temple';
          26: Result := 'AREA 26: proving grounds';
          27: Result := 'AREA 27: The Lab';
          28: Result := 'AREA 28: Alien Ship';
          29: Result := 'AREA 29: Entity''s Lair';
          30: Result := 'AREA 30: Abandoned Front Base';

          31: Result := 'AREA 31: Training Facility';

           0: Result := 'AREA 32';
        else
          Exit;
        end;
      end;
  end;
end;

function GetDoomSkyTexture(typ: TIDSoftWADType; MapName: string): string;
begin
  Result := '';
  case typ of
    idDoom :
        case MapName[2] of
          '1': Result := 'SKY1';
          '2': Result := 'SKY2';
          '3': Result := 'SKY3';
          '4': Result := 'SKY4';
          'A': // Doom2
          begin
            case StrToIntDef(MapName[4] + MapName[5], 0) of
              1..11: Result := 'SKY1';
             12..21: Result := 'SKY2';
             22..32: Result := 'SKY3';
            else
              Result := 'SKY1';
            end;
          end
        else
          Result := 'SKY1';
        end;
    idHeretic :
      begin
        case MapName[2] of
          '1': Result := 'SKY1';
          '2': Result := 'SKY2';
          '3': Result := 'SKY3';
          '4': Result := 'SKY1';
          '5': Result := 'SKY3';
          '6': Result := 'SKY1';
        else
          Result := 'SKY1';
        end;
      end;
    idStrife,
    idStrife2:
      begin
        case StrToIntDef(MapName[4] + MapName[5], 0) of
           1..8,
         32..34: Result := 'SKYMNT02';
        else // 9..31, 35..36
          Result := 'SKYMNT01';
        end;
      end;
    idHexen:
      Result := 'SKY3';
  end;
end;

{$IFNDEF NO_DOOMTHINGS}
function GetPredefinedTextureDimentions(typ: TIDSoftWADType; tex: string;
  var w, h: integer; var animEnd: char): boolean;
begin
  Result := Length(tex) >= 4;
  if not Result then Exit;
  tex := UpCase(tex[1]) + UpCase(tex[2]) + UpCase(tex[3]) + UpCase(tex[4]);
  if typ = idDoom then
    Result := GetSpriteTextureDimentions(se_DoomThings.sprnames,
      se_DoomThings.sprNamesLookUp, tex, w, h, animEnd)
  else if typ = idHeretic then
    Result := GetSpriteTextureDimentions(se_HereticThings.sprnames,
      se_HereticThings.sprNamesLookUp, tex, w, h, animEnd)
  else if typ = idHexen then
    Result := GetSpriteTextureDimentions(se_HexenThings.sprnames,
      se_HexenThings.sprNamesLookUp, tex, w, h, animEnd)
// No Strife support
  else
  begin
    animEnd := 'D';
    Result := False;
  end;
end;
{$ENDIF}

function IsValidTextureName(tn: TDoomCharArray): boolean; overload;
// Returns True if <tn> is a valid texture name
begin
  if tn[1] = #0 then
    Result := False
  else if tn[1] = '-' then
    Result := False
  else
    Result := True;
end;

function IsValidTextureName(ts: string): boolean; overload;
// Returns True if <tn> is a valid texture name 
begin
  Result := (ts <> '') and (ts <> '-')
end;

function GetWadLinkDescription(const WADFileName: string; Entry: string): string;
{$IFNDEF DOOMVIEWER}
var
  sWad, sEntry: string;
{$ENDIF}
begin
{$IFNDEF DOOMVIEWER}
  if GetWadLinkInfo(Entry, sWAD, sEntry) then // Entry is already formated
    Result := Format(rsFmtDOOMLINKDESCRIPTION, [WADFileName, sEntry])
  else
    Result := Format(rsFmtDOOMLINKDESCRIPTION, [WADFileName, Entry]);
{$ELSE}
  Result := Entry;
{$ENDIF}
end;

function IsSkyTextureName(const s: string): boolean;
var
  i: integer;
begin
  Result := (s = rsF_SKY) or (s = rsF_SKY1);
  if not Result then
  begin
    for i := 0 to 9 do
      if s = Format(rsF_FmtSKY, [i]) then
      begin
        Result := True;
        Exit;
      end;
  end;
end;

function GetWadTextureDescription(const WADFileName: string; Entry: string): string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to 9 do
    if Entry = Format(rsF_FmtSKY, [i]) then
      Exit;
  if (Entry <> '') and (Entry <> '-') and
     (Entry <> rsF_SKY) and (Entry <>  rsF_SKY1) then
    Result := GetWadLinkDescription(WADFileName, Entry)
end;

function IsWadLinkInfo(const inf: string): boolean;
{$IFNDEF DOOMVIEWER}
var
  WADFileName: string;
  Entry: string;
begin
  Result := GetWadLinkInfo(inf, WadFileName, Entry);
  if Result then
    Result := UpperCase(RightStr(WADFileName, 3)) = rsWADExt;
{$ELSE}
begin
  Result := True;
{$ENDIF}
end;

function GetWadLinkEntryName(const inf: string): string;
{$IFNDEF DOOMVIEWER}
var
  WADFileName: string;
  Entry: string;
begin
  if GetWadLinkInfo(inf, WADFileName, Entry) then
    Result := Entry
  else
    Result := inf;
{$ELSE}
begin
  Result := inf;
{$ENDIF}
end;

function GetWadLinkInfo(const inf: string; var WADFileName: string; var Entry: string): boolean;
{$IFNDEF DOOMVIEWER}
// Κάνει split το inf που είναι της μορφής πχ  '->C:\DOOM.WAD::FLAT_1' στα 'C:\DOOM.WAD' & 'FLAT_1'
var
  sEntry: string;
  i, j: integer;
  len: integer;
begin
  len := Length(inf);
  if len >= Length(rsFmtDOOMLINKDESCRIPTION1) + Length(rsFmtDOOMLINKDESCRIPTION2) + 2 then
  begin
    if inf[1] + inf[2] = rsFmtDOOMLINKDESCRIPTION1 then
    begin
      sEntry := '';
      i := len;
      while (i > Length(rsFmtDOOMLINKDESCRIPTION1)) and
           (inf[i] + inf[i - 1] <> rsFmtDOOMLINKDESCRIPTION2) do //rsFmtDOOMLINKDESCRIPTION2[Length(rsFmtDOOMLINKDESCRIPTION2) - 1] + rsFmtDOOMLINKDESCRIPTION2[Length(rsFmtDOOMLINKDESCRIPTION2)]) do
      begin
        sEntry := inf[i] + sEntry;
        dec(i);
      end;
      if i > Length(rsFmtDOOMLINKDESCRIPTION1) then
      begin
        WADFileName := '';
        for j := Length(rsFmtDOOMLINKDESCRIPTION1) + 1 to i - Length(rsFmtDOOMLINKDESCRIPTION2) do
          WADFileName := WADFileName + inf[j];
        Entry := sEntry;
        Result := True;
        Exit;
      end;
    end;
  end;
  Result := False;
{$ELSE}
begin
  WADFileName := '';
  Entry := inf;
  Result := True;
{$ENDIF}
end;

function DoomEntryName(const Entry: TDoomCharArray; fileCheck: boolean = True): string; overload;
var
  i: integer;
  pc: PChar;
begin
  Result := '';
  pc := @Entry[1];
  if fileCheck then
  begin
    for i := 1 to 8 do
    begin
      if pc^ in ['/','\','[',']'] then
         Result := Result + '-'
      else if pc^ = #0 then
        Exit
      else
        Result := Result + UpCase(pc^);
      inc(pc);
    end;
  end
  else
  begin
    for i := 1 to 8 do
    begin
      if pc^ = #0 then
        Exit
      else
        Result := Result + UpCase(pc^);
      inc(pc);
    end;
  end;
end;

function DoomStringName(const Entry: string): TDoomCharArray;
var
  i: integer;
  len: integer;
begin
  len := Length(Entry);
  if len >= 8 then
  begin
    for i := 1 to 8 do
      Result[i] := Entry[i];
  end
  else
  begin
    for i := 1 to len do
      Result[i] := Entry[i];
    for i := len + 1 to 8 do
      Result[i] := #0;
  end;
end;

function DoomSectorsEqual(const sec1, sec2: TDoomSector): boolean;
begin
  Result := (sec1.check1 = sec2.check1) and
            (sec1.check2 = sec2.check2) and
            (sec1.check3 = sec2.check3) and
            (sec1.check4 = sec2.check4) and
            (sec1.check5 = sec2.check5) and
            (sec1.check6 = sec2.check6);
end;

function DoomEntryNamesEqual(const Entry1, Entry2: TDoomCharArray): boolean;
begin
  Result := (PDoomCharArray2Integers(@Entry1)[0] = PDoomCharArray2Integers(@Entry2)[0]) and
            (PDoomCharArray2Integers(@Entry1)[1] = PDoomCharArray2Integers(@Entry2)[1])
end;

function DoomEntryNamesEqual(const Entry1, Entry2, Entry3: TDoomCharArray): boolean;
begin
  Result := (PDoomCharArray2Integers(@Entry1)[0] = PDoomCharArray2Integers(@Entry2)[0]) and
            (PDoomCharArray2Integers(@Entry1)[1] = PDoomCharArray2Integers(@Entry2)[1]);
  if not Result then
    Result := (PDoomCharArray2Integers(@Entry1)[0] = PDoomCharArray2Integers(@Entry3)[0]) and
              (PDoomCharArray2Integers(@Entry1)[1] = PDoomCharArray2Integers(@Entry3)[1])
end;

function DoomEntryNamesEqual(const Entry1, Entry2, Entry3, Entry4: TDoomCharArray): boolean;
begin
  Result := (PDoomCharArray2Integers(@Entry1)[0] = PDoomCharArray2Integers(@Entry2)[0]) and
            (PDoomCharArray2Integers(@Entry1)[1] = PDoomCharArray2Integers(@Entry2)[1]);
  if not Result then
  begin
    Result := (PDoomCharArray2Integers(@Entry1)[0] = PDoomCharArray2Integers(@Entry3)[0]) and
              (PDoomCharArray2Integers(@Entry1)[1] = PDoomCharArray2Integers(@Entry3)[1]);
    if not Result then
      Result := (PDoomCharArray2Integers(@Entry1)[0] = PDoomCharArray2Integers(@Entry4)[0]) and
                (PDoomCharArray2Integers(@Entry1)[1] = PDoomCharArray2Integers(@Entry4)[1]);
  end;
end;

function DoomEntryName(const dEntry: TDoomDirEntry; fileCheck: boolean = True): string; overload;
begin
  Result := DoomEntryName(dEntry.Name, fileCheck);
end;

function isDoomMap(inf: TDoomDirEntry): boolean;
var
  iName: PDoomCharArray;
begin
  iName := @inf.Name;
  if (iName[1] = 'E') and (iName[3] = 'M') and
    (iName[2] in ['1'..'9']) and (iName[4] in ['1'..'9']) and
    (iName[5] = Chr(0)) then
    Result := True
  else if (iName[1] = 'M') and (iName[2] = 'A') and (iName[3] = 'P') and
    (iName[4] in ['1'..'9','0']) and (iName[5] in ['1'..'9','0']) and
    (iName[6] = Chr(0)) then
    Result := True
  else
    Result := False;
end;

function GetWadType(FileName: TFileName): TIDSoftWADType;
var
  dir: PDoomDirectory;
  numEntries: integer;
begin
  Result := ReadWADDirectory(FileName, dir, numEntries);
  if numEntries > 0 then
    FreeMem(dir, numEntries * SizeOf(TDoomDirEntry));
end;

const VALID_CHARS: set of Char =
  ['A'..'Z','1'..'9','0',#0,'%','/','\','[',']','-','_', '~'];

function GetWadType(dir: PDoomDirectory; var numEntries: integer): TIDSoftWADType; overload;
var
  OK: boolean;
  isDoom: boolean;
  isHeretic: boolean;
  isHexen: boolean;
  isStrife: boolean;
  isNew: boolean;
  pEntry: PDoomDirEntry;
  pName: PDoomCharArray;
  i: integer;
  s: string;
begin
  Result := idInvalid;
  isDoom := False;
  isHeretic := False;
  isHexen := False;
  isStrife := False;
  isNew := False;
  OK := True;
  i := 0;
  // Ακολουθεί ο έλεγχος για την ορθότητα του directory
  while (i < numEntries) and OK do
  begin
    pEntry := @dir[i];
    pName := @pEntry.Name;
    OK := (pName[1] in VALID_CHARS) and
          (pName[2] in VALID_CHARS) and
          (pName[3] in VALID_CHARS) and
          (pName[4] in VALID_CHARS) and
          (pName[5] in VALID_CHARS) and
          (pName[6] in VALID_CHARS) and
          (pName[7] in VALID_CHARS) and
          (pName[8] in VALID_CHARS);
    if OK then
    begin
      s := DoomEntryName(pName^);
      if s = rsDoomFlag then
        isDoom := True
      else if s = rsHereticFlag then
        isHeretic := True
      else if s = rsHexenFlag then
        isHexen := True
      else if (s = rsStrifeFlag) or (s = rsStrifeFlag2) then
        isStrife := True
      else if s = rsNewFlag then
        isNew := True;
    end;
    inc(i);
  end;
  if OK then
  begin
    if isNew then
      Result := idNew
    else if isStrife then
      Result := idStrife
    else if isHexen then
      Result := idHexen
    else if isHeretic then
      Result := idHeretic
    else if isDoom then
      Result := idDoom
    else
      Result := idUnknown;
  end
end;

procedure AdjustWadDirectory(const dir: PDoomDirectory; const numEntries: integer);
var
  i, j: integer;
  zero: boolean;
  pEntry: PDoomDirEntry;
  pC: PChar;
begin
  pEntry := @dir[0];
  for i := 0 to numEntries - 1 do
  begin
    zero := False;
    pC := @pEntry.Name[1];
    for j := 1 to 8 do
    begin
      if zero then
        pC^ := #0
      else if pC^ = #0 then
        zero := True
      else
        pC^ := UpCase(pC^);
      inc(pC);
    end;
    inc(pEntry);
  end;
end;

procedure AdjustPatchNames(const pPatches: PPatchNames; const numEntries: integer);
var
  i, j: integer;
  zero: boolean;
  pEntry: PDoomCharArray;
  pC: PChar;
begin
  pEntry := @pPatches[0];
  for i := 0 to numEntries - 1 do
  begin
    zero := False;
    pC := @pEntry[1];
    for j := 1 to 8 do
    begin
      if zero then
        pC^ := #0
      else if pC^ = #0 then
        zero := True
      else
        pC^ := UpCase(pC^);
      inc(pC);
    end;
    inc(pEntry);
  end;
end;

const
  MAXCACHEDWADDIRENTRIES = 128;

type
  TWADDirCacheItem = record
    FileName: string;
    FileTime: integer;
    wadtype: TIDSoftWADType;
    numEntries: integer;
    dir: PDoomDirectory;
  end;

  PWADDirCacheItem = ^TWADDirCacheItem;

  TWADDirCache = array[0..MAXCACHEDWADDIRENTRIES - 1] of TWADDirCacheItem;

var
  WADDirCache: TWADDirCache;
  numWADDirCache: integer = 0;
  WADDirCacheInitialized: boolean = False;

procedure InitWADDIRCache;
var
  i: integer;
  pItem: PWADDirCacheItem;
begin
  if not WADDirCacheInitialized then
  begin
    numWADDirCache := 0;
    pItem := @WADDirCache[0];
    for i := 0 to MAXCACHEDWADDIRENTRIES - 1 do
    begin
      pItem.FileName := '';
      pItem.FileTime := -1;
      pItem.wadtype := idInvalid;
      pItem.numEntries := -1;
      pItem.dir := nil;
      inc(pItem);
    end;
    WADDirCacheInitialized := True;
  end;
end;

function GetWADDIRCache(FileName: string; var dir: PDoomDirectory;
  var numEntries: integer; var wadtype: TIDSoftWADType): boolean;
var
  i: integer;
  uFileName: string;
  FileTime: integer;
  pItem: PWADDirCacheItem;
begin
  uFileName := UpperCase(ExpandFileName(FileName));
  FileTime := FileAge(uFileName);
  if FileTime > -1 then
  begin
    pItem := @WADDirCache[numWADDirCache];
    for i := numWADDirCache - 1 downto 0 do // More possibilities for last dir
    begin
      dec(pItem);
      if (FileTime = pItem.FileTime) then
        if (uFileName = pItem.FileName) then
        begin
          wadtype := pItem.wadtype;
          numEntries := pItem.numEntries;
          GetMem(dir, numEntries * SizeOf(TDoomDirEntry));
          Move(pItem.dir^, dir^, numEntries * SizeOf(TDoomDirEntry));
          Result := True;
          Exit;
        end;
    end;
  end;
  Result := False;
end;

function GetWADDIRCacheNoCopy(FileName: string; var dir: PDoomDirectory;
  var numEntries: integer; var wadtype: TIDSoftWADType): boolean;
//Same as above but does not copy the dir data..
var
  i: integer;
  uFileName: string;
  FileTime: integer;
  pItem: PWADDirCacheItem;
begin
  uFileName := UpperCase(ExpandFileName(FileName));
  FileTime := FileAge(uFileName);
  if FileTime > -1 then
  begin
    pItem := @WADDirCache[numWADDirCache];
    for i := numWADDirCache - 1 downto 0 do // More possibilities for last dir
    begin
      dec(pItem);
      if (FileTime = pItem.FileTime) then
        if (uFileName = pItem.FileName) then
        begin
          wadtype := pItem.wadtype;
          numEntries := pItem.numEntries;
          dir := pItem.dir;
          Result := True;
          Exit;
        end;
    end;
  end;
  Result := False;
end;

procedure AddWADDIRCacheDir(FileName: string; const dir: PDoomDirectory;
  const numEntries: integer; const wadtype: TIDSoftWADType);
var
  pItem: PWADDirCacheItem;
  uFileName: string;
  idx: integer;
begin
  InitWADDIRCache;
  if numWADDirCache < MAXCACHEDWADDIRENTRIES then
  begin
    pItem := @WADDirCache[numWADDirCache];
    inc(numWADDirCache);
  end
  else
  begin
    idx := MAXCACHEDWADDIRENTRIES - 1 - random(MAXCACHEDWADDIRENTRIES div 4); // near end
    pItem := @WADDirCache[idx]; // Add anyway!!
    FreeMem(pItem.dir, pItem.numEntries * SizeOf(TDoomDirEntry));
  end;

  uFileName := UpperCase(ExpandFileName(FileName));
  pItem.FileName := uFileName;
  pItem.FileTime := FileAge(uFileName);
  pItem.wadtype := wadtype;
  pItem.numEntries := numEntries;
  GetMem(pItem.dir, numEntries * SizeOf(TDoomDirEntry));
  Move(dir^, pItem.dir^, numEntries * SizeOf(TDoomDirEntry));
end;

procedure FreeWADDIRCache;
var
  i: integer;
  pItem: PWADDirCacheItem;
begin
  pItem := @WADDirCache[0];
  for i := 0 to numWADDirCache - 1 do
  begin
    pItem.FileName := '';
    pItem.FileTime := -1;
    pItem.wadtype := idInvalid;
    FreeMem(pItem.dir, pItem.numEntries * SizeOf(TDoomDirEntry));
    pItem.numEntries := -1;
    inc(pItem);
  end;
  numWADDirCache := 0;
end;

{function ReadWadDirectory(FileName: TFileName;
  var dir: PDoomDirectory; var numEntries: integer): TIDSoftWADType;
var f: TFileStream;
begin
  Result := ReadWadDirectory(FileName, f, dir, numEntries);
  f.Free;
end;}

function ReadWadDirectory(FileName: TFileName; var dir: PDoomDirectory;
  var numEntries: integer; doSearchCache: boolean = True): TIDSoftWADType; overload;
const
  SIGNATURE_LEN = 4;
var
  f: TFileStream;
  i: integer;
  c: char;
  s: string;
  dirStart: integer;
  OK: boolean;
  isDoom: boolean;
  isHeretic: boolean;
  isHexen: boolean;
  isStrife: boolean;
  isNew: boolean;
  pEntry: PDoomDirEntry;
  fsize: integer;
  pName: PDoomCharArray;
begin
  if doSearchCache then
    if GetWADDIRCache(FileName, dir, numEntries, Result) then
      Exit;

  Result := idInvalid;
  numEntries := 0;

  if FileName = '' then
    Exit;

  f := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    fsize := f.size;
    for i := 1 to SIGNATURE_LEN do
    begin
      f.Read(c, SizeOf(c));
      s := s + c;
    end;
    if (s = rsPWad) or (s = rsIWad) then // είναι πράγματι αρχείο WAD
    begin
      f.Seek(4, soFromBeginning);
      f.Read(numEntries, SizeOf(numEntries));
      f.Read(dirStart, SizeOf(dirStart));
      if (dirStart + numEntries * SizeOf(TDoomDirEntry) > f.Size) or (numEntries <= 0) then
      begin
        numEntries := 0;
        Result := idVJ // Πιθανόν WAD δικού μου format
      end
      else
      begin
        f.Seek(dirStart, soFromBeginning);
        GetMem(pointer(dir), numEntries * SizeOf(TDoomDirEntry));
        f.Read(dir^, numEntries * SizeOf(TDoomDirEntry));
        AdjustWadDirectory(dir, numEntries);
        isDoom := False;
        isHeretic := False;
        isHexen := False;
        isStrife := False;
        isNew := False;
        OK := True;
        i := 0;
        // Ακολουθεί ο έλεγχος για την ορθότητα του directory
        while (i < numEntries) and OK do
        begin
          pEntry := @dir[i];
          pName := @pEntry.Name;
          OK := (pName[1] in VALID_CHARS) and
                (pName[2] in VALID_CHARS) and
                (pName[3] in VALID_CHARS) and
                (pName[4] in VALID_CHARS) and
                (pName[5] in VALID_CHARS) and
                (pName[6] in VALID_CHARS) and
                (pName[7] in VALID_CHARS) and
                (pName[8] in VALID_CHARS) and
                (pEntry.position + pEntry.size <= fSize);
          if OK then
          begin
            s := DoomEntryName(pName^);
            if s = rsDoomFlag then
              isDoom := True
            else if s = rsHereticFlag then
              isHeretic := True
            else if s = rsHexenFlag then
              isHexen := True
            else if (s = rsStrifeFlag) or (s = rsStrifeFlag2) then
              isStrife := True
            else if s = rsNewFlag then
              isNew := True;
          end
          else
            dec(i);
          inc(i);
        end;
        if OK then
        begin
          if isNew then
            Result := idNew
          else if isStrife then
            Result := idStrife
          else if isHexen then
            Result := idHexen
          else if isHeretic then
            Result := idHeretic
          else if isDoom then
            Result := idDoom
          else
            Result := idUnknown;
          AddWADDIRCacheDir(FileName, dir, numEntries, Result);
        end
      end;
    end;
  except
    numEntries := 0;
    raise Exception.Create(Format(rsFmtInvalidWAD, [FileName]));
  end;
  f.Free;
end;

function ReadEntry(WAD: string; Entry: string; var p: Pointer; var size: integer;
  dir: PDoomDirectory = nil; numEntries: integer = -1): boolean;
var
  d: TDoomDirEntry;
  f: TFileStream;
  needsFreeDir: boolean;
  wadtype: TIDSoftWADType;
begin
  Result := False;
  if Entry = '' then
    Exit;

  needsFreeDir := False;
  if (dir = nil) or (numEntries = -1) then
    if not GetWADDIRCacheNoCopy(WAD, dir, numEntries, wadtype) then
    begin
      wadtype := ReadWADDirectory(WAD, dir, numEntries, False);
      needsFreeDir := True;
    end;

  if wadtype <> idInvalid then
  begin
    if SearchEntry(Entry, dir, numEntries, d) then
    begin
      size := d.size;
      GetMem(p, size);
      f := TFileStream.Create(WAD, fmOpenRead or fmShareDenyNone);
      try
        f.Seek(d.position, soFromBeginning);
        f.Read(p^, size);
        Result := True;
      finally
        f.Free;
      end;
    end
    else
    begin
      p := nil;
      size := 0;
    end;
    if needsFreeDir then
      FreeMem(dir, numEntries * SizeOf(TDoomDirEntry));
  end;
end;

function SearchEntry(Entry: string; dir: PDoomDirectory;
  const numEntries: integer; var d: TDoomDirEntry): boolean;
var
  i: integer;
  Entry2: TDoomCharArray;
begin
  Result := False;
  if Entry = '' then
    Exit;
  Entry2 := DoomStringName(UpperCase(Entry));
  for i := 0 to numEntries - 1 do
    if DoomEntryNamesEqual(dir[i].Name, Entry2) then
    begin
      Result := True;
      d := dir[i];
      Exit;
    end;
end;

function GetDoomWADMaps(FileName: TFileName; s: TStrings): integer;
{ Επιστρέφει στο stringlist s τους χάρτες του αρχείου DOOM FileName}
var
  i, numEntries: integer;
  dir: PDoomDirectory;
  dirCacheMiss: boolean;
  typ: TIDSoftWADType;
begin
  if not Assigned(s) then
    s := TDXStringList.Create
  else
    s.Clear;

  dirCacheMiss := not GetWADDIRCacheNoCopy(FileName, dir, numEntries, typ);

  if dirCacheMiss then
    if ReadWadDirectory(FileName, dir, numEntries, False) = idInvalid then
    begin
      Result := 0;
      Exit;
    end;

  for i := 0 to numEntries - 1 do
  begin
    if isDoomMap(dir[i]) then
      s.Add(DoomEntryName(dir[i].Name))
  end;

  if dirCacheMiss then
    FreeMem(dir, numEntries * SizeOf(TDoomDirEntry));

  Result := s.Count;
end;

// Local optimizers
var
  tmp_GetSectorsLines: PDoomSectorLines; // GetSectorsLines(): Πρόχειρη μεταβλητή για την λίστα των SectorLines
  tmp_OrganizeSecondSectorSegment: PDoomSectorLines; // OrganizeSecondSectorSegment(): Πρόχειρη μεταβλητή
  tmp_MergeSectorSegments: PDoomSectorLines; // MergeSectorSegments(): Πρόχειρη μεταβλητή

function GetSectorsLines(
  lLineDefs: PDoomLineDefs; numLineDefs: integer;
  lSideDefs: PDoomSideDefs; numSideDefs: integer;
  var lSectorsLines: PDoomSectorLines): integer;
// Επιστρέφει μία λίστα με τα PDoomSectorLines όλων των Sectors
var
  i: integer;
  tmp1: PDoomSectorLine;
  tmp2: PDoomSectorLine;
  pld: PDoomLineDef;
  plds: integer;
begin
  Result := 0;
  pld := @lLineDefs[0];
  for i := 0 to numLineDefs - 1 do
  begin
    plds := pld.sidedef1;
    if plds > -1 then
    begin
      tmp1 := @tmp_GetSectorsLines[Result];
      tmp1.start_end := pld.start_end;
{      tmp1.start := pld.start;
      tmp1._end := pld._end;}
      tmp1.sector := lSideDefs[plds].sector;
// Δεν ψάχνουμε εδώ για το segment των γραμμών, αλλά στην GetSectorLines παρακάτω
      tmp1.segment := 0;
      inc(Result);
    end;
    plds := pld.sidedef2;
    if plds > -1 then
    begin
      tmp1 := @tmp_GetSectorsLines[Result];
      tmp1.start := pld._end;
      tmp1._end := pld.start;
      tmp1.sector := lSideDefs[plds].sector;
      inc(Result);
    end;
    inc(pld);
  end;
  GetMem(pointer(lSectorsLines), Result * SizeOf(TDoomSectorLine));
  tmp1 := @tmp_GetSectorsLines[0];
  tmp2 := @lSectorsLines[0];
  for i := 0 to Result - 1 do
  begin
    tmp2^ := tmp1^;
    inc(tmp1);
    inc(tmp2);
  end;
end;

function GetSectorLines(
  SectorID: integer;
  lLines: PDoomSectorLines; numLines: integer;
  var lSectorLines: PDoomSectorLines): integer;
{ Επιστρέφει μία λίστα με τα PDoomSectorLines του Sector SectorID.
  Ταξινομεί την λίστα των γραμμών ανάλογα με το segment στο οποίο ανήκει
  Αρχικά έχουμε καλέσει την GetSectorsLines για να πάρουμε τον
  πίνακα lLines που περιέχει όλα τα ΤDoomSectorLine του επιπέδου}
var
  i, j: integer;
  found: boolean;
  pass: PBoolArray;      // True αν έχουμε περάσει την αντίστοιχη γραμμή (για ασυνέχειες)
  segment: TIntValue;    // Τομέας που αντιστοιχεί η κάθε γραμμή
  pdl: PDoomSectorLine;
  lLi: PDoomSectorLine;
  lLi_prev: PDoomSectorLine;
begin
  Result := 0;
// Σαρώνουμε την λίστα με όλα τα lines και επιλέγουμε αυτές που ανήκουν στον Sector
  pdl := @lLines[0];
  for i := 0 to numLines - 1 do
  begin
    if pdl.sector = SectorID then
    begin
      tmp_GetSectorsLines[Result] := pdl^;
      inc(Result);
    end;
    inc(pdl);
  end;

  if Result = 0 then
    Exit;

  GetMem(pointer(lSectorLines), Result * SizeOf(TDoomSectorLine));
  GetMem(pointer(pass), Result * SizeOf(boolean));
  for i := 1 to Result - 1 do
    pass[i] := False;
  segment := 0;

  lLi := @lSectorLines[0];
  lLi^ := tmp_GetSectorsLines[0];
  lLi.segment := 0;
  pass[0] := True;
// Κάνουμε συνεχόμενη την λίστα
  for i := 1 to Result - 1 do
  begin
    lLi_prev := lLi;
    inc(lLi);
    if (lLi_prev._end = tmp_GetSectorsLines[i].start) and not pass[i] then
    begin
      lLi^ := tmp_GetSectorsLines[i];
      lLi.segment := segment;
      pass[i] := True;
    end
    else // Ασυνέχεια! Ψάχνουμε να βρούμε την συνέχεια
    begin
      j := 0;
      found := False;
      repeat
        if not pass[j] then if lLi_prev._end = tmp_GetSectorsLines[j].start then
        begin
          lLi^ := tmp_GetSectorsLines[j];
          lLi.segment := segment;
          pass[j] := True;
          found := True;
        end;
        inc(j);
      until found or (j = Result);
      if not found then // Δεν βρέθηκε, έχουμε νέο segment!
      begin
        j := 0;
        found := False;
        repeat
          if not pass[j] then // Βρήκαμε γραμμή που δεν έχει περαστεί στο sector ?
          begin
            inc(segment); // Αυξάνουμε το ID του segment
            lLi^ := tmp_GetSectorsLines[j];
            lLi.segment := segment;
            pass[j] := True;
            found := True;
          end;
          inc(j);
        until found or (j = Result);
      end;
    end;
  end;
  FreeMem(pointer(pass));
end;

function GetSectorLinesPatchDoom1E3M8_Sector1(
  lLines: PDoomSectorLines; numLines: integer;
  var lSectorLines: PDoomSectorLines): integer;
{ Επιστρέφει μία λίστα με τα PDoomSectorLines των sector 1 & 2 από το Doom1, E3M8
  Οι δύο αυτοί τομείς στην συγκεκριμένη πίστα είναι ανοικτοί, ενώ η ένωσή τους
  είναι κλειστός τομέας.
  Ταξινομεί την λίστα των γραμμών ανάλογα με το segment στο οποίο ανήκει
  Αρχικά έχουμε καλέσει την GetSectorsLines για να πάρουμε τον
  πίνακα lLines που περιέχει όλα τα ΤDoomSectorLine του επιπέδου}
var
  i, j: integer;
  found: boolean;
  pass: PBoolArray;      // True αν έχουμε περάσει την αντίστοιχη γραμμή (για ασυνέχειες)
  segment: TIntValue;    // Τομέας που αντιστοιχεί η κάθε γραμμή
begin
  Result := 0;
// Σαρώνουμε την λίστα με όλα τα lines και επιλέγουμε αυτές που ανήκουν στον Sector
  for i := 0 to numLines - 1 do
    if lLines[i].sector in [1, 2] then
    begin
      tmp_GetSectorsLines[Result] := lLines[i];
      inc(Result);
    end;

  GetMem(pointer(lSectorLines), Result * SizeOf(TDoomSectorLine));
  GetMem(pointer(pass), Result * SizeOf(boolean));
  for i := 1 to Result - 1 do
    pass[i] := False;

  segment := 0;
  lSectorLines[0] := tmp_GetSectorsLines[0];
  lSectorLines[0].segment := 0;
  pass[0] := True;
// Κάνουμε συνεχόμενη την λίστα
  for i := 1 to Result - 1 do
  begin
    if (lSectorLines[i - 1]._end = tmp_GetSectorsLines[i].start) and not pass[i] then
    begin
      lSectorLines[i] := tmp_GetSectorsLines[i];
      lSectorLines[i].segment := segment;
      pass[i] := True;
    end
    else // Ασυνέχεια! Ψάχνουμε να βρούμε την συνέχεια
    begin
      j := 0;
      found := False;
      repeat
        if not pass[j] then if lSectorLines[i - 1]._end = tmp_GetSectorsLines[j].start then
        begin
          lSectorLines[i] := tmp_GetSectorsLines[j];
          lSectorLines[i].segment := segment;
          pass[j] := True;
          found := True;
        end;
        inc(j);
      until found or (j = Result);
      if not found then // Δεν βρέθηκε, έχουμε νέο segment!
      begin
        j := 0;
        found := False;
        repeat
          if not pass[j] then // Βρήκαμε γραμμή που δεν έχει περαστεί στο sector ?
          begin
            inc(segment); // Αυξάνουμε το ID του segment
            lSectorLines[i] := tmp_GetSectorsLines[j];
            lSectorLines[i].segment := segment;
            pass[j] := True;
            found := True;
          end;
          inc(j);
        until found or (j = Result);
      end;
    end;
  end;
  FreeMem(pointer(pass));
end;

function GetAngle(v1, v2: TDoomVertex): Extended; overload;
begin
  if v1.x = v2.x then
  begin
    if v2.y > v1.y then
      Result := g_PI_DIV_2 //pi/2
    else if v2.y < v1.y then
      Result := g_3_PI_DIV_2 // 3*pi/2
    else
      Result := 0
  end
  else
  begin
    Result := ArcTan2(v2.y - v1.y, v2.x - v1.x); // Προσοχή, χρησιμοποίησε την ArcTan2(), όχι την ArcTan2S!!
    if Result < 0 then
      Result := Result + g_2_PI; // 2 * pi;
  end;
end;

function GetAngle(cx, cy: Extended; v2: TDoomVertex): Extended; overload;
begin
  if cx = v2.x then
    Result := 0
  else
  begin
    Result := ArcTan2(v2.y - cy, v2.x - cx); // Προσοχή, όχι ArcTan2S!!
    if Result < 0 then
      Result := Result + g_2_PI; //2 * pi;
  end;
end;

function GetAngle(v1, v2, v3: TDoomVertex): Extended; overload;
begin
  Result := GetAngle(v2, v3) - GetAngle(v2, v1);
  if Result < 0 then
    Result := Result + g_2_PI; //2 * pi
end;

{ Επιστρέφει True αν το v είναι στην γωνία που ορίζουν τα v1, v2, v3 }
function IsVertexInAngle(v, v1, v2, v3: TDoomVertex): boolean; overload;
var
  ang1, ang2: Extended;
begin
  ang1 := GetAngle(v1, v2, v);
  ang2 := GetAngle(v1, v2, v3);
  Result := (ang1 + DEFTOLERANCE < ang2) and (ang1 > DEFTOLERANCE);
end;

{ Επιστρέφει True αν το v είναι στην γωνία με πλευρά v1, v2 και τιμή angle }
function IsVertexInAngle(v, v1, v2: TDoomVertex; const angle: Extended): boolean; overload;
var
  ang: Extended;
begin
  ang := GetAngle(v1, v2, v);
  Result := (ang + DEFTOLERANCE < angle) and (ang > DEFTOLERANCE);
end;

function GetVertexSqrDistance(lVertexes: PDoomVertexes; const v1, v2: integer): integer;
{ Επιστρέφει το τετράγωνο της απόστασης των Vertexes v1 & v2,
  για ελέγχους, γι'αυτό δεν παίρνουμε την τετραγωνική ρίζα }
var
  pv1, pv2: PDoomVertex;
begin
  pv1 := @lVertexes[v1];
  pv2 := @lVertexes[v2];
  Result :=
        (sqr(pv1.x - pv2.x) +
         sqr(pv1.y - pv2.y));
end;

procedure OrganizeSecondSectorSegment(
  lVertexes: PDoomVertexes; // Τα χρειαζόμαστε για τον υπολογισμό της απόστασης
  lLines: PDoomSectorLines; const numLines: integer);
{ Υπολογίζει το segment με την μικρότερη απόσταση από το πρώτο segment του
  sector. Μεταφέρει το segment αυτό στην δεύτερη θέση (το κάνει δεύτερο) }
var
  pos: integer;
  i, j: integer; // Μετρητές
  v: integer;    // Index των lLines με την μικρότερη απόσταση
  min, dist: integer;
  seg: TIntValue;
  pL, pL2: PDoomSectorLine;
  plStart, pl2Start, plEnd: integer;
begin
  if lLines[0].segment <> lLines[numLines - 1].segment then
  begin
    seg := lLines[0].segment;
    pos := 0;
    repeat
      inc(pos);
    until lLines[pos].segment <> seg;
    if lLines[pos].segment <> lLines[numLines - 1].segment then
    begin
      min := MaxInt;
      v := 0;
      pL := @lLines[0];
      for i := 0 to pos - 1 do
      begin
        pL2 := @lLines[pos];
        pl2Start := pL2.start;
        plStart := pL.start;
        plEnd := pl._end;
        for j := pos to numLines - 1 do
        begin
          dist := GetVertexSqrDistance(lVertexes, plEnd, pl2Start);
          if dist < min then
            if IsVertexInAngle(lVertexes[pl2Start],
                               lVertexes[plStart],
                               lVertexes[plEnd],
                               lVertexes[lLines[i + 1]._End]) then
            begin
              min := dist;
              v := j;  // Σημείο με μικρότερη απόσταση
            end;
          inc(pL2);
          pl2Start := pL2.start;
          plStart := pL.start;
        end;
        inc(pL);
      end;
      j := 0;
      // Μεταφέρουμε το segment με την μικρότερη απόσταση στο tmp
      seg := lLines[v].segment;
      pL := @lLines[pos];
      for i := pos to numLines - 1 do
      begin
        if pL.segment = seg then
        begin
          tmp_OrganizeSecondSectorSegment[j] := pL^;
          inc(j);
        end;
        inc(pL);
      end;
      // Μεταφέρουμε τα υπόλοιπα segment στο tmp
      pL := @lLines[pos];
      for i := pos to numLines - 1 do
      begin
        if pl.segment <> seg then
        begin
          tmp_OrganizeSecondSectorSegment[j] := pL^;
          inc(j);
        end;
        inc(pL);
      end;
      // Τέλος μεταφέρουμε το tmp στο lLines
      pL := @lLines[pos];
      pL2 := @tmp_OrganizeSecondSectorSegment[0];
      for i := 0 to j - 1 do
      begin
        pL^ := pL2^;
        inc(pL);
        inc(pL2);
      end;
    end;
  end;
end;

procedure ReallocMem1024(var P: Pointer; Size: Integer);
begin
//  ReallocMem(P, size);
  ReallocMem(P, ((Size div 1024) + 1) * 1024);
end;

function MergeSectorSegments(
  lVertexes: PDoomVertexes; // Τα χρειαζόμαστε για τον υπολογισμό της απόστασης
  var lLines: PDoomSectorLines; var numLines: integer): boolean;
{ Κάνει συγχώνευση των segments του lLines
  Ο αριθμός των lines θα αλλάξει (γι'αυτό το numLines είναι var)
  Αλγόριθμος:
    Για κάθε segment βρίσκουμε το κοντινότερο σημείο με τον προηγούμενο segment
    και σε αυτό το σημείο τους ενώνουμε 'τραβώντας' γραμμές σε αυτά τα σημεία
    εκατέρωθεν (από τον προηγούμενο στον επόμενο και από τον επόμενο στον προηγούμενο)
    Όταν κάνουμε ένα merge καλούμε πάλι αναδρομικά την συνάρτηση.
  Επιστρέφει True αν κάνει αλλαγές, διαφορετικά False
  Στο τέλος στην λίστα lLines όλα τα στοιχεία
  θα έχουν το πεδίο segment = 0 => Ένας τομέας!
}
var
  tmp1: PDoomSectorLine;
  oldLines, newLines: integer;
  pos: integer;     // Θέση στον πίνακα lLines που βρέθηκε αλλαγή segment
  oldpos: integer;  // Θέση στον πίνακα lLines που βρέθηκε η προηγούμενη αλλάγή segment
  i, j: integer;    // Μετρητές
  v1, v2: integer;  // Indexes των lLines με την μικρότερη απόσταση
  min, dist: integer;
  found: boolean;
  pL: PDoomSectorLine;
  seg: TIntValue;
begin
// Aν δεν έχουμε καμία γραμμή, τότε δεν χρειάζεται να κάνουμε τίποτε!
  if (numlines <= 3) then
    Result := False
// Aν το τελευταίο segment είναι 0, τότε δεν χρειάζεται να κάνουμε τίποτε!
  else if lLines[numLines - 1].segment = 0 then
    Result := False
  else
  begin
  // Μεταφέρουμε το segment με την μικρότερη απόσταση από το πρώτο segment
  // στην δεύτερη θέση:
    OrganizeSecondSectorSegment(lVertexes, lLines, numLines);
    Result := True; // Κάνουμε αλλαγές, επιστρέφουμε True
    oldLines := numLines;
  // Θα προσθέσουμε δύο γραμμές που θα ενώσουν δύο segments
    newLines := numLines + 2;
  // Βρίσκουμε το σημείο αλλαγής segment
    oldpos := 0;
    seg := lLines[0].segment;
    repeat
      inc(oldPos);
      found := lLines[oldPos].segment <> seg;
    until (oldPos = oldLines - 1) or found;
    pos := oldPos;
    seg := lLines[oldPos].segment;
    repeat
      inc(pos);
      found := lLines[pos].segment <> seg;
    until (pos = oldLines - 1) or found;
    if (pos = oldLines - 1) then inc(pos);
  { Όταν βγούμε από τα παραπάνω loop, θα πρέπει στην μεταβλητή pos να είναι η
    θέση του καινούριου segment }
  { Ακολουθεί η εύρεση της μικρότερης απόστασης ανάμεσα στα δύο segment:
    To πρώτο segment είναι από το σημείο 0 έως το oldPos - 1 και το
    δεύτερο segment από oldPos έως pos }
    min := MaxInt;
    v1 := 0;
    v2 := oldPos;

    pL := @lLines[0];
    for i := 0 to oldPos - 1 do
    begin
      for j := oldPos to pos - 1 do
      begin
      { Υπολογισμός της απόστασης: Στο πρώτο segment παίρνουμε το ._end
        vertex & στο δεύτερο to .start (έτσι θα γίνει η ένωση! }
        dist := GetVertexSqrDistance(lVertexes, pl._end, lLines[j].start);
        if dist < min then
        begin
          min := dist;
          v1 := i;
          v2 := j;
        end;
      end;
      inc(pL);
    end;
  { Σε αυτό το σημείο θα πρέπει στα v1, v2 να βρίσκονται αντίστοιχα τα indexes των
    γραμμών με την μικρότερη απόσταση (ουσιαστικά την μικρότερη απόσταση από
    τα τελικά σημεία του πρώτου segment (._end) και τα αρχικά σημεία του
    δεύτερου segment (.start) }
  { Ακολουθεί η συγχώνευση των 2 segments: }
    // -> Πρώτο τμήμα του πρώτου segment: Παραμένει ως έχει στο lLines
    // -> Πρώτη γραμμή συγχώνευσης:
    tmp1 := @tmp_MergeSectorSegments[v1 + 1];

    tmp1.start := lLines[v1]._end;
    tmp1._end := lLines[v2].start;
    tmp1.sector := lLines[0].sector;
    tmp1.segment := 0;
    // -> Πρώτο τμήμα του δεύτερου segment
    inc(tmp1);
    pL := @lLines[v2];
    for i := v2 to pos - 1 do
    begin
      tmp1^ := pL^;
      tmp1.segment := 0;
      inc(tmp1);
      inc(pL);
    end;
    // -> Δεύτερο τμήμα του δεύτερου segment
    tmp1 := @tmp_MergeSectorSegments[v1 - v2 + pos + 2];
    pL := @lLines[oldPos];
    for i := oldPos to v2 - 1 do
    begin
      tmp1^ := pL^;
      tmp1.segment := 0;
      inc(tmp1);
      inc(pL);
    end;
    // -> Δεύτερη γραμμή συγχώνευσης:
    tmp1 := @tmp_MergeSectorSegments[v1 + pos - oldPos + 2];
    tmp1.start := lLines[v2].start;
    tmp1._end := lLines[v1]._end;
    tmp1.sector := lLines[0].sector;
    tmp1.segment := 0;
    // -> Δεύτερο τμήμα του πρώτου segment:
    inc(tmp1);
    pL := @lLines[v1 + 1];
    for i := v1 + 1 to oldPos - 1 do
    begin
      tmp1^ := pL^;
      inc(tmp1);
      inc(pL);
    end;
    // Αντιγράφουμε στο tmp την υπόλοιπη λίστα
    tmp1 := @tmp_MergeSectorSegments[pos + 2];
    pL := @lLines[pos];
    for i := pos to oldLines - 1 do
    begin
      tmp1^ := pL^;
      inc(tmp1);
      inc(pL);
    end;
//--------------------------------
    // Τέλος αντιγράφουμε το tmp στο lLines
    ReallocMem1024(pointer(lLines), newLines * SizeOf(TDoomSectorLine));
    inc(v1);
    pL := @lLines[v1];
    tmp1 := @tmp_MergeSectorSegments[v1];
    for i := v1 to newLines - 1 do
    begin
      pL^ := tmp1^;
      inc(pL);
      inc(tmp1);
    end;
//--------------------------------
{    FreeMem(lLines, numLines * SizeOf(TDoomSectorLine));
    lLines := tmp;}

    numLines := newLines;
    // Αναδρομική κλήση ->
    MergeSectorSegments(lVertexes, lLines, numLines);
  end;
end;

procedure ReadTextureData(FileName: TFileName; var lTexturesInfo: PDoomTexturesInfo;
  var typ: TIDSoftWADType; var numTextures{$IFNDEF NO_DOOMTHINGS}, numSprites{$ENDIF}: integer);
var
  f: TFileStream;
  global_i, l, count: integer;
  ti: PDoomTextureInfo;
  d1, d2, d3: TDoomDirEntry;
  texofs: integer;  // offset in the wad file to the texture data
  result1, result2, result3: boolean;
  dmChr: TDoomCharArray;
{$IFNDEF NO_DOOMTHINGS}
  SpritesStart: integer;
{$ENDIF}

  function AddNumTextures(var inf: TDoomDirEntry): boolean;
  // Απλά υπολογίζει τον αριθμό των textures που αντιστοιχούν στο entry tEntry
  // Στην παράμετρο di επιστρέφει πληροφορίες για το tEntry
  // (di.Name = tEntry, σε περίπτωση που βρούμε το tEntry)
  var
    numTex: integer;
    local_i: integer;
  begin
    Result := False;
    f.Seek(l, soFromBeginning);
    local_i := 0;
    // Ψάχνουμε για το Entry με τα Textures
    repeat
      inc(local_i);
      f.Read(inf, SizeOf(inf));
      if isDoomMap(inf) then
      begin
        inc(local_i, 10);
        f.seek(SizeOf(inf) * 10, soFromCurrent)
      end
      else if DoomEntryNamesEqual(dmChr, inf.Name) then // Βρέθηκε!
      begin
        Result := True;
        f.Seek(inf.position, soFromBeginning);
        // Διαβάζουμε τον αριθμό των Textures
        f.Read(numTex, 4);
        // Προσθέτουμε τον αριθμό των Textures στο numTextures
        numTextures := numTextures + numTex;
      end;
    until (local_i >= count) or Result;
  end;

  procedure AddTextureInfoInList(inf: PDoomDirEntry);
  var
    numTex: integer;
    n: integer;
    offSets: PIntegerArray;
    offn: integer;
    doSeek: boolean;
    flds: smallint;
  begin
    f.Seek(inf.position, soFromBeginning);
    f.Read(numTex, 4); // Διαβάζουμε τον αριθμό των Textures

    if numTex = 0 then Exit; // !!!

    GetMem(pointer(offSets), numTex * sizeof(integer));
    f.Read(offsets^, numTex * sizeof(integer));

    if (typ in [idStrife, idUnKnown]) and (numTex > 1) then
    begin
      f.Seek(inf.Position + Offsets[0] + 16, soFrombeginning);
      f.Read(flds, 2);
      if offsets[1] - offsets[0] = 18 + flds * 6 then
      begin
        f.Seek(inf.Position + Offsets[0] + 20, soFrombeginning);
        f.Read(flds, 2);
        doSeek := offsets[1] - offsets[0] = 20 + flds * 8;
        if not doSeek then
          typ := idStrife2;
      end
      else
        doSeek := True;
    end
    else
      doSeek := typ <> idStrife2;

    n := 0;
    if doSeek then
    begin
      repeat
        ti := @lTexturesInfo[global_i];
        offn := offSets[n];
        texofs := inf.Position + offn;
        f.Seek(texofs, soFromBeginning);
        f.Read(ti.Name, 8);
        ti.texofs := texofs;
        f.Seek(texofs + 12, soFrombeginning);
        f.Read(ti.dimentions, 4);
        f.Seek(texofs + 20, soFrombeginning);
        f.Read(ti.fields, 2);
        inc(global_i);
        inc(n);
      until (n = numTex);
    end
    else
    begin
      repeat
        ti := @lTexturesInfo[global_i];
        offn := offSets[n];
        texofs := inf.Position + offn;
        f.Seek(texofs, soFromBeginning);
        f.Read(ti.Name, 8);
        ti.texofs := texofs;
        f.Seek(texofs + 12, soFrombeginning);
        f.Read(ti.dimentions, 4);
        f.Read(ti.fields, 2);
        inc(global_i);
        inc(n);
      until (n = numTex);
    end;
    FreeMem(pointer(offSets), numTex * sizeof(integer));
  end;

{$IFNDEF NO_DOOMTHINGS}
  function AddNumSprites: boolean;
  // Απλά υπολογίζει τον αριθμό των textures που αντιστοιχούν στο entry tEntry
  // Στην παράμετρο di επιστρέφει πληροφορίες για το tEntry
  // (di.Name = tEntry, σε περίπτωση που βρούμε το tEntry)
  var
    local_i: integer;
    found: boolean;
    inf: TDoomDirEntry;
    DEntryName: string;
  begin
    found := False;
    Result := False;
    f.Seek(l, soFromBeginning);
    local_i := 0;
    // Ψάχνουμε για το Entry με τα Textures
    repeat
      inc(local_i);
      f.Read(inf, SizeOf(inf));
      if isDoomMap(inf) then
      begin
        inc(local_i, 10);
        f.seek(SizeOf(inf) * 10, soFromCurrent)
      end
      else
      begin
        DEntryName := DoomEntryName(inf);
        if (DEntryName = rsS_START) or (DEntryName = rsSS_START) then
          found := True
        else if (DEntryName = rsS_END) or (DEntryName = rsSS_END) then
          Result := True
        else if found then
          inc(numTextures);
      end;
    until (local_i=count) or Result;
  end;

  procedure AddSpriteInfoInList;
  var
    local_i: integer;
    found: boolean;
    done: boolean;
    inf: TDoomDirEntry;
    oldPos: integer;
    sd: TSpDim;
    ti: PDoomTextureInfo;
    DEntryName: string;
  begin
    found := False;
    done := False;
    f.Seek(l, soFromBeginning);
    local_i := SpritesStart;
    // Ψάχνουμε για το Entry με τα Textures
    repeat
      f.Read(inf, SizeOf(inf));
      if isDoomMap(inf) then
      begin
        inc(local_i, 10);
        f.seek(SizeOf(inf) * 10, soFromCurrent)
      end
      else
      begin
        DEntryName := DoomEntryName(inf.Name);
        if (DEntryName = rsS_START) or (DEntryName = rsSS_START) then
          found := True
        else if (DEntryName = rsS_END) or (DEntryName = rsSS_END) then
          done := True
        else if found then
        begin
          if inf.Name[6] in ['1','2','3','4','5','6','7','8','9','0'] then // Valid Sprite name
          begin
            oldPos := f.Position;
            f.Seek(inf.position, soFromBeginning);
            f.Read(sd, SizeOf(sd));
            ti := @lTexturesInfo[global_i];
            ti.Name := inf.Name;
            ti.dimentions := sd.dimentions;
            ti.fields := 0;
            ti.texofs := sd.offsets;
            inc(global_i);
            f.Seek(oldPos, soFromBeginning);
          end;
        end;
      end;
      inc(local_i);
    until (local_i = count) or done;
  end;
{$ENDIF}

begin
  numTextures := 0;
  lTexturesInfo := nil;
  f := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    f.Seek(4, soFromBeginning);
    f.Read(count, SizeOf(count));
    f.Read(l, SizeOf(l));
    // Προσθέτουμε τον αριθμό των textures για κάθε entry
    dmChr := DoomStringName(rsTexture1);
    result1 := AddNumTextures(d1);
    dmChr := DoomStringName(rsTexture2);
    result2 := AddNumTextures(d2);
    if typ = idDoom then
      result3 := False
    else
    begin
      dmChr := DoomStringName(rsTexture3);
      result3 := AddNumTextures(d3);
    end;
    GetMem(pointer(lTexturesInfo), numTextures * SizeOf(TDoomTextureInfo));
    global_i := 0;
    // Διαβάζουμε τα data και τα τοποθετούμε στην λίστα
    if result1 then
      AddTextureInfoInList(@d1);
    if result2 then
      AddTextureInfoInList(@d2);
    if result3 then
      AddTextureInfoInList(@d3);
{$IFNDEF NO_DOOMTHINGS}
    SpritesStart := numTextures;
    if AddNumSprites then
    begin
      ReallocMem1024(pointer(lTexturesInfo), numTextures * SizeOf(TDoomTextureInfo));
      AddSpriteInfoInList;
      numSprites := numTextures - SpritesStart;
    end
    else
      numSprites := 0;
{$ENDIF}
  finally
    f.Free;
  end;
end;

procedure ClearTextureData(
  var lTexturesInfo: PDoomTexturesInfo; numTextures: integer);
begin
  FreeMem(pointer(lTexturesInfo));
end;

procedure MakeUpCaseTexturesInfo(
  const lTexturesInfo: PDoomTexturesInfo;
  const numTextures: Integer);
var
  i, j: integer;
  zero: boolean;
  ptex: PDoomTextureInfo;
  pC: PChar;
begin
  ptex := @lTexturesInfo[0];
  for i := 0 to numTextures - 1 do
  begin
    zero := False;
    pC := @ptex.Name;
    for j := 1 to 8 do
    begin
      if zero then
        pC^ := #0
      else if pC^ = #0 then
        zero := True
      else
        pC^ := UpCase(pC^);
      inc(pC);
    end;

    inc(ptex);
  end;
end;

procedure MakeUpCaseMapData(
  const lSideDefs: PDoomSideDefs;
  const numSideDefs: integer;
  const lSectors: PDoomSectors;
  const numSectors: integer);
var
  i, j: integer;
  zero: boolean;
  pls: PDoomSideDef;
  psec: PDoomSector;
  pC: PChar;
begin
  pls := @lSideDefs[0];
  for i := 0 to numSideDefs - 1 do
  begin

    zero := False;
    pC := @pls.tex1;
    for j := 1 to 8 do
    begin
      if zero then
        pC^ := #0
      else if pC^ = #0 then
        zero := True
      else
        pC^ := UpCase(pC^);
      inc(pC);
    end;

    zero := False;
    pC := @pls.tex2;
    for j := 1 to 8 do
    begin
      if zero then
        pC^ := #0
      else if pC^ = #0 then
        zero := True
      else
        pC^ := UpCase(pC^);
      inc(pC);
    end;

    zero := False;
    pC := @pls.tex3;
    for j := 1 to 8 do
    begin
      if zero then
        pC^ := #0
      else if pC^ = #0 then
        zero := True
      else
        pC^ := UpCase(pC^);
      inc(pC);
    end;

    inc(pls);
  end;

  psec := @lSectors[0];
  for i := 0 to numSectors - 1 do
  begin
    zero := False;
    pC := @psec.floort;
    for j := 1 to 8 do
    begin
      if zero then
        pC^ := #0
      else if pC^ = #0 then
        zero := True
      else
        pC^ := UpCase(pC^);
      inc(pC);
    end;

    zero := False;
    pC := @psec.ceilt;
    for j := 1 to 8 do
    begin
      if zero then
        pC^ := #0
      else if pC^ = #0 then
        zero := True
      else
        pC^ := UpCase(pC^);
      inc(pC);
    end;

    inc(psec);
  end;
end;

procedure ReadMapData(FileName: TFileName; MapName: string;
  var lThings: PDoomThings;
  var numThings: integer;
  var lLineDefs: PDoomLineDefs;
  var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs;
  var numSideDefs: integer;
  var lVertexes: PDoomVertexes;
  var numVertexes: integer;
  var lSegs: PDoomSegs;
  var numSegs: integer;
  var lSubSectors: PDoomSubSectors;
  var numSubSectors: integer;
  var lSectors: PDoomSectors;
  var numSectors: integer;
  forceType: TIDSoftWADType = idUnknown);
{ Διαβάζει από τον χάρτη MapName του αρχείου FileName
  όλα τα "χρήσιμα αντικείμενα" }
var
  f: TFileStream;
  i, j, l, count: integer;
  d: TDoomDirEntry;
  hLineDefs: PHexenLineDefs;
  hThings: PHexenThings;
  wadType: TIDSoftWADType;
  ld: PDoomLineDef;
  hld: PHexenLineDef;
  dt: PDoomThing;
  ht: PHexenThing;
  map: TDoomCharArray;

  function GetEntriesInList(var l: Pointer; Entry: string; Size: integer): integer;
  { Τοποθετεί στην λίστα l τα Entries του Entry σαν πίνακα με μέγεθος στοιχείου Size}
  var
    oldPos: integer; // Παλαιά θέση στο αρχείο WAD
    dTmp: TDoomDirEntry; // Βοηθητική μεταβλητή για ανάγνωση δεδομένων
  begin
    // Κρατάμε την παλιά θέση του αρχείου
    oldPos := f.Position;
    // Διαβάζουμε από το αρχείο μέχρι να βρούμε το Entry που μας ενδιαφέρει
    // Προσοχή: Δεν κάνουμε έλεγχο αν το Entry δεν υπάρχει
    repeat
      f.Read(dTmp, SizeOf(dTmp));
    until DoomEntryName(dTmp.Name) = Entry;
    // Αφού βρεθεί το Entry, βρίσκουμε την θέση του στο αρχείο
    f.Seek(dTmp.position, soFromBeginning);
    // Δεσμεύουμε την αντίστοιχη μνήμη στην λίστα l
    GetMem(pointer(l), dTmp.size);
    // Διαβάζουμε την λίστα από τον δίσκο
    f.Read(l^, dTmp.size);
    // Επιστρεφόμενη τιμή είναι ο αριθμός των records που διαβάσαμε.
    Result := dTmp.size div Size;
    // Τέλος, πηγαίνουμε στην παλαιά θέση του αρχείου
    f.Seek(oldPos, soFromBeginning);
  end;

begin
  if forceType in [idUnknown, idInvalid, idVJ] then
    wadType := GetWadType(FileName)
  else
    wadType := forceType;
  MapName := UpperCase(MapName);
  map := DoomStringName(MapName);
  f := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    f.Seek(4, soFromBeginning);
    f.Read(count, SizeOf(count));
    f.Read(l, SizeOf(l));
    f.Seek(l, soFromBeginning);
    { Ψάχνουμε για τον χάρτη }
    i := 0;
    repeat
      inc(i);
      f.Read(d, SizeOf(d));
    until DoomEntryNamesEqual(d.Name, map) or (i = count);
    // Αν i = count έχουμε φτάσει στο τέλος του directory & ο χάρτης δεν βρέθηκε
    if i = count then
      raise Exception.Create(Format(rsFmtMapNotFound, [MapName, FileName]))
    else
    begin
      if wadType in [idDoom, idHeretic, idStrife, idStrife2, idUnknown] then
      begin
        numThings :=
          GetEntriesInList(pointer(lThings), rsThings, SizeOf(TDoomThing));
        numLineDefs :=
          GetEntriesInList(pointer(lLineDefs), rsLineDefs, SizeOf(TDoomLineDef));
      end
      else if wadType in [idHexen, idNew] then
      begin
        numThings :=
          GetEntriesInList(pointer(hThings), rsThings, SizeOf(THexenThing));
        GetMem(pointer(lThings), numThings * SizeOf(TDoomThing));
        dt := @lThings[0];
        ht := @hThings[0];
        for j := 0 to numThings - 1 do
        begin
{          dt.xpos := ht.xpos;
          dt.ypos := ht.ypos;
          dt.angle := ht.angle;
          dt._type := ht._type;}
          dt.xpos_ypos := ht.xpos_ypos;
          dt.angle_type := ht.angle_type;
          dt.when := ht.when;
          inc(dt);
          inc(ht);
        end;
        FreeMem(pointer(hThings));

        numLineDefs :=
          GetEntriesInList(pointer(hLineDefs), rsLineDefs, SizeOf(THexenLineDef));
        GetMem(pointer(lLineDefs), numLineDefs * SizeOf(TDoomLineDef));
        ld := @lLineDefs[0];
        hld := @hLineDefs[0];
        for j := 0 to numLineDefs - 1 do
        begin
{          ld.start := hld.start;
          ld._end := hld._end;
          ld.flags := hld.flags;
          ld._type := hld._type;
          ld.tag := hld.tag;
          ld.sidedef1 := hld.sidedef1;
          ld.sidedef2 := hld.sidedef2;}
          ld.start_end := hld.start_end;
          ld.flags := hld.flags;
          ld.type_tag := hld.type_tag;
          ld.sidedefs := hld.sidedefs;

          inc(ld);
          inc(hld);
        end;
        FreeMem(pointer(hLineDefs));
      end;
      numSideDefs :=
        GetEntriesInList(pointer(lSideDefs), rsSideDefs, SizeOf(TDoomSideDef));
      numVertexes :=
        GetEntriesInList(pointer(lVertexes), rsVertexes, SizeOf(TDoomVertex));
      numSegs :=
        GetEntriesInList(pointer(lSegs), rsSegs, SizeOf(TDoomSeg));
      numSubSectors :=
        GetEntriesInList(pointer(lSubSectors), rsSubSectors, SizeOf(TDoomSubSector));
      numSectors :=
        GetEntriesInList(pointer(lSectors), rsSectors, SizeOf(TDoomSector));
    end;
    MakeUpCaseMapData(lSideDefs, numSideDefs, lSectors, numSectors);
  finally
    f.Free;
  end;
end;

procedure ReadMapData(FileName: TFileName; MapName: string;
  var lThings: PDoomThings;
  var numThings: integer;
  var lLineDefs: PDoomLineDefs;
  var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs;
  var numSideDefs: integer;
  var lVertexes: PDoomVertexes;
  var numVertexes: integer;
  var lSectors: PDoomSectors;
  var numSectors: integer;
  forceType: TIDSoftWADType = idUnknown);
{ Διαβάζει από τον χάρτη MapName του αρχείου FileName
  όλα τα "χρήσιμα αντικείμενα" }
var f: TFileStream;
    i, j, l, count: integer;
    d: TDoomDirEntry;
    hLineDefs: PHexenLineDefs;
    hThings: PHexenThings;
    wadType: TIDSoftWADType;
    ld: PDoomLineDef;
    hld: PHexenLineDef;
    dt: PDoomThing;
    ht: PHexenThing;
    map: TDoomCharArray;

    function GetEntriesInList(var l: Pointer; Entry: string; Size: integer): integer;
    { Τοποθετεί στην λίστα l τα Entries του Entry σαν πίνακα με μέγεθος στοιχείου Size}
    var oldPos: integer; // Παλαιά θέση στο αρχείο WAD
        dTmp: TDoomDirEntry; // Βοηθητική μεταβλητή για ανάγνωση δεδομένων
    begin
      // Κρατάμε την παλιά θέση του αρχείου
      oldPos := f.Position;
      // Διαβάζουμε από το αρχείο μέχρι να βρούμε το Entry που μας ενδιαφέρει
      // Προσοχή: Δεν κάνουμε έλεγχο αν το Entry δεν υπάρχει
      repeat
        f.Read(dTmp, SizeOf(dTmp));
      until DoomEntryName(dTmp.Name) = Entry;
      // Αφού βρεθεί το Entry, βρίσκουμε την θέση του στο αρχείο
      f.Seek(dTmp.position, soFromBeginning);
      // Δεσμεύουμε την αντίστοιχη μνήμη στην λίστα l
      GetMem(pointer(l), dTmp.size);
      // Διαβάζουμε την λίστα από τον δίσκο
      f.Read(l^, dTmp.size);
      // Επιστρεφόμενη τιμή είναι ο αριθμός των records που διαβάσαμε.
      Result := dTmp.size div Size;
      // Τέλος, πηγαίνουμε στην παλαιά θέση του αρχείου
      f.Seek(oldPos, soFromBeginning);
    end;

begin
  if forceType in [idUnknown, idInvalid, idVJ] then
    wadType := GetWadType(FileName)
  else
    wadType := forceType;
  MapName := UpperCase(MapName);
  map := DoomStringName(MapName);
  f := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    f.Seek(4, soFromBeginning);
    f.Read(count, SizeOf(count));
    f.Read(l, SizeOf(l));
    f.Seek(l, soFromBeginning);
    { Ψάχνουμε για τον χάρτη }
    i := 0;
    repeat
      inc(i);
      f.Read(d, SizeOf(d));
    until DoomEntryNamesEqual(d.Name, map) or (i = count);
    // Αν i = count έχουμε φτάσει στο τέλος του directory & ο χάρτης δεν βρέθηκε
    if i = count then
      raise Exception.Create(Format(rsFmtMapNotFound, [MapName, FileName]))
    else
    begin
      if wadType in [idDoom, idHeretic, idStrife, idStrife2, idUnknown] then
      begin
        numThings :=
          GetEntriesInList(pointer(lThings), rsThings, SizeOf(TDoomThing));
        numLineDefs :=
          GetEntriesInList(pointer(lLineDefs), rsLineDefs, SizeOf(TDoomLineDef));
      end
      else if wadType in [idHexen, idNew] then
      begin
        numThings :=
          GetEntriesInList(pointer(hThings), rsThings, SizeOf(THexenThing));
        GetMem(pointer(lThings), numThings * SizeOf(TDoomThing));
        dt := @lThings[0];
        ht := @hThings[0];
        for j := 0 to numThings - 1 do
        begin
          dt.xpos_ypos := ht.xpos_ypos;
          dt.angle_type := ht.angle_type;
          dt.when := ht.when;
          inc(dt);
          inc(ht);
        end;
        FreeMem(pointer(hThings));

        numLineDefs :=
          GetEntriesInList(pointer(hLineDefs), rsLineDefs, SizeOf(THexenLineDef));
        GetMem(pointer(lLineDefs), numLineDefs * SizeOf(TDoomLineDef));
        ld := @lLineDefs[0];
        hld := @hLineDefs[0];
        for j := 0 to numLineDefs - 1 do
        begin
          ld.start_end := hld.start_end;
          ld.flags := hld.flags;
          ld.type_tag := hld.type_tag;
          ld.sidedefs := hld.sidedefs;

          inc(ld);
          inc(hld);
        end;
        FreeMem(pointer(hLineDefs));
      end;
      numSideDefs :=
        GetEntriesInList(pointer(lSideDefs), rsSideDefs, SizeOf(TDoomSideDef));
      numVertexes :=
        GetEntriesInList(pointer(lVertexes), rsVertexes, SizeOf(TDoomVertex));
      numSectors :=
        GetEntriesInList(pointer(lSectors), rsSectors, SizeOf(TDoomSector));
    end;
    MakeUpCaseMapData(lSideDefs, numSideDefs, lSectors, numSectors);
  finally
    f.Free;
  end;
end;

procedure ClearMapData(
  var lThings: PDoomThings;
  var numThings: integer;
  var lLineDefs: PDoomLineDefs;
  var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs;
  var numSideDefs: integer;
  var lVertexes: PDoomVertexes;
  var numVertexes: integer;
  var lSegs: PDoomSegs;
  var numSegs: integer;
  var lSubSectors: PDoomSubSectors;
  var numSubSectors: integer;
  var lSectors: PDoomSectors;
  var numSectors: integer);
begin
  FreeMem(pointer(lThings));
  FreeMem(pointer(lLineDefs));
  FreeMem(pointer(lSideDefs));
  FreeMem(pointer(lVertexes));
  FreeMem(pointer(lSegs));
  FreeMem(pointer(lSubSectors));
  FreeMem(pointer(lSectors));
end;

procedure ClearMapData(
  var lThings: PDoomThings;
  var numThings: integer;
  var lLineDefs: PDoomLineDefs;
  var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs;
  var numSideDefs: integer;
  var lVertexes: PDoomVertexes;
  var numVertexes: integer;
  var lSectors: PDoomSectors;
  var numSectors: integer);
begin
  FreeMem(pointer(lThings));
  FreeMem(pointer(lLineDefs));
  FreeMem(pointer(lSideDefs));
  FreeMem(pointer(lVertexes));
  FreeMem(pointer(lSectors));
end;

procedure GetSectorCenter(lVertexes: PDoomVertexes;
  lLineDefs: PDoomLineDefs; numLineDefs: TIntValue;
  lSideDefs: PDoomSideDefs; numSideDefs: TIntValue;
  lSectors: PDoomSectors; si: integer; var x, y: single);
// Επιστρέφει το κεντρικό σημείο του Sector si (x, y)
var i: integer;
    minX, minY, maxX, maxY: integer;
    v: PDoomVertex;
    vx, vy: integer;
    lLd: PDoomLineDef;
begin
  minX :=  32767;
  minY :=  32767;
  maxX := -32768;
  maxY := -32768;
  lLd := @lLineDefs[0];
  for i := 0 to numLineDefs - 1 do
  begin
    if lLd.sidedef1 <> - 1 then
    begin
      if lSideDefs[lLd.sidedef1].sector = si then
      begin
        v := @lVertexes[lLd.start];
        vx := v.x;
        vy := v.y;
        if vx > maxX then
          maxX := vx;
        if vy > maxY then
          maxY := vy;
        if vx < minX then
          minX := vx;
        if vy < minY then
          minY := vy;
        if vx > maxX then
          maxX := vx;
        if vy > maxY then
          maxY := vy;
        if vx < minX then
          minX := vx;
        if vy < minY then
          minY := vy;
      end
    end
    else if lLd.sidedef2 <> - 1 then
    begin
      if lSideDefs[lLd.sidedef2].sector = si then
      begin
        v := @lVertexes[lLd.start];
        vx := v.x;
        vy := v.y;
        if vx > maxX then
          maxX := vx;
        if vy > maxY then
          maxY := vy;
        if vx < minX then
          minX := vx;
        if vy < minY then
          minY := vy;
        if vx > maxX then
          maxX := vx;
        if vy > maxY then
          maxY := vy;
        if vx < minX then
          minX := vx;
        if vy < minY then
          minY := vy;
      end
    end;
    inc(lLd);
  end;
  x := (maxX + minX) / 2;
  y := (maxY + minY) / 2;
end;

procedure GetSubSectorCenter(
  lVertexes: PDoomVertexes;
  lSegs: PDoomSegs;
  lSubSectors: PDoomSubSectors; ss: integer; var x, y: single);
// Επιστρέφει το κεντρικό σημείο του SubSector ss (x, y)
var j: integer;
    minX, minY, maxX, maxY: integer;
    lseg: PDoomSeg;
    v1, v2: PDoomVertex;
    v1x, v1y, v2x, v2y: integer;
begin
  minX :=  32767;
  minY :=  32767;
  maxX := -32768;
  maxY := -32768;
  for j := 0 to lSubSectors[ss].numsegs - 1 do
  begin
    lseg := @lSegs[lSubSectors[ss].firstseg + j];
    v1 := @lVertexes[lseg.v1];
    v2 := @lVertexes[lseg.v2];
    v1x := v1.x;
    v1y := v1.y;
    v2x := v2.x;
    v2y := v2.y;
    if v1x > maxX then
      maxX := v1x;
    if v2x > maxX then
      maxX := v2x;
    if v1y > maxY then
      maxY := v1y;
    if v2y > maxY then
      maxY := v2y;
    if v1x < minX then
      minX := v1x;
    if v2x < minX then
      minX := v2x;
    if v1y < minY then
      minY := v1y;
    if v2y < minY then
      minY := v2y;
  end;
  x := (maxX + minX) / 2;
  y := (maxY + minY) / 2;
end;

procedure GetSubSectorDimentions(
  lVertexes: PDoomVertexes;
  lSegs: PDoomSegs;
  lSubSectors: PDoomSubSectors; ss: integer; var dx, dy: integer);
// Επιστρέφει τις διαστάσεις του SubSector ss
var j: integer;
    minX, minY, maxX, maxY: integer;
    lseg: PDoomSeg;
    v1, v2: PDoomVertex;
    v1x, v1y, v2x, v2y: integer;
begin
  minX :=  32767;
  minY :=  32767;
  maxX := -32768;
  maxY := -32768;
  for j := 0 to lSubSectors[ss].numsegs - 1 do
  begin
    lseg := @lSegs[lSubSectors[ss].firstseg + j];
    v1 := @lVertexes[lseg.v1];
    v2 := @lVertexes[lseg.v2];
    v1x := v1.x;
    v1y := v1.y;
    v2x := v2.x;
    v2y := v2.y;
    if v1x > maxX then
      maxX := v1x;
    if v2x > maxX then
      maxX := v2x;
    if v1y > maxY then
      maxY := v1y;
    if v2y > maxY then
      maxY := v2y;
    if v1x < minX then
      minX := v1x;
    if v2x < minX then
      minX := v2x;
    if v1y < minY then
      minY := v1y;
    if v2y < minY then
      minY := v2y;
  end;
  dx := (maxX - minX);
  dy := (maxY - minY);
end;

procedure QuickSortDoomThings(hThings: PDoomThings; const numThings: Integer);

  procedure QuickSort(L: integer; const R: integer); register;
  var
    I, J: Integer;
    P: smallint;
    T: TDoomThing;
  begin
    I := L;
    repeat
      J := R;
      P := hThings[(I + J) shr 1]._type;
      repeat
        while (hThings[I]._type - P) < 0 do
          Inc(I);
        while (hThings[J]._type - P) > 0 do
          Dec(J);
        if I <= J then
        begin
          T := hThings[I];
          hThings[I] := hThings[J];
          hThings[J] := T;
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
  if numThings > 1 then
    QuickSort(0, numThings - 1);
end;

function DChrCompare(const d1, d2: TDoomCharArray): integer;
begin
  Result := PDoomCharArray2Integers(@d1)[0] - PDoomCharArray2Integers(@d2)[0];
  if Result = 0 then
    Result := PDoomCharArray2Integers(@d1)[1] - PDoomCharArray2Integers(@d2)[1];
end;

////////////////////////////////////////////////////////////////////////////////

procedure QuickSortDoomDirectory(DIR: PDoomDirectory; const numEntries: Integer);

  procedure QuickSort(L: integer; const R: integer); register;
  var
    I, J: Integer;
    P: TDoomCharArray;
    T: TDoomDirEntry;
  begin
    I := L;
    repeat
      J := R;
      P := DIR[(I + J) shr 1].Name;
      repeat
        while DChrCompare(DIR[I].Name, P) < 0 do
          Inc(I);
        while DChrCompare(DIR[J].Name, P) > 0 do
          Dec(J);
        if I <= J then
        begin
          T := DIR[I];
          DIR[I] := DIR[J];
          DIR[J] := T;
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
  if numEntries > 1 then
    QuickSort(0, numEntries - 1);
end;

function SearchSortedDoomDirectory(DIR: PDoomDirectory; const numEntries: Integer; const EntryName: TDoomCharArray): integer;
var
  L, H, I, C: Integer;
begin
  L := 0;
  H := numEntries - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := DChrCompare(DIR[I].Name, EntryName);
    if C < 0 then
      L := I + 1
    else
    begin
      if C = 0 then
      begin
        Result := I;
        Exit;
      end;
      H := I - 1;
    end;
  end;
  Result := -1;
end;

function GetSortedDoomDirectoryEntries(DIR: PDoomDirectory; const numEntries: Integer;
  const EntryPrefix: string; var Entries: TDXStringList): integer;
var
  L, H, I, C: Integer;
  len, prefix: integer;
  EntryPrefixCH: TDoomCharArray;
begin
  len := Length(EntryPrefix);
  if len > 4 then
    len := 4;

  for I := 1 to len do
    EntryPrefixCH[I] := UpCase(EntryPrefix[I]);
  for i := len + 1 to 8 do
    EntryPrefixCH[I] := #0;

  L := 0;
  H := numEntries - 1;

  prefix := PDoomCharArray2Integers(@EntryPrefixCH)[0];

  if Entries = nil then
    Entries := TDXStringList.Create;

  Result := -1;
  I := -1;
  while (L <= H) and (Result = -1) do
  begin
    I := (L + H) shr 1;
    C := PDoomCharArray2Integers(@DIR[I].Name)[0] - prefix;
    if C < 0 then
      L := I + 1
    else
    begin
      if C = 0 then
      begin
        Result := I;
      end;
      H := I - 1;
    end;
  end;

  if Result <> -1 then
  begin
    while (I >= 0) and (PDoomCharArray2Integers(@DIR[I].Name)[0] = prefix) do
    begin
      Entries.Add(DoomEntryName(DIR[I].Name));
      dec(i);
    end;
    I := Result + 1;
    while (I < numEntries) and (PDoomCharArray2Integers(@DIR[I].Name)[0] = prefix) do
    begin
      Entries.Add(DoomEntryName(DIR[I].Name));
      inc(i);
    end;
  end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure QuickSortTexturesInfo(const lTexturesInfo: PDoomTexturesInfo;
  const numTextures: Integer);

  procedure QuickSort(L: integer; const R: integer); register;
  var
    I, J: Integer;
    P: TDoomCharArray;
    T: TDoomTextureInfo;
  begin
    I := L;
    repeat
      J := R;
      P := lTexturesInfo[(I + J) shr 1].Name;
      repeat
        while DChrCompare(lTexturesInfo[I].Name, P) < 0 do
          Inc(I);
        while DChrCompare(lTexturesInfo[J].Name, P) > 0 do
          Dec(J);
        if I <= J then
        begin
          T := lTexturesInfo[I];
          lTexturesInfo[I] := lTexturesInfo[J];
          lTexturesInfo[J] := T;
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
  MakeUpCaseTexturesInfo(lTexturesInfo, numTextures);
  if numTextures > 1 then
    QuickSort(0, numTextures - 1);
end;

function SearchSortedTexturesInfo(const lTexturesInfo: PDoomTexturesInfo;
  const numTextures: Integer; const EntryName: TDoomCharArray): integer;
var
  L, H, I, C: Integer;
begin
  L := 0;
  H := numTextures - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := DChrCompare(lTexturesInfo[I].Name, EntryName);
    if C < 0 then
      L := I + 1
    else
    begin
      if C = 0 then
      begin
        Result := I;
        Exit;
      end;
      H := I - 1;
    end;
  end;
  Result := -1;
end;

////////////////////////////////////////////////////////////////////////////////

procedure QuickSortVertexesAngles(lVertexes: PDoomVertexes;
  const numVertexes: Integer; const cx, cy: single);
var V: TDoomVertex;

  procedure QuickSort(left, right: integer); register;
  var l, r: integer;
      lvl: PDoomVertex;
  begin
    if right > left then
    begin
      l := left;
      lvl := @lVertexes[left];
      r := right;
      while l < r do
      begin
        while GetAngle(cx, cy, lVertexes[r]) < GetAngle(cx, cy, lvl^) do dec(r);
        while (GetAngle(cx, cy, lVertexes[l]) >= GetAngle(cx, cy, lvl^)) and (l < r) do inc(l);
        if l < r then
        begin
          V := lVertexes[l];
          lVertexes[l] := lVertexes[r];
          lVertexes[r] := V;
        end;
      end;
      V := lvl^;
      lvl^ := lVertexes[r];
      lVertexes[r] := V;
      QuickSort(left, r - 1);
      QuickSort(r + 1, right)
    end
  end;

begin
  if numVertexes > 1 then
    QuickSort(0, numVertexes - 1);
end;

function RemoveNullVertexes(
  var lLines: PDoomSectorLines; var numLines: integer): boolean;
var i, j: integer;
    num1: integer;
    ll: PDoomSectorLine;
{    tmp1: PDoomSectorLines;}
begin
  Result := False;
  if numLines > 3 then
  begin
    num1 := numLines;
    ll := @lLines[num1 - 1];
    for i := num1 - 1 downto 0 do
    begin
      if ll.start = ll._end then
      begin
        for j := i + 1 to num1 - 1 do
          lLines[j - 1] := lLines[j];
        dec(numLines);
      end;
      dec(ll);
    end;

    if num1 <> numLines then
    begin
      Result := True;
      ReallocMem(pointer(lLines), numLines * SizeOf(TDoomSectorLine));
{      GetMem(pointer(tmp1), numLines * SizeOf(TDoomSectorLine));
      for i := 0 to numLines - 1 do
        tmp1[i] := lLines[i];
      FreeMem(pointer(lLines), num1 * SizeOf(TDoomSectorLine));
      GetMem(pointer(lLines), numLines * SizeOf(TDoomSectorLine));
      for i := 0 to numLines - 1 do
        lLines[i] := tmp1[i];
      FreeMem(pointer(tmp1), numLines * SizeOf(TDoomSectorLine));}
    end;
  end;
end;

var SegLines: array[0..$FFF] of integer;

function RemoveIconicSegments(
  var lLines: PDoomSectorLines; var numLines: integer): boolean;
var numSegs: integer;
    i, j: integer;
    tmp: PDoomSectorLines;
begin
  Result := False;
  numSegs := lLines[numLines - 1].segment;
  if lLines[0].segment <> numSegs then
  begin
    for i := 0 to numSegs do
      SegLines[i] := 0;
    for i := 0 to numLines - 1 do
      inc(SegLines[lLines[i].segment]);

    j := numLines;
    for i := 0 to numSegs do
    begin
      if SegLines[i] = 1 then
      begin
        Result := True;
        dec(j);
      end;
    end;

    if Result and (j > 1) then
    begin
      GetMem(tmp, j * SizeOf(TDoomSectorLine));
      j := 0;
      for i := 0 to numLines - 1 do
      begin
        if SegLines[lLines[i].segment] > 1 then
        begin
          tmp[j] := lLines[i];
          if j = 0 then
            tmp[j].segment := 0
          else
          begin
            if lLines[i - 1].segment <> lLines[i].segment then
              tmp[j].segment := tmp[j - 1].segment + 1
            else
              tmp[j].segment := tmp[j - 1].segment
          end;
          inc(j);
        end
      end;
      FreeMem(lLines, numLines * SizeOf(TDoomSectorLine));
      numLines := j;
      lLines := tmp;
    end;
  end
  else
    Result := False;
end;

function ReduceSectorComplexity(
  lVertexes: PDoomVertexes;
  var lLines: PDoomSectorLines; var numLines: integer; tolerance: single = DEFTOLERANCE): boolean;
{ Όσες συνεχόμενες γραμμές του sector έχουν γωνία 180 μοίρες διαγράφονται }
{ Πρέπει το sector να είναι συνεχόμενο! }
var i: integer;
    angle: single;
    tmp1: PDoomSectorLines;
    lLi: PDoomSectorLine;
    lLn: PDoomSectorLine;
    num1: integer;
    lLiStart, lLiEnd: integer;
begin
  Result := False;
  if numLines > 3 then
  begin
    lLi := @lLines[0];
    for i := 0 to numLines - 1 do
    begin
      lLiStart := lLi.start;
      lLiEnd := lLi._end;
      angle := GetAngle(
        lVertexes[lLines[(i + numLines - 1) mod numLines].start],
        lVertexes[lLiStart],
        lVertexes[lLiEnd]);
      // Αν η γωνία είναι = pi τότε ενώνουμε τις γραμμές!
      if abs(angle - g_PI) <= tolerance then
        lLi.segment := -1 // Βάζουμε εικονική τιμή στο segment!
      else if lLiStart = lLiEnd then
        lLi.segment := -1; // Βάζουμε εικονική τιμή στο segment!
      inc(lLi);
    end;
    num1 := 0;
    GetMem(pointer(tmp1), numLines * SizeOf(TDoomSectorLine));
    lLi := @lLines[0];
    lLn := @lLines[numLines];
    repeat
      if lLi.segment >= 0 then
      begin
        tmp1[num1] := lLi^;
        if num1 > 0 then
          tmp1[num1 - 1]._End := lLi.start;
        inc(num1);
      end;
      inc(lLi);
    until lLi = lLn;
    // Close the sector
    tmp1[num1 - 1]._End := tmp1[0].start;

    Result := num1 <> numLines;
    if Result then
    begin
      FreeMem(pointer(lLines));
      ReallocMem(pointer(tmp1), num1 * SizeOf(TDoomSectorLine));
      lLines := tmp1;
{      GetMem(pointer(lLines), num1 * SizeOf(TDoomSectorLine));
      for i := 0 to num1 - 1 do
        lLines[i] := tmp1[i];}
      numLines := num1;
    end
    else
      FreeMem(pointer(tmp1));

{    if Result then
    begin
      FreeMem(pointer(lLines), numLines * SizeOf(TDoomSectorLine));
      GetMem(pointer(lLines), num1 * SizeOf(TDoomSectorLine));
      for i := 0 to num1 - 1 do
        lLines[i] := tmp1[i];
      numLines := num1;
    end;
    FreeMem(pointer(tmp1), numLines * SizeOf(TDoomSectorLine));}
  end;
end;

function SplitSectorConvexity(
  lVertexes: PDoomVertexes;
  lLines: PDoomSectorLines; numLines: integer;
  var hollow: PDoomSectorLinesArray): boolean;
{ Κάνει διάσπαση των κυτρών sectors, επιστρέφει False αν δεν κάνει διάσπαση }
{ Κυρτός sector: έχει γωνίες ανάμεσα σε συνεχόμενες γραμμές > 180 μοιρών }
var i, i_mod, j, pos: integer;
    angle: single;
    tmp1: PDoomSectorLines;
    tmpl: PDoomSectorLine;
    lLi: PDoomSectorLine;
    lLj: PDoomSectorLine;
    num1: integer;
    min, dist: integer;
    nSectors: integer;
    hsl: PDoomSectorLine;
    si, sj: TIntValue;

    procedure ReduceTmp1; /////////////// ?????
    var i, j: integer;
        tmpr: PDoomSectorLine;
    begin
      tmpr := @tmp1[0];
      for i := 0 to num1 - 1 do
      begin
        if tmpr.start = tmpr._end then
        begin
          for j := i to num1 - 2 do
            tmp1[j] := tmp1[j + 1];
          dec(num1);
        end;
        inc(tmpr);
      end;
    end;

begin
  Result := False;
{ Αν το sector που ορίζουν τα lLines έχει 3 γραμμές τότε είναι κυρτός }
  if (numLines = 3) and (lLines[1].start <> lLines[1]._End) then
  begin
    GetMem(pointer(hollow.Sectors[hollow.NumSectors]), 3 * SizeOf(TDoomSectorLine));
    nSectors := hollow.NumSectors;

    hsl := @hollow.Sectors[nSectors][0];
    lLi := @lLines[0];
    hsl^ := lLi^;

    inc(hsl);
    inc(lLi);
    hsl^ := lLi^;

    inc(hsl);
    inc(lLi);
    hsl^ := lLi^;

    hollow.NumSectorsLines[nSectors] := 3;
    inc(hollow.NumSectors);
  end
  else if numLines > 3 then
  begin
    lLi := @lLines[0];
    i := 0;
    repeat
      i_mod := (i + numLines - 1) mod numLines;
      angle := GetAngle(
        lVertexes[lLines[i_mod].start],
        lVertexes[lLi.start],
        lVertexes[lLi._End]);
      // Αν η γωνία είναι > pi τότε κάνουμε αλλαγές
      // Θα χωρίσουμε το sector
      if angle > g_PI then
      begin
        Result := True; // Το sector είναι κυρτό
        { Θα βρούμε το σημείο στο οποίο θα χωρίσουμε το sector,
          βρίσκουμε το κοντινότερο σημείο στην κορυφή της γωνίας}
        min := MaxInt;
        pos := 0; // Σημείο με την μικρότερη απόσταση
        for j := 0 to numLines - 1 do
          if (j <> i_mod) and
             (j <> i) and
             (j <> (i + 1) mod numlines) then // όχι στα σημεία που ορίζουν την γωνία
          begin
        { Υπολογισμός της απόστασης }
            si := lLi.start;
            sj := lLines[j].start;
            dist := GetVertexSqrDistance(lVertexes, si, sj);
            if dist < min then
            begin
            // Αν η απόσταση τείνει στο 0, δεν εξετάζουμε την γωνία
              if dist < g_EPSILON then
              begin
                min := dist;
                pos := j;
              end
              else if IsVertexInAngle(lVertexes[sj],
                                      lVertexes[lLines[i_mod].start],
                                      lVertexes[si],
                                      angle) then
              begin
                min := dist;
                pos := j; // Σημείο με την κοντινότερη απόσταση
              end;
            end;
          end;
        if min < MaxInt then // Αν βρέθηκε σημείο (διαφορετικά το sector είναι invalid!)
        begin
          // Δημιουργία του πρώτου τμήματος (πρώτος sector διαχωρισμού)
          GetMem(pointer(tmp1), numLines * SizeOf(TDoomSectorLine));
          tmpl := @tmp1[0];
          tmpl.start := lLi.start;
          tmpl._end := lLines[pos].start;
          tmpl.sector := lLines[0].sector;
          tmpl.segment := lLines[0].segment;
          if pos > i then
          begin
            lLj := @lLines[pos];
            for j := pos to numLines - 1 do
            begin
              inc(tmpl);
              tmpl^ := lLj^;
              inc(lLj);
            end;
            lLj := @lLines[0];
            for j := 0 to i - 1 do
            begin
              inc(tmpl);
              tmpl^ := lLj^;
              inc(lLj);
            end;

{            for j := pos to numLines - 1 do
              tmp1[j - pos + 1] := lLines[j];
            for j := 0 to i - 1 do
              tmp1[numLines - pos + j + 1] := lLines[j];}
            num1 := numLines - pos + i + 1;
          end
          else
          begin
            lLj := @lLines[pos];
            for j := pos to i - 1 do
            begin
              inc(tmpl);
              tmpl^ := lLj^;
              inc(lLj);
            end;
//              tmp1[j - pos + 1] := lLines[j];
            num1 := i - pos + 1
          end;
          ReduceTmp1; //////////////////////////////
          SplitSectorConvexity(
            lVertexes, tmp1, num1, hollow);
          // Δημιουργία του δεύτερου τμήματος (δεύτερος sector διαχωρισμού)
          tmpl := @tmp1[0];
          tmpl.start := lLines[pos].start;
          tmpl._end := lLi.start;
          if pos > i then
          begin
            lLj := lLi;
            for j := i to pos - 1 do
            begin
//              tmp1[j - i + 1] := lLines[j];
              inc(tmpl);
              tmpl^ := lLj^;
              inc(lLj);
            end;
            num1 := pos - i + 1;
          end
          else
          begin
            lLj := lLi;
            for j := i to numLines - 1 do
            begin
              inc(tmpl);
              tmpl^ := lLj^;
              inc(lLj);
            end;
            tmpl := @tmp1[numLines - i];
            lLj := @lLines[0];
            for j := 0 to pos - 1 do
            begin
              inc(tmpl);
              tmpl^ := lLj^;
              inc(lLj);
            end;
            num1 := numLines - i + pos + 1;
          end;
          ReduceTmp1; /////////////////////
          SplitSectorConvexity(
            lVertexes, tmp1, num1, hollow);
          FreeMem(pointer(tmp1));
        end; // if min < MaxInt
      end;
      inc(i);
      inc(lLi);
    until (i = numLines) or Result;
    // Τέλος αν το sector δεν ήταν κυρτό το προσθέτουμε στην λίστα hollow
    if not Result then
    begin
      nSectors := hollow.NumSectors;
      GetMem(pointer(hollow.Sectors[nSectors]), numLines * SizeOf(TDoomSectorLine));
      hsl := @hollow.Sectors[nSectors][0];
      lLi := @lLines[0];
      for i := 0 to numLines - 1 do
      begin
        hsl^ := lLi^;
        inc(hsl);
        inc(lLi);
      end;
      hollow.NumSectorsLines[nSectors] := numLines;
      inc(hollow.NumSectors);
    end;
  end;
end;

function GetSectorColor(light: byte; lFactor: Single = DEFDOOMIMPORTLFACTOR): TColor;
var l: byte;
begin
  l := round(255 * lFactor + light * (1 - lFactor));
  Result := RGB(l, l, l);
end;

function GetTheTextureName(AScene: TD3DScene; MainWAD: TFileName;
  TX: TDoomCharArray): string; overload;
var s: string;
begin
  s := DoomEntryName(TX);
  Result := GetWadLinkDescription(MainWAD, s);
  if AScene.Textures.IndexOf(Result) = -1 then
    Result := s + rsBMPExt;
end;

function GetTheTextureName(AScene: TD3DScene; MainWAD: TFileName;
  const TX: string): string; overload;
begin
  Result := GetWadLinkDescription(MainWAD, TX);
  if AScene.Textures.IndexOf(Result) = -1 then
    Result := TX + rsBMPExt;
end;

function GetDirIndexOfEntry(Entry: string; dir: PDoomDirectory;
  const numEntries: integer; start: integer = 0): integer;
var i: integer;
    Entry2: TDoomCharArray;
begin
  Entry2 := DoomStringName(UpperCase(Entry));

  if start < 0 then
    start := 0;
    
  for i := start to numEntries - 1 do
    if DoomEntryNamesEqual(Entry2, dir[i].Name) then
//    if {UpperCase}(DoomEntryName(dir[i])) = Entry then
    begin
      Result := i;
      Exit;
    end;
  Result := - 1;
end;

{$IFNDEF NO_DOOMTHINGS}
procedure GetDoomMapSprites(
    dir: PDoomDirectory; numEntries: integer;
    lThings: PDoomThings;
    numThings: integer; var TextureNames: TDXStringList); overload;
var local_i, i: integer;
    txName: string;
    ipos: integer;
    iStart, iEnd: integer;
    sTmp: string;
    TextureNames2: TDXStringList;
    wasEmpty: boolean;
    lastThing: integer;
    curThing: integer;
    pDIRi: PDoomDirEntry;
    checkid: integer;
//    tseq: string;
begin
  if TextureNames = nil then
  begin
    TextureNames := TDXStringList.Create;
    wasEmpty := True;
  end
  else
  begin
    TextureNames.Sorted := True;
    wasEmpty := TextureNames.Count = 0;
  end;

  TextureNames2 := TDXStringList.Create;
  try
    iStart := GetDirIndexOfEntry(rsS_START, dir, numEntries) + 1;
    iEnd := GetDirIndexOfEntry(rsS_END, dir, numEntries, iStart) - 1;

    QuickSortDoomThings(lThings, numThings);

    lastThing := -2147483647;

    if wasEmpty then
    begin

      for i := 0 to numThings - 1 do
      begin
        curThing := lThings[i]._type;
        if curThing <> lastThing then
        begin
          ipos := se_DoomThings.GetThingTextureSubFix(curThing, txName);
          if ipos > -1 then
          begin
//            tseq := 'ABCD'; se_DoomThings.GetThingTextureSequence(ipos);
            txName := UpperCase(txName);
            checkid := (Ord(txName[1])) or
                       (Ord(txName[2]) shl 8) or
                       (Ord(txName[3]) shl 16) or
                       (Ord(txName[4]) shl 24);
            pDIRi := @DIR[iStart];
            for local_i := iStart to iEnd do
            begin
              if pDIRi.intName1 = checkid then
//                if Pos(pDIRi.Name[5], tseq) > 0 then
                if pDIRi.Name[5] in ['A', 'B', 'C', 'D'] then
                  TextureNames2.Add(DoomEntryName(pDIRi.Name));
              inc(pDIRi);
            end;
          end;
          lastThing := curThing;
        end;
      end;

    end
    else
    begin

      for i := 0 to numThings - 1 do
      begin
        curThing := lThings[i]._type;
        if curThing <> lastThing then
        begin
          ipos := se_DoomThings.GetThingTextureSubFix(curThing, txName);
          if ipos > -1 then
          begin
//            tseq := 'ABCD'; // se_DoomThings.GetThingTextureSequence(ipos);
            txName := UpperCase(txName);
            checkid := (Ord(txName[1])) or
                       (Ord(txName[2]) shl 8) or
                       (Ord(txName[3]) shl 16) or
                       (Ord(txName[4]) shl 24);
            pDIRi := @DIR[iStart];
            for local_i := iStart to iEnd do
            begin
              if pDIRi.intName1 = checkid then
                if pDIRi.Name[5] in ['A', 'B', 'C', 'D'] then
                begin
                  sTmp := DoomEntryName(pDIRi.Name);
                  if TextureNames.IndexOf(sTmp) < 0 then
                    TextureNames2.Add(sTmp)
                  else
                    Break; // Αν έστω και ένα texture υπάρχει, τότε υπάρχουν & τα υπόλοιπα}
                end;
              inc(pDIRi);
            end;
          end;
          lastThing := curThing;
        end;
      end;

    end;

    TextureNames.AddStrings(TextureNames2);
  finally
    TextureNames2.Free;
  end;
end;

procedure GetDoomMapSprites(MainWAD: TFileName;
    lThings: PDoomThings;
    numThings: integer; var TextureNames: TDXStringList); overload;
var dir: PDoomDirectory;
    numEntries: integer;
    typ: TIDSoftWadType;
    dirCacheMiss: boolean;
begin
  dirCacheMiss := not GetWADDIRCacheNoCopy(MainWAD, dir, numEntries, typ);
  if dirCacheMiss then
    ReadWadDirectory(MainWAD, dir, numEntries);

  GetDoomMapSprites(dir, numEntries, lThings, numThings, TextureNames);

  if dirCacheMiss then
    FreeMem(dir, numEntries * SizeOf(TDoomDirEntry));
end;
{$ENDIF}

{$IFNDEF NO_DOOMTHINGS}
procedure GetHereticMapSprites(
    dir: PDoomDirectory; numEntries: integer;
    lThings: PDoomThings;
    numThings: integer; var TextureNames: TDXStringList); overload;
var local_i, i: integer;
    txName: string;
    ipos: integer;
    iStart, iEnd: integer;
    sTmp: string;
    TextureNames2: TDXStringList;
    wasEmpty: boolean;
    lastThing: integer;
    curThing: integer;
//    tseq: string;
begin
  if TextureNames = nil then
  begin
    TextureNames := TDXStringList.Create;
    wasEmpty := True;
  end
  else
  begin
    TextureNames.Sorted := True;
    wasEmpty := TextureNames.Count = 0;
  end;

  TextureNames2 := TDXStringList.Create;
  try
    iStart := GetDirIndexOfEntry(rsS_START, dir, numEntries) + 1;
    iEnd := GetDirIndexOfEntry(rsS_END, dir, numEntries, iStart) - 1;

    QuickSortDoomThings(lThings, numThings);

    lastThing := -2147483647;

    if wasEmpty then
    begin

      for i := 0 to numThings - 1 do
      begin
        curThing := lThings[i]._type;
        if curThing <> lastThing then
        begin
          ipos := se_HereticThings.GetThingTextureSubFix(curThing, txName);
          if ipos > -1 then
          begin
//            tseq := 'ABCD'; // se_HereticThings.GetThingTextureSequence(ipos);
            txName := UpperCase(txName);
            for local_i := iStart to iEnd do
            begin
              sTmp := DoomEntryName(Dir[local_i]);
              if Length(sTmp) > 4 then
//                if Pos(sTmp[5], tseq) > 0 then
                if sTmp[5] in ['A', 'B', 'C', 'D'] then
                  if LeftStr(sTmp, 4) = txName then
                    TextureNames2.Add(sTmp);
            end;
          end;
          lastThing := curThing;
        end;
      end;

    end
    else
    begin

      for i := 0 to numThings - 1 do
      begin
        curThing := lThings[i]._type;
        if curThing <> lastThing then
        begin
          ipos := se_HereticThings.GetThingTextureSubFix(curThing, txName);
          if ipos > -1 then
          begin
//            tseq := 'ABCD'; // se_HereticThings.GetThingTextureSequence(ipos);
            txName := UpperCase(txName);
            for local_i := iStart to iEnd do
            begin
              sTmp := DoomEntryName(Dir[local_i]);
              if Length(sTmp) > 4 then
//                if Pos(sTmp[5], tseq) > 0 then
                if sTmp[5] in ['A', 'B', 'C', 'D'] then
                  if LeftStr(sTmp, 4) = txName then
                    if TextureNames.IndexOf(sTmp) < 0 then
                      TextureNames2.Add(sTmp)
                    else
                      Break; // Αν έστω και ένα texture υπάρχει, τότε υπάρχουν & τα υπόλοιπα}
            end;
          end;
          lastThing := curThing;
        end;
      end;

    end;

    TextureNames.AddStrings(TextureNames2);
  finally
    TextureNames2.Free;
  end;
end;

procedure GetHereticMapSprites(MainWAD: TFileName;
    lThings: PDoomThings;
    numThings: integer; var TextureNames: TDXStringList); overload;
var dir: PDoomDirectory;
    numEntries: integer;
    typ: TIDSoftWadType;
    dirCacheMiss: boolean;
begin
  dirCacheMiss := not GetWADDIRCacheNoCopy(MainWAD, dir, numEntries, typ);
  if dirCacheMiss then
    ReadWadDirectory(MainWAD, dir, numEntries);

  GetHereticMapSprites(dir, numEntries, lThings, numThings, TextureNames);

  if dirCacheMiss then
    FreeMem(dir, numEntries * SizeOf(TDoomDirEntry));
end;
{$ENDIF}

{$IFNDEF NO_DOOMTHINGS}
procedure GetHexenMapSprites(
    dir: PDoomDirectory; numEntries: integer;
    lThings: PDoomThings;
    numThings: integer; var TextureNames: TDXStringList); overload;
var local_i, i: integer;
    txName: string;
    ipos: integer;
    iStart, iEnd: integer;
    sTmp: string;
    TextureNames2: TDXStringList;
    wasEmpty: boolean;
    lastThing: integer;
    curThing: integer;
    pDIRi: PDoomDirEntry;
    checkid: integer;
//    tseq: string;
begin
  if TextureNames = nil then
  begin
    TextureNames := TDXStringList.Create;
    wasEmpty := True;
  end
  else
  begin
    TextureNames.Sorted := True;
    wasEmpty := TextureNames.Count = 0;
  end;

  TextureNames2 := TDXStringList.Create;
  try
    iStart := GetDirIndexOfEntry(rsS_START, dir, numEntries) + 1;
    iEnd := GetDirIndexOfEntry(rsS_END, dir, numEntries, iStart) - 1;

    QuickSortDoomThings(lThings, numThings);

    lastThing := -2147483647;

    if wasEmpty then
    begin

      for i := 0 to numThings - 1 do
      begin
        curThing := lThings[i]._type;
        if curThing <> lastThing then
        begin
          ipos := se_HexenThings.GetThingTextureSubFix(curThing, txName);
          if ipos > -1 then
          begin
//            tseq := 'ABCD'; // se_HexenThings.GetThingTextureSequence(ipos);
            txName := UpperCase(txName);
            checkid := (Ord(txName[1])) or
                       (Ord(txName[2]) shl 8) or
                       (Ord(txName[3]) shl 16) or
                       (Ord(txName[4]) shl 24);
            pDIRi := @DIR[iStart];
            for local_i := iStart to iEnd do
            begin
//              if Pos(pDIRi.Name[5], tseq) > 0 then
              if pDIRi.Name[5] in ['A', 'B', 'C', 'D'] then
              begin
                if pDIRi.intName1 = checkid then
                  TextureNames2.Add(DoomEntryName(pDIRi.Name));
              end;
              inc(pDIRi);
            end;
          end;
          lastThing := curThing;
        end;
      end;

    end
    else
    begin

      for i := 0 to numThings - 1 do
      begin
        curThing := lThings[i]._type;
        if curThing <> lastThing then
        begin
          ipos := se_HexenThings.GetThingTextureSubFix(curThing, txName);
          if ipos > -1 then
          begin
//            tseq := 'ABCD'; // se_HexenThings.GetThingTextureSequence(ipos);
            txName := UpperCase(txName);
            for local_i := iStart to iEnd do
            begin
              sTmp := DoomEntryName(Dir[local_i]);
              if Length(sTmp) > 4 then
//                if Pos(sTmp[5], tseq) > 0 then
                if sTmp[5] in ['A', 'B', 'C', 'D'] then
                  if LeftStr(sTmp, 4) = txName then
                    if TextureNames.IndexOf(sTmp) < 0 then
                      TextureNames2.Add(sTmp)
                    else
                      Break; // Αν έστω και ένα texture υπάρχει, τότε υπάρχουν & τα υπόλοιπα}
            end;
          end;
          lastThing := curThing;
        end;
      end;

    end;

    TextureNames.AddStrings(TextureNames2);
  finally
    TextureNames2.Free;
  end;
end;

procedure GetHexenMapSprites(MainWAD: TFileName;
    lThings: PDoomThings;
    numThings: integer; var TextureNames: TDXStringList); overload;
var dir: PDoomDirectory;
    numEntries: integer;
    typ: TIDSoftWadType;
    dirCacheMiss: boolean;
begin
  dirCacheMiss := not GetWADDIRCacheNoCopy(MainWAD, dir, numEntries, typ);
  if dirCacheMiss then
    ReadWadDirectory(MainWAD, dir, numEntries);

  GetHexenMapSprites(dir, numEntries, lThings, numThings, TextureNames);

  if dirCacheMiss then
    FreeMem(dir, numEntries * SizeOf(TDoomDirEntry));
end;
{$ENDIF}

{$IFNDEF NO_DOOMTHINGS}
procedure GetStrifeMapSprites(
    dir: PDoomDirectory; numEntries: integer;
    lThings: PDoomThings;
    numThings: integer; var TextureNames: TDXStringList); overload;
var local_i, i: integer;
    txName: string;
    ipos: integer;
    iStart, iEnd: integer;
    sTmp: string;
    TextureNames2: TDXStringList;
    wasEmpty: boolean;
    lastThing: integer;
    curThing: integer;
//    tseq: string;
begin
  if TextureNames = nil then
  begin
    TextureNames := TDXStringList.Create;
    wasEmpty := True;
  end
  else
  begin
    TextureNames.Sorted := True;
    wasEmpty := TextureNames.Count = 0;
  end;

  TextureNames2 := TDXStringList.Create;
  try
    iStart := GetDirIndexOfEntry(rsS_START, dir, numEntries) + 1;
    iEnd := GetDirIndexOfEntry(rsS_END, dir, numEntries, iStart) - 1;

    QuickSortDoomThings(lThings, numThings);

    lastThing := -2147483647;

    if wasEmpty then
    begin

      for i := 0 to numThings - 1 do
      begin
        curThing := lThings[i]._type;
        if curThing <> lastThing then
        begin
          ipos := se_StrifeThings.GetThingTextureSubFix(curThing, txName);
          if ipos > -1 then
          begin
//            tseq := 'ABCD'; // se_StrifeThings.GetThingTextureSequence(ipos);
            txName := UpperCase(txName);
            for local_i := iStart to iEnd do
            begin
              sTmp := DoomEntryName(Dir[local_i]);
              if Length(sTmp) > 4 then
//                if Pos(sTmp[5], tseq) > 0 then
                if sTmp[5] in ['A', 'B', 'C', 'D'] then
                  if LeftStr(sTmp, 4) = txName then
                    TextureNames2.Add(sTmp);
            end;
          end;
          lastThing := curThing;
        end;
      end;

    end
    else
    begin

      for i := 0 to numThings - 1 do
      begin
        curThing := lThings[i]._type;
        if curThing <> lastThing then
        begin
          ipos := se_StrifeThings.GetThingTextureSubFix(curThing, txName);
          if ipos > -1 then
          begin
//            tseq := 'ABCD'; // se_StrifeThings.GetThingTextureSequence(ipos);
            txName := UpperCase(txName);
            for local_i := iStart to iEnd do
            begin
              sTmp := DoomEntryName(Dir[local_i]);
              if Length(sTmp) > 4 then
//                if Pos(sTmp[5], tseq) > 0 then
                if sTmp[5] in ['A', 'B', 'C', 'D'] then
                  if LeftStr(sTmp, 4) = txName then
                    if TextureNames.IndexOf(sTmp) < 0 then
                      TextureNames2.Add(sTmp)
                    else
                      Break; // Αν έστω και ένα texture υπάρχει, τότε υπάρχουν & τα υπόλοιπα}
            end;
          end;
          lastThing := curThing;
        end;
      end;

    end;

    TextureNames.AddStrings(TextureNames2);
  finally
    TextureNames2.Free;
  end;
end;

procedure GetStrifeMapSprites(MainWAD: TFileName;
    lThings: PDoomThings;
    numThings: integer; var TextureNames: TDXStringList); overload;
var
  dir: PDoomDirectory;
  numEntries: integer;
  typ: TIDSoftWadType;
  dirCacheMiss: boolean;
begin
  dirCacheMiss := not GetWADDIRCacheNoCopy(MainWAD, dir, numEntries, typ);
  if dirCacheMiss then
    ReadWadDirectory(MainWAD, dir, numEntries);

  GetStrifeMapSprites(dir, numEntries, lThings, numThings, TextureNames);

  if dirCacheMiss then
    FreeMem(dir, numEntries * SizeOf(TDoomDirEntry));
end;
{$ENDIF}

const
  NullFlatAnims: array[0..0] of TTextureAnim = (
    (NumAnims: 0; Speed:-1; Anims: ('', '', '', '', '', '', '', ''))
  );

function GetFlatAnimsPointer(typ: TIDSoftWADType): PTextureAnimTable;
begin
  if typ = idDoom then
    Result := @DoomFlatAnims
  else if typ = idHeretic then
    Result := @HereticFlatAnims
  else if typ = idHexen then
    Result := @HexenFlatAnims
  else if typ in [idStrife, idStrife2] then
    Result := @StrifeFlatAnims
  else
    Result := @NullFlatAnims;
end;

function GetWallAnimsPointer(typ: TIDSoftWADType): PTextureAnimTable;
begin
  if typ = idDoom then
    Result := @DoomWallAnims
  else if typ = idHeretic then
    Result := @HereticWallAnims
  else if typ = idHexen then
    Result := @HexenWallAnims
  else if typ in [idStrife, idStrife2] then
    Result := @StrifeWallAnims
  else
    Result := nil;
end;

function SearchAnims(const tex: string; const anims: PTextureAnimTable): integer;
var
  i: integer;
  anim: PTextureAnim;
begin
  if anims <> nil then
  begin
    i := 0;
    anim := @anims[0];
    while anim.NumAnims > 0 do
    begin
      if (tex >= anim.Anims[0]) and (tex <= anim.Anims[anim.NumAnims - 1]) then
      begin
        Result := i;
        Exit;
      end;
      inc(i);
      inc(anim);
    end;
  end;
  Result := -1;
end;

procedure CacheMapTextures(AScene: TD3DScene; MainWAD, PWAD: TFileName;
    MapName: string;
    lSideDefs: PDoomSideDefs;
    numSideDefs: integer;
    lSectors: PDoomSectors;
    numSectors: integer;
    lTexturesInfo: PDoomTexturesInfo;
    numTextures: integer;
{$IFNDEF NO_DOOMTHINGS}
    lThings: PDoomThings;
    numThings: integer;
    dir: PDoomDirectory;
    numEntries: integer;
{$ENDIF}
    typ: TIDSoftWADType;
    PrepareOptimizer: boolean);

var
  TextureNames1, TextureNames2: TDXStringList;
{$IFNDEF NO_DOOMTHINGS}
  TextureNames3: TDXStringList;
{$ENDIF}
  s: string;
  pS: PDoomSector;
  pL: PDoomSideDef;
  anims: PTextureAnimTable;

  procedure AddSectors;
  var
    i, j: integer;
    animidx: integer;
  begin
    pS := @lSectors[0];
    if anims = nil then
    begin
      for i := 0 to numSectors - 1 do
      begin
        s := DoomEntryName(pS.floort);
        if TextureNames1.IndexOf(s) < 0 then
          TextureNames1.Add(s);
        s := DoomEntryName(pS.ceilt);
        if (TextureNames1.IndexOf(s) < 0) and
           (not IsSkyTextureName(s)) then
          TextureNames1.Add(s);
        inc(pS);
      end;
    end
    else
    begin
      for i := 0 to numSectors - 1 do
      begin
        s := DoomEntryName(pS.floort);
        if TextureNames1.IndexOf(s) < 0 then
        begin
          animidx := SearchAnims(s, anims);
          if animidx >= 0 then
          begin
            for j := 0 to anims[animidx].NumAnims - 1 do
              TextureNames1.Add(anims[animidx].Anims[j]);
          end
          else
            TextureNames1.Add(s);
        end;
        s := DoomEntryName(pS.ceilt);
        if (TextureNames1.IndexOf(s) < 0) and
           (not IsSkyTextureName(s)) then
        begin
          animidx := SearchAnims(s, anims);
          if animidx >= 0 then
          begin
            for j := 0 to anims[animidx].NumAnims - 1 do
              TextureNames1.Add(anims[animidx].Anims[j]);
          end
          else
            TextureNames1.Add(s);
        end;
        inc(pS);
      end;
    end;
  end;

  procedure AddSideDefTex(const tex: TDoomCharArray);
  var
    s: string;
    i, animidx: integer;
  begin
    if IsValidTextureName(tex) then
    begin
      s := DoomEntryName(tex);
      if TextureNames2.IndexOf(s) < 0 then
      begin
        if anims = nil then
        begin
          TextureNames2.Add(s);
        end
        else
        begin
          animidx := SearchAnims(s, anims);

          if animidx >= 0 then
          begin
            for i := 0 to anims[animidx].NumAnims - 1 do
              TextureNames2.Add(anims[animidx].Anims[i]);
          end
          else
            TextureNames2.Add(s);
        end;
      end;
    end;
  end;

  procedure AddSideDefs;
  var
    i: integer;
  begin
    pL := @lSideDefs[0];
    for i := 0 to numSideDefs - 1 do
    begin
      AddSideDefTex(pL.tex1);
      AddSideDefTex(pL.tex2);
      AddSideDefTex(pL.tex3);
{      if IsValidTextureName(pL.tex1) then
      begin
        s := DoomEntryName(pL.tex1);
        if TextureNames2.IndexOf(s) < 0 then
          TextureNames2.Add(s);
      end;
      if IsValidTextureName(pL.tex2) then
      begin
        s := DoomEntryName(pL.tex2);
        if TextureNames2.IndexOf(s) < 0 then
          TextureNames2.Add(s);
      end;
      if IsValidTextureName(pL.tex3) then
      begin
        s := DoomEntryName(pL.tex3);
          if TextureNames2.IndexOf(s) < 0 then
            TextureNames2.Add(s);
      end;}
      inc(pL);
    end;
  end;

var
  i: integer;
  TextureNames: TDXStringList;
begin
  TextureNames := TDXStringList.Create;
  TextureNames1 := TDXStringList.Create;
  TextureNames2 := TDXStringList.Create;
{$IFNDEF NO_DOOMTHINGS}
  TextureNames3 := TDXStringList.Create;
{$ENDIF}
  try
    anims := GetFlatAnimsPointer(typ);
    AddSectors;

    anims := GetWallAnimsPointer(typ);
    AddSideDefs;

    TextureNames2.Add(rsBlack);
    TextureNames2.Add(rsWhite);
    TextureNames2.Add(rsInvalid);
    s := GetDoomSkyTexture(typ, MapName);
    if s <> '' then
      TextureNames2.Add(s);

    TextureNames.AddStrings(TextureNames1);
    TextureNames.AddStrings(TextureNames2);

{$IFNDEF NO_DOOMTHINGS}
    if numThings > 0 then
    begin
      if typ = idDoom then
      begin
        GetDoomMapSprites(dir, numEntries, lThings, numThings, TextureNames3);
      end
      else if typ = idHeretic then
      begin
        GetHereticMapSprites(dir, numEntries, lThings, numThings, TextureNames3);
      end
      else if typ = idHexen then
      begin
        GetHexenMapSprites(dir, numEntries, lThings, numThings, TextureNames3);
      end
      else if typ in [idStrife, idStrife2] then
      begin
        GetStrifeMapSprites(dir, numEntries, lThings, numThings, TextureNames3);
      end;
      TextureNames.AddStrings(TextureNames3);
    end;
    CacheWADTextures(AScene, MainWAD, PWAD, TextureNames, dir, numEntries, typ,
      lTexturesInfo, numTextures);
{$ELSE}
    CacheWADTextures(AScene, MainWAD, PWAD, TextureNames, nil, -1, typ,
      lTexturesInfo, numTextures);
{$ENDIF}

    if PrepareOptimizer then
    begin
      TextureNames.Clear;
      TextureNames.AddStrings(TextureNames1);
      for i := 0 to TextureNames.Count - 1 do
        TextureNames.Strings[i] := GetWadLinkDescription(MainWAD, TextureNames.Strings[i]);
      AScene.PrepareRTLOptimizer(TextureNames, True, False, D3DCULL_NONE, False);

      TextureNames.Clear;
      TextureNames.AddStrings(TextureNames2);
{      TextureNames.Add(rsBlack);
      TextureNames.Add(rsWhite);
      TextureNames.Add(rsInvalid);}
      for i := 0 to TextureNames.Count - 1 do
        TextureNames.Strings[i] := GetWadLinkDescription(MainWAD, TextureNames.Strings[i]);
      AScene.PrepareRTLOptimizer(TextureNames, False, True, D3DCULL_NONE, False);
      AScene.PrepareRTLOptimizer(TextureNames, False, True, D3DCULL_CCW, False);

//      AScene.Surfaces.Sorted := True;

    end;

  finally
    TextureNames.Free;
    TextureNames1.Free;
    TextureNames2.Free;
{$IFNDEF NO_DOOMTHINGS}
    TextureNames3.Free;
{$ENDIF}
  end;
end;

procedure ArrangeDuplicatedVertexes(
  lLineDefs: PDoomLineDefs;
  numLineDefs: integer;
  lVertexes: PDoomVertexes;
  numVertexes: integer);
// Αν υπάρχουν δύο ίδια vertexes (με ίδιες συντεταγμένες αλλά διαφορετικό κωδικό,
// αλλάζουμε τα references στα lLineDefs ώστε να δίχνουν όλα στο πρώτο.
var
  i, j, k: integer;
  ld: PDoomLineDef;
  vi, vj: PDoomVertex;
//  vix, viy: integer;
begin
  vi := @lVertexes[0];
  for i := 0 to numVertexes - 2 do
  begin
//    vix := vi.x;
//    viy := vi.y;
    vj := vi;
    for j := i + 1 to numVertexes - 1 do
    begin
      inc(vj);
      if vi.x_y = vj.x_y then
//      if (vix = vj.x) and (viy = vj.y) then
      begin
        ld := @lLineDefs[0];
        for k := 0 to numLineDefs - 1 do
        begin
          if ld.start = j then
            ld.start := i;
          if ld._End = j then
            ld._End := i;
          inc(ld);
        end;
      end;
    end;
    inc(vi);
  end;
end;

resourceString
  rsExceptionMake3DQInfVertex = 'Make3DQInfVertex() -> Invalid parameter!';

const
  rsE3M8 = 'E3M8';
  rsMAP07 = 'MAP07';

////////////////////////////////////////////////////////////////////////////////
// Eg: E1M3 Doom1
function TryToCorrectOpenSector(
  lVertexes: PDoomVertexes;
  var lLines: PDoomSectorLines; var numLines: integer): boolean;
// Προσπαθεί να διορθώσει έναν ανοικτό τομέα.
// Επιστρέφει True αν επιστρέψει κλειστό τομέα
var
  i, j: integer;
  lL0, lLn, lLi: PDoomSectorLine;
begin
  lL0 := @lLines[0];
  lLn := @lLines[numLines - 1];
  if lL0.start <> lLn._end then
  begin
    Result := False;

    if lLines[1].start = lLn._end then
    begin
      lLi := lL0;
      lLn := lLi;
      for i := 1 to numLines - 1 do
      begin
        inc(lLn);
        lLi^ := lLn^;
        inc(lLi);
      end;
      dec(numLines);
      ReAllocMem(lLines, numLines * SizeOf(TDoomSectorLine));
      Result := True;
      Exit;
    end;

    for i := numLines - 2 downto 2 do
      if lLines[i]._end = lL0.start then
      begin
        for j := i + 1 to numLines - 1 do
          lLines[j].segment := 1;
        MergeSectorSegments(lVertexes, lLines, numLines);
        Result := lL0.start = lLines[numLines - 1]._end;
        Exit;
      end;
  end
  else
    Result := True;
end;

function GetMapData(AScene: TD3DScene;
  MainWAD, PWAD: TFileName; MapName: string;
  Factor: integer = DEFDOOMIMPORTFACTOR; lFactor: Single = DEFDOOMIMPORTLFACTOR;
  PrepareOptimizer: boolean = True
{$IFNDEF NO_DOOMTHINGS}
  ; doThings: boolean = True
{$ENDIF}
  ; forceTyp: TIDSoftWADType = idUnknown
  ): TIDSoftWADType;
var
  lThings: PDoomThings;
  numThings: integer;
  lLineDefs: PDoomLineDefs;
  numLineDefs: integer;
  lSideDefs: PDoomSideDefs;
  numSideDefs: integer;
  lVertexes: PDoomVertexes;
  numVertexes: integer;
  lSectors: PDoomSectors;
  numSectors: integer;
  dir: PDoomDirectory;
  numEntries: integer;
  dirCacheMiss: boolean;
begin
  if PWAD = '' then PWAD := MainWAD;
  dirCacheMiss := not GetWADDIRCacheNoCopy(MainWAD, dir, numEntries, Result);
  if dirCacheMiss then
    Result := ReadWadDirectory(MainWAD, dir, numEntries, False);
  ReadMapData(PWAD, MapName,
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSectors, numSectors,
    Result);
  GetMapData(AScene,
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSectors, numSectors,
    dir, numEntries,
    MainWAD, PWAD, MapName,
    Factor, lFactor,
    PrepareOptimizer
{$IFNDEF NO_DOOMTHINGS}
  , doThings
{$ENDIF}, Result);
  ClearMapData(
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSectors, numSectors);
  if dirCacheMiss then
    FreeMem(dir, numEntries * SizeOf(TDoomDirEntry));
end;

procedure AdjustRaisingFloors(
  var lLineDefs: PDoomLineDefs; var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs; var numSideDefs: integer;
  var lSectors: PDoomSectors; var numSectors: integer);
var
  i: integer;
  lLi: PDoomLineDef;
  pSec1, pSec2: PDoomSector;
  psd1, psd2: PDoomSideDef;
  dmInvalidStr: TDoomCharArray;
begin
  if numLineDefs = 0 then
    Exit;

  dmInvalidStr := DoomStringName(rsInvalid);
  lLi := @lLineDefs[0];
  for i := 0 to numLinedefs - 1 do
  begin
    if (lLi.sidedef1 > -1) and (lLi.sidedef1 < numSideDefs) and
       (lLi.sidedef2 > -1) and (lLi.sidedef2 < numSideDefs) then
    begin
      psd1 := @lSideDefs[lLi.sidedef1];
      psd2 := @lSideDefs[lLi.sidedef2];
      if (psd1.sector > - 1) and
         (psd2.sector > - 1) then
      begin
        pSec1 := @lSectors[psd1.sector];
        pSec2 := @lSectors[psd2.sector];

        if pSec1.floorh < pSec2.floorh then
        begin
          if not IsValidTextureName(psd1.tex2) then
          begin
            psd1.tex2 := dmInvalidStr;
          end;
        end
        else if pSec1.floorh > pSec2.floorh then
        begin
          if not IsValidTextureName(psd2.tex2) then
          begin
            psd2.tex2 := dmInvalidStr;
          end;
        end;

        if pSec1.ceilh < pSec2.ceilh then
        begin
          if not IsValidTextureName(psd1.tex1) then
          begin
            psd1.tex1 := dmInvalidStr;
          end;
        end
        else if pSec1.ceilh > pSec2.ceilh then
        begin
          if not IsValidTextureName(psd2.tex1) then
          begin
            psd2.tex1 := dmInvalidStr;
          end;
        end

      end;
    end;
    inc(lLi);
  end;
end;

procedure GetMapData(AScene: TD3DScene;
  var lThings: PDoomThings; var numThings: integer;
  var lLineDefs: PDoomLineDefs; var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs; var numSideDefs: integer;
  var lVertexes: PDoomVertexes; var numVertexes: integer;
  var lSectors: PDoomSectors; var numSectors: integer;
  var dir: PDoomDirectory; var numEntries: integer;
  MainWAD, PWAD: TFileName; MapName: string;
  Factor: integer = DEFDOOMIMPORTFACTOR; lFactor: Single = DEFDOOMIMPORTLFACTOR;
  PrepareOptimizer: boolean = True
{$IFNDEF NO_DOOMTHINGS}
  ; doThings: boolean = True
{$ENDIF}
  ; forceTyp: TIDSoftWADType = idUnknown
  ); overload;
{ Διαβάζει το αρχείο WAD <FileName> και ενσωματώνει στην σκηνή <AScene> τον
  χάρτη MapName.
  Factor: Παράγοντας scaling }
var
  lTexturesInfo,
  lTexturesInfo2: PDoomTexturesInfo;
  numTextures,
  numTextures2: integer;
{$IFNDEF NO_DOOMTHINGS}
  numSprites: integer;
{$ENDIF}
  inf: TD3DPolygonInfo;
  Qinf: TD3DQuadrangleInfo;
{$IFNDEF NO_DOOMTHINGS}
  tinf: TD3DExObjectInfo;
{$ENDIF}
  lSectorsLines: PDoomSectorLines;
  numSectorsLines: integer;
  i: integer;
  typ: TIDSoftWADType;
  cView_div_Factor: single;
{$IFNDEF NO_DOOMTHINGS}
  StartPositionFound: boolean;
  SpritesDir: PDoomDirectory;
  numSpritesEntries: integer;
  last_txName,
  txNameFull: string;
  sStart, sEnd: integer; // Indexes για την αρχή & το τέλος των Sprites
  lTriangles: PD3DFloatTriangleArray; // Για τον υπολογισμό της θέσης των αντικειμένων (άξονας y)
  pTriangle: PD3DFloatTriangle;
  lCeilings: PSingleArray;
  numTriangles: integer;
{$ENDIF}
  curCeilHeight: single;
  pl: PDoomLineDef;
  pls1, pls2: integer;
  sec1, sec2: integer;
  hollow: PDoomSectorLinesArray;
  epoly: TD3DExtraRTLPolygon;
// Animatings support
  ftanims: PTextureAnimTable;
  wlanims: PTextureAnimTable;

{$IFDEF DESIGNER}
  oldSaveUndo: boolean;
{$ENDIF}

  procedure Make3DInfVertex(i: integer; x, y, z: single);
  begin
    inf.Vertexes[i] := MakeD3DVector(
      x / Factor,
      y * cView_div_Factor,  // cView: Viewport
      z / Factor);
  end;

  procedure Make3DQInfVertex(i: integer; x, y, z: single);
  begin
    case i of
      0: begin
           Qinf.x1 := x / Factor;
           Qinf.y1 := y * cView_div_Factor; // cView: Viewport
           Qinf.z1 := z / Factor;
         end;
      1: begin
           Qinf.x2 := x / Factor;
           Qinf.y2 := y * cView_div_Factor; // cView: Viewport
           Qinf.z2 := z / Factor;
         end;
      2: begin
           Qinf.x3 := x / Factor;
           Qinf.y3 := y * cView_div_Factor; // cView: Viewport
           Qinf.z3 := z / Factor;
         end;
      3: begin
           Qinf.x4 := x / Factor;
           Qinf.y4 := y * cView_div_Factor; // cView: Viewport
           Qinf.z4 := z / Factor;
         end;
    else
      raise Exception.Create(rsExceptionMake3DQInfVertex);
    end;
  end;

  procedure MakeQInfUV(len, height: single; xofs, yofs: TIntValue; w, h: integer);
  begin
    if w > 0 then
    begin
      Qinf.u := len / w;
      Qinf.du := xofs / w;
    end
    else
    begin
      Qinf.u := 1.0;
      Qinf.du := 0.0;
    end;
    if h <> 0 then
    begin
      Qinf.v := height / h;
      Qinf.dv := yofs / h;
    end
    else
    begin
      Qinf.v := 1.0;
      Qinf.dv := 0.0;
    end;
  end;

  // Make scrolling walls
  procedure MakeQInfdduddv(const ld, sd: TIntValue);
  var
    side: integer;
    _type: integer;
    plf: PDoomLineDef;
  begin
    Qinf.ddu := 0.0;
    Qinf.ddv := 0.0;
    plf := @lLineDefs[ld];
    if plf.sidedef1 = sd then
      side := 1
    else if plf.sidedef2 = sd then
      side := 2
    else
      Exit;

    _type := plf._type;
    if typ = idDoom then
    begin
      if _type = 48 then // Scroll_Texture_Left
      begin
        if side = 1 then
          Qinf.ddu := 0.5
        else
          Qinf.ddu := -0.5;
      end;
    end
    else if typ = idHeretic then
    begin
      if _type = 48 then // Scroll_Texture_Left
      begin
        if side = 1 then
          Qinf.ddu := 0.5
        else
          Qinf.ddu := -0.5;
      end
      else if _type = 99 then // Scroll_Texture_Right
      begin
        if side = 1 then
          Qinf.ddu := -0.5
        else
          Qinf.ddu := 0.5;
      end
    end
    else if typ = idHexen then
    begin
      if _type = 100 then // Scroll_Texture_Left
      begin
        if side = 1 then
          Qinf.ddu := 0.5
        else
          Qinf.ddu := -0.5;
      end
      else if _type = 101 then // Scroll_Texture_Right
      begin
        if side = 1 then
          Qinf.ddu := -0.5
        else
          Qinf.ddu := 0.5;
      end
      else if _type = 102 then // Scroll_Texture_Up
        Qinf.ddv := -Factor / 64
      else if _type = 103 then // Scroll_Texture_Down
        Qinf.ddu := Factor / 64;
    end;
  end;

  function VertexDistance(v1, v2: TDoomVertex): TD3DValue;
  begin
    Result :=
      sqrt(sqr(v1.x - v2.x) +
           sqr(v1.y - v2.y));
  end;

  function LineDefLength(plf: PDoomLineDef): TD3DValue;
  { Επιστρέφει το μήκος του LineDef με δείκτη ld }
  var
    start1: PDoomVertex;
    end1: PDoomVertex;
  begin
    start1 := @lVertexes[plf.start];
    end1 := @lVertexes[plf._End];
    Result :=
      sqrt(sqr(start1.x - end1.x) +
           sqr(start1.y - end1.y));
  end;

  function SideDefHeight(psd: PDoomSideDef): TIntValue; overload;
  { Επιστρέφει το ύψος του SideDef με δείκτη sd }
  var
    sec: PDoomSector;
  begin
    sec := @lSectors[psd.Sector];
    Result := sec.ceilh -
              sec.floorh;
//      if Result <= 0 then Result := 1 / Factor; // ????
  end;

  function SideDefHeight(plf: PDoomLineDef; psd: PDoomSideDef): integer; overload;
  var
    sec, sec2: PDoomSector;
  begin
    sec := @lSectors[psd.Sector];
    sec2 := nil;
    if @lSideDefs[plf.sidedef1] = psd then
    begin
      if plf.sidedef2 > -1 then
        if lSideDefs[plf.sidedef2].sector > -1 then
          sec2 := @lSectors[lSideDefs[plf.sidedef2].sector];
    end
    else
    begin
      if plf.sidedef1 > -1 then
        if lSideDefs[plf.sidedef1].sector > -1 then
          sec2 := @lSectors[lSideDefs[plf.sidedef1].sector];
    end;
    if sec2 = nil then
      Result := sec.ceilh -
                sec.floorh
//        Result := SideDefHeight(psd)
    else
    begin
      Result := Min(sec.ceilh, sec2.ceilh) - sec.floorh; //Max(sec.floorh, sec2.floorh);
    end;
    if Result < 0 then
      Result := 0;
  end;

  function FindSectorDataOfSideDef(sd: integer;
    var floorh1, ceilh1, floorh2, ceilh2: TIntValue): boolean;
  { Επιστρέφει τα ύψη του πατώματος και του ταβανιού από τα Sector
    που αντιστοιχούν στην SideDef με δείκτη sd }
  var
    local_i: integer;
    sec: integer;
    pld: PDoomLineDef;
    pss: PDoomSector;
    pss1: PDoomSector;
    sdef: integer;
  begin
    Result := False;
    if sd < 0 then  // To επισόδειο Ε1Μ8 του DOOM 1 έχει μία αρνητική sidedef
    begin
      floorh1 := 0;
      ceilh1 := 0;
      floorh2 := 0;
      ceilh2 := 0;
      Exit;
    end;
    sec := lSideDefs[sd].sector;
    pss1 := @lSectors[sec];
    for local_i := 0 to NumLineDefs - 1 do
    begin
      pld := @lLineDefs[local_i];
      if pld.sidedef1 = sd then // Found, check the other sidedef
      begin
        sdef := pld.sidedef2;
        if sdef > -1 then // Μόνο αν έχει 2 sidedef ενώνει 2 Sectors
        begin
{            floorh1 := lSectors[lSideDefs[lLineDefs[local_i].sidedef1].sector].floorh;
            ceilh1  := lSectors[lSideDefs[lLineDefs[local_i].sidedef1].sector].ceilh;}
          floorh1 := pss1.floorh;
          ceilh1  := pss1.ceilh;
          pss := @lSectors[lSideDefs[sdef].sector];
          floorh2 := pss.floorh;

          if IsSkyTextureName(DoomEntryName(pss.ceilt)) then
            ceilh2 := ceilh1
          else
            ceilh2  := pss.ceilh;

          Result := True;
          Exit;
        end;
      end
      else if pld.sidedef2 = sd then // Found, check the other
      begin
        sdef := pld.sidedef1;
        if sdef > -1 then
        begin
{            floorh1 := lSectors[lSideDefs[lLineDefs[local_i].sidedef2].sector].floorh;
            ceilh1  := lSectors[lSideDefs[lLineDefs[local_i].sidedef2].sector].ceilh;}
          floorh1 := pss1.floorh;
          ceilh1  := pss1.ceilh;
          pss := @lSectors[lSideDefs[sdef].sector];
          floorh2 := pss.floorh;
          ceilh2  := pss.ceilh;
          Result := True;
          Exit;
        end;
      end;
    end;
  end;

  function GetTextureDimentions(const tex: TDoomCharArray; var w, h: integer): boolean; overload;
  var
    ti, ti2: PDoomTextureInfo;
    idxtex: integer;
  begin
    idxtex := SearchSortedTexturesInfo(lTexturesInfo, numTextures, tex);
    if idxtex > -1 then
    begin
      ti := @lTexturesInfo[idxtex];
      w := ti.w;
      h := ti.h;
      Result := True;
    end
    else
    begin
      Result := False;
      w := 0;
      h := 0;
      if numTextures > 0 then
      begin
        ti := @lTexturesInfo[0];
        ti2 := @lTexturesInfo[numTextures];
        repeat
          if DoomEntryNamesEqual(tex, ti.Name) then
          begin
            Result := True;
            w := ti.w;
            h := ti.h;
          end;
          inc(ti);
        until (ti = ti2) or Result;
      end;
    end;
  end;

  function GetTextureDimentions(const tex: string; var w, h: integer): integer; overload;
  var
    local_i: integer;
    ti: PDoomTextureInfo;
    texCA: TDoomCharArray;
    len: integer;
  begin
    len := Length(tex);
    if len > 8 then
    begin
      Result := -1;
      w := 0;
      h := 0;
      Exit;
    end;

    for local_i := 1 to len do
      texCA[local_i] := tex[local_i];
    for local_i := len + 1 to 8 do
      texCA[local_i] := #0;

    Result := SearchSortedTexturesInfo(lTexturesInfo, numTextures, texCA);
    if Result > -1 then
    begin
      ti := @lTexturesInfo[Result];
      w := ti.w;
      h := ti.h;
    end
    else
    begin
      Result := -1;
      w := 0;
      h := 0;
      if numTextures > 0 then
      begin
        local_i := 0;
        ti := @lTexturesInfo[0];
        repeat
          if DoomEntryNamesEqual(ti.Name, texCA) then
//            if DoomEntryName(ti.Name) = tex then
          begin
            Result := local_i;
            w := ti.w;
            h := ti.h;
          end;
          inc(local_i);
          inc(ti);
        until (local_i = numTextures) or (Result > -1);
      end;
    end;
  end;

  procedure MakeQinfEpoly(const animidx: integer);
  var
    local_i: integer;
    anim: PTextureAnim;
    txNames: TTextureNames;
  begin
    if animidx >= 0 then
    begin
      anim := @wlanims[animidx];
      for local_i := 0 to anim.NumAnims - 1 do
      begin
        txNames[local_i, 0] := anim.Anims[local_i];
        txNames[local_i, 1] := '';
      end;
      txNames[anim.NumAnims, 0] := '';
      txNames[anim.NumAnims, 1] := '';

      epoly := TD3DExtraRTLPolygon.Create(aScene.DXDraw,
        aScene.AddTexturesToCollection(txNames), txNames);
      epoly.ddu := qinf.ddu;
      epoly.ddv := qinf.ddv;
      epoly.DrawMethod := rpd_Normal;
      epoly.Interval := anim.NumAnims * anim.Speed / TICRATE;    // VJ ???
      epoly.PrimitiveType := D3DPT_TRIANGLESTRIP;
      epoly.VertexTypeDesc := D3DFVF_LVERTEX;
      if (Qinf.flags or flg_DoubleSided) <> 0 then
        epoly.Cull := D3DCULL_NONE
      else if (Qinf.flags and flg_CullCW) <> 0 then
        epoly.Cull := D3DCULL_CW
      else
        epoly.Cull := D3DCULL_CCW;
      epoly.NumVertexes := 4;
      epoly.Vertexes[0] := MakeD3DLVertex(Qinf.x1, Qinf.y1, Qinf.z1, CA_MAKE(Qinf.C1, 0), 0, Qinf.du, Qinf.dv);
      epoly.Vertexes[1] := MakeD3DLVertex(Qinf.x2, Qinf.y2, Qinf.z2, CA_MAKE(Qinf.C2, 0), 0, Qinf.u + Qinf.du, Qinf.dv);
      epoly.Vertexes[2] := MakeD3DLVertex(Qinf.x3, Qinf.y3, Qinf.z3, CA_MAKE(Qinf.C3, 0), 0, Qinf.du, Qinf.v + Qinf.dv);
      epoly.Vertexes[3] := MakeD3DLVertex(Qinf.x4, Qinf.y4, Qinf.z4, CA_MAKE(Qinf.C4, 0), 0, Qinf.u + Qinf.du, Qinf.v + Qinf.dv);
      aScene.AddSurface(epoly);
    end
    else
      AScene.MergePolygonData(ID3D_Quadrangle, @Qinf);
  end;

  procedure MakeSideDefInfoSpecific_tex1_2(ld, sd: integer);
//    procedure MakeSideDefInfoSpecific_tex1_2(plf: PDoomLineDef; psd: PDoomSideDef);
    { Δημιουργία Upper & Lower textures polygons}
  var
    floorh1, ceilh1, floorh2, ceilh2: TIntValue;
    w, h: integer;
    ll: single;
    x1, y1: TD3DValue;
    x2, y2: TD3DValue;
    c1, c2: TD3DValue;
    f1, f2: TD3DValue;
    v: PDoomVertex;
    plf: PDoomLineDef;
    psd: PDoomSideDef;
    CC: TColor;
    psec: PDoomSector;
  begin
//      AddDebugString('MakeSideDefInfoSpecific_tex1_2(' + IntToStr(ld) + ', ' + IntToStr(sd) +')');
    plf := @lLineDefs[ld];
    psd := @lSideDefs[sd];
    if psd.sector > -1 then
      psec := @lSectors[psd.sector]
    else
      psec := nil;
    ll := LineDefLength(plf);
    if (ll > 0.0) and FindSectorDataOfSideDef(sd, floorh1, ceilh1, floorh2, ceilh2) then
    begin
      Qinf.flags := Qinf.flags or flg_DoubleSided; // Διπλή πλευρά (?)
      if psec <> nil then
        CC := GetSectorColor(psec.light, lFactor)
      else
        CC := RGB(255, 255, 255);
      Qinf.C1 := CC;
      Qinf.C2 := CC;
      Qinf.C3 := CC;
      Qinf.C4 := CC;
      MakeQInfdduddv(ld, sd);
      if IsValidTextureName(psd.tex1) then // UpperTexture
      begin
        if ceilh1 > ceilh2 then
        begin
          Qinf.TextureName := GetTheTextureName(AScene, MainWAD, psd.tex1); // Upper texture
          { Δεν διαιρούμε με το Factor γιατί τα Floor & Ceiling Textures
            έχουν πάντα μέγεθος 64x64, έτσι διαιρούμε με 64 }
          if GetTextureDimentions(psd.tex1, w, h) then
          { Βρήκαμε πληροφορίες για το texture (διαστάσεις) }
            MakeQInfUV(ll, (ceilh1 - ceilh2),
               psd.xoff, psd.yoff, w, h)
          else
          // Default value for texture dimentions
            MakeQInfUV(ll, (ceilh1 - ceilh2), 0, 0, 128, 128);

          if psec <> nil then
            if psec.tag <> 0 then
              QInf.dv := 0.0;

          v := @lVertexes[plf.start];
          x1 := v.x;
          y1 := v.y;
          v := @lVertexes[plf._end];
          x2 := v.x;
          y2 := v.y;

          c1 := ceilh1;
          c2 := ceilh2;
          Make3DQInfVertex(0,
              x1,
              c1,
              y1);
          Make3DQInfVertex(1,
              x2,
              c1,
              y2);
          Make3DQInfVertex(2,
              x1,
              c2,
              y1);
          Make3DQInfVertex(3,
              x2,
              c2,
              y2);

          MakeQinfEpoly(SearchAnims(DoomEntryName(psd.tex1, False), wlanims));
  //          AScene.AddSurface(ID3D_Quadrangle, @Qinf);
        end;
      end;
      if IsValidTextureName(psd.tex2) then // LowerTexture
      begin
        if floorh1 < floorh2 then
        begin
          Qinf.TextureName := GetTheTextureName(AScene, MainWAD, psd.tex2); // Upper texture
          if GetTextureDimentions(psd.tex2, w, h) then
          { Βρήκαμε πληροφορίες για το texture (διαστάσεις) }
            MakeQInfUV(ll, (floorh2 - floorh1),
              psd.xoff, psd.yoff, w, h)
          else
          { Default τιμές για διαστάσεις εικόνας: 128x128 }
            MakeQInfUV(ll, (floorh2 - floorh1), 0, 0, 128, 128);

          if psec <> nil then
            if psec.tag <> 0 then
              QInf.dv := 0.0;

          v := @lVertexes[plf.start];
          x1 := v.x;
          y1 := v.y;
          v := @lVertexes[plf._end];
          x2 := v.x;
          y2 := v.y;

          f1 := floorh1;
          f2 := floorh2;

          Make3DQInfVertex(0,
              x1,
              f2,
              y1);
          Make3DQInfVertex(1,
              x2,
              f2,
              y2);
          Make3DQInfVertex(2,
              x1,
              f1,
              y1);
          Make3DQInfVertex(3,
              x2,
              f1,
              y2);
          MakeQinfEpoly(SearchAnims(DoomEntryName(psd.tex2, False), wlanims));
//            AScene.MergePolygonData(ID3D_Quadrangle, @Qinf);
//          AScene.AddSurface(ID3D_Quadrangle, @Qinf);
        end;
      end;
    end;
  end;

  procedure MakeSideDefInfoSpecific_tex3(ld, sd: integer);
  // Make Normal Texture
  { ld: LineDef index.
    sd: SideDef index. }
  var
    w, h, sh: integer;
    ll: single;
    x1, y1: TD3DValue;
    x2, y2: TD3DValue;
    c, f: TD3DValue;
    v: PDoomVertex;
    plf: PDoomLineDef;
    psd: PDoomSideDef;
    CC: TColor;
    sec: PDoomSector;
    gtd: boolean;
  begin
//      AddDebugString('MakeSideDefInfoSpecific_tex3(' + IntToStr(ld) + ', ' + IntToStr(sd) +')');

    plf := @lLineDefs[ld];
    psd := @lSideDefs[sd];
    sh := SideDefHeight(plf, psd);
//      sh := SideDefHeight(psd);
    if sh > 0 then
    begin
      ll := LineDefLength(plf);
      if ((plf.flags and 4) <> 0) or // Double Sided, mayby transparent
         (plf.sidedef1 = -1) or
         (plf.sidedef2 = -1) then
      begin
        Qinf.flags := {Qinf.flags or} flg_DoubleSided;
        Qinf.Transparent := True;
      end
      else
      begin
        Qinf.flags := 0;
        Qinf.Transparent := False;
      end;
      sec := @lSectors[psd.sector];
      CC := GetSectorColor(sec.light, lFactor);
      Qinf.C1 := CC;
      Qinf.C2 := CC;
      Qinf.C3 := CC;
      Qinf.C4 := CC;
      Qinf.TextureName := GetTheTextureName(AScene, MainWAD, psd.tex3); // Normal texture

      v := @lVertexes[plf.start];
      x1 := v.x;
      y1 := v.y;
      v := @lVertexes[plf._end];
      x2 := v.x;
      y2 := v.y;

      f := sec.floorh;
//        c := sec.ceilh;
//        f := sec.floorh;

      gtd := GetTextureDimentions(psd.tex3, w, h);

      if plf.flags and 16 <> 0 then
        if plf.flags and 4 <> 0 then
          sh := h;

      c := f + sh;
      Make3DQInfVertex(0,
          x1,
          c,
          y1);
      Make3DQInfVertex(1,
          x2,
          c,
          y2);
      Make3DQInfVertex(2,
          x1,
          f,
          y1);
      Make3DQInfVertex(3,
          x2,
          f,
          y2);

      if gtd then
      begin
      { Βρήκαμε πληροφορίες για το texture (διαστάσεις w & h) }
        MakeQInfUV(ll, sh, psd.xoff, psd.yoff, w, h);
      end
      else
      begin
        MakeQInfUV(ll, sh, 0, 0, 128, 128);
      end;
      MakeQInfdduddv(ld, sd);
      MakeQinfEpoly(SearchAnims(DoomEntryName(psd.tex3, False), wlanims));
//        AScene.MergePolygonData(ID3D_Quadrangle, @Qinf);
    end;
//      AScene.AddSurface(ID3D_Quadrangle, @Qinf);
  end;

  // Προσθέτει στον πίνακα lTriangles τις τρέχουσες τιμές του inf
{$IFNDEF NO_DOOMTHINGS}
  procedure AddTriangles;
  var
    local_i: integer;
    VV: PD3DVectorArray;
    tmp: PD3DVectorArray;
    tmp1: PD3DVector;
    num: integer;
    idx: integer;
  begin
    if inf.NumVertexes < 3 then
      Exit; // error!
    if inf.PrimitiveType = D3DPT_TRIANGLELIST then
    begin
      num := numTriangles;
      numTriangles := numTriangles + inf.NumVertexes div 3;
      ReallocMem1024(pointer(lTriangles), numTriangles * SizeOf(TD3DFloatTriangle));
      ReallocMem1024(pointer(lCeilings), numTriangles * SizeOf(single));
      local_i := num;
      pTriangle := @lTriangles[local_i];
      tmp1 := @inf.Vertexes;
      repeat
        pTriangle[0] := tmp1^;
        inc(tmp1);

        pTriangle[1] := tmp1^;
        inc(tmp1);

        pTriangle[2] := tmp1^;
        inc(tmp1);

        lCeilings[local_i] := curCeilHeight;

        inc(pTriangle);
        inc(local_i);
      until local_i >= numTriangles;
    end
    else if inf.PrimitiveType = D3DPT_TRIANGLESTRIP then
    begin
      tmp := @inf.Vertexes;
      GetMem(pointer(VV), (3 * (inf.NumVertexes - 2)) * SizeOf(TD3DVector));
      idx := 0;
      for local_i := 0 to inf.NumVertexes - 3 do
        if odd(local_i) then
        begin
          VV[idx] := tmp[local_i    ];
          inc(idx);
          VV[idx] := tmp[local_i + 2];
          inc(idx);
          VV[idx] := tmp[local_i + 1];
          inc(idx);
        end
        else
        begin
          VV[idx] := tmp[local_i    ];
          inc(idx);
          VV[idx] := tmp[local_i + 1];
          inc(idx);
          VV[idx] := tmp[local_i + 2];
          inc(idx);
        end;

      num := numTriangles;
      numTriangles := numTriangles + inf.NumVertexes - 2;
      ReallocMem1024(pointer(lTriangles), numTriangles * SizeOf(TD3DFloatTriangle));
      ReallocMem1024(pointer(lCeilings), numTriangles * SizeOf(single));
      local_i := num;
      pTriangle := @lTriangles[num];
      tmp1 := @VV[0];
      repeat
        pTriangle[0] := tmp1^;
        inc(tmp1);
        pTriangle[1] := tmp1^;
        inc(tmp1);
        pTriangle[2] := tmp1^;
        inc(tmp1);
        lCeilings[local_i] := curCeilHeight;
        inc(local_i);
        inc(pTriangle);
      until local_i >= numTriangles;
      FreeMem(pointer(VV));
    end
  end;
{$ENDIF}

{$IFNDEF NO_DOOMTHINGS}
  function GetFloorAtPoint(const x, z: TD3DValue): TD3DValue;
  var
    local_i: integer;
    tr: TFloatTriangle;
    fp: TFloatPoint;
    fp2: TFloatPoint;
    fp3: TFloatPoint;
    dist, tmp, tmpResult: TD3DValue;
    found: boolean;
    pfp0, pfp1, pfp2: PFloatPoint;
  begin
    dist := g_HUGE;
    tmpResult := 0.0;
    Result := 0.0;
    found := False;
    fp := MakeFloatPoint(x, z);
    fp2 := MakeFloatPoint(x + 0.05, z);
    fp3 := MakeFloatPoint(x, z + 0.05);
    pfp0 := @tr[0];
    pfp1 := @tr[1];
    pfp2 := @tr[2];
    pTriangle := @lTriangles[0];
    for local_i := 0 to numTriangles - 1 do
    begin
      pfp0.x := pTriangle[0].x;
      pfp0.y := pTriangle[0].z;
      pfp1.x := pTriangle[1].x;
      pfp1.y := pTriangle[1].z;
      pfp2.x := pTriangle[2].x;
      pfp2.y := pTriangle[2].z;
      if F_PtNearTriangle(tr, fp, 1.0) then // This line improves speed a lot!!!!!!
      begin
        if F_PtInTriangle(tr, fp) or F_PtInTriangle(tr, fp2) or F_PtInTriangle(tr, fp3) then
        begin
          if found then
          begin
            if pTriangle[0].y > Result then
              Result := pTriangle[0].y;
          end
          else
          begin
            found := True;
            Result := pTriangle[0].y;
          end;
          //Exit;
        end
        else if not found then
        begin  // Παίρνουμε το τετράγωνο της απόστασης
          tmp := sqr(x - (pfp0.x + pfp1.x + pfp2.x) / 3) +
                 sqr(z - (pfp0.y + pfp1.y + pfp2.y) / 3);
          if tmp < dist then
          begin
            dist := tmp;
            tmpResult := pTriangle[0].y;
          end;
        end;
      end;
      inc(pTriangle);
    end;
    // Αν δεν βρέθηκε η προβολή του σημείου μέσα σε τρίγωνο παίρνουμε το κοντινότερο
    if not found then
      Result := tmpResult;
  end;
{$ENDIF}

{$IFNDEF NO_DOOMTHINGS}
  function GetCeilingAtPoint(const x, z: TD3DValue): TD3DValue;
  var
    local_i: integer;
    tr: TFloatTriangle;
    fp: TFloatPoint;
    fp2: TFloatPoint;
    fp3: TFloatPoint;
    dist, tmp, tmpResult: TD3DValue;
    found: boolean;
  begin
    dist := g_HUGE;
    tmpResult := 0.0;
    Result := 0.0;
    found := False;
    fp := MakeFloatPoint(x, z);
    fp2 := MakeFloatPoint(x + 0.05, z);
    fp3 := MakeFloatPoint(x, z + 0.05);
    for local_i := 0 to numTriangles - 1 do
    begin
      pTriangle := @lTriangles[local_i];
      tr[0].x := pTriangle[0].x;
      tr[0].y := pTriangle[0].z;
      tr[1].x := pTriangle[1].x;
      tr[1].y := pTriangle[1].z;
      tr[2].x := pTriangle[2].x;
      tr[2].y := pTriangle[2].z;
      if F_PtNearTriangle(tr, fp, 1.0) then // This line improves speed a lot!!!!!!
      begin
        if F_PtInTriangle(tr, fp) or F_PtInTriangle(tr, fp2) or F_PtInTriangle(tr, fp3) then
        begin
          if found then
          begin
            if lCeilings[local_i] > Result then
              Result := lCeilings[local_i];
          end
          else
          begin
            found := True;
            Result := lCeilings[local_i];
          end;
          //Exit;
        end
        else if not found then
        begin  // Παίρνουμε το τετράγωνο της απόστασης
          tmp := sqr(x - (tr[0].x + tr[1].x + tr[2].x) / 3) +
                 sqr(z - (tr[0].y + tr[1].y + tr[2].y) / 3);
          if tmp < dist then
          begin
            dist := tmp;
            tmpResult := lCeilings[local_i];
          end;
        end;
      end;
    end;
    // Αν δεν βρέθηκε η προβολή του σημείου μέσα σε τρίγωνο παίρνουμε το κοντινότερο
    if not found then
      Result := tmpResult;
  end;
{$ENDIF}

  procedure MakeSector(ss: integer);
  var
    lLines: PDoomSectorLines;
    numLines, local_i, local_j, ofs: integer;
    psl: PDoomSectorLines;
    slnum: integer;
    f: TD3DValue;
    v: PDoomVertex;
    pss: PDoomSector;
    floortName,
    ceiltName: string;
    fanimidx: integer;
    canimidx: integer;
    IsFloorSkyTexture,
    IsCeilSkyTexture: boolean;

    procedure SetFloorTexture;
    var
      local_i: integer;
      anim: PTextureAnim;
    begin
      if fanimidx >= 0 then
      begin
        anim := @ftanims[fanimidx];
        inf.NumTextures := anim.NumAnims;
        inf.Interval := anim.NumAnims * anim.Speed / TICRATE;    // VJ ???
        inf.TextureNames[0, 0] := floortName;
        for local_i := 1 to anim.NumAnims - 1 do
          inf.TextureNames[local_i, 0] := GetTheTextureName(AScene, MainWAD, anim.Anims[local_i]);
      end
      else
      begin
        inf.NumTextures := 1;
        inf.Interval := 0.0;
        inf.TextureNames[0, 0] := floortName;
        for local_i := 1 to MAXTEXANIMS - 1 do
          inf.TextureNames[local_i, 0] := '';
      end;
    end;

    procedure SetCeilingTexture;
    var
      local_i: integer;
      anim: PTextureAnim;
    begin
      if canimidx >= 0 then
      begin
        anim := @ftanims[canimidx];
        inf.NumTextures := anim.NumAnims;
        inf.Interval := anim.NumAnims * anim.Speed / TICRATE;    // VJ ???
        for local_i := 0 to anim.NumAnims - 1 do
          inf.TextureNames[local_i, 0] := anim.Anims[local_i];
      end
      else
      begin
        inf.NumTextures := 1;
        inf.Interval := 0.0;
        inf.TextureNames[0, 0] := ceiltName;
        for local_i := 1 to MAXTEXANIMS - 1 do
          inf.TextureNames[local_i, 0] := '';
      end;
    end;

  begin
//      AddDebugString('MakeSector(' + IntToStr(ss) + ')');
    pss := @lsectors[ss];
    lLines := nil;
    numLines := GetSectorLines(ss, lSectorsLines, numSectorsLines, lLines);

    if numLines = 0 then
      Exit;

      //////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////
//      FileDumpHeap('d:\z_zone\z_zone' + inttostr(ss) + '.txt');
      //////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////

    RemoveIconicSegments(lLines, numLines);
    MergeSectorSegments(lVertexes, lLines, numLines);
    // To Sector δεν είναι κλειστό
    // Patches....
    //////////////////////////////////////////////////////////////////////////
    if lLines[0].start <> lLines[numLines - 1]._end then
    begin
      if (ss = 1) and (typ = idDoom) and (MapName = rsE3M8) then
      begin
        FreeMem(pointer(lLines));
        numLines := GetSectorLinesPatchDoom1E3M8_Sector1(lSectorsLines, numSectorsLines, lLines);
        MergeSectorSegments(lVertexes, lLines, numLines);
      end;
      // To Sector δεν είναι κλειστό
      if lLines[0].start <> lLines[numLines - 1]._end then
      begin
        TryToCorrectOpenSector(lVertexes, lLines, numLines);
        if lLines[0].start <> lLines[numLines - 1]._end then
        begin
          FreeMem(pointer(lLines));
          Exit;
        end;
      end;
    end;
    //////////////////////////////////////////////////////////////////////////

    RemoveNullVertexes(lLines, numLines);

//      if not ((ss = 0) and (typ = idDoom) and (MapName = rsMAP07)) then // Patch
//        ReduceSectorComplexity(lVertexes, lLines, numLines);

    hollow.NumSectors := 0;
    SplitSectorConvexity(lVertexes, lLines, numLines, hollow);

    inf.C := GetSectorColor(pss.light, lFactor);

    inf.PrimitiveType := D3DPT_TRIANGLESTRIP;

    f := pss.floorh;
    curCeilHeight := pss.ceilh * cView_div_Factor;

    floortName := GetTheTextureName(AScene, MainWAD, pss.floort);
    fanimidx := SearchAnims(DoomEntryName(pss.floort, False), ftanims);
    SetFloorTexture;

    ceiltName := GetTheTextureName(AScene, MainWAD, pss.ceilt);
    canimidx := SearchAnims(DoomEntryName(pss.ceilt, False), ftanims);

    IsFloorSkyTexture := IsSkyTextureName(DoomEntryName(pss.floort));
    IsCeilSkyTexture := IsSkyTextureName(DoomEntryName(pss.ceilt));

    for local_j := 0 to hollow.NumSectors - 1 do
    begin
      //////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////
//      FileDumpHeap('d:\z_zone\z_zone' + inttostr(ss) + '-' + IntToStr(local_j) + '.txt');
      //////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////
      ReduceSectorComplexity(lVertexes, hollow.Sectors[local_j], hollow.NumSectorsLines[local_j]);
      slnum := hollow.NumSectorsLines[local_j];
      if slnum > 3 then
      begin
        psl := hollow.Sectors[local_j];
{          MakeInfUV(
            VertexDistance(lVertexes[hollow.Sectors[local_j][0].start],
                           lVertexes[hollow.Sectors[local_j][0]._End]),
            VertexDistance(lVertexes[hollow.Sectors[local_j][1].start],
                           lVertexes[hollow.Sectors[local_j][1]._End]),
            64, 64);}
        inf.NumVertexes := slnum;
        ofs := 0;
        for local_i := 0 to slnum - 1 do
        begin
          if odd(local_i) or (local_i = 0) then
          begin
            v := @lVertexes[psl[local_i - ofs].start];
            Make3DInfVertex(local_i,
                v.x,
                f,
                v.y)
          end
          else
          begin
            inc(ofs);
            v := @lVertexes[psl[slnum - local_i + ofs].start];
            Make3DInfVertex(local_i,
                v.x,
                f,
                v.y);
          end;
        end;
          ////////////
{$IFNDEF NO_DOOMTHINGS}
        if doThings then
          AddTriangles;
{$ENDIF}
          ////////////
        if not IsFloorSkyTexture then
          AScene.MergePolygonData(ID3D_POLYGON, @inf);

        if not IsCeilSkyTexture then
        begin
          SetCeilingTexture;
//            inf.TextureNames[0, 0] := ceiltName;
          for local_i := 0 to inf.NumVertexes - 1 do
            inf.Vertexes[local_i].y := curCeilHeight;
          AScene.MergePolygonData(ID3D_POLYGON, @inf);
          SetFloorTexture;
          //inf.TextureNames[0, 0] := floortName;
        end;
      end;
    end;

    // Όλα τα τρίγωνα τα περνάμε σε ένα μόνο πολύγωνο D3DPT_TRIANGLELIST
    inf.NumVertexes := 0;
    inf.PrimitiveType := D3DPT_TRIANGLELIST;
    SetFloorTexture;
//      inf.TextureNames[0, 0] := floortName;
    for local_j := 0 to hollow.NumSectors - 1 do
      if hollow.NumSectorsLines[local_j] = 3 then
      begin
        psl := hollow.Sectors[local_j];
//          slnum := hollow.NumSectorsLines[local_j];
{          MakeInfUV(
            VertexDistance(lVertexes[hollow.Sectors[local_j][0].start],
                           lVertexes[hollow.Sectors[local_j][0]._End]),
            VertexDistance(lVertexes[hollow.Sectors[local_j][1].start],
                           lVertexes[hollow.Sectors[local_j][1]._End]),
            64, 64);}
        local_i := inf.NumVertexes;
        inf.NumVertexes := inf.NumVertexes + 3;
        v := @lVertexes[psl[0].start];
        Make3DInfVertex(local_i,
            v.x,
            f,
            v.y);

        v := @lVertexes[psl[1].start];
        inc(local_i);
        Make3DInfVertex(local_i,
            v.x,
            f, //pss.floorh,
            v.y);

        v := @lVertexes[psl[2].start];
        inc(local_i);
        Make3DInfVertex(local_i,
            v.x,
            f, //pss.floorh,
            v.y);

        // Αν γεμίσουμε το πολύγωνο τότε θα δημιουργήσουμε άλλο ένα
        if (Inf.NumVertexes + 4) > MAXVERTEXES then
        begin
            ////////////
{$IFNDEF NO_DOOMTHINGS}
          if doThings then
            AddTriangles;
{$ENDIF}
            ////////////
          if not IsFloorSkyTexture then
            AScene.MergePolygonData(ID3D_POLYGON, @inf);

          if not IsCeilSkyTexture then
          begin
            SetCeilingTexture;
            for local_i := 0 to inf.NumVertexes - 1 do
              inf.Vertexes[local_i].y := curCeilHeight;
            AScene.MergePolygonData(ID3D_POLYGON, @inf);
            SetFloorTexture;
          end;
          inf.NumVertexes := 0;
        end;
      end;

      if inf.NumVertexes > 0 then
      begin
        ////////////
{$IFNDEF NO_DOOMTHINGS}
        if doThings then AddTriangles;
{$ENDIF}
        ////////////
        if  not IsFloorSkyTexture then
          AScene.MergePolygonData(ID3D_POLYGON, @inf);

        if not IsCeilSkyTexture then
        begin
          SetCeilingTexture;
          for local_i := 0 to inf.NumVertexes - 1 do
            inf.Vertexes[local_i].y := curCeilHeight;
          AScene.MergePolygonData(ID3D_POLYGON, @inf);
        end;
      end;

    FreeMem(pointer(lLines));
    for local_j := 0 to hollow.NumSectors - 1 do
      FreeMem(pointer(hollow.Sectors[local_j]));
  end;

{$IFNDEF NO_DOOMTHINGS}
  procedure MakeThing(ti: integer; ipos: integer; txName: string;
    doCeiling: boolean = False; height: integer = 0);
  // ti: Αύξων αριθμός thing στην λίστα lThings;
  // ipos: Αριθμός mobjInfo
  // txName: Texturename prefix.
  // Τα hThings είναι ταξινομημένα (QuickSortDoomThings)
  // Η ταξινόμηση γίνεται από την GetDoomMapSprites()
  var
    s: TDXStringList;
    local_i: integer;
    idx: integer;
//        sTmp: string;
    w, h: integer; // width, height of sprite image
    flag: boolean;
    lTh: PDoomThing;
    sLast: string;
//        len: integer;
    animEnd: char;
    // Για έλεγχο αν το προηγούμενο αντικείμενο ήταν το ίδιο με το τρέχον
    lastHit: boolean;
    checkChar: char;
    {$IFNDEF DOOMVIEWER}
    ppos: integer;
    {$ENDIF}
  begin
//    AddDebugString('MakeThing(' + IntToStr(ti) + ')');
    lTh := @lThings[ti];
    if lTh._type = 1 then // Player1 start
    begin
      if not StartPositionFound then
      begin
        AScene.Position :=
          MakeD3DVector(lTh.xpos / Factor,
                        GetFloorAtPoint(lTh.xpos / Factor, lTh.ypos / Factor) + 64 * cView_div_Factor,
                        lTh.ypos / Factor);
        AScene.Rotation :=
          MakeD3DVector(0.0,
                        (lTh.angle - 2) * g_PI_DIV_4,
                        0.0);
        StartPositionFound := True;
      end;
      Exit;
    end;

    if ipos < 0 then
      Exit;

//      tinf.angle := (lTh.angle - 2) * g_PI_DIV_4;
    tinf.angle := (lTh.angle + 90) * g_DEGTORAD;

    tinf.x := lTh.xpos / Factor;
    tinf.z := lTh.ypos / Factor;

    if doCeiling then
      tinf.y := GetCeilingAtPoint(tinf.x, tinf.z)
    else
      tinf.y := GetFloorAtPoint(tinf.x, tinf.z);

    txName := UpperCase(txName);
    if last_txName <> txName then
    begin
      lastHit := False;
      s := TDXStringList.Create;
      try
        GetSortedDoomDirectoryEntries(SpritesDir, numSpritesEntries, txName, s);
        if s.Count > 0 then
        begin
          s.Sort;
          tinf.NumTextures := s.Count;
          for local_i := 0 to tinf.NumTextures - 1 do
          begin
            tinf.TextureNames[local_i, 0] := GetWadLinkDescription(MainWAD, s.Strings[local_i]);
//              tinf.TextureNames[local_i, 1] := '';
          end;
          for local_i := tinf.NumTextures to MAXTEXTURES - 1 do
          begin
            tinf.TextureNames[local_i, 0] := '';
//              tinf.TextureNames[local_i, 1] := '';
          end;
          txNameFull := s.Strings[0];
        end;
        last_txName := txname;
      finally
        s.Free;
      end;
    end
    else
      lastHit := True;

    if tinf.NumTextures = 0 then
      Exit;

    flag := True;

    // Υπολογισμός του μεγέθους του αντικειμένου
    if not lastHit then
    begin
      if GetPredefinedTextureDimentions(typ, txNameFull, w, h, animEnd) then
      begin
        tinf.width := w / Factor; //* cView_div_Factor;
        tinf.height := h * cView_div_Factor;
        if doCeiling then
          tinf.y := tinf.y + tInf.Height / 2 - Height  * cView_div_Factor
        else
          tinf.y := tinf.y + tInf.Height / 2;
        flag := False;
      end
      else
      begin
        tinf.width := 256 / Factor; //* cView_div_Factor;
        tinf.height := tinf.width;

        idx := GetTextureDimentions(txNameFull, w, h);
        if idx > -1 then
        begin
          if (w < 129) and (h < 129) then
            if (lTexturesInfo[idx].xOffs > 64) or
               (lTexturesInfo[idx].yOffs > 128) then
            else
            begin
              tinf.width := 128 / Factor; //* cView_div_Factor;
              tinf.height := 128 * cView_div_Factor;
              if doCeiling then
                tinf.y := tinf.y + tInf.Height / 2 - Height  * cView_div_Factor
              else
                tinf.y := tinf.y + tInf.Height / 2;
              flag := False;
            end;
        end;
      end;
    end;

    if lastHit or flag then
    begin
      if doCeiling then
        tinf.y := tinf.y + tInf.Height / 2 - Height  * cView_div_Factor
      else
        tinf.y := tinf.y + tInf.Height / 2;
    end;

    // Εύρεση του τέλους του animation.
    // Αν το προηγούμενο αντικείμενο ήταν το ίδιο δεν αλλάζουμε το animEnd
    if not lastHit then
    begin
      sLast := tinf.TextureNames[0, 0];
      {$IFNDEF DOOMVIEWER}
      ppos := Pos('::', sLast);
      checkChar := sLast[ppos + 6];
      {$ELSE}
      checkChar := sLast[5];
      {$ENDIF}
      tinf.AnimStart := checkchar;

      sLast := tinf.TextureNames[tinf.numTextures - 1, 0];
      {$IFNDEF DOOMVIEWER}
      ppos := Pos('::', sLast);
      checkChar := sLast[ppos + 6];
      {$ELSE}
      checkChar := sLast[5];
      {$ENDIF}
      if (checkChar >= animEnd) then
        tinf.AnimEnd := animEnd
      else
        tinf.AnimEnd := checkChar;
    end;
//          tinf.AnimEnd := 'A';
    if tinf.NumTextures < 5 then
      AScene.AddSurface(ID3D_ExObjectToStubObject, @tinf)
    else
      AScene.AddSurface(ID3D_ExObject, @tinf);
  end;
{$ENDIF}

{$IFNDEF NO_DOOMTHINGS}
  procedure MakeDoomThing(ti: integer);
  var
    txName: string;
    ipos: integer;
    doCeiling: boolean;
    aHeight: integer;
  begin
    ipos := se_DoomThings.GetThingTextureSubFix(lThings[ti]._type, txName);
    if ipos > -1 then
    begin
      doCeiling := se_DoomThings.mobjinfo[ipos].flags and MF_SPAWNCEILING <> 0;
      aHeight := se_DoomThings.mobjinfo[ipos].height;
      MakeThing(ti, ipos, txName, doCeiling, aHeight);
    end
    else
      MakeThing(ti, ipos, txName);
  end;
{$ENDIF}

{$IFNDEF NO_DOOMTHINGS}
  procedure MakeHereticThing(ti: integer);
  var
    txName: string;
    ipos: integer;
    doCeiling: boolean;
    aHeight: integer;
  begin
    ipos := se_HereticThings.GetThingTextureSubFix(lThings[ti]._type, txName);
    if ipos > -1 then
    begin
      doCeiling := se_HereticThings.mobjinfo[ipos].flags and MF_SPAWNCEILING <> 0;
      aHeight := se_HereticThings.mobjinfo[ipos].height;
      MakeThing(ti, ipos, txName, doCeiling, aHeight);
    end
    else
      MakeThing(ti, ipos, txName);
  end;
{$ENDIF}

{$IFNDEF NO_DOOMTHINGS}
  procedure MakeHexenThing(ti: integer);
  var
    txName: string;
    ipos: integer;
    doCeiling: boolean;
    aHeight: integer;
  begin
    ipos := se_HexenThings.GetThingTextureSubFix(lThings[ti]._type, txName);
    if ipos > -1 then
    begin
      doCeiling := se_HexenThings.mobjinfo[ipos].flags and MF_SPAWNCEILING <> 0;
      aHeight := se_HexenThings.mobjinfo[ipos].height;
      MakeThing(ti, ipos, txName, doCeiling, aHeight);
    end
    else
      MakeThing(ti, ipos, txName);
  end;
{$ENDIF}

{$IFNDEF NO_DOOMTHINGS}
  procedure MakeStrifeThing(ti: integer);
  var
    txName: string;
    ipos: integer;
    doCeiling: boolean;
    aHeight: integer;
  begin
    ipos := se_StrifeThings.GetThingTextureSubFix(lThings[ti]._type, txName);
    if ipos > -1 then
    begin
      doCeiling := se_StrifeThings.mobjinfo[ipos].flags and MF_SPAWNCEILING <> 0;
      aHeight := se_StrifeThings.mobjinfo[ipos].height;
      MakeThing(ti, ipos, txName, doCeiling, aHeight);
    end
    else
      MakeThing(ti, ipos, txName);
  end;
{$ENDIF}

var
  sd1: PDoomSideDef;
  sd2: PDoomSideDef;
  ld: PDoomLineDef;
  sd1num: integer;
  sd2num: integer;

begin
{$IFDEF DESIGNER}
  AScene.SaveUndo;
  oldSaveUndo := AScene.CanSaveUndo;
  AScene.CanSaveUndo := False;
{$ENDIF}
  GetMem(pointer(tmp_GetSectorsLines), SizeOf(TDoomSectorLines));
  GetMem(pointer(tmp_OrganizeSecondSectorSegment), SizeOf(TDoomSectorLines));
  GetMem(pointer(tmp_MergeSectorSegments), SizeOf(TDoomSectorLines));

{$IFNDEF NO_DOOMTHINGS}
  last_txName := '';
  txNameFull := '';
{$ENDIF}

{ Διαβάζουμε τον χάρτη }
  if PWAD = '' then PWAD := MainWAD;
  if forceTyp = idUnKnown then
    typ := GetWADType(MainWAD)
  else
    typ := forceTyp;
  ReadTextureData(MainWAD, lTexturesInfo,
    typ, numTextures{$IFNDEF NO_DOOMTHINGS}, numSprites{$ENDIF});

  numTextures2 := numTextures{$IFNDEF NO_DOOMTHINGS} - numSprites{$ENDIF};
  GetMem(lTexturesInfo2, numTextures2 * SizeOf(TDoomTextureInfo));
  Move(lTexturesInfo^, lTexturesInfo2^, numTextures2 * SizeOf(TDoomTextureInfo));

  QuickSortTexturesInfo(lTexturesInfo, numTextures);

  AdjustRaisingFloors(
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lSectors, numSectors);

  cView_div_Factor := cView / Factor;

  wlanims := GetWallAnimsPointer(typ);
  ftanims := GetFlatAnimsPointer(typ);

{$IFNDEF NO_DOOMTHINGS}
  if doThings then
  begin
    if typ = idDoom then
    begin
      se_HereticThings.Finalize;
      se_HexenThings.Finalize;
      se_StrifeThings.Finalize;
      se_DoomThings.Initialize;
    end
    else if typ = idHeretic then
    begin
      se_DoomThings.Finalize;
      se_HexenThings.Finalize;
      se_StrifeThings.Finalize;
      se_HereticThings.Initialize;
    end
    else if typ = idHexen then
    begin
      se_DoomThings.Finalize;
      se_HereticThings.Finalize;
      se_StrifeThings.Finalize;
      se_HexenThings.Initialize
    end
    else if typ in [idStrife, idStrife2] then
    begin
      se_DoomThings.Finalize;
      se_HereticThings.Finalize;
      se_HexenThings.Finalize;
      se_StrifeThings.Initialize;
    end;
  end;
{$ENDIF}

  ArrangeDuplicatedVertexes(lLineDefs, numLineDefs, lVertexes, numVertexes);

{$IFNDEF NO_DOOMTHINGS}
  if doThings then
    CacheMapTextures(AScene,
      MainWAD, PWAD, MapName,
      lSideDefs, numSideDefs,
      lSectors, numSectors,
      lTexturesInfo2, numTextures2,
      lThings, numThings,
      dir, numEntries,
      typ, PrepareOptimizer)
  else
    CacheMapTextures(AScene,
      MainWAD, PWAD, MapName,
      lSideDefs, numSideDefs,
      lSectors, numSectors,
      lTexturesInfo2, numTextures2,
      nil, -1,
      nil, -1,
      typ, PrepareOptimizer);
{$ELSE}
    CacheMapTextures(AScene,
      MainWAD, PWAD, MapName,
      lSideDefs, numSideDefs,
      lSectors, numSectors,
      lTexturesInfo2, numTextures2,
      typ, PrepareOptimizer);
{$ENDIF}

{ Δίνουμε αρχικές τιμές στις πληροφορίες για τα τετράγωνα }
  FillChar(Qinf, SizeOf(Qinf), Chr(0));
  Qinf.Key := GenGlobalID;

  ld := @lLineDefs[0];
  for i := 0 to numLineDefs - 1 do
  begin
    sd1num := ld.sidedef1;
    if (sd1num > - 1) and
       (sd1num < numSideDefs) then // Υπάρχει η πρώτη SideDef
    begin
      sd1 := @lSideDefs[sd1num];
      if IsValidTextureName(sd1.tex3) then // Αν υπάρχει normal texture
        MakeSideDefInfoSpecific_tex3(i, sd1num);
      if IsValidTextureName(sd1.tex1) or // Αν υπάρχουν Upper/Lower Textures
         IsValidTextureName(sd1.tex2) then
        MakeSideDefInfoSpecific_tex1_2(i, sd1num);
    end;

    sd2num := ld.sidedef2;
    if (sd2num > - 1) and
       (sd2num < numSideDefs) then // Υπάρχει η δεύτερη SideDef
    begin
      sd2 := @lSideDefs[sd2num];
      if IsValidTextureName(sd2.tex3) then
        MakeSideDefInfoSpecific_tex3(i, sd2num);
      if IsValidTextureName(sd2.tex1) or
         IsValidTextureName(sd2.tex2) then
        MakeSideDefInfoSpecific_tex1_2(i, sd2num);
    end;

    inc(ld);
  end;

{$IFNDEF NO_DOOMTHINGS}
  lCeilings := nil;
  lTriangles := nil;
  numTriangles := 0;
  curCeilHeight := 0.0;
{$ENDIF}

// Delete unused linedefs
// Δεν χρειάζεται να εξετάσουμε αν έχουν texture, τα texture τα κάναμε!
  pl := @lLineDefs[0];
  for i := 0 to numLineDefs - 1 do
  begin
    pls1 := pl.sidedef1;
    if pls1 > - 1 then
    begin
      pls2 := pl.sidedef2;
      if pls2 > - 1 then
      begin
        sec1 := lSideDefs[pls1].sector;
        if sec1 > -1 then
        begin
          sec2 := lSideDefs[pls2].sector;
          if sec1 = sec2 then
          begin
            lSideDefs[pls1].sector := -1;
            lSideDefs[pls2].sector := -1;
            pl.sidedef1 := -1;
            pl.sidedef2 := -1;
          end
(*
          else
          begin
            if DoomSectorsEqual(lSectors[sec1], lSectors[sec2]) then
            begin
              sec1 := Min(sec1, sec2);
              lSideDefs[pls1].sector := sec1;
              lSideDefs[pls2].sector := sec1;
{              pl.sidedef1 := -1;
              pl.sidedef2 := -1;}
            end;
          end;
*)
        end;
      end;
    end;
    inc(pl);
  end;

  numSectorsLines := GetSectorsLines(
    lLineDefs, numLineDefs, lSideDefs, numSideDefs, lSectorsLines);

{ Δίνουμε αρχικές τιμές στις πληροφορίες για τα πολύγωνα }
  FillChar(inf, SizeOf(inf), Chr(0));
  inf.key := GenGlobalId;
  inf.NumTextures := 1;
  inf.u := Factor / 64;
  inf.v := -Factor / 64;
  inf.du := 0.0;
  inf.dv := 0.0;
  inf.UseFlatUV := True;
//  inf.Transparency := MAXTRANSPARENCYREPLICATION;
  inf.Transparency := 0;
  inf.Cull := D3DCULL_NONE;

  GetMem(pointer(hollow), SizeOf(TDoomSectorLinesArray));
//  messagebox(getfocus, pchar(inttostr(SizeOf(TDoomSectorLinesArray))), '', mb_ok);
  for i := 0 to numSectors - 1 do
    MakeSector(i);
//MakeSector(39);
  FreeMem(pointer(hollow), SizeOf(TDoomSectorLinesArray));

{$IFNDEF NO_DOOMTHINGS}
  StartPositionFound := False;
  if doThings then
  begin
    FillChar(tinf, SizeOf(tinf), Chr(0));
    tinf.Key := GenGlobalID;
    tinf.zOrder := 0;
    tInf.C := clWhite;
    tInf.u := 1.0;
    tInf.v := 1.0;
    tInf.du := 0.0;
    tInf.dv := 0.0;
    tInf.Transparency := MAXTRANSPARENCYREPLICATION;
    tInf.Interval := 1.0;

    sStart := GetDirIndexOfEntry(rsS_START, dir, numEntries);
    sEnd := GetDirIndexOfEntry(rsS_END, dir, numEntries, sStart);

    GetMem(SpritesDir, (sEnd - sStart - 2) * SizeOf(TDoomDirEntry));

    numSpritesEntries := 0;
    for i := sStart + 1 to sEnd - 1 do
{//}      if dir[i].Name[5] in ['A', 'B', 'C', 'D'] then
      begin
        SpritesDir[numSpritesEntries] := dir[i];
        inc(numSpritesEntries);
      end;

    QuickSortDoomDirectory(SpritesDir, numSpritesEntries);

    if typ = idDoom then
    begin
      for i := 0 to numThings - 1 do
        MakeDoomThing(i);
//      DoomThings.Finalize;
    end
    else if typ = idHeretic then
    begin
      for i := 0 to numThings - 1 do
        MakeHereticThing(i);
//      HereticThings.Finalize;
    end
    else if typ = idHexen then
    begin
      for i := 0 to numThings - 1 do
        MakeHexenThing(i);
//      HexenThings.Finalize;
    end
    else if typ in [idStrife, idStrife2] then
    begin
      for i := 0 to numThings - 1 do
        MakeStrifeThing(i);
//      StrifeThings.Finalize;
    end;

    FreeMem(SpritesDir, (sEnd - sStart - 2) * SizeOf(TDoomDirEntry));

  end;


  if numTriangles > 0 then
  begin
    FreeMem(pointer(lTriangles));
    FreeMem(pointer(lCeilings));

//    FreeMem(pointer(lTriangles));
    numTriangles := 0;
  end;
{$ENDIF}

  ClearTextureData(lTexturesInfo, numTextures);
  ClearTextureData(lTexturesInfo2, numTextures2);

  FreeMem(pointer(lSectorsLines));

  if PrepareOptimizer then
    AScene.ReleaseUnusedObjects;

  FreeMem(pointer(tmp_GetSectorsLines), SizeOf(TDoomSectorLines));
  FreeMem(pointer(tmp_OrganizeSecondSectorSegment), SizeOf(TDoomSectorLines));
  FreeMem(pointer(tmp_MergeSectorSegments), SizeOf(TDoomSectorLines));

{$IFDEF DESIGNER}
  AScene.CanSaveUndo := oldSaveUndo;
{$ENDIF}
end;

{$IFNDEF NO_D3DSECTORCOLLECTIONS}
procedure GetSectorData(AScene: TD3DScene;
  MainWAD, PWAD: TFileName; MapName: string;
  Factor: integer = DEFDOOMIMPORTFACTOR; lFactor: Single = DEFDOOMIMPORTLFACTOR;
  doTextures: boolean = True);
var
  lThings: PDoomThings;
  numThings: integer;
  lLineDefs: PDoomLineDefs;
  numLineDefs: integer;
  lSideDefs: PDoomSideDefs;
  numSideDefs: integer;
  lVertexes: PDoomVertexes;
  numVertexes: integer;
  lSectors: PDoomSectors;
  numSectors: integer;
begin
  if PWAD = '' then
    PWAD := MainWAD;
  ReadMapData(PWAD, MapName,
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSectors, numSectors);
  GetSectorData(AScene,
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSectors, numSectors,
    MainWAD, PWAD, MapName,
    Factor, lFactor,
    doTextures);
  ClearMapData(
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSectors, numSectors);
end;

procedure GetSectorData(AScene: TD3DScene;
  var lThings: PDoomThings; var numThings: integer;
  var lLineDefs: PDoomLineDefs; var numLineDefs: integer;
  var lSideDefs: PDoomSideDefs; var numSideDefs: integer;
  var lVertexes: PDoomVertexes; var numVertexes: integer;
  var lSectors: PDoomSectors; var numSectors: integer;
  MainWAD, PWAD: TFileName; MapName: string;
  Factor: integer = DEFDOOMIMPORTFACTOR; lFactor: Single = DEFDOOMIMPORTLFACTOR;
  doTextures: boolean = True);
var
  i: integer;
  typ: TIdSoftWADType;
  inf: PD3DSectorCollectionInfo2;
  lTexturesInfo: PDoomTexturesInfo;
  numTextures: integer;
  numSprites: integer;
  cView_div_Factor: single;
  _16_div_Factor: single;
  _64_div_Factor: single;
  _Factor_div_64: single;
  pdv: PDoomVertex;
  PP: PSectorPoint;
  PP2: PSectorPoint;
  PS: PSector;
  PL: PSectorLineDef;
  PD: PSectorSideDef;
  pdd: PDoomSideDef;
  pdl: PDoomLineDef;
  pds: PDoomSector;
  sdi: integer;
{$IFDEF DESIGNER}
  oldSaveUndo: boolean;
{$ENDIF}

  function GetDoomObjectID(si: smallint): word;
  begin
    if si = -1 then
      Result := $FFFF
    else
      Result := word(si);
  end;

  function GetTexturePixelsPerUnit(tex: TDoomCharArray): TD3DValue;
  var
    local_i: integer;
    stex: string;
  begin
    Result := 1.0;
    if doTextures then
    begin
      local_i := 0;
      if numTextures > 0 then
      begin
        stex := DoomEntryName(tex);
        repeat
          if DoomEntryName(lTexturesInfo[local_i].Name) = stex then
          begin
            Result := Factor / lTexturesInfo[local_i].w;
            Exit;
          end;
          inc(local_i);
        until (local_i = numTextures);
      end;
    end;
  end;

begin
{$IFDEF DESIGNER}
  AScene.SaveUndo;
  oldSaveUndo := AScene.CanSaveUndo;
  AScene.CanSaveUndo := False;
{$ENDIF}
{ Διαβάζουμε τον χάρτη }
  typ := GetWADType(MainWAD);
  if doTextures then
    ReadTextureData(MainWAD, lTexturesInfo, typ,
      numTextures{$IFNDEF NO_DOOMTHINGS}, numSprites{$ENDIF});

  cView_div_Factor := cView / Factor;

  _16_div_Factor := 16 / Factor;
  _64_div_Factor := 64 / Factor;
  _Factor_div_64 := Factor / 64;

// Η τελευταία παράμετρος είναι False, δεν κάνουμε εισαγωγή stub runtime πολυγώνων,
// αυτό θα το κάνει η δημιουργία του SectorCollection (βλέπε: TD3DSectorCollection.MakeTheSurfaces;)
  if doTextures then
    CacheMapTextures(AScene,
      MainWAD, PWAD, MapName,
      lSideDefs, numSideDefs,
      lSectors, numSectors,
      lTexturesInfo, numTextures - numSprites,
{$IFNDEF NO_DOOMTHINGS}
      nil, -1,
      nil, -1,
{$ENDIF}
      typ, False);

  NewSectorCollectionInfo2(inf);
  try
    inf.Key := GenGlobalID;
    inf.x := 0;
    inf.y := 0;
    inf.z := 0;
    inf.dx := 0;
    inf.dy := 0;
    inf.dz := 0;
    inf.numPoints := 0;
    inf.numSideDefs := 0;
    inf.numLineDefs := 0;
    inf.numSectors := 0;
    inf.TexturePixelsPerUnit := 1.0;
    inf.CheckNavigation := True;
    inf.DrawTheObjects := True;

    ReallocMem(pointer(inf.Points), numVertexes * SizeOf(TSectorPoint));
    FillChar(inf.Points^, numVertexes * SizeOf(TSectorPoint), Chr(0));
    inf.numPoints := numVertexes;

    ReallocMem(pointer(inf.LineDefs), numLineDefs * SizeOf(TSectorLineDef));
    FillChar(inf.LineDefs^, numLineDefs * SizeOf(TSectorLineDef), Chr(0));
    inf.numLineDefs := numLineDefs;

    ReallocMem(pointer(inf.SideDefs), numSideDefs * SizeOf(TSectorSideDef));
    FillChar(inf.SideDefs^, numSideDefs * SizeOf(TSectorSideDef), Chr(0));
    inf.numSideDefs := numSideDefs;

    ReallocMem(pointer(inf.Sectors), numSectors * SizeOf(TSector));
    inf.numSectors := numSectors;

    PP := @inf.Points[0];
    pdv := @lVertexes[0];
    for i := 0 to numVertexes - 1 do
    begin
      PP.x := pdv.x / Factor;
      PP.y := pdv.y / Factor;
      inc(PP);
      inc(pdv);
    end;

    PL := @inf.LineDefs[0];
    pdl := @lLineDefs[0];
    for i := 0 to numLineDefs - 1 do
    begin
      PL.start := GetDoomObjectID(pdl.start);
      PL._End := GetDoomObjectID(pdl._End);
      PL.SideDef1 := GetDoomObjectID(pdl.sidedef1);
      PL.SideDef2 := GetDoomObjectID(pdl.sidedef2);
      PL.Transparent := (pdl.flags and 4) <> 0;
      sdi := PL.SideDef1;
      if sdi < inf.numSideDefs then
        inf.SideDefs[sdi].LineDef := i;
      sdi := PL.SideDef2;
      if sdi < inf.numSideDefs then
        inf.SideDefs[sdi].LineDef := i;
      inc(PL);
      inc(pdl);
    end;

    PD := @inf.SideDefs[0];
    pdd := @lSideDefs[0];
    for i := 0 to numSideDefs - 1 do
    begin
      PD.xoff := pdd.xoff / Factor;
      PD.yoff := pdd.yoff / Factor;
      PD.Sector := GetDoomObjectID(pdd.sector);
      PD.NavigationType := ntSlide;

      if doTextures then
      begin
        if DoomEntryName(pdd.tex1) <> '' then
          PD.TexturePixelsPerUnit := GetTexturePixelsPerUnit(pdd.tex1)
        else if DoomEntryName(pdd.tex2) <> '' then
          PD.TexturePixelsPerUnit := GetTexturePixelsPerUnit(pdd.tex2)
        else if DoomEntryName(lSideDefs[i].tex3) <> '' then
          PD.TexturePixelsPerUnit := GetTexturePixelsPerUnit(pdd.tex3)
        else
          PD.TexturePixelsPerUnit := 1.0;

        PD.tex1 :=
          GetWadTextureDescription(MainWAD, DoomEntryName(pdd.tex1));
        PD.tex2 :=
          GetWadTextureDescription(MainWAD, DoomEntryName(pdd.tex2));
        PD.tex3 :=
          GetWadTextureDescription(MainWAD, DoomEntryName(pdd.tex3));
      end
      else
      begin
        PD.TexturePixelsPerUnit := 1.0;
        if pdd.tex1[1] in ['-', #0] then
          PD.tex1 := ''
        else
          PD.tex1 := rsBlack;
        if pdd.tex2[1] in ['-', #0] then
          PD.tex2 := ''
        else
          PD.tex2 := rsBlack;
        if pdd.tex3[1] in ['-', #0] then
          PD.tex3 := ''
        else
          PD.tex3 := rsBlack;
      end;
      inc(PD);
      inc(pdd);
    end;

    pds := @lSectors[0];
    PS := @inf.Sectors[0];
    for i := 0 to numSectors - 1 do
    begin
      PS.floorh := pds.floorh * cView_div_Factor;
      PS.ceilh := pds.ceilh * cView_div_Factor;
      PS.floorC := GetSectorColor(pds.light, lFactor);
      PS.ceilC := PS.floorC;
      PS.AbsoluteFlat := True;
      if doTextures then
      begin
        PS.floort :=
          GetWadTextureDescription(MainWAD, DoomEntryName(pds.floort));
        PS.ceilt :=
          GetWadTextureDescription(MainWAD, DoomEntryName(pds.ceilt));
      end
      else
      begin
        PS.floort := rsBlack;
        PS.ceilt := rsBlack;
      end;
      PS.DrawSideDefs := True;
      PS.AllowWalkThru := True;
      PS.GravityBehaviour := True;
      PS.CheckFloorNavigation := True;
      PS.MinDistanceFromFloor := _64_div_Factor;
      PS.CheckCeilingNavigation := True;
      PS.MinDistanceFromCeiling := _16_div_Factor;
      PS.CheckWallsNavigation := True;
      PS.MinDistanceFromWalls := _16_div_Factor;
      PS.TexturePixelsPerUnit := _Factor_div_64;
      inc(PS);
      inc(pds);
    end;

    if doTextures then
    begin
      PL := @inf.LineDefs[0];
      for i := 0 to numLineDefs - 1 do
      begin
        PP := @inf.Points[PL.start];
        if PL.SideDef1 < inf.numSideDefs then
        begin
          PS := @inf.Sectors[inf.SideDefs[PL.SideDef1].Sector];
          PP.topColor :=
            PS.ceilC;
          PP.bottomColor :=
            PS.floorC;
          PP.top :=
            PS.ceilH;
          PP.bottom :=
            PS.floorH;
        end
        else if PL.SideDef2 < inf.numSideDefs then
        begin
          PS := @inf.Sectors[inf.SideDefs[PL.SideDef2].Sector];
          PP.topColor :=
            PS.ceilC;
          PP.bottomColor :=
            PS.floorC;
          PP.top :=
            PS.ceilH;
          PP.bottom :=
            PS.floorH;
        end
        else
        begin
          PP.topColor := clWhite;
          PP.bottomColor := clWhite;
          PP.top := 128 / lFactor;
          PP.bottom := 0.0;
  {        inf.Points[i].top := 128 / lFactor;
          inf.Points[i].bottom := 0.0;}
        end;
        PP2 := @inf.Points[PL._End];
        PP2.bottomColor :=
          PP.bottomColor;
        PP2.topColor :=
          PP.topColor;
        inc(PL);
      end;
    end;

    AScene.AddSurface(ID3D_SectorCollection, inf);

  finally
    disposeSectorCollectionInfo2(inf);
  end;

  if doTextures then
    ClearTextureData(lTexturesInfo, numTextures);
{$IFDEF DESIGNER}
  AScene.CanSaveUndo := oldSaveUndo;
{$ENDIF}
end;

procedure GetSectorData(inf: PD3DSectorCollectionInfo2;
  MainWAD, PWAD: TFileName; MapName: string;
  Factor: integer = DEFDOOMIMPORTFACTOR; lFactor: Single = DEFDOOMIMPORTLFACTOR); overload;
var
  lThings: PDoomThings;
  numThings: integer;
  lLineDefs: PDoomLineDefs;
  numLineDefs: integer;
  lSideDefs: PDoomSideDefs;
  numSideDefs: integer;
  lVertexes: PDoomVertexes;
  numVertexes: integer;
  lSectors: PDoomSectors;
  numSectors: integer;
  i: integer;
  lTexturesInfo: PDoomTexturesInfo;
  numTextures: integer;
  numSprites: integer;
  cView_div_Factor: single;
  plf: PSectorLineDef;
  psf: PSectorSideDef;
  pss: PSector;
  typ: TIDSoftWADType;

  function GetDoomObjectID(si: TIntValue): word;
  begin
    if si = -1 then
      Result := $FFFF
    else
      Result := word(si);
  end;

  function GetTexturePixelsPerUnit(tex: TDoomCharArray): TD3DValue;
  var
    local_i: integer;
  begin
    Result := 1.0;
    local_i := 0;
    if numTextures > 0 then
    repeat
      if DoomEntryName(lTexturesInfo[local_i].Name) = DoomEntryName(tex) then
      begin
        Result := Factor / lTexturesInfo[local_i].w;
        Exit;
      end;
      inc(local_i);
    until (local_i = numTextures);
  end;

begin
{ Διαβάζουμε τον χάρτη }
  if PWAD = '' then
    PWAD := MainWAD;
  ReadMapData(PWAD, MapName,
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSectors, numSectors);
    typ := GetWADType(MainWAD);
  ReadTextureData(MainWAD,
    lTexturesInfo, typ, numTextures, numSprites);

  cView_div_Factor := cView / Factor;

  inf.Key := GenGlobalID;
  inf.x := 0;
  inf.y := 0;
  inf.z := 0;
  inf.dx := 0;
  inf.dy := 0;
  inf.dz := 0;
  inf.numPoints := 0;
  inf.numSideDefs := 0;
  inf.numLineDefs := 0;
  inf.numSectors := 0;
  inf.TexturePixelsPerUnit := 1.0;
  inf.CheckNavigation := True;
  inf.DrawTheObjects := True;

  ReallocMem(pointer(inf.Points), numVertexes * SizeOf(TSectorPoint));
  inf.numPoints := numVertexes;

  ReallocMem(pointer(inf.LineDefs), numLineDefs * SizeOf(TSectorLineDef));
  inf.numLineDefs := numLineDefs;

  ReallocMem(pointer(inf.SideDefs), numSideDefs * SizeOf(TSectorSideDef));
  inf.numSideDefs := numSideDefs;

  ReallocMem(pointer(inf.Sectors), numSectors * SizeOf(TSector));
  inf.numSectors := numSectors;

  for i := 0 to numVertexes - 1 do
  begin
    inf.Points[i].x := lVertexes[i].x / Factor;
    inf.Points[i].y := lVertexes[i].y / Factor;
  end;

  plf := @inf.LineDefs[0];
  for i := 0 to numLineDefs - 1 do
  begin
    plf.start := GetDoomObjectID(lLineDefs[i].start);
    plf._End := GetDoomObjectID(lLineDefs[i]._End);
    plf.SideDef1 := GetDoomObjectID(lLineDefs[i].sidedef1);
    plf.SideDef2 := GetDoomObjectID(lLineDefs[i].sidedef2);
    plf.Transparent := (lLineDefs[i].flags and 4) <> 0;
    if plf.SideDef1 < inf.numSideDefs then
      inf.SideDefs[plf.SideDef1].LineDef := i;
    if plf.SideDef2 < inf.numSideDefs then
      inf.SideDefs[plf.SideDef2].LineDef := i;
    inc(plf);
  end;

  psf := @inf.SideDefs[0];
  for i := 0 to numSideDefs - 1 do
  begin
    psf.xoff := lSideDefs[i].xoff / Factor;
    psf.yoff := lSideDefs[i].yoff / Factor;
    psf.Sector := GetDoomObjectID(lSideDefs[i].sector);
    psf.NavigationType := ntSlide;

    if DoomEntryName(lSideDefs[i].tex1) <> '' then
      psf.TexturePixelsPerUnit := GetTexturePixelsPerUnit(lSideDefs[i].tex1)
    else if DoomEntryName(lSideDefs[i].tex2) <> '' then
      psf.TexturePixelsPerUnit := GetTexturePixelsPerUnit(lSideDefs[i].tex2)
    else if DoomEntryName(lSideDefs[i].tex3) <> '' then
      psf.TexturePixelsPerUnit := GetTexturePixelsPerUnit(lSideDefs[i].tex3)
    else
      psf.TexturePixelsPerUnit := 1.0;

    psf.tex1 :=
      GetWadTextureDescription(MainWAD, DoomEntryName(lSideDefs[i].tex1));
    psf.tex2 :=
      GetWadTextureDescription(MainWAD, DoomEntryName(lSideDefs[i].tex2));
    psf.tex3 :=
      GetWadTextureDescription(MainWAD, DoomEntryName(lSideDefs[i].tex3));
    inc(psf);
  end;

  pss := @inf.Sectors[0];
  for i := 0 to numSectors - 1 do
  begin
    pss.floorh := lSectors[i].floorh  * cView_div_Factor;
    pss.ceilh := lSectors[i].ceilh  * cView_div_Factor;
    pss.floorC := GetSectorColor(lSectors[i].light, lFactor);
    pss.ceilC := inf.Sectors[i].floorC;
    pss.AbsoluteFlat := True;
    pss.floort :=
      GetWadTextureDescription(MainWAD, DoomEntryName(lSectors[i].floort));
    pss.ceilt :=
      GetWadTextureDescription(MainWAD, DoomEntryName(lSectors[i].ceilt));
    pss.DrawSideDefs := True;
    pss.AllowWalkThru := True;
    pss.GravityBehaviour := True;
    pss.CheckFloorNavigation := True;
    pss.MinDistanceFromFloor := 64 / Factor;
    pss.CheckCeilingNavigation := True;
    pss.MinDistanceFromCeiling := 16 / Factor;
    pss.CheckWallsNavigation := True;
    pss.MinDistanceFromWalls := 16 / Factor;
    pss.TexturePixelsPerUnit := Factor / 64;
    inc(pss);
  end;

  plf := @inf.LineDefs[0];
  for i := 0 to numLineDefs - 1 do
  begin
    if plf.SideDef1 < inf.numSideDefs then
    begin
      inf.Points[plf.start].topColor :=
        inf.Sectors[inf.SideDefs[plf.SideDef1].Sector].ceilC;
      inf.Points[plf.start].bottomColor :=
        inf.Sectors[inf.SideDefs[plf.SideDef1].Sector].floorC;
      inf.Points[plf.start].top :=
        inf.Sectors[inf.SideDefs[plf.SideDef1].Sector].ceilH;
      inf.Points[plf.start].bottom :=
        inf.Sectors[inf.SideDefs[plf.SideDef1].Sector].floorH;
    end
    else if plf.SideDef2 < inf.numSideDefs then
    begin
      inf.Points[plf.start].topColor :=
        inf.Sectors[inf.SideDefs[plf.SideDef2].Sector].ceilC;
      inf.Points[plf.start].bottomColor :=
        inf.Sectors[inf.SideDefs[plf.SideDef2].Sector].floorC;
      inf.Points[plf.start].top :=
        inf.Sectors[inf.SideDefs[plf.SideDef2].Sector].ceilH;
      inf.Points[plf.start].bottom :=
        inf.Sectors[inf.SideDefs[plf.SideDef2].Sector].floorH;
    end
    else
    begin
      inf.Points[plf.start].topColor := clWhite;
      inf.Points[plf.start].bottomColor := clWhite;
      inf.Points[plf.start].top := 128 / lFactor;
      inf.Points[plf.start].bottom := 0.0;
    end;
    inf.Points[plf._End].bottomColor :=
      inf.Points[plf.start].bottomColor;
    inf.Points[plf._End].topColor :=
      inf.Points[plf.start].topColor;
    inc(plf);
  end;

  ClearTextureData(lTexturesInfo, numTextures);
  ClearMapData(
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSectors, numSectors);

end;
{$ENDIF}

procedure Preview2DWADMap(
  lLineDefs: PDoomLineDefs; numLineDefs: integer;
  lVertexes: PDoomVertexes; numVertexes: integer;
  lSegs: PDoomSegs; numSegs: integer;
  lSubSectors: PDoomSubSectors; numSubSectors: integer;
  bmp: TBitmap; fScale: single = 1.0); overload;
begin
  Preview2DWADMap(lLineDefs, numLineDefs, lVertexes, numVertexes,
                  lSegs, numSegs, lSubSectors, numSubSectors,
                  bmp.Canvas, bmp.Width, bmp.Height, fScale);
end;

procedure Preview2DWADMap(
  lLineDefs: PDoomLineDefs; numLineDefs: integer;
  lVertexes: PDoomVertexes; numVertexes: integer;
  lSegs: PDoomSegs; numSegs: integer;
  lSubSectors: PDoomSubSectors; numSubSectors: integer;
  C: TCanvas; X, Y: integer; fScale: single = 1.0); overload;
const
  c_BackColor = clBlack;
  c_LineColor = clRed;
  c_VertexColor = clYellow;
  c_SegColor = clLime;
var
  i, j: integer;
  minX, minY, maxX, maxY: integer;
  xx, yy: integer;
  Scale: double;
  cx, cy: single; // Το κέντρο ενός subsector
  cxPixel, cyPixel: integer;
  offsX: integer;
  offsY: integer;
  pdl: PDoomLineDef;
  pdv: PDoomVertex;

  function xPixel(xp: single): integer;
  begin
    try
      Result := round(fScale * Scale * (xp - MinX)) + offsX
    except
      Result := 0;
    end;
  end;

  function yPixel(yp: single): integer;
  begin
    try
      Result := round(fScale * (Y - Scale * (yp - MinY))) + offsY
    except
      Result := 0;
    end;
  end;

begin
  minX :=  32767;
  minY :=  32767;
  maxX := -32768;
  maxY := -32768;

  // Βρίσκουμε το bounding rectangle του χάρτη
  pdl := @lLineDefs[0];
  for i := 0 to numLineDefs - 1 do
  begin
    pdv := @lVertexes[pdl.Start];
    xx := pdv.x;
    yy := pdv.y;
    if xx < minX then
      minX := xx;
    if xx > maxX then
      maxX := xx;
    if yy < minY then
      minY := yy;
    if yy > maxY then
      maxY := yy;
    inc(pdl);
  end;
  dec(minX); dec(minY);
  inc(maxX); inc(maxY);

  Scale := Min((X - 1) / (maxX - minX), (Y - 1) / (maxY - minY));
  try
    offsX := (X - round(fScale * Scale * (maxX - minX) - 0.501)) div 2;
  except
    offsX := 0;
  end;
  try
    offsY := (Y - round(fScale * Scale * (maxY - minY) - 0.501)) div 2;
  except
    offsY := 0;
  end;

// Γεμίζουμε το background με c_BackColor
  C.Brush.Color := c_BackColor;
  C.Brush.Style := bsSolid;
  C.FillRect(Rect(0, 0, X, Y));

  C.Pen.Color := c_LineColor;
  C.Pen.Style := psSolid;
// Σχεδιάζουμε τις γραμμές
  pdl := @lLineDefs[0];
  for i := 0 to numLineDefs - 1 do
  begin
    pdv := @lVertexes[pdl.Start];
    C.MoveTo(
      xPixel(pdv.x),
      yPixel(pdv.y));
    pdv := @lVertexes[pdl._End];
    C.LineTo(
      xPixel(pdv.x),
      yPixel(pdv.y));
    inc(pdl)
  end;

// Σχεδιάζουμε τα Segs
  C.Pen.Color := c_SegColor;
  C.Pen.Style := psDot;
  for i := 0 to numSubSectors - 1 do
  begin
    GetSubSectorCenter(
      lVertexes, lSegs, lSubSectors, i, cx, cy);
    cxPixel := xPixel(cx);
    cyPixel := yPixel(cy);

//    C.Pen.Color := RGB((cxPixel mod 192) + 63, 255, (cyPixel mod 192) + 63);

    xx := lSubSectors[i].firstseg;
    for j := xx to xx + lSubSectors[i].numsegs - 1 do
    begin
      C.MoveTo(cxPixel, cyPixel);
      pdv := @lVertexes[lSegs[j].v1];
      C.LineTo(xPixel(pdv.x),
               yPixel(pdv.y));

      C.MoveTo(cxPixel, cyPixel);
      pdv := @lVertexes[lSegs[j].v2];
      C.LineTo(xPixel(pdv.x),
               yPixel(pdv.y));
    end;
  end;

// Σχεδιάζουμε τα σημεία
  for i := 0 to numVertexes - 1 do
    C.Pixels[xPixel(lVertexes[i].x), yPixel(lVertexes[i].y)] := c_VertexColor;
end;

procedure Preview2DWADMap(FileName: TFileName; MapName: string;
  C: TCanvas; X, Y: integer; fScale: single = 1.0);
var
  lThings: PDoomThings;
  numThings: integer;
  lLineDefs: PDoomLineDefs;
  numLineDefs: integer;
  lSideDefs: PDoomSideDefs;
  numSideDefs: integer;
  lVertexes: PDoomVertexes;
  numVertexes: integer;
  lSegs: PDoomSegs;
  numSegs: integer;
  lSubSectors: PDoomSubSectors;
  numSubSectors: integer;
  lSectors: PDoomSectors;
  numSectors: integer;
begin
  ReadMapData(FileName, MapName,
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSegs, numSegs,
    lSubSectors, numSubSectors,
    lSectors, numSectors);

  Preview2DWADMap(lLineDefs, numLineDefs, lVertexes, numVertexes,
                  lSegs, numSegs, lSubSectors, numSubSectors,
                  C, X, Y, fScale);

  ClearMapData(
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSegs, numSegs,
    lSubSectors, numSubSectors,
    lSectors, numSectors);
end;

//----------

procedure Preview2DWADMap(
  lLineDefs: PDoomLineDefs; numLineDefs: integer;
  lVertexes: PDoomVertexes; numVertexes: integer;
  lSegs: PDoomSegs; numSegs: integer;
  lSubSectors: PDoomSubSectors; numSubSectors: integer;
  bmp: TBitmap; var xShift, yShift: single; fScale: single = 1.0;
  doSegments: boolean = False);
begin
  Preview2DWADMap(lLineDefs, numLineDefs, lVertexes, numVertexes,
                  lSegs, numSegs, lSubSectors, numSubSectors,
                  bmp.Canvas, bmp.Width, bmp.Height, xShift, yShift,
                  fScale, doSegments);
end;

procedure Preview2DWADMap(
  lLineDefs: PDoomLineDefs; numLineDefs: integer;
  lVertexes: PDoomVertexes; numVertexes: integer;
  lSegs: PDoomSegs; numSegs: integer;
  lSubSectors: PDoomSubSectors; numSubSectors: integer;
  C: TCanvas; X, Y: integer;
  var xShift, yShift: single; fScale: single = 1.0;
  doSegments: boolean = False);
const
  c_BackColor = clBlack;
  c_LineColor = clRed;
  c_SecretLineColor = clYellow;
  c_TwoSidedLineColor = clGray;
  c_TaggedLineColor = $FF00FF;
  c_VertexColor = clLime; //clYellow;
  c_SegColor = clLime;
var
  i, j: integer;
  minX, minY, maxX, maxY: integer;
  xx, yy: integer;
  Scale: double;
  cx, cy: single; // Το κέντρο ενός subsector
  cxPixel, cyPixel: integer;
  offsX: integer;
  offsY: integer;
  pdl: PDoomLineDef;
  pdv: PDoomVertex;
  pss: PDoomSubSector;
  tmp: single;

  function xPixel(const xp: integer): integer;
  var
    xx: integer;
  begin
    xx := xp - MinX;
    try
      Result := trunc(Scale * xx) + offsX;
    except
      try
        Result := round(Scale * xx) + offsX;
      except
        Result := 0;
      end;
    end;
  end;

  function yPixel(const yp: integer): integer;
  var
    yy: integer;
  begin
    yy := yp - MinY;
    try
      Result := Y - (trunc(Scale * yy) + offsY);
    except
      try
        Result := Y - (trunc(Scale * yy) + offsY);
      except
        Result := 0;
      end;
    end;
  end;


begin
  minX :=  32767;
  minY :=  32767;
  maxX := -32768;
  maxY := -32768;

  // Βρίσκουμε το bounding rectangle του χάρτη
  pdl := @lLineDefs[0];
  for i := 0 to numLineDefs - 1 do
  begin
    pdv := @lVertexes[pdl.Start];
    xx := pdv.x;
    yy := pdv.y;
    if xx < minX then
      minX := xx;
    if xx > maxX then
      maxX := xx;
    if yy < minY then
      minY := yy;
    if yy > maxY then
      maxY := yy;
    inc(pdl);
  end;
  dec(minX); dec(minY);
  inc(maxX); inc(maxY);

{
  Scale := Min((X - 1) / (maxX - minX), (Y - 1) / (maxY - minY));
  try
    offsX := (X - round(fScale * Scale * (maxX - minX) - 0.501)) div 2;
  except
    offsX := 0;
  end;
  try
    offsY := (Y - round(fScale * Scale * (maxY - minY) - 0.501)) div 2;
  except
    offsY := 0;
  end;

  tmp := Scale * (MaxX - MinX) / 2;
  if xShift > tmp then
    xShift := tmp
  else if xShift < -tmp then
    xShift := -tmp;

  offsX := offsX - round(xShift);

  tmp := Scale * (MaxY - MinY) / 2;
  if yShift > tmp then
    yShift := tmp
  else if yShift < -tmp then
    yShift := -tmp;

  offsY := offsY - round(yShift);}
  Scale := fScale * Min((X - 1) / (maxX - minX), (Y - 1) / (maxY - minY));
  try
    offsX := (X - round(Scale * (maxX - minX) - 0.501)) div 2;
  except
    offsX := 0;
  end;
  try
    offsY := (Y - round(Scale * (maxY - minY) - 0.501)) div 2;
  except
    offsY := 0;
  end;

  tmp := Scale * (MaxX - MinX) / 2;
  if xShift > tmp then
    xShift := tmp
  else if xShift < -tmp then
    xShift := -tmp;

  offsX := offsX - round(xShift);

  tmp := Scale * (MaxY - MinY) / 2;
  if yShift > tmp then
    yShift := tmp
  else if yShift < -tmp then
    yShift := -tmp;

  offsY := offsY - round(yShift);


// Γεμίζουμε το background με c_BackColor
  C.Brush.Color := c_BackColor;
  C.Brush.Style := bsSolid;
  C.FillRect(Rect(0, 0, X, Y));

  C.Pen.Style := psSolid;
// Σχεδιάζουμε τις γραμμές
  pdl := @lLineDefs[0];
  for i := 0 to numLineDefs - 1 do
  begin
    if pdl.tag <> 0 then
      C.Pen.Color := c_TaggedLineColor
    else if (pdl.flags and ML_SECRET) <> 0 then // secret door
      C.Pen.Color := c_SecretLineColor
    else if (pdl.flags and ML_TWOSIDED) <> 0 then
      C.Pen.Color := c_TwoSidedLineColor
    else
      C.Pen.Color := c_LineColor;
    pdv := @lVertexes[pdl.Start];
    C.MoveTo(
      xPixel(pdv.x),
      yPixel(pdv.y));
    pdv := @lVertexes[pdl._End];
    C.LineTo(
      xPixel(pdv.x),
      yPixel(pdv.y));
    inc(pdl)
  end;

  if doSegments then
  begin
// Σχεδιάζουμε τα Segs
    C.Pen.Color := c_SegColor;
    C.Pen.Style := psDot;
    pss := @lSubSectors[0];
    for i := 0 to numSubSectors - 1 do
    begin
      GetSubSectorCenter(
        lVertexes, lSegs, lSubSectors, i, cx, cy);
      cxPixel := xPixel(round(cx));
      cyPixel := yPixel(round(cy));

      xx := pss.firstseg;
      for j := xx to xx + pss.numsegs - 1 do
      begin
        C.MoveTo(cxPixel, cyPixel);
        pdv := @lVertexes[lSegs[j].v1];
        C.LineTo(xPixel(pdv.x),
                 yPixel(pdv.y));

        C.MoveTo(cxPixel, cyPixel);
        pdv := @lVertexes[lSegs[j].v2];
        C.LineTo(xPixel(pdv.x),
                 yPixel(pdv.y));
      end;
      inc(pss);
    end;
  end;

// Σχεδιάζουμε τα σημεία
  pdv := @lVertexes[0];
  if fScale < 3.0 then
  begin
    for i := 0 to numVertexes - 1 do
    begin
      C.Pixels[xPixel(pdv.x), yPixel(pdv.y)] := c_VertexColor;
      inc(pdv);
    end;
  end
  else if fScale < 8.0 then
  begin
    for i := 0 to numVertexes - 1 do
    begin
      xx := xPixel(pdv.x);
      yy := yPixel(pdv.y);
      if (xx > 0) and (yy > 0) and (xx < X) and (yy < Y) then
      begin
        C.Pixels[xx - 1, yy] := c_VertexColor;
        C.Pixels[xx, yy - 1] := c_VertexColor;
        C.Pixels[xx + 1, yy] := c_VertexColor;
        C.Pixels[xx, yy + 1] := c_VertexColor;
      end;
      inc(pdv);
    end;
  end
  else
  begin
    for i := 0 to numVertexes - 1 do
    begin
      xx := xPixel(pdv.x);
      yy := yPixel(pdv.y);
      if (xx > 0) and (yy > 0) and (xx < X) and (yy < Y) then
      begin
        C.Pixels[xx - 1, yy - 1] := c_VertexColor;
        C.Pixels[xx - 1, yy] := c_VertexColor;
        C.Pixels[xx - 1, yy + 1] := c_VertexColor;
        C.Pixels[xx, yy - 1] := c_VertexColor;
        C.Pixels[xx, yy + 1] := c_VertexColor;
        C.Pixels[xx + 1, yy - 1] := c_VertexColor;
        C.Pixels[xx + 1, yy] := c_VertexColor;
        C.Pixels[xx + 1, yy + 1] := c_VertexColor;
      end;
      inc(pdv);
    end;
  end;
end;

procedure Preview2DWADMap(FileName: TFileName; MapName: string;
  C: TCanvas; X, Y: integer; var xShift, yShift: single; fScale: single = 1.0);
var
  lThings: PDoomThings;
  numThings: integer;
  lLineDefs: PDoomLineDefs;
  numLineDefs: integer;
  lSideDefs: PDoomSideDefs;
  numSideDefs: integer;
  lVertexes: PDoomVertexes;
  numVertexes: integer;
  lSegs: PDoomSegs;
  numSegs: integer;
  lSubSectors: PDoomSubSectors;
  numSubSectors: integer;
  lSectors: PDoomSectors;
  numSectors: integer;
begin
  ReadMapData(FileName, MapName,
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSegs, numSegs,
    lSubSectors, numSubSectors,
    lSectors, numSectors);

  Preview2DWADMap(lLineDefs, numLineDefs, lVertexes, numVertexes,
                  lSegs, numSegs, lSubSectors, numSubSectors,
                  C, X, Y, xShift, yShift, fScale);

  ClearMapData(
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSegs, numSegs,
    lSubSectors, numSubSectors,
    lSectors, numSectors);
end;

procedure CacheWADTextures(AScene: TD3DScene; MainWAD, PWAD: TFileName;
  TextureNames: TDXStringList;
  dir: PDoomDirectory = nil; numEntries: integer = -1;
  wadType: TIDSoftWADType = idUnknown;
  lTexturesInfo: PDoomTexturesInfo = nil;
  numTextures: integer = -1);
begin
  AScene.CacheIDWADTextures(MainWAD, PWAD, TextureNames, False,
    {$IFNDEF DOOMVIEWER} '', {$ENDIF}
    dir, numEntries, wadType, lTexturesInfo, numTextures, nil, True);
  AScene.AddTextureToCollectionConst(rsBlack);
  AScene.AddTextureToCollectionConst(rsWhite);
  AScene.AddTextureToCollectionConst(rsInvalid);
  AScene.Textures.Sorted := True;
end;

initialization

finalization
  FreeWADDIRCache;

{$ENDIF}
end.

