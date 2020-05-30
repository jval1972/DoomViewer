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
//  Doom Engine structs
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//------------------------------------------------------------------------------

{$I defs.inc}

unit se_DoomTypes;

interface

const
  DEFDOOMIMPORTFACTOR = 32;
  DEFDOOMIMPORTLFACTOR = 0.3;
  DEFTOLERANCE = 0.001;
  cView: single = 4/3;
  MAXWALLSIZE = 64000;

type
  TPalEntry = packed record
    r, g ,b: byte;
  end;
  PPalEntry = ^TPalEntry;

  TDoomPalette = packed array[0..255] of TPalEntry;
  PDoomPalette = ^TDoomPalette;

// Για ανάγνωση τοίχων
  POffsetList = ^TOffsetList;
  TOffsetList = array[0..320] of integer;
  TSpDim = record
    case integer of
    0: (
        xsize: smallInt;
        ysize: smallInt;
        xOffs: smallInt;
        yOffs: smallInt;
       );
    1: (
        dimentions: integer;
        offsets: integer;
       );     
  end;

// Ο τύπος του αρχείου WAD:
  TIDSoftWADType = (idDoom,    // Doom
                    idHeretic, // Heretic
                    idHexen,   // Hexen
                    idStrife,  // Strife old format
                    idStrife2, // Strife
                    idNew,     // MSADoom
                    idUnknown, // Αγνώστου τύπου WAD της ID Soft
                    idInvalid, // Ακατάλληλου τύπου
                    idVJ);     // Πιθανόν WAD δικού μου format

  TDoomCharArray = array[1..8] of char;
  PDoomCharArray = ^TDoomCharArray;

  TDoomCharArray2Integers = array[0..1] of integer;
  PDoomCharArray2Integers = ^TDoomCharArray2Integers;

  TDoomCharArray8Bytes = array[1..8] of byte;
  PDoomCharArray8Bytes = ^TDoomCharArray8Bytes;

  TPatchNames = array[0..$FFFE] of TDoomCharArray;
  PPatchNames = ^TPatchNames;

  PDoomThing = ^TDoomThing;
  TDoomThing = packed record
    case integer of
      0: (
          xpos: SmallInt;  // x position
          ypos: SmallInt;  // y position
          angle: SmallInt; // facing angle
          _type: SmallInt; // thing type
          when: SmallInt;  // appears when?
         );
      1: (
          xpos_ypos: integer;  // x + y position
          angle_type: integer;  // facing angle + thing type
          when2: SmallInt;  // appears when?
         ); 
  end;
  PDoomThings = ^TDoomThings;
  TDoomThings = array[0..$FFFE] of TDoomThing;

  PHexenThing = ^THexenThing;
  THexenThing = packed record
    case integer of
      0: (
          foo1: SmallInt;  // FILLER
          xpos: SmallInt;  // x position
          ypos: SmallInt;  // y position
          foo2: SmallInt;  // FILLER
          angle: SmallInt; // facing angle
          _type: SmallInt; // thing type
          when: SmallInt;  // appears when?
          foo3: SmallInt;  // FILLER
          foo4: SmallInt;  // FILLER
          foo5: SmallInt;  // FILLER
         );
      1: (foo6: SmallInt;
          xpos_ypos: integer;
          foo7: SmallInt;
          angle_type: integer;  // facing angle + thing type
          foo8: integer;
          foo9: integer;
         );
  end;
  PHexenThings = ^THexenThings;
  THexenThings = array[0..$FFFE] of THexenThing;

// This data structure contains the information about the LINEDEFS

  PDoomLineDef = ^TDoomLineDef;
  TDoomLineDef = packed record
    case integer of
      0: (
          start: SmallInt;    // from this vertex ...
          _end: SmallInt;     // ... to this vertex
          flags: SmallInt;    // see NAMES.C for more info
          _type: SmallInt;    // see NAMES.C for more info
          tag: SmallInt;      // crossing this linedef activates the sector with the same tag
          sidedef1: SmallInt; // sidedef
          sidedef2: SmallInt; // only if this line adjoins 2 sectors
         );
      1: (
          start_end: integer;
          flags2: SmallInt;
          type_tag: integer;
          sidedefs: integer;
         );
  end;
  PDoomLineDefs = ^TDoomLineDefs;
  TDoomLineDefs = array[0..$FFFE] of TDoomLineDef;

const // Linedefs constants
// Solid, is an obstacle.
  ML_BLOCKING = 1;

// Blocks monsters only.
  ML_BLOCKMONSTERS = 2;

// Backside will not be present at all
//  if not two sided.
  ML_TWOSIDED = 4;

// If a texture is pegged, the texture will have
// the end exposed to air held constant at the
// top or bottom of the texture (stairs or pulled
// down things) and will move with a height change
// of one of the neighbor sectors.
// Unpegged textures allways have the first row of
// the texture at the top pixel of the line for both
// top and bottom textures (use next to windows).

// upper texture unpegged
  ML_DONTPEGTOP = 8;

// lower texture unpegged
  ML_DONTPEGBOTTOM = 16;

// In AutoMap: don't map as two sided: IT'S A SECRET!
  ML_SECRET = 32;

// Sound rendering: don't let sound cross two of these.
  ML_SOUNDBLOCK = 64;

// Don't draw on the automap at all.
  ML_DONTDRAW = 128;

// Set if already seen, thus drawn in automap.
  ML_MAPPED = 256;

type  
  PHexenLineDef = ^THexenLineDef;
  THexenLineDef = packed record
    case integer of
      0: (
          start: SmallInt;    // from this vertex ...
          _end: SmallInt;     // ... to this vertex
          flags: SmallInt;    // see NAMES.C for more info
          foo1: SmallInt;     // FILLER
          _type: SmallInt;    // see NAMES.C for more info
          tag: SmallInt;      // crossing this linedef activates the sector with the same tag
          sidedef1: SmallInt; // sidedef
          sidedef2: SmallInt; // only if this line adjoins 2 sectors
         );
      1: (
          start_end: integer;
          flags2: SmallInt;
          foo2: SmallInt;
          type_tag: integer;
          sidedefs: integer;
         );
  end;
  PHexenLineDefs = ^THexenLineDefs;
  THexenLineDefs = array[0..$FFFE] of THexenLineDef;

// This data structure contains the information about the SIDEDEFS

  PDoomSideDef = ^TDoomSideDef;
  TDoomSideDef = record
    xoff: SmallInt;            // X offset for texture
    yoff: SmallInt;            // Y offset for texture
    tex1: TDoomCharArray;      // texture name for the part above
    tex2: TDoomCharArray;      // texture name for the part below
    tex3: TDoomCharArray;      // texture name for the regular part
    sector: SmallInt;          // adjacent sector
  end;
  PDoomSideDefs = ^TDoomSideDefs;
  TDoomSideDefs = array[0..$FFFE] of TDoomSideDef;

// This data structure contains the information about the VERTEXES

  PDoomVertex = ^TDoomVertex;
  TDoomVertex = record
    case integer of
      0: (
          x: SmallInt; // X coordinate
          y: SmallInt; // Y coordinate
         );
      1: (
          x_y: integer;
         ); 
  end;
  PDoomVertexes = ^TDoomVertexes;
  TDoomVertexes = array[0..$FFFE] of TDoomVertex;

// This data structure contains the information about the SECTORS

  PDoomSector = ^TDoomSector;
  TDoomSector = packed record
    case integer of
      0: (
          floorh: SmallInt;        // floor height
          ceilh: SmallInt;         // ceiling height
          floort: TDoomCharArray;  // floor texture
          ceilt: TDoomCharArray;   // ceiling texture
          light: SmallInt;         // light level (0-255)
          special: SmallInt;       // special behaviour (0 = normal, 9 = secret, ...)
          tag: SmallInt;           // sector activated by a linedef with the same tag
         );
      1: (
          check1: integer;
          check2: integer;
          check3: integer;
          check4: integer;
          check5: integer;
          check6: smallint;
          foo1: integer
         ); 
  end;
  PDoomSectors = ^TDoomSectors;
  TDoomSectors = array[0..$FFFE] of TDoomSector;

  PDoomSubSector = ^TDoomSubSector;
  TDoomSubSector = record
    numsegs: SmallInt;
    firstseg: SmallInt; // Index of first one, segs are stored sequentially.
  end;
  PDoomSubSectors = ^TDoomSubSectors;
  TDoomSubSectors = array[0..$FFFE] of TDoomSubSector;

  PDoomSeg = ^TDoomSeg;
  TDoomSeg = record
    v1: SmallInt;      // from this vertex ...
    v2: SmallInt;      // ... to this vertex
    angle: word;       // angle (0 = east, 16384 = north, ...)
    linedef: SmallInt; // linedef that this seg goes along
    flip: SmallInt;    // true if not the same direction as linedef
    dist: word;        // distance from starting point
  end;
  PDoomSegs = ^TDoomSegs;
  TDoomSegs = array[0..$FFFE] of TDoomSeg;

  PDoomDirEntry = ^TDoomDirEntry;
  TDoomDirEntry = record
    case integer of
      0: (position: Integer;      // Θέση στο αρχείο
          size: Integer;          // Μέγεθος
          Name: TDoomCharArray);  // Όνομα
      1: (position1: Integer;     // Θέση στο αρχείο
          size1: Integer;         // Μέγεθος
          intName1: Integer;      // Όνομα
          intName2: Integer);     // Όνομα
  end;
  PDoomDirectory = ^TDoomDirectory;
  TDoomDirectory = array[0..$FFFE] of TDoomDirEntry;

  PDoomTextureInfo = ^TDoomTextureInfo;
  TDoomTextureInfo = packed record
    Name: TDoomCharArray;
    fields: smallint;
    case integer of
     1: (texofs: integer; dimentions: integer;);
     2: (xOffs, yOffs: SmallInt; w, h: SmallInt);
  end;
  PDoomTexturesInfo = ^TDoomTexturesInfo;
  TDoomTexturesInfo = array[0..$FFFE] of TDoomTextureInfo;

implementation

end.
 