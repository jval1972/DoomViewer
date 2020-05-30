//------------------------------------------------------------------------------
//
//  DoomViewer: Map Viewer for the games Doom, Heretic, Hexen & Strife.
//  Copyright (C) 2003-2018 by Jim Valavanis
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
//  Utility functions
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//  New site: https://sourceforge.net/projects/doomviewer/
//  Old Site: http://www.geocities.ws/jimmyvalavanis/applications/doomviewer.html
//------------------------------------------------------------------------------

unit dv_delphi;

interface

////////////////////////////////////////////////////////////////////////////////

function boolval(const x: integer): boolean; overload;

function boolval(const c: char): boolean; overload;

function boolval(const p: pointer): boolean; overload;

////////////////////////////////////////////////////////////////////////////////

function _SHL(const x: integer; const bits: integer): integer;

function _SHLW(const x: LongWord; const bits: LongWord): LongWord;

function _SHR(const x: integer; const bits: integer): integer;

function _SHRW(const x: LongWord; const bits: LongWord): LongWord;

////////////////////////////////////////////////////////////////////////////////

function strupper(const S: string): string;

function toupper(ch: Char): Char;

function tolower(ch: Char): Char;

////////////////////////////////////////////////////////////////////////////////

function fexists(const filename: string): boolean;

procedure fdelete(const filename: string);

////////////////////////////////////////////////////////////////////////////////

implementation

uses
  SysUtils;

////////////////////////////////////////////////////////////////////////////////

function boolval(const x: integer): boolean;
begin
  result := x <> 0;
end;

function boolval(const c: char): boolean;
begin
  result := c <> #0;
end;

function boolval(const p: pointer): boolean;
begin
  result := p <> nil;
end;

////////////////////////////////////////////////////////////////////////////////

function _SHL(const x: integer; const bits: integer): integer;
begin
  result := x * (1 shl bits);
end;

function _SHLW(const x: LongWord; const bits: LongWord): LongWord;
begin
//  result := x * (1 shl bits);
  result := x shl bits;
end;

function _SHR(const x: integer; const bits: integer): integer;
begin
  result := x div (1 shl bits);
end;

function _SHRW(const x: LongWord; const bits: LongWord): LongWord;
begin
//  result := x div (1 shl bits);
  result := x shr bits;
end;

////////////////////////////////////////////////////////////////////////////////

function strupper(const S: string): string;
var
  Ch: Char;
  L: Integer;
  Source, Dest: PChar;
begin
  L := Length(S);
  SetLength(Result, L);
  Source := Pointer(S);
  Dest := Pointer(Result);
  while L <> 0 do
  begin
    Ch := Source^;
    if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);
    Dest^ := Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  end;
end;


function toupper(ch: Char): Char;
asm
{ ->    AL      Character       }
{ <-    AL      Result          }

        CMP     AL,'a'
        JB      @@exit
        CMP     AL,'z'
        JA      @@exit
        SUB     AL,'a' - 'A'
@@exit:
end;

function tolower(ch: Char): Char;
asm
{ ->    AL      Character       }
{ <-    AL      Result          }

        CMP     AL,'A'
        JB      @@exit
        CMP     AL,'Z'
        JA      @@exit
        SUB     AL,'A' - 'a'
@@exit:
end;

////////////////////////////////////////////////////////////////////////////////

function fexists(const filename: string): boolean;
begin
  result := FileExists(filename);
end;

procedure fdelete(const filename: string);
begin
  if fexists(filename) then
    DeleteFile(filename);
end;

////////////////////////////////////////////////////////////////////////////////

end.
