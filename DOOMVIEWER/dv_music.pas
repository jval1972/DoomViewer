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
//  Music
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//  New site: https://sourceforge.net/projects/doomviewer/
//  Old Site: http://www.geocities.ws/jimmyvalavanis/applications/doomviewer.html
//------------------------------------------------------------------------------

unit dv_music;

interface

uses
  se_DoomTypes;

//
//  MUSIC I/O
//
procedure DV_InitMusic;
procedure DV_ShutdownMusic;

// Volume.
procedure DV_SetMusicVolume(volume: integer);

// PAUSE game handling.
procedure DV_PauseSong(handle: integer);
procedure DV_ResumeSong(handle: integer);

// Registers a song handle to song data.
function DV_RegisterSong(data: pointer; size: integer): integer;

// Called by anything that wishes to start music.
//  plays a song, and when the song is done,
//  starts playing it again in an endless loop.
// Horrible thing to do, considering.
procedure DV_PlaySong(handle: integer; looping: boolean = True);

// See above (register), then think backwards
procedure DV_UnRegisterSong(handle: integer);

procedure DV_ProcessMusic;

function DV_GetMusicName(typ: TIDSoftWADType; mapName: string): string;

implementation

uses windows,
  messages,
  sysutils,
  dv_argv,
  dv_io,
  dv_delphi,
  se_DXRTLMediaPlayer,
  mmsystem;

const
  DOOM_music: array[0..67] of string[6] = (
    '',
    'E1M1',
    'E1M2',
    'E1M3',
    'E1M4',
    'E1M5',
    'E1M6',
    'E1M7',
    'E1M8',
    'E1M9',
    'E2M1',
    'E2M2',
    'E2M3',
    'E2M4',
    'E2M5',
    'E2M6',
    'E2M7',
    'E2M8',
    'E2M9',
    'E3M1',
    'E3M2',
    'E3M3',
    'E3M4',
    'E3M5',
    'E3M6',
    'E3M7',
    'E3M8',
    'E3M9',
    'INTER',
    'INTRO',
    'BUNNY',
    'VICTOR',
    'INTROA',
    'RUNNIN',
    'STALKS',
    'COUNTD',
    'BETWEE',
    'DOOM',
    'THE_DA',
    'SHAWN',
    'DDTBLU',
    'IN_CIT',
    'DEAD',
    'STLKS2',
    'THEDA2',
    'DOOM2',
    'DDTBL2',
    'RUNNI2',
    'DEAD2',
    'STLKS3',
    'ROMERO',
    'SHAWN2',
    'MESSAG',
    'COUNT2',
    'DDTBL3',
    'AMPIE',
    'THEDA3',
    'ADRIAN',
    'MESSG2',
    'ROMER2',
    'TENSE',
    'SHAWN3',
    'OPENIN',
    'EVIL',
    'ULTIMA',
    'READ_M',
    'DM2TTL',
    'DM2INT'
  );

  HERETIC_music: array[0..47] of string[8] = (
    'MUS_E1M1', // 1-1
    'MUS_E1M2',
    'MUS_E1M3',
    'MUS_E1M4',
    'MUS_E1M5',
    'MUS_E1M6',
    'MUS_E1M7',
    'MUS_E1M8',
    'MUS_E1M9',

    'MUS_E2M1', // 2-1
    'MUS_E2M2',
    'MUS_E2M3',
    'MUS_E2M4',
    'MUS_E1M4',
    'MUS_E2M6',
    'MUS_E2M7',
    'MUS_E2M8',
    'MUS_E2M9',

    'MUS_E1M1', // 3-1
    'MUS_E3M2',
    'MUS_E3M3',
    'MUS_E1M6',
    'MUS_E1M3',
    'MUS_E1M2',
    'MUS_E1M5',
    'MUS_E1M9',
    'MUS_E2M6',

    'MUS_E1M6', // 4-1
    'MUS_E1M2',
    'MUS_E1M3',
    'MUS_E1M4',
    'MUS_E1M5',
    'MUS_E1M1',
    'MUS_E1M7',
    'MUS_E1M8',
    'MUS_E1M9',

    'MUS_E2M1', // 5-1
    'MUS_E2M2',
    'MUS_E2M3',
    'MUS_E2M4',
    'MUS_E1M4',
    'MUS_E2M6',
    'MUS_E2M7',
    'MUS_E2M8',
    'MUS_E2M9',

    'MUS_E3M2', // 6-1
    'MUS_E3M3', // 6-2
    'MUS_E1M6'  // 6-3
  );

  STRIFE_musNum: array[0..36] of integer =
  (
     1,  2,  3,  4,  5,  6,  7,  8,  9, 10,
     3, 11, 12,  6,  1, 13, 14,  8,  7, 15,
    16,  8, 17, 18, 19, 20, 16,  1, 20, 17,
    13,  1,  2, 37, 34, 35, 36
  );

  STRIFE_music: array[0..37] of string[8] =
  (
    'D_LOGO',
    'D_ACTION',
    'D_TAVERN',
    'D_DANGER',
    'D_FAST',
    'D_INTRO',
    'D_DARKER',
    'D_STRIKE',
    'D_SLIDE',
    'D_TRIBAL',
    'D_MARCH',
    'D_DANGER',
    'D_MOOD',
    'D_CASTLE',
    'D_DARKER',
    'D_ACTION',
    'D_FIGHT',
    'D_SPENSE',
    'D_SLIDE',
    'D_STRIKE',
    'D_DARK',
    'D_TECH',
    'D_SLIDE',
    'D_DRONE',
    'D_PANTHR',
    'D_SAD',
    'D_INSTRY',
    'D_TECH',
    'D_ACTION',
    'D_INSTRY',
    'D_DRONE',
    'D_FIGHT',
    'D_HAPPY',
    'D_END',
    'D_MAP1',
    'D_MAP2',
    'D_MAP3',
    'D_STRIFE'
  );

function DV_GetMusicName(typ: TIDSoftWADType; mapName: string): string;
var
  musnum: integer;
begin
  Result := '';

  if typ = idDoom then
  begin
    if mapName[1] = 'M' then
    begin
      musnum := 34 + (Ord(mapName[4]) - Ord('0')) * 10 + Ord(mapName[5]) - Ord('0') - 1;
      if musnum > 67 then
        musnum := 35 + random(33);
    end
    else
    begin
      musnum := 1 + (Ord(mapName[2]) - Ord('1')) * 9 + Ord(mapName[4]) - Ord('1');
      if musnum > 31 then
      begin
        case mapName[4] of
          '1': Result := 'D_E3M4';  // American e4m1
          '2': Result := 'D_E3M2';  // Romero e4m2
          '3': Result := 'D_E3M3';  // Shawn e4m3
          '4': Result := 'D_E1M5';  // American e4m4
          '5': Result := 'D_E2M7';  // Tim e4m5
          '6': Result := 'D_E2M4';  // Romero e4m6
          '7': Result := 'D_E2M6';  // J.Anderson e4m7 CHIRON.WAD
          '8': Result := 'D_E2M5';  // Shawn e4m8
          '9': Result := 'D_E1M9';  // Tim e4m9
        else
          Result := 'D_E1M1'; // VJ ?????
        end;
        Exit;
      end;
    end;
    Result := 'D_' + DOOM_music[musnum];
  end
  else if typ = idHeretic then
  begin
    musnum := (Ord(mapName[2]) - Ord('1')) * 9 + Ord(mapName[4]) - Ord('1');
    if musnum < 48 then
      Result := HERETIC_music[musnum]
    else
      Result := HERETIC_music[0];
  end
  else if typ = idHexen then
  begin
    musnum := (Ord(mapName[4]) - Ord('0')) * 10 + Ord(mapName[5]) - Ord('0');
    case musnum of
       1: Result := 'WINNOWR';
       2: Result := 'JACHR';
       3: Result := 'SIMONR';
       4: Result := 'WUTZITR';
       5: Result := 'FALCONR';
       6: Result := 'LEVELR';
       7: Result := 'CHARTR';
       8: Result := 'SWAMPR';
       9: Result := 'DEEPR';
      10: Result := 'FUBASR';
      11: Result := 'GROVER';
      12: Result := 'FORTR';
      13: Result := 'CRYPTR';
      14: Result := 'SWAMPR';
      21: Result := 'FOOJAR';
      22: Result := 'SIXATER';
      23: Result := 'WOBABYR';
      24: Result := 'CRYPTR';
      25: Result := 'FANTAR';
      26: Result := 'BLECHR';
      27: Result := 'VOIDR';
      28: Result := 'CHAP_1R';
      29: Result := 'CHAP_2R';
      30: Result := 'CHAP_3R';
      31: Result := 'CHAP_4R';
      32: Result := 'CHIPPYR';
      33: Result := 'PERCR';
      34: Result := 'SECRETR';
      35: Result := 'BONESR';
      36: Result := 'OCTOR';
      37: Result := 'RITHMR';
      38: Result := 'STALKR';
      39: Result := 'BORKR';
      40: Result := 'CRUCIBR';
    else
      Result := 'CHESS';
    end;
  end
  else if typ in [idStrife, idStrife2] then
  begin
    musnum := (Ord(mapName[4]) - Ord('0')) * 10 + Ord(mapName[5]) - Ord('0');
    if musnum < 37 then
      musnum := STRIFE_musNum[musnum]
    else
      musnum := 0;
    Result := STRIFE_music[musnum];
  end;
end;

type
  music_t = (m_none, m_mus, m_midi);

const
  MAX_MIDI_EVENTS = 512;
  MUSMAGIC = $1A53554D; //"MUS"<EOF>

var
  hMidiStream: HMIDISTRM = 0;
  MidiDevice: LongWord;
  midicaps: MIDIOUTCAPS;
  m_type: music_t = m_none;
  MidiFileName: string;
  snd_MusicVolume: integer = 15;

type
  MidiEvent_t = packed record
    time: LongWord;                  { Ticks since last event }
    ID: LongWord;                    { Reserved, must be zero }
    case integer of
      1: (data: packed array[0..2] of byte;
         _type: byte);
      2: (mevent: LongWord);
  end;
  PMidiEvent_t = ^MidiEvent_t;
  MidiEvent_tArray = array[0..$FFFF] of MidiEvent_t;
  PMidiEvent_tArray = ^MidiEvent_tArray;

  Pmidiheader_t = ^midiheader_t;
  midiheader_t = record
    lpData: pointer;             { pointer to locked data block }
    dwBufferLength: LongWord;    { length of data in data block }
    dwBytesRecorded: LongWord;   { used for input only }
    dwUser: LongWord;            { for client's use }
    dwFlags: LongWord;           { assorted flags (see defines) }
    lpNext: Pmidiheader_t;       { reserved for driver }
    reserved: LongWord;          { reserved for driver }
    dwOffset: LongWord;          { Callback offset into buffer }
    dwReserved: array[0..7] of LongWord; { Reserved for MMSYSTEM }
  end;

  musheader_t = packed record
    ID: LongWord;       // identifier "MUS" 0x1A
    scoreLen: word;
    scoreStart: word;
    channels: word;     // count of primary channels
    sec_channels: word; // count of secondary channels
    instrCnt: word;
    dummy: word;
  end;
  Pmusheader_t = ^musheader_t;

const
  NUMMIDIHEADERS = 2;

type
  songinfo_t = record
    numevents: integer;
    nextevent: integer;
    midievents: PMidiEvent_tArray;
    header: array[0..NUMMIDIHEADERS - 1] of midiheader_t;
  end;
  Psonginfo_t = ^songinfo_t;

const
  MidiControlers: packed array[0..9] of byte =
    (0, 0, 1, 7, 10, 11, 91, 93, 64, 67);

var
  started: boolean = False;
  CurrentSong: Psonginfo_t = nil;
  loopsong: boolean = False;

function XLateMUSControl(control: byte): byte;
begin
  case control of
    10: Result := 120;
    11: Result := 123;
    12: Result := 126;
    13: Result := 127;
    14: Result := 121;
  else
    begin
      printf('XLateMUSControl(): Unknown control %d', [control]);
      Result := 0;
    end;
  end;
end;

const
  NUMTEMPOEVENTS = 2;

function GetSongLength(data: PByteArray): integer;
var
  done: boolean;
  events: integer;
  header: Pmusheader_t;
  time: boolean;
  i: integer;
begin
  if data = nil then
  begin
    Result := 0;
    Exit;
  end;

  header := Pmusheader_t(data);
  i := header.scoreStart;
  events := 0;
  done := header.ID <> MUSMAGIC;
  time := False;
  while not done do
  begin
    if boolval(data[i] and $80) then
      time := True;
    inc(i);
    case _SHR(data[i - 1], 4) and 7 of
      1:
        begin
          if boolval(data[i] and $80) then
            inc(i);
          inc(i);
        end;
      0,
      2,
      3: inc(i);
      4: inc(i, 2);
    else
      done := True;
    end;
    inc(events);
    if time then
    begin
      while boolval(data[i] and $80) do
        inc(i);
      inc(i);
      time := False;
    end;
  end;
  Result := events + NUMTEMPOEVENTS;
end;

function DV_MusToMidi(MusData: PByteArray; MidiEvents: PMidiEvent_tArray): boolean;
var
  header: Pmusheader_t;
  score: PByteArray;
  spos: integer;
  event: PMidiEvent_tArray;
  channel: byte;
  etype: integer;
  delta: integer;
  finished: boolean;
  channelvol: array[0..15] of byte;
  count: integer;
  i: integer;
begin
  if MusData = nil then
  begin
    Result := false;
    Exit;
  end;

  header := Pmusheader_t(MusData);
  Result := header.ID = MUSMAGIC;
  if not Result then
  begin
    printf('I_MusToMidi(): Not a MUS file' + #13#10);
    Exit;
  end;

  count := GetSongLength(MusData);
  score := PByteArray(@MusData[header.scoreStart]);
  event := MidiEvents;

  i := 0;
  while i < NUMTEMPOEVENTS do
  begin
    event[i].time := 0;
    event[i].ID := 0;
    event[i]._type := MEVT_TEMPO;
    event[i].data[0] := $00;
    event[i].data[1] := $80; //not sure how to work this out, should be 140bpm
    event[i].data[2] := $02; //but it's guessed so it sounds about right
    inc(i);
  end;

  delta := 0;
  spos := 0;
  FillChar(channelvol, SizeOf(channelvol), Chr(0));

  finished := False;
  while True do
  begin
    event[i].time := delta;
    delta := 0;
    event[i].ID := 0;
    etype := _SHR(score[spos], 4) and 7;
    event[i]._type := MEVT_SHORTMSG;
    channel := score[spos] and 15;
    if channel = 9 then
      channel := 15
    else if channel = 15 then
      channel := 9;
    if boolval(score[spos] and $80) then
      delta := -1;
    inc(spos);
    case etype of
      0:
        begin
          event[i].data[0] := channel or $80;
          event[i].data[1] := score[spos];
          inc(spos);
          event[i].data[2] := channelvol[channel];
        end;
      1:
        begin
          event[i].data[0] := channel or $90;
          event[i].data[1] := score[spos] and 127;
          if boolval(score[spos] and 128) then
          begin
            inc(spos);
            channelvol[channel] := score[spos];
          end;
          inc(spos);
          event[i].data[2] := channelvol[channel];
        end;
      2:
        begin
          event[i].data[0] := channel or $e0;
          // JVAL 20181028 - from DelphiDoom (i_music.pas)
          // fix pitch (https://www.doomworld.com/forum/topic/92113-delphidoom-20/?do=findComment&comment=1700485)
          event[i].data[1] := (score[spos] and 1) shr 6;
          event[i].data[2] := (score[spos] div 2) and 127;
          inc(spos);
        end;
      3:
        begin
          event[i].data[0] := channel or $b0;
          event[i].data[1] := XLateMUSControl(score[spos]);
          inc(spos);
          event[i].data[2] := 0;
        end;
      4:
        begin
          if boolval(score[spos]) then
          begin
            event[i].data[0] := channel or $b0;
            event[i].data[1] := MidiControlers[score[spos]];
            inc(spos);
            event[i].data[2] := score[spos];
            inc(spos);
          end
          else
          begin
            event[i].data[0] := channel or $c0;
            inc(spos);
            event[i].data[1] := score[spos];
            inc(spos);
            event[i].data[2] := 64;
          end;
        end;
    else
      finished := True;
    end;
    if finished then
      break;
    inc(i);
    dec(count);
    if count < 3 then
      printf('I_MusToMidi(): Overflow');
    if delta = -1 then
    begin
      delta := 0;
      while boolval(score[spos] and 128) do
      begin
        delta := _SHL(delta, 7);
        delta := delta + score[spos] and 127;
        inc(spos);
      end;
      delta := delta + score[spos];
      inc(spos);
    end;
  end;
end;

//
// MUSIC API.
//
procedure DV_InitMus;
var
  rc: MMRESULT;
  numdev: LongWord;
  i: integer;
begin
  if boolval(DV_CheckParam('-nomusic')) then
    Exit;

  if hMidiStream <> 0 then
    Exit;

  FillChar(midicaps, SizeOf(midicaps), Chr(0));
  MidiDevice := MIDI_MAPPER;

  // First try midi mapper
  rc := midiOutGetDevCaps(MidiDevice, @midicaps, SizeOf(midicaps));
  if rc <> MMSYSERR_NOERROR then
    printf('I_InitMusic(): midiOutGetDevCaps failed, return value = %d', [rc]);

  // midiStreamOut not supported (should not happen with MIDI MAPPER...)
  // Try to enumurate all midi devices
  if (midicaps.dwSupport and MIDICAPS_STREAM) = 0 then
  begin
    numdev := midiOutGetNumDevs;
    if numdev = 0 then // fatal
      Exit;

    for i := -1 to numdev - 1 do
    begin
      rc := midiOutGetDevCaps(i, @midicaps, SizeOf(midicaps));
      if rc <> MMSYSERR_NOERROR then
        printf('I_InitMusic(): midiOutGetDevCaps failed, return value = %d', [rc]);

      if (midicaps.dwSupport and MIDICAPS_STREAM) <> 0 then
      begin
        MidiDevice := i;
        break;
      end;
    end;
  end;

  if MidiDevice = MIDI_MAPPER then
    printf('Using midi mapper' + #13#10)
  else
    printf('Using midi device %d' + #13#10, [MidiDevice]);

  rc := midiStreamOpen(@hMidiStream, @MidiDevice, 1, 0, 0, CALLBACK_NULL);
  if rc <> MMSYSERR_NOERROR then
  begin
    hMidiStream := 0;
    printf('I_InitMusic(): midiStreamOpen failed, Result = %d' + #13#10, [rc]);
  end;
  started := False;
end;

procedure DV_InitMusic;
begin
  DV_InitMus;
end;


//
// DV_StopMusic
//
procedure DV_StopMusicMus(song: Psonginfo_t);
var
  i: integer;
  rc: MMRESULT;
begin
  if not (boolval(song) and boolval(hMidiStream)) then
    Exit;

  loopsong := False;
  rc := midiOutReset(HMIDIOUT(hMidiStream));
  if rc <> MMSYSERR_NOERROR then
    printf('I_StopMusic(): midiOutReset failed, Result = %d' + #13#10, [rc]);

  started := False;

  for i := 0 to NUMMIDIHEADERS - 1 do
  begin
    if boolval(song.header[i].lpData) then
    begin
      rc := midiOutUnprepareHeader(HMIDIOUT(hMidiStream), @song.header[i], SizeOf(midiheader_t));
      if rc <> MMSYSERR_NOERROR then
        printf('I_StopMusic(): midiOutUnprepareHeader failed, Result = %d' + #13#10, [rc]);

      song.header[i].lpData := nil;
      song.header[i].dwFlags := MHDR_DONE or MHDR_ISSTRM;
    end;
  end;
  song.nextevent := 0;

{  rc := midiOutClose(HMIDIOUT(hMidiStream));
  if rc <> MMSYSERR_NOERROR then
    printf('I_StopMusic(): midiOutReset failed, Result = %d' + #13#10, [rc]);

  hMidiStream := 0;}
end;

procedure DV_StopMusic(song: Psonginfo_t);
begin
  case m_type of
    m_midi: StopMedia; //DV_StopMidi;
    m_mus: DV_StopMusicMus(song);
  end;
end;

procedure DV_StopMus;
var
  rc: MMRESULT;
begin
  if hMidiStream <> 0 then
  begin
    rc := midiStreamStop(hMidiStream);
    if rc <> MMSYSERR_NOERROR then
      printf('I_ShutdownMusic(): midiStreamStop failed, Result = %d' + #13#10, [rc]);

    started := False;
    rc := midiStreamClose(hMidiStream);
    if rc <> MMSYSERR_NOERROR then
      printf('I_ShutdownMusic(): midiStreamClose failed, Result = %d' + #13#10, [rc]);

    hMidiStream := 0;
  end;
end;

//
// DV_ShutdownMusic
//
procedure DV_ShutdownMusic;
begin
  DV_StopMus;
  StopMedia;//DV_StopMidi;
  fdelete(MidiFileName);
end;

//
// DV_PlaySong
//
procedure DV_PlaySong(handle: integer; looping: boolean = True);
begin
  if not (boolval(handle) and boolval(hMidiStream)) then
    Exit;
  loopsong := looping;
  CurrentSong := Psonginfo_t(handle);
end;

//
// DV_PauseSong
//
procedure DV_PauseSongMus(handle: integer);
var
  rc: MMRESULT;
begin
  if not boolval(hMidiStream) then
    Exit;

  rc := midiStreamPause(hMidiStream);
  if rc <> MMSYSERR_NOERROR then
    printf('I_PauseSong(): midiStreamRestart failed, return value = %d', [rc]);
end;

procedure DV_PauseSong(handle: integer);
begin
  case m_type of
    m_midi: PauseMedia;//DV_PauseMidi;
    m_mus: DV_PauseSongMus(handle);
  end;
end;

//
// DV_ResumeSong
//
procedure DV_ResumeSongMus(handle: integer);
var
  rc: MMRESULT;
begin
  if not boolval(hMidiStream) then
    Exit;

  rc := midiStreamRestart(hMidiStream);
  if rc <> MMSYSERR_NOERROR then
    printf('I_ResumeSong(): midiStreamRestart failed, return value = %d', [rc]);
end;

procedure DV_ResumeSong(handle: integer);
begin
  case m_type of
    m_midi: ResumeMedia;//DV_ResumeMidi;
    m_mus: DV_ResumeSongMus(handle);
  end;
end;

// Stops a song over 3 seconds.
procedure DV_StopSong(handle: integer);
var
  song: Psonginfo_t;
begin
  if not (boolval(handle) and boolval(hMidiStream)) then
    Exit;

  song := Psonginfo_t(handle);

  DV_StopMusic(song);

  if song = CurrentSong then
    CurrentSong := nil;
end;

procedure DV_UnRegisterSong(handle: integer);
var
  song: Psonginfo_t;
begin
  if not (boolval(handle) and boolval(hMidiStream)) then
    Exit;

  DV_StopSong(handle);

  song := Psonginfo_t(handle);
  FreeMem(song.midievents);
  FreeMem(song);
end;

function DV_RegisterSong(data: pointer; size: integer): integer;
var
  song: Psonginfo_t;
  i: integer;
  f: file;
  buf: array[0..1024] of char;
begin
  GetMem(song, SizeOf(songinfo_t));
  song.numevents := GetSongLength(PByteArray(data));
  song.nextevent := 0;
  GetMem(song.midievents, (song.numevents * SizeOf(MidiEvent_t)));

  if m_type = m_midi then
    StopMedia;//DV_StopMidi;

  if DV_MusToMidi(PByteArray(data), song.midievents) then
  begin
{    if m_type <> m_mus then
    begin}
      DV_InitMus;
      m_type := m_mus;
//    end;

    if not boolval(hMidiStream) then
    begin
      printf('I_RegisterSong(): Could not initialize midi stream' + #13#10);
      m_type := m_none;
      Result := 0;
      Exit;
    end;

    for i := 0 to NUMMIDIHEADERS - 1 do
    begin
      song.header[i].lpData := nil;
      song.header[i].dwFlags := MHDR_ISSTRM or MHDR_DONE;
    end;
  end
  else
  begin
    if m_type <> m_midi then
    begin
      DV_StopMus;
      m_type := m_midi;
    end;

    FillChar(buf, SizeOf(buf), Chr(0));
    GetTempPath(SizeOf(buf), buf);
    MidiFileName := StrPas(buf) + '\doomviewer.mid';

    assign(f, MidiFileName);
    {$I-}
    rewrite(f, 1);
    BlockWrite(f, data^, size);
    close(f);
    {$I+}
    if IOResult <> 0 then
    begin
      printf('I_RegisterSong(): Could not initialize MCI' + #13#10);
      m_type := m_none;
      Result := 0;
      Exit;
    end;
    ClearMediaPlayList;//ClearMidiFilePlayList;
    AddMediaToPlayList(MidiFileName);//AddMidiFileToPlayList(MidiFileName);
    PlayMedia(0);//DV_PlayMidi(0);
  end;
  Result := integer(song);
end;

// Is the song playing?
function DV_QrySongPlaying(handle: integer): boolean;
begin
  Result := boolval(CurrentSong);
end;

//
// DV_SetMusicVolume
//
procedure DV_SetMusicVolumeMus(volume: integer);
var
  rc: MMRESULT;
begin
  snd_MusicVolume := volume;
// Now set volume on output device.
// Whatever( snd_MusciVolume );
  if boolval(CurrentSong) and (snd_MusicVolume = 0) and started then
    DV_StopMusic(CurrentSong);

  if (midicaps.dwSupport and MIDICAPS_VOLUME) <> 0 then
  begin
    rc := midiOutSetVolume(hMidiStream,
      _SHLW($FFFF * snd_MusicVolume div 16, 16) or _SHLW(($FFFF * snd_MusicVolume div 16), 0));
    if rc <> MMSYSERR_NOERROR then
      printf('I_SetMusicVolume(): midiOutSetVolume failed, return value = %d' + #13#10, [rc]);
  end
  else
    printf('I_SetMusicVolume(): Midi device dos not support volume control' + #13#10);
end;

procedure DV_SetMusicVolume(volume: integer);
begin
  case m_type of
    m_midi: ; // unsupported
    m_mus: DV_SetMusicVolumeMus(volume);
  end;
end;

procedure DV_ProcessMusic;
var
  header: Pmidiheader_t;
  len: integer;
  i: integer;
  rc: MMRESULT;
begin
  if m_type <> m_mus then
    Exit;

  if (snd_MusicVolume = 0) or (not boolval(CurrentSong)) then
    Exit;

  for i := 0 to NUMMIDIHEADERS - 1 do
  begin
    header := @CurrentSong.header[i];
    if boolval(header.dwFlags and MHDR_DONE) then
    begin
      if boolval(header.lpData) then
      begin
        rc := midiOutUnprepareHeader(HMIDIOUT(hMidiStream), PMidiHdr(header), SizeOf(midiheader_t));
        if rc <> MMSYSERR_NOERROR then
          printf('I_ProcessMusic(): midiOutUnprepareHeader failed, Result = %d' + #13#10, [rc]);
      end;
      header.lpData := @CurrentSong.midievents[CurrentSong.nextevent];
      len := CurrentSong.numevents - CurrentSong.nextevent;
      if len > MAX_MIDI_EVENTS then
      begin
        len := MAX_MIDI_EVENTS;
        CurrentSong.nextevent := CurrentSong.nextevent + MAX_MIDI_EVENTS;
      end
      else
        CurrentSong.nextevent := 0;
      len := len * SizeOf(MidiEvent_t);
      header.dwBufferLength := len;
      header.dwBytesRecorded := len;
      header.dwFlags := MHDR_ISSTRM;
      rc := midiOutPrepareHeader(HMIDIOUT(hMidiStream), PMidiHdr(header), SizeOf(midiheader_t));
      if rc <> MMSYSERR_NOERROR then
        printf('I_ProcessMusic(): midiOutPrepareHeader failed, return value = %d', [rc]);
      if not started then
      begin
        rc := midiStreamRestart(hMidiStream);
        if rc <> MMSYSERR_NOERROR then
          printf('I_ProcessMusic(): midiStreamRestart failed, return value = %d', [rc]);
        started := True;
      end;
      rc := midiStreamOut(hMidiStream, PMidiHdr(header), SizeOf(midiheader_t));
      if rc <> MMSYSERR_NOERROR then
        printf('I_ProcessMusic(): midiStreamOut failed, return value = %d', [rc]);
    end;
  end;
end;


end.

