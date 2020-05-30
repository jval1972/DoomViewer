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
//  Open Map Form
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//  New site: https://sourceforge.net/projects/doomviewer/
//  Old Site: http://www.geocities.ws/jimmyvalavanis/applications/doomviewer.html
//------------------------------------------------------------------------------

{$I defs.inc}

unit OpenDoomMapFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  se_DoomUtils, se_DoomTypes, AnotherReg, StdCtrls, ExtCtrls,
  rmBaseEdit, rmBtnEdit, Buttons, Spin, ComCtrls, MessageBox, Variants;

type
  TOpenDoomMapForm = class(TForm)
    Notebook1: TNotebook;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    NextMap: TSpeedButton;
    PrevMap: TSpeedButton;
    TrackBar1: TTrackBar;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    MapNameLabel: TLabel;
    Image1: TImage;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure FileEdit1Btn1Click(Sender: TObject);
    procedure FileEdit2Btn1Click(Sender: TObject);
    procedure PrevMapClick(Sender: TObject);
    procedure NextMapClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FileEdit1Change(Sender: TObject);
    procedure FileEdit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    MessageBox1: TMessageBox;
    MessageBox2: TMessageBox;
    MessageBox3: TMessageBox;

    FileEdit1: TrmBtnEdit;
    FileEdit2: TrmBtnEdit;

    FormRestorer1: TFormRestorer;
    regdoThings: TVariantProfile;
    regLightFactor: TVariantProfile;

    procedure UpdateMaps;
    procedure UpdateMapsComboBox;
    procedure UpdateEditorChange(FileEdit: TrmBtnEdit; default: string);
  public
    { Public declarations }
  end;

function QueryImportDoomMap(AOwner: TComponent;
  var MainWAD, PWAD: TFileName; var MapName: string;
  var lFactor: single; var bdoThings: boolean; var MapList: TStringList): boolean;

implementation

uses Math, Unit1;

{$R *.DFM}

function QueryImportDoomMap(AOwner: TComponent;
  var MainWAD, PWAD: TFileName; var MapName: string;
  var lFactor: single; var bdoThings: boolean; var MapList: TStringList): boolean;
begin
  result := false;
  with TOpenDoomMapForm.Create(AOwner) do
  try
    FileEdit1.Text := MainWAD;
    if PWAD <> '' then
      FileEdit2.Text := PWAD
    else
      FileEdit2.Text := MainWAD;
    if lFactor >= 0 then
      TrackBar1.Position := round(lFactor * (TrackBar1.Max - TrackBar1.Min));
    UpdateMaps;
    if MapName <> '' then
      ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(MapName);
    ShowModal;
    if ModalResult = mrOK then
    begin
      MainWAD := FileEdit1.Text;
      PWAD := FileEdit2.Text;
      lFactor := TrackBar1.Position / (TrackBar1.Max - TrackBar1.Min);
      if ComboBox1.ItemIndex <> -1 then
        MapName := ComboBox1.Items[ComboBox1.ItemIndex];
      bdoThings := CheckBox1.Checked;
      if MapList = nil then
        MapList := TStringList.Create
      else
        MapList.Clear;
      MapList.AddStrings(ComboBox1.Items);
      result := true;
    end;
  finally
    Free;
  end;
end;

procedure TOpenDoomMapForm.FormShow(Sender: TObject);
begin
//  DFWSmoothShow1.Execute;
  UpdateMaps;
end;

procedure TOpenDoomMapForm.FileEdit1Btn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    FileEdit1.Text := OpenDialog1.FileName;
    FileEdit2.Text := OpenDialog1.FileName;
    UpdateMaps;
    ComboBox1.ItemIndex := 0;
    UpdateMapsComboBox;
  end;
end;

procedure TOpenDoomMapForm.FileEdit2Btn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    FileEdit2.Text := OpenDialog1.FileName;
    UpdateMaps;
    ComboBox1.ItemIndex := 0;
    UpdateMapsComboBox;
  end;
end;

procedure TOpenDoomMapForm.UpdateMaps;
begin
  if (FileEdit2.Text <> '') and FileExists(FileEdit2.Text) then
  begin
    ComboBox1.Enabled := true;
    GetDoomWADMaps(FileEdit2.Text, ComboBox1.Items);
    if ComboBox1.Items.Count > 0 then
    begin
      ComboBox1.Enabled := true;
      OKBtn.Enabled := true;
    end
    else
    begin
      ComboBox1.Enabled := false;
      OKBtn.Enabled := false;
    end
  end
  else
  begin
    ComboBox1.Enabled := false;
    OKBtn.Enabled := false;
  end;
  UpdateMapsComboBox;
//  PrevMap.Enabled := ComboBox1.ItemIndex > 0;
//  NextMap.Enabled := (ComboBox1.ItemIndex < (ComboBox1.Items.Count - 1)) and (ComboBox1.Items.Count > 0);
end;

procedure TOpenDoomMapForm.PrevMapClick(Sender: TObject);
begin
  if ComboBox1.ItemIndex > 0 then
  begin
    ComboBox1.ItemIndex := ComboBox1.ItemIndex - 1;
    PrevMap.Enabled := ComboBox1.ItemIndex > 0;
    NextMap.Enabled := true;
  end;
  UpdateMapsComboBox;
end;

procedure TOpenDoomMapForm.NextMapClick(Sender: TObject);
begin
  if ComboBox1.ItemIndex < ComboBox1.Items.Count - 1 then
  begin
    ComboBox1.ItemIndex := ComboBox1.ItemIndex + 1;
    PrevMap.Enabled := true;
    NextMap.Enabled := (ComboBox1.ItemIndex < (ComboBox1.Items.Count - 1)) and (ComboBox1.Items.Count > 0);
  end
  else
  begin
    PrevMap.Enabled := ComboBox1.ItemIndex > 0;
    NextMap.Enabled := false;
  end;
  UpdateMapsComboBox;
end;

procedure TOpenDoomMapForm.UpdateMapsComboBox;
begin
  PrevMap.Enabled := ComboBox1.ItemIndex > 0;
  NextMap.Enabled := (ComboBox1.ItemIndex < (ComboBox1.Items.Count - 1)) and (ComboBox1.Items.Count > 0);
  if ComboBox1.ItemIndex > -1 then
    MapNameLabel.Caption := GetMapName(FileEdit1.Text, ComboBox1.Items[ComboBox1.ItemIndex])
  else
    MapNameLabel.Caption := '';
end;

procedure TOpenDoomMapForm.ComboBox1Change(Sender: TObject);
begin
  UpdateMapsComboBox;
end;

resourceString
  rsWADDoom = 'DOOM/DOOM2 WAD file';
  rsWADHeretic = 'Heretic WAD file';
  rsWADHexen = 'Hexen WAD file';
  rsWADStrife = 'Strife WAD file';
  rsWADNew = 'New type WAD file';
  rsWADInvalid = 'Invalid file';
  rsWADUnknown = 'Unknown file type';
  rsWADVJ = 'DXDesigner WAD file';
  rsIWAD = 'Main WAD file';
  rsPWAD = 'Patch WAD file';

procedure TOpenDoomMapForm.UpdateEditorChange(FileEdit: TrmBtnEdit; default: string);
var wad_type: TIDSoftWADType;
begin
  Screen.Cursor := crHourglass;
  Refresh;
  try
    if (FileEdit.Text <> '') and FileExists(FileEdit.Text) then
    begin
      wad_type := GetWadType(FileEdit.Text);
      case wad_type of
        idDoom:    FileEdit.Hint := rsWADDoom;    // Doom
        idHeretic: FileEdit.Hint := rsWADHeretic; // Heretic
        idHexen:   FileEdit.Hint := rsWADHexen;   // Hexen
        idStrife,
        idStrife2: FileEdit.Hint := rsWADStrife;  // Strife
        idNew:     FileEdit.Hint := rsWADNew;     // MSADoom
        idInvalid: FileEdit.Hint := rsWADInvalid; // Ακατάλληλου τύπου
        idUnknown: FileEdit.Hint := rsWADUnknown; // Αγνώστου τύπου
        idVJ:      FileEdit.Hint := rsWADVJ;      // Πιθανόν WAD δικού μου format
      end;
      UpdateMapsComboBox;
    end
    else
      FileEdit.Hint := default;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TOpenDoomMapForm.FileEdit1Change(Sender: TObject);
begin
  UpdateEditorChange(FileEdit1, rsIWAD);
end;

procedure TOpenDoomMapForm.FileEdit2Change(Sender: TObject);
begin
  UpdateEditorChange(FileEdit2, rsPWAD);
end;

procedure TOpenDoomMapForm.FormCreate(Sender: TObject);
begin
  FormRestorer1 := TFormRestorer.Create(self);
  FormRestorer1.ParentKey := DXViewerForm.AppConfigKey1;
  FormRestorer1.Name := 'FormRestorer1';
  FormRestorer1.Restoring := frPositionOnly;
  FormRestorer1.Restore;

  regLightFactor := TVariantProfile.Create(self);
  regLightFactor.Key := FormRestorer1;
  regLightFactor.Name := 'LightFactor';

  regdoThings := TVariantProfile.Create(self);
  regdoThings.Key := FormRestorer1;
  regdoThings.Name := 'doThings';

  MessageBox1 := TMessageBox.Create(self);
  MessageBox1.Caption := 'DoomViewer';
  MessageBox1.Text := 'Please select each WAD file as an existed file on disk.';
  MessageBox1.Buttons := mbxOK;
  MessageBox1.Icon := mbxIconError;
  MessageBox1.DefaultButton := mbxDefButton1;
  MessageBox1.Modality := mbxDefModality;
  MessageBox1.TextAlignment := mbxLeft;

  MessageBox2 := TMessageBox.Create(self);
  MessageBox2.Caption := 'DoomViewer';
  MessageBox2.Text := 'Main WAD file is invalid!';
  MessageBox2.Buttons := mbxOK;
  MessageBox2.Icon := mbxIconError;
  MessageBox2.DefaultButton := mbxDefButton1;
  MessageBox2.Modality := mbxDefModality;
  MessageBox2.TextAlignment := mbxLeft;

  MessageBox3 := TMessageBox.Create(self);
  MessageBox3.Caption := 'DoomViewer';
  MessageBox3.Text := 'Patch WAD file is invalid!';
  MessageBox3.Buttons := mbxOK;
  MessageBox3.Icon := mbxIconError;
  MessageBox3.DefaultButton := mbxDefButton1;
  MessageBox3.Modality := mbxDefModality;
  MessageBox3.TextAlignment := mbxLeft;

  FileEdit1 := TrmBtnEdit.Create(self);
  FileEdit1.Parent := NoteBook1;
  FileEdit1.Left := 120;
  FileEdit1.Top := 14;
  FileEdit1.Width := 361;
  FileEdit1.Height := 21;
  FileEdit1.Hint := 'Main WAD FileName';
  FileEdit1.BtnWidth := 22;
  FileEdit1.Btn1Glyph := Image1.Picture.Bitmap;
  FileEdit1.Btn1NumGlyphs := 1;
  FileEdit1.Btn2Glyph := Image2.Picture.Bitmap;
  FileEdit1.Btn2NumGlyphs := 1;
  FileEdit1.TabOrder := 0;
  FileEdit1.OnChange := FileEdit1Change;
  FileEdit1.OnBtn1Click := FileEdit1Btn1Click;

  FileEdit2 := TrmBtnEdit.Create(self);
  FileEdit2.Parent := NoteBook1;
  FileEdit2.Left := 120;
  FileEdit2.Top := 38;
  FileEdit2.Width := 361;
  FileEdit2.Height := 21;
  FileEdit2.Hint := 'Patch WAD FileName';
  FileEdit2.BtnWidth := 22;
  FileEdit2.Btn1Glyph := Image1.Picture.Bitmap;
  FileEdit2.Btn1NumGlyphs := 1;
  FileEdit2.Btn2Glyph := Image2.Picture.Bitmap;
  FileEdit2.Btn2NumGlyphs := 1;
  FileEdit2.TabOrder := 1;
  FileEdit2.OnChange := FileEdit2Change;
  FileEdit2.OnBtn1Click := FileEdit2Btn1Click;

  if not VarIsEmpty(regLightFactor.Value) then
    TrackBar1.Position := Max(TrackBar1.Min, Min(regLightFactor.Value, TrackBar1.Max));
  if not VarIsEmpty(regdoThings.Value) then
    CheckBox1.Checked := regdoThings.Value;
end;

procedure TOpenDoomMapForm.FormDestroy(Sender: TObject);
begin
  regdoThings.Value := CheckBox1.Checked;
  regdoThings.Free;

  regLightFactor.Value := TrackBar1.Position;
  regLightFactor.Free;

  FormRestorer1.Store;
  FormRestorer1.Free;

  MessageBox1.Free;
  MessageBox2.Free;
  MessageBox3.Free;

  FileEdit1.Free;
  FileEdit2.Free;
end;

procedure TOpenDoomMapForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  begin
    CanClose := (FileEdit1.Text <> '') and FileExists(FileEdit1.Text) and
                (FileEdit2.Text <> '') and FileExists(FileEdit2.Text);
    if not CanClose then
    begin
      MessageBox1.Execute;
      FileEdit1.SetFocus;
    end
    else
    begin
      CanClose := not (GetWADType(FileEdit1.Text) in [idInvalid, idVJ]);
      if not CanClose then
      begin
        MessageBox2.Execute;
        FileEdit1.SetFocus;
      end
      else
      begin
        CanClose := not (GetWADType(FileEdit2.Text) in [idInvalid, idVJ]);
        if not CanClose then
        begin
          MessageBox3.Execute;
          FileEdit2.SetFocus;
        end
      end;
    end;
  end;
end;

end.
