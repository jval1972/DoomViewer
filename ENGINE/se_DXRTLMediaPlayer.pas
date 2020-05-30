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
//  DirectShow Media Player
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//------------------------------------------------------------------------------

{$I defs.inc}

unit se_DXRTLMediaPlayer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls, ComCtrls, se_DirectShowStuff, se_DirectShowUtils,
  se_DirectShow, OleServer, se_DirectDraw, se_DXClass;

type
  TDirectShow8Form = class(TForm)
    Mp3FileNames: TListBox;
    procedure FilterGraphDSEvent(sender: TOleServer; Event, Param1,
      Param2: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DXTimer1Deactivate(Sender: TObject);
    procedure DXTimer1Activate(Sender: TObject);
  private
    { Private declarations }
    Mp3ID: integer;
    FDeActivated: boolean;
    DXTimer1: TDXTimer;
    VideoWindow: TDSVideoWindow;
    FilterGraph: TDSFilterGraph2;
    isMidi: boolean;
    midierror: boolean;
    function PlayMidi(Index: integer): boolean;
  public
    { Public declarations }
    procedure Add(FileName: string);
    function Play(Index: integer): boolean;
    procedure Pause;
    procedure Resume;
    procedure Stop;
  end;

procedure PlayMp3File(FileName: string);

procedure PlayMp3(index: integer);

procedure StopMp3;

procedure PauseMp3;

procedure ResumeMp3;

procedure AddMp3ToPlayList(Mp3File: string);

procedure DeleteMp3FromPlayList(Mp3File: string);

procedure ClearMp3PlayList;

procedure PlayMediaFile(FileName: string);

procedure PlayMedia(index: integer);

procedure StopMedia;

procedure PauseMedia;

procedure ResumeMedia;

procedure AddMediaToPlayList(MediaFile: string);

procedure DeleteMediaFromPlayList(MediaFile: string);

procedure ClearMediaPlayList;

procedure KillMedia;

procedure ShowDirectShow8Form;

type
  TOnMediaResumeProc = function: boolean;

var
  OnMediaResumeProc: TOnMediaResumeProc;

implementation

{$R *.DFM}

uses
  se_DXDUtils, se_Midi;

var
  DirectShow8Form: TDirectShow8Form;

procedure ShowDirectShow8Form;
begin
  if not Assigned(DirectShow8Form) then
    Application.CreateForm(TDirectShow8Form, DirectShow8Form);
  if not DirectShow8Form.Visible then
    DirectShow8Form.ShowModal;
end;

procedure GetDirectShow8Form;
begin
  if not Assigned(DirectShow8Form) then
  begin
    if Application.MainForm = nil then
      DirectShow8Form := TDirectShow8Form.Create(nil)
    else
      Application.CreateForm(TDirectShow8Form, DirectShow8Form);
  end;
end;

procedure PlayMp3File(FileName: string);
begin
  GetDirectShow8Form;
  DirectShow8Form.Add(FileName);
end;

procedure PlayMp3(index: integer);
begin
  GetDirectShow8Form;
  DirectShow8Form.Play(Index);
end;

procedure StopMp3;
begin
  if Assigned(DirectShow8Form) then
    DirectShow8Form.Stop;
end;

procedure PauseMp3;
begin
  if Assigned(DirectShow8Form) then
    DirectShow8Form.Pause;
end;

procedure ResumeMp3;
begin
  if Assigned(OnMediaResumeProc) then
  begin
    if OnMediaResumeProc then
    begin
      if Assigned(DirectShow8Form) then
        DirectShow8Form.Resume;
    end;
  end
  else
    if Assigned(DirectShow8Form) then
      DirectShow8Form.Resume;
end;

procedure AddMp3ToPlayList(Mp3File: string);
begin
  GetDirectShow8Form;
  if DirectShow8Form.Mp3FileNames.Items.IndexOf(UpperCase(Mp3File)) = -1 then
    DirectShow8Form.Mp3FileNames.Items.Add(UpperCase(Mp3File))
end;

procedure DeleteMp3FromPlayList(Mp3File: string);
begin
  GetDirectShow8Form;
  if DirectShow8Form.Mp3FileNames.Items.IndexOf(UpperCase(Mp3File)) > -1 then
    DirectShow8Form.Mp3FileNames.Items.Delete(
      DirectShow8Form.Mp3FileNames.Items.IndexOf(UpperCase(Mp3File)));
end;

procedure ClearMp3PlayList;
begin
  GetDirectShow8Form;
  DirectShow8Form.Mp3FileNames.Items.Clear;
end;

procedure PlayMediaFile(FileName: string);
begin
  PlayMp3File(FileName);
end;

procedure PlayMedia(index: integer);
begin
  PlayMp3(index);
end;

procedure StopMedia;
begin
  StopMp3;
end;

procedure PauseMedia;
begin
  PauseMp3;
end;

procedure ResumeMedia;
begin
  ResumeMp3;
end;

procedure AddMediaToPlayList(MediaFile: string);
begin
  AddMp3ToPlayList(MediaFile);
end;

procedure DeleteMediaFromPlayList(MediaFile: string);
begin
  DeleteMp3FromPlaylist(MediaFile);
end;

procedure ClearMediaPlayList;
begin
  ClearMp3PlayList
end;

procedure KillMedia;
begin
  if Assigned(DirectShow8Form) then
  begin
    StopMedia;
    if not DirectShow8Form.Visible then
    begin
      DirectShow8Form.Close;
      DirectShow8Form.Free;
      DirectShow8Form := nil;
    end
    else
      DirectShow8Form.Mp3FileNames.Items.Clear;
  end;
end;

procedure TDirectShow8Form.Add(FileName: string);
begin
  FilterGraph.ClearGraph;
  if Mp3FileNames.Items.IndexOf(UpperCase(FileName)) > -1 then
    Play(Mp3FileNames.Items.IndexOf(UpperCase(FileName)))
  else
  begin
    Mp3FileNames.Items.Add(UpperCase(FileName));
    Play(Mp3FileNames.Items.IndexOf(UpperCase(FileName)))
  end;
end;

function TDirectShow8Form.PlayMidi(Index: integer): boolean;
var
  mfile: string;
begin
  Result := False;

  if not midierror then
    Exit;

  if IsIntegerInRange(Index, 0, Mp3FileNames.Items.Count - 1) then
  begin
    mfile := Mp3FileNames.Items[index];
    if UpperCase(ExtractFileExt(mfile)) = '.MID' then
    begin
      I_PlayMidi(mfile);
      Result := True;
    end;
  end;
end;

function TDirectShow8Form.Play(Index: integer): boolean;
begin
  Result := False;
  if IsIntegerInRange(Index, 0, Mp3FileNames.Items.Count - 1) then
  begin
    Stop;
    isMidi := UpperCase(ExtractFileExt(Mp3FileNames.Items[index])) = '.MID';
    if not PlayMidi(Index) then
    begin
      if not midierror then
        try FilterGraph.ClearGraph; except midierror := True; end;
      if not midierror then
        try FilterGraph.FilterGraph2.RenderFile(StringToOleStr(Mp3FileNames.Items[index]), nil); except midierror := True; end;
      if not midierror then
        try FilterGraph.QueryInterfaces; except midierror := True; end;
      if not midierror then
      begin
        if Assigned(FilterGraph.MediaControl) then
          FilterGraph.MediaControl.Run;
      end
      else
        Result := PlayMidi(Index);
    end;
    Mp3FileNames.ItemIndex := Index;
  end;
  Mp3ID := Index;
end;

procedure TDirectShow8Form.Pause;
begin
  if midierror and isMidi then
    I_PauseMidi
  else if Assigned(FilterGraph.MediaControl) then
    FilterGraph.MediaControl.Pause;
end;

procedure TDirectShow8Form.Resume;
begin
  if Assigned(OnMediaResumeProc) then
  begin
    if OnMediaResumeProc then
    begin
      if midierror and isMidi then
        I_PauseMidi
      else if Assigned(FilterGraph.MediaControl) then
          FilterGraph.MediaControl.Run;
    end;
  end
  else
  begin
    if midierror and isMidi then
      I_PauseMidi
    else if Assigned(FilterGraph.MediaControl) then
      FilterGraph.MediaControl.Run;
  end;
end;

procedure TDirectShow8Form.Stop;
begin
  if midierror and isMidi then
    I_StopMidi
  else if Assigned(FilterGraph.MediaControl) then
    FilterGraph.MediaControl.Stop;
end;

procedure TDirectShow8Form.FilterGraphDSEvent(sender: TOleServer; Event, Param1,
  Param2: Integer);
begin
  if Event = EC_COMPLETE then
  begin
    inc(Mp3ID);
    if Mp3ID >= Mp3FileNames.Items.Count then Mp3ID := 0;
    Play(Mp3ID);
  end;
end;

procedure TDirectShow8Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FilterGraph.Disconnect;
end;

procedure TDirectShow8Form.FormCreate(Sender: TObject);
begin
  isMidi := True;
  midierror := False;

  FilterGraph := TDSFilterGraph2.Create(self);
  FilterGraph.AutoConnect := True;
  FilterGraph.ConnectKind := ckRunningOrNew;
  FilterGraph.RotEnabled := True;
  FilterGraph.OnDSEvent := FilterGraphDSEvent;

  VideoWindow := TDSVideoWindow.Create(self);
  VideoWindow.Parent := self;
  VideoWindow.Left := 0;
  VideoWindow.Top := 0;
  VideoWindow.Width := 160;
  VideoWindow.Height := 120;
  VideoWindow.Graph := FilterGraph;

  FDeActivated := False;
  DXTimer1 := TDXTimer.Create(self);
  DXTimer1.ActiveOnly := True;
  DXTimer1.Enabled := True;
  DXTimer1.Interval := 100;
  DXTimer1.OnActivate := DXTimer1Activate;
  DXTimer1.OnDeactivate := DXTimer1Deactivate;
end;

procedure TDirectShow8Form.DXTimer1Deactivate(Sender: TObject);
begin
  FDeActivated := True;
  Pause;
end;

procedure TDirectShow8Form.DXTimer1Activate(Sender: TObject);
begin
  if FDeActivated then
  begin
    FDeActivated := false;
    Resume;
  end;
end;

initialization
  DirectShow8Form := nil;
  OnMediaResumeProc := nil;

finalization

end.

