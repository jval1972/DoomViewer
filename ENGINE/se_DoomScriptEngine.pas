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
//  Script engine for Doom Engine (Hexen)
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//------------------------------------------------------------------------------

{$I defs.inc}

unit se_DoomScriptEngine;

interface

uses
  Classes, SysUtils;

const
  MAPINFO_SCRIPT_NAME = 'MAPINFO';

const
  MAX_STRING_SIZE = 64;
  ASCII_COMMENT = ';';
  ASCII_QUOTE = Chr(34);

////////////////////////////////////////////////////////////////////////////////

type
  TDoomScriptEngine = class(TObject)
  private
    sc_String: PChar;
    sc_Number: integer;
    sc_Line: integer;
    sc_End: boolean;
    ScriptBuffer: PChar;
    ScriptPtr: PChar;
    ScriptEndPtr: PChar;
    StringBuffer: array[0..MAX_STRING_SIZE - 1] of char;
    ScriptSize: integer;
    AlreadyGot: boolean;
    LastError: string;
  protected
    function fToken: string;
  public
    constructor Create(const MainWAD: TFileName; const EntryName: string); virtual;
    destructor destroy; override;
    procedure Clear;
    procedure LoadFrom(const MainWAD: TFileName; const EntryName: string); virtual;
    procedure ScriptError(const err: string = 'Syntax Error!');
    function GetString: boolean;
    procedure MustGetString;
    procedure MustGetStringName(const name: string);
    function GetNumber: boolean;
    procedure MustGetNumber;
    procedure UnGet;
    function MatchString(strs: TStringList): integer;
    function MustMatchString(strs: TStringList): integer;
    function Compare(const txt: string): boolean;
    property Number: integer read sc_Number;
    property Token: string read fToken;
  end;

implementation

uses
  se_DoomUtils;

constructor TDoomScriptEngine.Create(const MainWAD: TFileName;
  const EntryName: string);
begin
  Inherited Create;
  Clear;
  LoadFrom(MainWAD, EntryName);
end;

destructor TDoomScriptEngine.destroy;
begin
  Clear;
  Inherited;
end;

function TDoomScriptEngine.fToken: string;
begin
  Result := StrPas(sc_String);
end;

procedure TDoomScriptEngine.Clear;
begin
  if ScriptSize > 0 then
    FreeMem(ScriptBuffer, ScriptSize);

  ScriptBuffer := nil;
  ScriptSize := 0;
  ScriptPtr := ScriptBuffer;
  ScriptEndPtr := ScriptPtr + ScriptSize;
  sc_Line := 1;
  sc_End := False;
  sc_String := @StringBuffer[0];
  AlreadyGot := False;
  LastError := '';
end;

procedure TDoomScriptEngine.LoadFrom(const MainWAD: TFileName; const EntryName: string);
var
  p: Pointer;
  size: integer;
begin
  p := nil;
  size := 0;
  if ReadEntry(MainWAD, MAPINFO_SCRIPT_NAME, p, size) then
  begin
    Clear;
    ScriptSize := size;
    GetMem(ScriptBuffer, ScriptSize);
    Move(p^, ScriptBuffer^, ScriptSize);
    ScriptPtr := ScriptBuffer;
    ScriptEndPtr := ScriptPtr + ScriptSize;
    sc_Line := 1;
    sc_End := False;
    sc_String := @StringBuffer[0];
    AlreadyGot := False;
  end;
  ReallocMem(p, 0);
end;

function TDoomScriptEngine.GetString: boolean;
var
  txt: PChar;
  foundToken: boolean;
begin
  if AlreadyGot then
  begin
    AlreadyGot := False;
    Result := True;
    Exit;
  end;

  foundToken := False;
  if ScriptPtr >= ScriptEndPtr then
  begin
    sc_End := True;
    Result := False;
    Exit;
  end;

  while not foundToken do
  begin
    while ScriptPtr^ <= Chr(32) do
    begin
      if ScriptPtr >= ScriptEndPtr then
      begin
        sc_End := True;
        Result := False;
        Exit;
      end;

      if ScriptPtr^ = Chr(13) then
      begin
        inc(sc_Line);
      end;
      inc(ScriptPtr);
    end;

    if ScriptPtr >= ScriptEndPtr then
    begin
      sc_End := True;
      Result := False;
      Exit;
    end;

    if ScriptPtr^ <> ASCII_COMMENT then
    begin // Found a token
      foundToken := True;
    end
    else
    begin // Skip comment
      while ScriptPtr^ <> Chr(13) do
      begin
        if ScriptPtr >= ScriptEndPtr then
        begin
          sc_End := True;
          Result := False;
          Exit;
        end;
        inc(ScriptPtr);
      end;
      inc(sc_Line);    end;  end;

  txt := sc_String;
  if ScriptPtr^ = ASCII_QUOTE then
  begin // Quoted string
    inc(ScriptPtr);
    while ScriptPtr^ <> ASCII_QUOTE do
    begin
      txt^ := ScriptPtr^;
      inc(txt);
      inc(ScriptPtr);
      if (ScriptPtr = ScriptEndPtr) or
         (txt = @sc_String[MAX_STRING_SIZE - 1]) then
        Break;
    end;
    inc(ScriptPtr);
  end
  else
  begin // Normal string
    while (ScriptPtr^ > Chr(32)) and (ScriptPtr^ <> ASCII_COMMENT) do
    begin
      txt^ := ScriptPtr^;
      inc(txt);
      inc(ScriptPtr);
      if (ScriptPtr = ScriptEndPtr) or (txt = @sc_String[MAX_STRING_SIZE - 1]) then
        Break;
    end;
  end;
  txt^ := Chr(0);
  Result := True;
end;

procedure TDoomScriptEngine.ScriptError(const err: string);
begin
  LastError := err;
end;

procedure TDoomScriptEngine.MustGetString;
begin
  if not GetString then
    ScriptError('TDoomScriptEngine.MustGetString(): Missing string!');
end;

procedure TDoomScriptEngine.MustGetStringName(const name: string);
begin
  MustGetString;
  if not Compare(name) then
    ScriptError('TDoomScriptEngine.MustGetStringName()!');
end;

function TDoomScriptEngine.GetNumber: boolean;
var
  code: integer;
begin
  if GetString then
  begin
    val(StrPas(sc_String), sc_Number, code);
    if code <> 0 then
    begin
      ScriptError(
        Format(
          'TDoomScriptEngine.GetNumber(): Bad numeric constant "%s\" at Line %d',
          [sc_String, sc_Line]));
      Result := False;
      Exit;
    end;
    Result := True;
  end
  else
    Result := True;
end;

procedure TDoomScriptEngine.MustGetNumber;
begin
  if not GetNumber then
    ScriptError('TDoomScriptEngine.MustGetNumber(): Missing integer.');
end;

procedure TDoomScriptEngine.UnGet;
// Assumes there is a valid string in sc_String.
begin
  AlreadyGot := True;
end;

function TDoomScriptEngine.MatchString(strs: TStringList): integer;
// Returns the index of the first match to sc_String from the passed
// array of strings, or -1 if not found.
var
  i: integer;
begin
  for i := 0 to strs.Count - 1 do
  begin
    if Compare(strs.Strings[i]) then
    begin
      Result := i;
      Exit;
    end;
  end;
  Result := -1;
end;

function TDoomScriptEngine.MustMatchString(strs: TStringList): integer;
var
  i: integer;
begin
  i := MatchString(strs);
  if i = -1 then
    ScriptError('TDoomScriptEngine.MustMatchString()!');

  Result := i;
end;

function TDoomScriptEngine.Compare(const txt: string): boolean;
begin
  Result := UpperCase(txt) = UpperCase(StrPas(sc_String));
end;

////////////////////////////////////////////////////////////////////////////////

end.
