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
//  I/O handling
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//  New site: https://sourceforge.net/projects/doomviewer/
//  Old Site: http://www.geocities.ws/jimmyvalavanis/applications/doomviewer.html
//------------------------------------------------------------------------------

unit dv_io;

interface

type
  TOutProc = procedure (const s: string);

var
  outproc: TOutProc = nil;

procedure sprintf(var s: string; const Fmt: string; const Args: array of const);

procedure printf(const str: string); overload;

procedure printf(const Fmt: string; const Args: array of const); overload;

implementation

uses
  SysUtils;

procedure sprintf(var s: string; const Fmt: string; const Args: array of const);
begin
  s := Format(Fmt, Args);
end;

procedure printf(const str: string);
begin
  if Assigned(outproc) then
    outproc(str)
  else if IsConsole then
    write(str);
end;

procedure printf(const Fmt: string; const Args: array of const);
var s: string;
begin
  sprintf(s, Fmt, Args);
  printf(s);
end;

end.
