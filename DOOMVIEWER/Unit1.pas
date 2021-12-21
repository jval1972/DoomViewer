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
//  Main Form
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//  New site: https://sourceforge.net/projects/doomviewer/
//  Old Site: http://www.geocities.ws/jimmyvalavanis/applications/doomviewer.html
//------------------------------------------------------------------------------

{$I defs.inc}

unit Unit1;

{
  Version 2.3
  -----------
  Png & jpg screenshot export
  Open source release

  Version 2.2
  -----------
  Animated textures for floors & ceilings

  Version 2.1
  -----------
  Use of DirectShowMedia for midi playback inside WADs.
  Lower memory utilization of TD3DSectorCollection (texture filenames)
  Better sprite perspective (surfaces.pas - TD3DExObject)
  Improved 2D view

  Bug fixed: Now we can load MAP40 from Hexen

-------------------------
  Version 1.5
  Triangularization algorithm improvments, Texture transparency corrections.
  Hide walls bug fixed.

-------------------------
  Version 1.4
  Step sound while navigating,
  allow to accelerate, or brake using the <shift> key.
  Better Sky support.

-------------------------
  Version 1.3
  1. Option to hide sprites
  2. Screenshop export

-------------------------
  Version 1.2
  1. Strife support.

-------------------------
  Version 1.1
  1. Sprites
  2. Set scene view at player start postion

-------------------------
  Version 1.0.
  Initial release
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ImgList, ShellAPI, AppEvnts, Tabs, ExtCtrls, ToolWin, ComCtrls,
  ExtDlgs, Menus, Buttons, MessageBox, XPMenu, Aboutdlg, AnotherReg,
  BinaryData, pngimage, jpeg, xPPM, xM8, xTGA, MMSystem, se_DoomUtils,
  se_DoomTypes, se_MyD3DUtils, se_DXInput, se_DirectX, se_DXClass, se_DXDraws,
  se_D3DUtils, se_Main, se_DXDUtils, se_Wave;

const
  vMax = 8; // Maximum navigation speed
  CULLDISTANCE = 10000.0;

type
  TDoomSoundRec = record
    SoundID: integer;
    SoundName: string;
    LastTimePlayed: TD3DValue;
    RepetitionAfter: TD3DValue;
  end;

type
  TDoomViewerScene = class(TD3DScene)
  public
    procedure UpdateObjectsTime; override;
  end;

  TDXViewerForm = class(TDXForm)
    ApplicationEvents1: TApplicationEvents;
    ToolBar1: TToolBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    ToolButton1: TToolButton;
    Open2: TSpeedButton;
    ToolButton2: TToolButton;
    DisplayModeBox: TComboBox;
    FullScreen2: TSpeedButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    PrevMap: TSpeedButton;
    ComboBox1: TComboBox;
    NextMap: TSpeedButton;
    Edit1: TMenuItem;
    Copy1: TMenuItem;
    Copy2: TSpeedButton;
    ToolButton5: TToolButton;
    View1: TMenuItem;
    N2D1: TMenuItem;
    N3D1: TMenuItem;
    FullScreen1: TMenuItem;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Notebook1: TNotebook;
    Image1: TImage;
    ImageList1: TImageList;
    Contactme1: TMenuItem;
    N2: TMenuItem;
    QuickInfo1: TMenuItem;
    HomePage1: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    Save2: TSpeedButton;
    SaveAs1: TMenuItem;
    Options1: TMenuItem;
    Renderthings1: TMenuItem;
    Sound1: TMenuItem;
    Checknavigation1: TMenuItem;
    N3: TMenuItem;
    SafeModerendering1: TMenuItem;
    Hardware1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    Timer1: TTimer;
    ShowAnimations1: TMenuItem;
    DXDrawPanel: TPanel;
    StepSoundTimer: TTimer;
    BreakTimer: TTimer;
    AccelerateTimer: TTimer;
    TextureFiltering1: TMenuItem;
    procedure DXTimerTimer(Sender: TObject; LagCount: Integer);
    procedure DXDrawInitializeSurface(Sender: TObject);
    procedure DXDrawInitialize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure DXDrawFinalize(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FullScreenClick(Sender: TObject);
    procedure DisplayModeBoxChange(Sender: TObject);
    procedure PrevMapClick(Sender: TObject);
    procedure NextMapClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CopyClick(Sender: TObject);
    procedure N2D1Click(Sender: TObject);
    procedure N3D1Click(Sender: TObject);
    procedure View1Click(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure Contactme1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure QuickInfo1Click(Sender: TObject);
    procedure HomePage1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure Renderthings1Click(Sender: TObject);
    procedure Sound1Click(Sender: TObject);
    procedure Checknavigation1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure SafeModerendering1Click(Sender: TObject);
    procedure Hardware1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DXDrawClick(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Notebook1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DXTimerActivate(Sender: TObject);
    procedure DXTimerDeactivate(Sender: TObject);
    procedure ShowAnimations1Click(Sender: TObject);
    procedure StepSoundTimerExecute(Sender: TObject);
    procedure AccelerateTimerExecute(Sender: TObject);
    procedure BreakTimerExecute(Sender: TObject);
    procedure TextureFiltering1Click(Sender: TObject);
  private
    { Private declarations }
    DXDraw: TDXDraw;
    DXTimer: TDXTimer;
    DXInput: TDXInput;

    mmXPMenu1: TmmXPMenu;
    AboutDialog1: TAboutDialog;
    regFormRestorer1: TFormRestorer;
    regSceneBitCount: TVariantProfile;
    regSceneWidth: TVariantProfile;
    regSceneHeight: TVariantProfile;
    regSafeMode: TVariantProfile;
    regUseHardwareAcceleration: TVariantProfile;
    regShowAnimations: TVariantProfile;
    regRenderThings: TVariantProfile;
    regSoundOn: TVariantProfile;
    regCheckNavigation: TVariantProfile;
    regTextureFiltering: TVariantProfile;

    ErrorNoMapSelectedMessageBox: TMessageBox;
    ErrorNoFileSelectMessageBox: TMessageBox;
    ClipboardErrorMessageBox: TMessageBox;
    ErrorMessageBox: TMessageBox;
    MessageBox1: TMessageBox;

    Scene: TDoomViewerScene;
    WalkTime: double;
    WalkDistance: double;
    OldTime: double; // last render timer
    LastStepSoundAt: double;
    LastBreathSoundAt: double;

    vMaxPosition: TD3DValue; // maximun desired speed
    AcceleratingSpeed,
    BreakingSpeed: TD3DValue;
    vPosition: TD3DValue; // Τρέχουσα ταχύτητα
    vTarget: TD3DValue;   // Ταχύτητα που στοχεύουμε
    vRotation: TD3DValue; // Περιστροφή (μοίρες/sec)

    MapName: string;
    MainWAD, PWAD: TFileName;
    lFactor: single;
    doThings: boolean;

    bCube: TBoundingCube;
    bCubeSize: TD3DValue;

    lLineDefs: PDoomLineDefs; numLineDefs: integer;
    lVertexes: PDoomVertexes; numVertexes: integer;
    lSegs: PDoomSegs; numSegs: integer;
    lSubSectors: PDoomSubSectors; numSubSectors: integer;
    lThings: PDoomThings;
    numThings: integer;
    lSideDefs: PDoomSideDefs;
    numSideDefs: integer;
    lSectors: PDoomSectors;
    numSectors: integer;

    xShift,
    yShift: single; // 2D display offsets
    lastWidth,
    lastHeight: integer;

    serrormessage: string;

    procedure CreateComponents;
    procedure DestroyComponents;

    procedure ZoomIn2D;
    procedure ZoomOut2D;

    procedure FrameMovie(Time: Double);
//    procedure FrameSky(Time: Double);
    procedure DrawTheScene;

    procedure LoadMap(const doFast: boolean = False);

  // 2D support
    procedure Read2DMap;
    procedure Make2DPreview;
    procedure Clear2DPreviewData;

    procedure SetHardWare(flag: boolean; fStartup: boolean = False);
    procedure SetSafeMode(flag: boolean; fStartup: boolean = False);
    procedure AdjustFullScreen(const rlevel: integer = 0);
  protected
    IsLoading: boolean;
  // Sky support
    skyTexture: string;
    SPHERE_0004_ID_0008_Vertexes: PD3DLVertexArray;
    FloorInfo: TD3DQuadrangleInfo;

    wasActive: boolean;
    Song: pointer;
    hSong: integer;

    fScale2D: TD3DValue;

    doFiltering: boolean;

    procedure ResumeSong;
    procedure AdjustThings;
    procedure AdjustNavigation;
    procedure AdjustFocus;
    procedure WMSysCommand(var Msg: TMessage); message WM_SysCommand;
  public
    { Public declarations }
    AppConfigKey1: TAppConfigKey;
  end;

// Compiler $DEFINES
{
    NO_SCRIPTS,
    NO_D3DTRIANGLES,
    NO_D3DSTUBOBJECTS,
    NO_D3DEXOBJECTS,
    NO_D3DBILLBOARDS,
    NO_D3DCUBES,
    NO_D3DSPHERES,
    NO_D3DCONES,
    NO_D3DCYLINDERS,
    NO_D3DPLUGINS,
    NO_D3DRINGS,
    NO_D3DSECTORCOLLECTIONS,
    NO_D3DTEXTS,
    NO_D3DPROCEDURALOBJECTS,
    NO_D3DSOUNDS,
    NO_AVI.

NO_D3DTRIANGLES;NO_D3DSTUBOBJECTS;NO_D3DEXOBJECTS;NO_D3DBILLBOARDS;NO_D3DCUBES;
NO_D3DSPHERES;NO_D3DCONES;NO_D3DCYLINDERS;NO_D3DRINGS;NO_D3DSECTORCOLLECTIONS;
NO_D3DPLUGINS;NO_D3DTEXTS;NO_D3DPROCEDURALOBJECTS;NO_SCRIPTS;NO_AVI;
}

var
  DXViewerForm: TDXViewerForm;

implementation

{$R *.DFM}

uses
  SyncObjs, Math, OpenDoomMapFrm, Clipbrd, Variants, QuickInfoFrm,
  Splash, dv_io, dv_argv, dv_music, dv_globals, se_DXRTLMediaPlayer, se_Utils;

function MediaResumeProc: boolean;
begin
  if DXViewerForm <> nil then
    Result := (Application.Active) and
              ((DXViewerForm.Notebook1.PageIndex = 1) or (doFullScreen in DXViewerForm.DXDraw.Options)) and
              (DXViewerForm.Sound1.Checked) and (DXViewerForm.WindowState <> wsMinimized)
  else
    Result := False;
end;

type
  TD3DSceneDisplayParam = class(TObject)
    Width: integer;
    Height: integer;
    BitCount: integer;
    constructor Create(aWidth, aHeight, aBitCount: integer); virtual;
  end;

{ *** TD3DSceneDisplayParam *** }
constructor TD3DSceneDisplayParam.Create(aWidth, aHeight, aBitCount: integer);
begin
  Inherited Create;
  Width := aWidth;
  Height := aHeight;
  BitCount := aBitCount;
end;

{ *** TDoomViewerScene *** }
procedure TDoomViewerScene.UpdateObjectsTime;
var i: integer;
begin
  if DXViewerForm.ShowAnimations1.Checked then
    Inherited
  else
  begin
    for i := 0 to Surfaces.Count - 1 do
      if Surfaces.Objects[i].InheritsFrom(TD3DTimingObject) then
        (Surfaces.Objects[i] as TD3DTimingObject).Time := (Surfaces.Objects[i] as TD3DTimingObject).StartTime;
  end;
end;

// Ορίζουμε τα keyboard assignes για το DXInput
function KeyAssignProc: TKeyAssignList;
begin
  FillChar(Result, SizeOf(Result), 0);

  AssignKey(Result, isUp,      [VK_UP, VK_NUMPAD8]);
  AssignKey(Result, isDown,    [VK_DOWN, VK_NUMPAD2]);
  AssignKey(Result, isLeft,    [VK_LEFT, VK_NUMPAD4]);
  AssignKey(Result, isRight,   [VK_RIGHT, VK_NUMPAD6]);
  AssignKey(Result, isButton1, [VK_NUMPAD9]);
  AssignKey(Result, isButton2, [VK_NUMPAD3]);
  AssignKey(Result, isButton3, [VK_ADD, 187]);
  AssignKey(Result, isButton4, [VK_SUBTRACT, 189]);
  AssignKey(Result, isButton5, [VK_SHIFT]); // run!
end;

procedure TDXViewerForm.WMSysCommand(var Msg: TMessage);
begin
  if (Msg.WParam = SC_SCREENSAVE) then
    if doFullScreen in DXDraw.NowOptions then
    begin
      Msg.Result := 0;
      Exit;
    end;
  DefWindowProc(Handle, Msg.Msg, Msg.WParam, Msg.LParam);
end;

procedure TDXViewerForm.DXTimerTimer(Sender: TObject; LagCount: Integer);
var
  cs: TCriticalSection;
begin
  cs := TCriticalSection.Create;
  try
    cs.Enter;
    DrawTheScene;
  finally
    cs.Release;
    cs.Free;
  end;
  if serrormessage <> '' then
  begin
    ErrorMessageBox.Execute(serrormessage);
    serrormessage := '';
  end;
end;

procedure TDXViewerForm.DrawTheScene;
begin
  if Scene = nil then Exit;

  if NoteBook1.PageIndex = 1 then
  begin
    if DXDraw.CanDraw and not IsLoading then
    begin
      { Frame Movie }
      FrameMovie(GetTickCount / 1000);

      if doFiltering then
      begin
        DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_MINFILTER, ord(D3DTFN_LINEAR));
        DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_MAGFILTER, ord(D3DTFG_LINEAR));
      end
      else
      begin
        DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_MINFILTER, ord(D3DTFN_POINT));
        DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_MAGFILTER, ord(D3DTFG_POINT));
      end;

      Scene.DrawWithBackColor(clBlack);

      DXDraw.Flip;
    end;
  end;
end;

procedure TDXViewerForm.DXDrawInitializeSurface(Sender: TObject);
var
  vp: TD3DViewport7;
  mtrl: TD3DMaterial7;
  matProj: TD3DMatrix;
begin
  { Viewport }
  FillChar(vp, SizeOf(vp), 0);
  vp.dwX := 0;
  vp.dwY := 0;
  vp.dwWidth := DXDraw.SurfaceWidth;
  vp.dwHeight := DXDraw.SurfaceHeight;
  vp.dvMinZ := 0.0;
  vp.dvMaxZ := 1.0;

  DXDraw.D3DDevice7.SetViewport(vp);

  {  Material  }
  FillChar(mtrl, SizeOf(mtrl), 0);
  mtrl.ambient.r := 1.0;
  mtrl.ambient.g := 1.0;
  mtrl.ambient.b := 1.0;
  mtrl.ambient.a := 1.0;
  mtrl.specular.r := 0.0;
  mtrl.specular.g := 0.0;
  mtrl.specular.b := 0.0;
  mtrl.specular.a := 0.0;
  mtrl.diffuse.r := 1.0;
  mtrl.diffuse.g := 1.0;
  mtrl.diffuse.b := 1.0;
  DXDraw.D3DDevice7.SetMaterial(mtrl);
  DXDraw.D3DDevice7.SetRenderState(D3DRENDERSTATE_AMBIENT, $ffffffff);
  DXDraw.D3DDevice7.SetRenderState(D3DRENDERSTATE_SPECULARENABLE, 1);

// Set the projection matrix.
  FillChar(matProj, SizeOf(matProj), 0);
  matProj._11 :=  1.0;
  matProj._22 :=  1.0;
  matProj._33 :=  1.0;
  matProj._34 :=  1.0;
  matProj._43 := -1.0;
  DXDraw.D3DDevice7.SetTransform( D3DTRANSFORMSTATE_PROJECTION, matProj );

//Note: in DX7, setting D3DRENDERSTATE_LIGHTING to FALSE is needed to
// turn off vertex lighting (and use the color in the D3DLVERTEX instead.)
  DXDraw.D3DDevice7.SetRenderState(D3DRENDERSTATE_LIGHTING, 0);

  DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_COLORARG1, ord(D3DTA_TEXTURE));
  DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_COLORARG2, ord(D3DTA_DIFFUSE));
  DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_COLOROP, ord(D3DTOP_MODULATE));
  DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_ALPHAOP, ord(D3DTOP_SELECTARG1));
  DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_ALPHAARG1, ord(D3DTA_TEXTURE));
  DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_MINFILTER, ord(D3DTFN_LINEAR));
  DXDraw.D3DDevice7.SetTextureStageState(0, D3DTSS_MAGFILTER, ord(D3DTFG_LINEAR));
//  DXDraw.D3DDevice7.SetRenderState(D3DRENDERSTATE_NORMALIZENORMALS, ord(True));
  DXDraw.D3DDevice7.SetRenderState(D3DRENDERSTATE_COLORKEYENABLE, 1);

//  DXDraw.D3DDevice7.SetRenderState(D3DRENDERSTATE_ANTIALIAS, ord(D3DANTIALIAS_SORTINDEPENDENT));

  if Scene <> nil then Scene.ForceRecalc;
end;

resourceString
  rsFmtMode = '%dx%d %dbit';

const
  DefSceneWidth = 640;
  DefSceneHeight = 480;
  DefSceneBitCount = 16;
  ValidSceneBitCounts = [16, 32];

procedure TDXViewerForm.DXDrawInitialize(Sender: TObject);
var
  matView: TD3DMatrix;
  i: integer;
  aParam: TD3DSceneDisplayParam;
  sW, sH: integer;
begin
  if DisplayModeBox.Items.Count = 0 then
  begin
    for i := 0 to DXDraw.Display.Count - 1 do
      if DXDraw.Display[i].BitCount in ValidSceneBitCounts then
      begin
        aParam := TD3DSceneDisplayParam.Create(
          DXDraw.Display[i].Width,
          DXDraw.Display[i].Height,
          DXDraw.Display[i].BitCount);
        DisplayModeBox.Items.AddObject(Format(rsFmtMode,
          [aParam.Width, aParam.Height, aParam.BitCount]), aParam);
      end;
    if VarIsEmpty(regSceneWidth.Value) then
      regSceneWidth.Value := DefSceneWidth;
    if VarIsEmpty(regSceneHeight.Value) then
      regSceneHeight.Value := DefSceneHeight;
    if VarIsEmpty(regSceneBitCount.Value) then
      regSceneBitCount.Value := DefSceneBitCount;
    DisplayModeBox.ItemIndex := DisplayModeBox.Items.IndexOf(
      Format(rsFmtMode,
        [Integer(regSceneWidth.Value),
         Integer(regSceneHeight.Value),
         Integer(regSceneBitCount.Value)]));
    if DisplayModeBox.ItemIndex = -1 then
      DisplayModeBox.ItemIndex := DisplayModeBox.Items.IndexOf(
        Format(rsFmtMode,[DefSceneWidth, DefSceneHeight, DefSceneBitCount]));
    if NoteBook1.PageIndex = 1 then
      TryFocusControl(DXDraw);
  end;

  FillChar(matView, SizeOf(matView), 0);
  sW := GetSystemMetrics(SM_CXSCREEN);
  sH := GetSystemMetrics(SM_CYSCREEN);
  if (sW > 0) and (sH > 0) then
    matView._11 := sH / sW
  else
    matView._11 := 0.75; // Screen Aspect ratio
  matView._22 := 1;
  matView._33 := 1;
  DXDraw.D3DDevice7.SetTransform(D3DTRANSFORMSTATE_VIEW, matView);
end;

procedure TDXViewerForm.CreateComponents;
begin
  DXDraw := TDXDraw.Create(self);
  DXDraw.Parent := DXDrawPanel;
  DXDraw.Left := 0;
  DXDraw.Top := 0;
  DXDraw.Width := 640;
  DXDraw.Height := 480;
  DXDraw.AutoInitialize := True;
  DXDraw.AutoSize := True;
  DXDraw.Color := clBlack;
  DXDraw.Display.FixedBitCount := False;
  DXDraw.Display.FixedRatio := True;
  DXDraw.Display.FixedSize := False;
  DXDraw.Options := [doAllowReboot, doWaitVBlank, doAllowPalette256, doStretch, doCenter, doFlip, do3D, doDirectX7Mode, doHardware, doSelectDriver, doZBuffer];
  DXDraw.SurfaceHeight := 480;
  DXDraw.OnFinalize := DXDrawFinalize;
  DXDraw.OnInitialize := DXDrawInitialize;
  DXDraw.OnInitializeSurface := DXDrawInitializeSurface;
  DXDraw.Align := alClient;
  DXDraw.DragMode := dmAutomatic;
  DXDraw.TabOrder := 2;
  DXDraw.Visible := False;
  DXDraw.OnClick := DXDrawClick;

  DXTimer := TDXTimer.Create(self);
  DXTimer.ActiveOnly := True;
  DXTimer.Enabled := False;
  DXTimer.Interval := 10;
  DXTimer.OnTimer := DXTimerTimer;
  DXTimer.OnActivate := DXTimerActivate;
  DXTimer.OnDeactivate := DXTimerDeactivate;

  DXInput := TDXInput.Create(self);
  DXInput.UseDirectInput := False;
  DXInput.UseDirectInput := True;
  DXInput.ActiveOnly := True;

  DXInput.Joystick.BindInputStates := True;
  DXInput.Joystick.Enabled := True;
  DXInput.Joystick.ForceFeedback := False;
  DXInput.Joystick.AutoCenter := True;
  DXInput.Joystick.DeadZoneX := 50;
  DXInput.Joystick.DeadZoneY := 50;
  DXInput.Joystick.DeadZoneZ := 50;
  DXInput.Joystick.ID := 0;
  DXInput.Joystick.RangeX := 1000;
  DXInput.Joystick.RangeY := 1000;
  DXInput.Joystick.RangeZ := 1000;

  DXInput.Keyboard.BindInputStates := True;
  DXInput.Keyboard.Enabled := True;
  DXInput.Keyboard.ForceFeedback := False;

  DXInput.Mouse.BindInputStates := True;
  DXInput.Mouse.Enabled := True;
  DXInput.Mouse.ForceFeedback := False;

  mmXPMenu1 := TmmXPMenu.Create(self);
  mmXPMenu1.Font.Charset := DEFAULT_CHARSET;
  mmXPMenu1.Font.Color := clMenuText;
  mmXPMenu1.Font.Height := -11;
  mmXPMenu1.Font.Name := 'Tahoma';
  mmXPMenu1.Font.Style := [];
  mmXPMenu1.Color := clBtnFace;
  mmXPMenu1.IconBackColor := clBtnFace;
  mmXPMenu1.MenuBarColor := clBtnFace;
  mmXPMenu1.SelectColor := clHighlight;
  mmXPMenu1.SelectBorderColor := clHighlight;
  mmXPMenu1.SelectFontColor := clMenuText;
  mmXPMenu1.DisabledColor := clInactiveCaption;
  mmXPMenu1.SeparatorColor := clBtnFace;
  mmXPMenu1.CheckedColor := clHighlight;
  mmXPMenu1.IconWidth := 24;
  mmXPMenu1.DrawSelect := True;
  mmXPMenu1.UseSystemColors := True;
  mmXPMenu1.OverrideOwnerDraw := False;
  mmXPMenu1.Gradient := False;
  mmXPMenu1.FlatMenu := False;
  mmXPMenu1.MakeToolbars := False;
  mmXPMenu1.MakeControlBars := False;
  mmXPMenu1.AutoDetect := False;
  mmXPMenu1.Active := True;

  AboutDialog1 := TAboutDialog.Create(self);
  AboutDialog1.ProductName := 'DoomViewer';
  AboutDialog1.Version := 'Version 2.3';
  AboutDialog1.Copyright := '© 2003-2018, Jim Valavanis, <jimmyvalavanis@yahoo.gr>';
  AboutDialog1.Comments := 'Doom, Heretic, Hexen && Strife Map Viewer';

  AppConfigKey1 := TAppConfigKey.Create(self);
  AppConfigKey1.ApplicationName := 'DoomViewer';
  AppConfigKey1.ApplicationVersion := '2.3';
  AppConfigKey1.CompanyName := 'Jim Valavanis';
  AppConfigKey1.Name := 'AppConfigKey1';

  regFormRestorer1 := TFormRestorer.Create(self);
  regFormRestorer1.ParentKey := AppConfigKey1;
  regFormRestorer1.Name := 'FormRestorer1';
  regFormRestorer1.Restoring := frSizeAndPosition;
  regFormRestorer1.Restore;

  regSceneBitCount := TVariantProfile.Create(self);
  regSceneBitCount.Key := regFormRestorer1;
  regSceneBitCount.Name := 'SceneBitCount';

  regSceneWidth := TVariantProfile.Create(self);
  regSceneWidth.Key := regFormRestorer1;
  regSceneWidth.Name := 'SceneWidth';

  regSceneHeight := TVariantProfile.Create(self);
  regSceneHeight.Key := regFormRestorer1;
  regSceneHeight.Name := 'SceneHeight';

  regUseHardwareAcceleration := TVariantProfile.Create(self);
  regUseHardwareAcceleration.Key := regFormRestorer1;
  regUseHardwareAcceleration.Name := 'UseHardwareAcceleration';

  regShowAnimations := TVariantProfile.Create(self);
  regShowAnimations.Key := regFormRestorer1;
  regShowAnimations.Name := 'ShowAnimations';

  regSafeMode := TVariantProfile.Create(self);
  regSafeMode.Key := regFormRestorer1;
  regSafeMode.Name := 'SafeMode';

  regRenderThings := TVariantProfile.Create(self);
  regRenderThings.Key := regFormRestorer1;
  regRenderThings.Name := 'RenderThings';

  regSoundOn := TVariantProfile.Create(self);
  regSoundOn.Key := regFormRestorer1;
  regSoundOn.Name := 'SoundOn';

  regCheckNavigation := TVariantProfile.Create(self);
  regCheckNavigation.Key := regFormRestorer1;
  regCheckNavigation.Name := 'CheckNavigation';

  regTextureFiltering := TVariantProfile.Create(self);
  regTextureFiltering.Key := regFormRestorer1;
  regTextureFiltering.Name := 'TextureFiltering';

  ErrorNoMapSelectedMessageBox := TMessageBox.Create(self);
  ErrorNoMapSelectedMessageBox.Caption := 'DoomViewer';
  ErrorNoMapSelectedMessageBox.Text := 'You did not select a valid map to preview.';
  ErrorNoMapSelectedMessageBox.Buttons := mbxOK;
  ErrorNoMapSelectedMessageBox.Icon := mbxIconError;
  ErrorNoMapSelectedMessageBox.DefaultButton := mbxDefButton1;
  ErrorNoMapSelectedMessageBox.Modality := mbxTaskModal;
  ErrorNoMapSelectedMessageBox.TextAlignment := mbxLeft;

  ErrorNoFileSelectMessageBox := TMessageBox.Create(self);
  ErrorNoFileSelectMessageBox.Caption := 'DoomViewer';
  ErrorNoFileSelectMessageBox.Text := 'You did not select a valid filename.';
  ErrorNoFileSelectMessageBox.Buttons := mbxOK;
  ErrorNoFileSelectMessageBox.Icon := mbxIconError;
  ErrorNoFileSelectMessageBox.DefaultButton := mbxDefButton1;
  ErrorNoFileSelectMessageBox.Modality := mbxTaskModal;
  ErrorNoFileSelectMessageBox.TextAlignment := mbxLeft;

  ClipboardErrorMessageBox := TMessageBox.Create(self);
  ClipboardErrorMessageBox.Caption := 'DoomViewer';
  ClipboardErrorMessageBox.Text := 'Can not copy to clipboard an empty bitmap!';
  ClipboardErrorMessageBox.Buttons := mbxOK;
  ClipboardErrorMessageBox.Icon := mbxIconError;
  ClipboardErrorMessageBox.DefaultButton := mbxDefButton1;
  ClipboardErrorMessageBox.Modality := mbxTaskModal;
  ClipboardErrorMessageBox.TextAlignment := mbxLeft;

  ErrorMessageBox := TMessageBox.Create(self);
  ErrorMessageBox.Caption := 'DoomViewer';
  ErrorMessageBox.Text := 'Write your message here.';
  ErrorMessageBox.Buttons := mbxOK;
  ErrorMessageBox.Icon := mbxIconStop;
  ErrorMessageBox.DefaultButton := mbxDefButton1;
  ErrorMessageBox.Modality := mbxTaskModal;
  ErrorMessageBox.TextAlignment := mbxLeft;

  MessageBox1 := TMessageBox.Create(self);
  MessageBox1.Caption := 'DoomViewer';
  MessageBox1.Text := 'Can not determine file type!';
  MessageBox1.Buttons := mbxOK;
  MessageBox1.Icon := mbxIconStop;
  MessageBox1.DefaultButton := mbxDefButton1;
  MessageBox1.Modality := mbxDefModality;
  MessageBox1.TextAlignment := mbxLeft;
end;

procedure TDXViewerForm.DestroyComponents;
begin
  regUseHardwareAcceleration.Free;
  regSceneBitCount.Free;
  regSceneWidth.Free;
  regSceneHeight.Free;
  regSafeMode.Free;
  regTextureFiltering.Free;
  regFormRestorer1.Store;
  regFormRestorer1.Free;
  AppConfigKey1.Free;

  mmXPMenu1.Free;
  AboutDialog1.Free;

  StepSoundTimer.Enabled := False;
  BreakTimer.Enabled := False;
  AccelerateTimer.Enabled := False;

  ErrorNoMapSelectedMessageBox.Free;
  ErrorNoFileSelectMessageBox.Free;
  ClipboardErrorMessageBox.Free;
  MessageBox1.Free;
  ErrorMessageBox.Free;
end;

procedure TDXViewerForm.FormCreate(Sender: TObject);
var
  i: integer;
begin
  if DV_CheckParam('-nosplash') = 0 then
  begin
    SplashForm := TSplashForm.Create(nil);
    SplashForm.Update;
  end;
  Screen.Cursor := crHourglass;
  try
    CreateComponents;

    Color := clBlack;
    DXDrawPanel.Color := clBlack;

    serrormessage := '';

    lLineDefs := nil;
    numLineDefs := 0;
    lVertexes := nil;
    numVertexes := 0;
    lSegs := nil;
    numSegs := 0;
    lSubSectors := nil;
    numSubSectors := 0;
    lThings := nil;
    numThings := 0;
    lSideDefs := nil;
    numSideDefs := 0;
    lSectors := nil;
    numSectors := 0;

    StepSoundTimer.Enabled := False;
    BreakTimer.Enabled := False;
    AccelerateTimer.Enabled := False;

    OnMediaResumeProc := MediaResumeProc;

    mmXPMenu1.Active := (lobyte(loword(GetVersion)) = 5) and
                        (hibyte(loword(GetVersion)) = 0);

    InitWADDIRCache;

    IsLoading := False;
    skyTexture := '';

    FillChar(FloorInfo, SizeOf(FloorInfo), Chr(0));
    FloorInfo.Key := 1;
    FloorInfo.x1 := -10000.0;
    FloorInfo.x2 :=  10000.0;
    FloorInfo.x3 := -10000.0;
    FloorInfo.x4 :=  10000.0;
    FloorInfo.z1 :=  10000.0;
    FloorInfo.z2 :=  10000.0;
    FloorInfo.z3 := -10000.0;
    FloorInfo.z4 := -10000.0;
    FloorInfo.flags := flg_DoubleSided;
    FloorInfo.u := 0.0;
    FloorInfo.v := 0.0;
    FloorInfo.Transparent := False;
    FloorInfo.TextureName := '';

    DXDraw.Align := alClient;
    NoteBook1.PageIndex := 0;
    PageControl1.ActivePageIndex := 0;

    Scene := TDoomViewerScene.Create(DXDraw);

    Scene.UpdateTolerance := 0.1;
    Scene.NearClippingPlane := 0.3;

    StepSoundTimer.Enabled := False;
    WalkTime := 0.0;
    WalkDistance := 0.0;
    LastStepSoundAt := 0.0;
    LastBreathSoundAt := 0.0;
    vMaxPosition := 0.0; // we can't walk
    AcceleratingSpeed := 0.0;
    BreakingSpeed := 0.0;
    vPosition := 0.0;
    vRotation := 20.0;
    vTarget := 0.0;
    StepSoundTimer.Enabled := True;
    BreakTimer.Enabled := False;
    AccelerateTimer.Enabled := False;

    DXDraw.Visible := True;
    DXTimer.Enabled := True;
    WalkTime := 0.0;
    oldTime := GetTickCount / 1000;
    DXInput.Keyboard.Enabled := True;
    DXInput.Keyboard.BindInputStates := True;
    DXInput.Mouse.Enabled := False;
    DXInput.Mouse.BindInputStates := False;
    DXInput.Joystick.Enabled := True;
    DXInput.Joystick.BindInputStates := True;
    DXInput.Keyboard.KeyAssigns := KeyAssignProc;

    if not VarIsEmpty(regRenderThings.Value) then
      Renderthings1.Checked := regRenderThings.Value <> 0
    else
    begin
      Renderthings1.Checked := True;
      regRenderThings.Value := 1;
    end;
    doThings := True;


    if not VarIsEmpty(regSoundOn.Value) then
      Sound1.Checked := regSoundOn.Value <> 0
    else
    begin
      Sound1.Checked := True;
      regSoundOn.Value := 1;
    end;

    if not VarIsEmpty(regShowAnimations.Value) then
      ShowAnimations1.Checked := regShowAnimations.Value <> 0
    else
      ShowAnimations1.Checked := True;

    if not VarIsEmpty(regCheckNavigation.Value) then
      CheckNavigation1.Checked := regCheckNavigation.Value <> 0
    else
    begin
      CheckNavigation1.Checked := False;
      regCheckNavigation.Value := 0;
    end;

    if not VarIsEmpty(regUseHardwareAcceleration.Value) then
      SetHardware(regUseHardwareAcceleration.Value, True);

    if not VarIsEmpty(regSafeMode.Value) then
      SetSafeMode(regSafeMode.Value, True)
    else
      SetSafeMode(True, True);

    if not VarIsEmpty(regTextureFiltering.Value) then
      doFiltering := regTextureFiltering.Value
    else
      doFiltering := False;
    TextureFiltering1.Checked := doFiltering;

    MakeEmptyBoundingCube(bCube);
    bCubeSize := g_HUGE;

    FullScreen1.Enabled := False;
    FullScreen2.Enabled := False;

    i := DV_CheckParam('-file');
    if i > 0 then
    begin
      MainWAD := DV_GetParam(i + 1);
      PWAD := MainWAD;
    end
    else
    begin
      MainWAD := '';
      PWAD := '';
    end;

    i := DV_CheckParam('-map');
    if i > 0 then
    begin
      MapName := DV_GetParam(i + 1);
    end
    else
      MapName := '';

    lFactor := -1;
    fScale2D := 1.0;
    xShift := 0.0;
    yShift := 0.0;
    lastWidth := Image1.Width;
    lastHeight := Image1.Height;

    wasActive := True;
    hSong := 0;
    Song := nil;
    DV_InitMusic;

////////////////////////////////////////////////////////////////////////////////
// Sky support
    GetMem(SPHERE_0004_ID_0008_Vertexes, 320 * SizeOf(TD3DLVertex));
    SPHERE_0004_ID_0008_Vertexes[0] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[1] := MakeD3DLVERTEX(0.000000000000, 6755.282714843750, 3090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[2] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[3] := MakeD3DLVERTEX(1256.885375976563, 6755.282714843750, 2823.010742187500, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[4] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[5] := MakeD3DLVERTEX(2296.444091796875, 6755.282714843750, 2067.727050781250, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[6] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[7] := MakeD3DLVERTEX(2938.926513671875, 6755.282714843750, 954.914978027344, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[8] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[9] := MakeD3DLVERTEX(3073.241699218750, 6755.282714843750, -323.010864257813, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[10] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[11] := MakeD3DLVERTEX(2676.165771484375, 6755.282714843750, -1545.085205078125, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[12] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[13] := MakeD3DLVERTEX(1816.356201171875, 6755.282714843750, -2500.000244140625, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[14] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[15] := MakeD3DLVERTEX(642.482177734375, 6755.282714843750, -3022.642333984375, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[16] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[17] := MakeD3DLVERTEX(-642.482788085938, 6755.282714843750, -3022.642333984375, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[18] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[19] := MakeD3DLVERTEX(-1816.356811523438, 6755.282714843750, -2499.999755859375, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[20] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[21] := MakeD3DLVERTEX(-2676.166015625000, 6755.282714843750, -1545.084716796875, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[22] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[23] := MakeD3DLVERTEX(-3073.241699218750, 6755.282714843750, -323.010345458984, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[24] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[25] := MakeD3DLVERTEX(-2938.926269531250, 6755.282714843750, 954.915405273438, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[26] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[27] := MakeD3DLVERTEX(-2296.443603515625, 6755.282714843750, 2067.727783203125, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[28] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[29] := MakeD3DLVERTEX(-1256.884887695313, 6755.282714843750, 2823.010986328125, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[30] := MakeD3DLVERTEX(0.000000000000, 7000.000000000000, 0.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.000000000000);
    SPHERE_0004_ID_0008_Vertexes[31] := MakeD3DLVERTEX(0.000540302484, 6755.282714843750, 3090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[32] := MakeD3DLVERTEX(0.000000000000, 6755.282714843750, 3090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[33] := MakeD3DLVERTEX(0.000000000000, 6045.084960937500, 5877.852539062500, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[34] := MakeD3DLVERTEX(1256.885375976563, 6755.282714843750, 2823.010742187500, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[35] := MakeD3DLVERTEX(2390.738037109375, 6045.084960937500, 5369.685058593750, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[36] := MakeD3DLVERTEX(2296.444091796875, 6755.282714843750, 2067.727050781250, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[37] := MakeD3DLVERTEX(4368.096191406250, 6045.084960937500, 3933.050537109375, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[38] := MakeD3DLVERTEX(2938.926513671875, 6755.282714843750, 954.914978027344, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[39] := MakeD3DLVERTEX(5590.169921875000, 6045.084960937500, 1816.356201171875, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[40] := MakeD3DLVERTEX(3073.241699218750, 6755.282714843750, -323.010864257813, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[41] := MakeD3DLVERTEX(5845.652832031250, 6045.084960937500, -614.403137207031, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[42] := MakeD3DLVERTEX(2676.165771484375, 6755.282714843750, -1545.085205078125, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[43] := MakeD3DLVERTEX(5090.369628906250, 6045.084960937500, -2938.926513671875, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[44] := MakeD3DLVERTEX(1816.356201171875, 6755.282714843750, -2500.000244140625, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[45] := MakeD3DLVERTEX(3454.914794921875, 6045.084960937500, -4755.283203125000, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[46] := MakeD3DLVERTEX(642.482177734375, 6755.282714843750, -3022.642333984375, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[47] := MakeD3DLVERTEX(1222.073730468750, 6045.084960937500, -5749.407226562500, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[48] := MakeD3DLVERTEX(-642.482788085938, 6755.282714843750, -3022.642333984375, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[49] := MakeD3DLVERTEX(-1222.074829101563, 6045.084960937500, -5749.406738281250, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[50] := MakeD3DLVERTEX(-1816.356811523438, 6755.282714843750, -2499.999755859375, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[51] := MakeD3DLVERTEX(-3454.915527343750, 6045.084960937500, -4755.282226562500, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[52] := MakeD3DLVERTEX(-2676.166015625000, 6755.282714843750, -1545.084716796875, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[53] := MakeD3DLVERTEX(-5090.369628906250, 6045.084960937500, -2938.925537109375, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[54] := MakeD3DLVERTEX(-3073.241699218750, 6755.282714843750, -323.010345458984, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[55] := MakeD3DLVERTEX(-5845.652832031250, 6045.084960937500, -614.402160644531, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[56] := MakeD3DLVERTEX(-2938.926269531250, 6755.282714843750, 954.915405273438, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[57] := MakeD3DLVERTEX(-5590.169433593750, 6045.084960937500, 1816.357055664063, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[58] := MakeD3DLVERTEX(-2296.443603515625, 6755.282714843750, 2067.727783203125, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[59] := MakeD3DLVERTEX(-4368.095214843750, 6045.084960937500, 3933.051757812500, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[60] := MakeD3DLVERTEX(-1256.884887695313, 6755.282714843750, 2823.010986328125, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[61] := MakeD3DLVERTEX(-2390.737060546875, 6045.084960937500, 5369.686035156250, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[62] := MakeD3DLVERTEX(0.000540302484, 6755.282714843750, 3090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.100000001490);
    SPHERE_0004_ID_0008_Vertexes[63] := MakeD3DLVERTEX(0.001027716324, 6045.084960937500, 5877.852539062500, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[64] := MakeD3DLVERTEX(0.000000000000, 6045.084960937500, 5877.852539062500, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[65] := MakeD3DLVERTEX(0.000000000000, 4938.926269531250, 8090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[66] := MakeD3DLVERTEX(2390.738037109375, 6045.084960937500, 5369.685058593750, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[67] := MakeD3DLVERTEX(3290.568603515625, 4938.926269531250, 7390.738281250000, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[68] := MakeD3DLVERTEX(4368.096191406250, 6045.084960937500, 3933.050537109375, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[69] := MakeD3DLVERTEX(6012.168457031250, 4938.926269531250, 5413.380371093750, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[70] := MakeD3DLVERTEX(5590.169921875000, 6045.084960937500, 1816.356201171875, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[71] := MakeD3DLVERTEX(7694.208984375000, 4938.926269531250, 2499.999755859375, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[72] := MakeD3DLVERTEX(5845.652832031250, 6045.084960937500, -614.403137207031, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[73] := MakeD3DLVERTEX(8045.851562500000, 4938.926269531250, -845.653442382813, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[74] := MakeD3DLVERTEX(5090.369628906250, 6045.084960937500, -2938.926513671875, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[75] := MakeD3DLVERTEX(7006.292480468750, 4938.926269531250, -4045.085693359375, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[76] := MakeD3DLVERTEX(3454.914794921875, 6045.084960937500, -4755.283203125000, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[77] := MakeD3DLVERTEX(4755.282226562500, 4938.926269531250, -6545.085449218750, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[78] := MakeD3DLVERTEX(1222.073730468750, 6045.084960937500, -5749.407226562500, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[79] := MakeD3DLVERTEX(1682.040283203125, 4938.926269531250, -7913.380859375000, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[80] := MakeD3DLVERTEX(-1222.074829101563, 6045.084960937500, -5749.406738281250, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[81] := MakeD3DLVERTEX(-1682.041748046875, 4938.926269531250, -7913.380371093750, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[82] := MakeD3DLVERTEX(-3454.915527343750, 6045.084960937500, -4755.282226562500, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[83] := MakeD3DLVERTEX(-4755.283691406250, 4938.926269531250, -6545.084472656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[84] := MakeD3DLVERTEX(-5090.369628906250, 6045.084960937500, -2938.925537109375, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[85] := MakeD3DLVERTEX(-7006.292968750000, 4938.926269531250, -4045.084472656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[86] := MakeD3DLVERTEX(-5845.652832031250, 6045.084960937500, -614.402160644531, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[87] := MakeD3DLVERTEX(-8045.851562500000, 4938.926269531250, -845.651977539063, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[88] := MakeD3DLVERTEX(-5590.169433593750, 6045.084960937500, 1816.357055664063, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[89] := MakeD3DLVERTEX(-7694.208496093750, 4938.926269531250, 2500.001220703125, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[90] := MakeD3DLVERTEX(-4368.095214843750, 6045.084960937500, 3933.051757812500, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[91] := MakeD3DLVERTEX(-6012.167480468750, 4938.926269531250, 5413.381347656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[92] := MakeD3DLVERTEX(-2390.737060546875, 6045.084960937500, 5369.686035156250, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[93] := MakeD3DLVERTEX(-3290.567382812500, 4938.926269531250, 7390.738769531250, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[94] := MakeD3DLVERTEX(0.001027716324, 6045.084960937500, 5877.852539062500, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.200000002980);
    SPHERE_0004_ID_0008_Vertexes[95] := MakeD3DLVERTEX(0.001414530328, 4938.926269531250, 8090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[96] := MakeD3DLVERTEX(0.000000000000, 4938.926269531250, 8090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[97] := MakeD3DLVERTEX(0.000000000000, 3545.084960937500, 9510.565429687500, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[98] := MakeD3DLVERTEX(3290.568603515625, 4938.926269531250, 7390.738281250000, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[99] := MakeD3DLVERTEX(3868.295654296875, 3545.084960937500, 8688.333984375000, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[100] := MakeD3DLVERTEX(6012.168457031250, 4938.926269531250, 5413.380371093750, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[101] := MakeD3DLVERTEX(7067.728027343750, 3545.084960937500, 6363.809570312500, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[102] := MakeD3DLVERTEX(7694.208984375000, 4938.926269531250, 2499.999755859375, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[103] := MakeD3DLVERTEX(9045.084960937500, 3545.084960937500, 2938.926269531250, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[104] := MakeD3DLVERTEX(8045.851562500000, 4938.926269531250, -845.653442382813, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[105] := MakeD3DLVERTEX(9458.465820312500, 3545.084960937500, -994.125244140625, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[106] := MakeD3DLVERTEX(7006.292480468750, 4938.926269531250, -4045.085693359375, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[107] := MakeD3DLVERTEX(8236.390625000000, 3545.084960937500, -4755.283203125000, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[108] := MakeD3DLVERTEX(4755.282226562500, 4938.926269531250, -6545.085449218750, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[109] := MakeD3DLVERTEX(5590.169433593750, 3545.084960937500, -7694.209960937500, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[110] := MakeD3DLVERTEX(1682.040283203125, 4938.926269531250, -7913.380859375000, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[111] := MakeD3DLVERTEX(1977.356933593750, 3545.084960937500, -9302.737304687500, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[112] := MakeD3DLVERTEX(-1682.041748046875, 4938.926269531250, -7913.380371093750, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[113] := MakeD3DLVERTEX(-1977.358642578125, 3545.084960937500, -9302.736328125000, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[114] := MakeD3DLVERTEX(-4755.283691406250, 4938.926269531250, -6545.084472656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[115] := MakeD3DLVERTEX(-5590.171386718750, 3545.084960937500, -7694.208496093750, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[116] := MakeD3DLVERTEX(-7006.292968750000, 4938.926269531250, -4045.084472656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[117] := MakeD3DLVERTEX(-8236.391601562500, 3545.084960937500, -4755.281738281250, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[118] := MakeD3DLVERTEX(-8045.851562500000, 4938.926269531250, -845.651977539063, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[119] := MakeD3DLVERTEX(-9458.465820312500, 3545.084960937500, -994.123596191406, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[120] := MakeD3DLVERTEX(-7694.208496093750, 4938.926269531250, 2500.001220703125, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[121] := MakeD3DLVERTEX(-9045.084960937500, 3545.084960937500, 2938.927490234375, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[122] := MakeD3DLVERTEX(-6012.167480468750, 4938.926269531250, 5413.381347656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[123] := MakeD3DLVERTEX(-7067.727050781250, 3545.084960937500, 6363.811523437500, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[124] := MakeD3DLVERTEX(-3290.567382812500, 4938.926269531250, 7390.738769531250, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[125] := MakeD3DLVERTEX(-3868.293945312500, 3545.084960937500, 8688.334960937500, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[126] := MakeD3DLVERTEX(0.001414530328, 4938.926269531250, 8090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.300000011921);
    SPHERE_0004_ID_0008_Vertexes[127] := MakeD3DLVERTEX(0.001662880066, 3545.084960937500, 9510.565429687500, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[128] := MakeD3DLVERTEX(0.000000000000, 3545.084960937500, 9510.565429687500, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[129] := MakeD3DLVERTEX(0.000000000000, 1999.999755859375, 10000.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[130] := MakeD3DLVERTEX(3868.295654296875, 3545.084960937500, 8688.333984375000, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[131] := MakeD3DLVERTEX(4067.366455078125, 1999.999755859375, 9135.454101562500, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[132] := MakeD3DLVERTEX(7067.728027343750, 3545.084960937500, 6363.809570312500, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[133] := MakeD3DLVERTEX(7431.448730468750, 1999.999755859375, 6691.305664062500, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[134] := MakeD3DLVERTEX(9045.084960937500, 3545.084960937500, 2938.926269531250, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[135] := MakeD3DLVERTEX(9510.565429687500, 1999.999755859375, 3090.169677734375, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[136] := MakeD3DLVERTEX(9458.465820312500, 3545.084960937500, -994.125244140625, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[137] := MakeD3DLVERTEX(9945.218750000000, 1999.999755859375, -1045.285034179688, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[138] := MakeD3DLVERTEX(8236.390625000000, 3545.084960937500, -4755.283203125000, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[139] := MakeD3DLVERTEX(8660.253906250000, 1999.999755859375, -5000.000488281250, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[140] := MakeD3DLVERTEX(5590.169433593750, 3545.084960937500, -7694.209960937500, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[141] := MakeD3DLVERTEX(5877.852050781250, 1999.999755859375, -8090.170410156250, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[142] := MakeD3DLVERTEX(1977.356933593750, 3545.084960937500, -9302.737304687500, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[143] := MakeD3DLVERTEX(2079.116210937500, 1999.999755859375, -9781.476562500000, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[144] := MakeD3DLVERTEX(-1977.358642578125, 3545.084960937500, -9302.736328125000, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[145] := MakeD3DLVERTEX(-2079.117919921875, 1999.999755859375, -9781.475585937500, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[146] := MakeD3DLVERTEX(-5590.171386718750, 3545.084960937500, -7694.208496093750, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[147] := MakeD3DLVERTEX(-5877.853515625000, 1999.999755859375, -8090.169433593750, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[148] := MakeD3DLVERTEX(-8236.391601562500, 3545.084960937500, -4755.281738281250, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[149] := MakeD3DLVERTEX(-8660.254882812500, 1999.999755859375, -4999.999023437500, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[150] := MakeD3DLVERTEX(-9458.465820312500, 3545.084960937500, -994.123596191406, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[151] := MakeD3DLVERTEX(-9945.218750000000, 1999.999755859375, -1045.283325195313, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[152] := MakeD3DLVERTEX(-9045.084960937500, 3545.084960937500, 2938.927490234375, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[153] := MakeD3DLVERTEX(-9510.564453125000, 1999.999755859375, 3090.171142578125, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[154] := MakeD3DLVERTEX(-7067.727050781250, 3545.084960937500, 6363.811523437500, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[155] := MakeD3DLVERTEX(-7431.447265625000, 1999.999755859375, 6691.307617187500, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[156] := MakeD3DLVERTEX(-3868.293945312500, 3545.084960937500, 8688.334960937500, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[157] := MakeD3DLVERTEX(-4067.364990234375, 1999.999755859375, 9135.455078125000, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[158] := MakeD3DLVERTEX(0.001662880066, 3545.084960937500, 9510.565429687500, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.400000005960);
    SPHERE_0004_ID_0008_Vertexes[159] := MakeD3DLVERTEX(0.001748455572, 1999.999755859375, 10000.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[160] := MakeD3DLVERTEX(0.000000000000, 1999.999755859375, 10000.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[161] := MakeD3DLVERTEX(0.000000000000, 454.914794921875, 9510.564453125000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[162] := MakeD3DLVERTEX(4067.366455078125, 1999.999755859375, 9135.454101562500, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[163] := MakeD3DLVERTEX(3868.295166015625, 454.914794921875, 8688.333007812500, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[164] := MakeD3DLVERTEX(7431.448730468750, 1999.999755859375, 6691.305664062500, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[165] := MakeD3DLVERTEX(7067.727539062500, 454.914794921875, 6363.809570312500, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[166] := MakeD3DLVERTEX(9510.565429687500, 1999.999755859375, 3090.169677734375, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[167] := MakeD3DLVERTEX(9045.084960937500, 454.914794921875, 2938.926025390625, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[168] := MakeD3DLVERTEX(9945.218750000000, 1999.999755859375, -1045.285034179688, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[169] := MakeD3DLVERTEX(9458.464843750000, 454.914794921875, -994.125183105469, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[170] := MakeD3DLVERTEX(8660.253906250000, 1999.999755859375, -5000.000488281250, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[171] := MakeD3DLVERTEX(8236.390625000000, 454.914794921875, -4755.283203125000, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[172] := MakeD3DLVERTEX(5877.852050781250, 1999.999755859375, -8090.170410156250, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[173] := MakeD3DLVERTEX(5590.168945312500, 454.914794921875, -7694.208984375000, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[174] := MakeD3DLVERTEX(2079.116210937500, 1999.999755859375, -9781.476562500000, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[175] := MakeD3DLVERTEX(1977.356811523438, 454.914794921875, -9302.736328125000, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[176] := MakeD3DLVERTEX(-2079.117919921875, 1999.999755859375, -9781.475585937500, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[177] := MakeD3DLVERTEX(-1977.358642578125, 454.914794921875, -9302.736328125000, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[178] := MakeD3DLVERTEX(-5877.853515625000, 1999.999755859375, -8090.169433593750, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[179] := MakeD3DLVERTEX(-5590.170410156250, 454.914794921875, -7694.208007812500, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[180] := MakeD3DLVERTEX(-8660.254882812500, 1999.999755859375, -4999.999023437500, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[181] := MakeD3DLVERTEX(-8236.390625000000, 454.914794921875, -4755.281738281250, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[182] := MakeD3DLVERTEX(-9945.218750000000, 1999.999755859375, -1045.283325195313, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[183] := MakeD3DLVERTEX(-9458.464843750000, 454.914794921875, -994.123535156250, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[184] := MakeD3DLVERTEX(-9510.564453125000, 1999.999755859375, 3090.171142578125, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[185] := MakeD3DLVERTEX(-9045.083984375000, 454.914794921875, 2938.927490234375, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[186] := MakeD3DLVERTEX(-7431.447265625000, 1999.999755859375, 6691.307617187500, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[187] := MakeD3DLVERTEX(-7067.726074218750, 454.914794921875, 6363.811523437500, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[188] := MakeD3DLVERTEX(-4067.364990234375, 1999.999755859375, 9135.455078125000, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[189] := MakeD3DLVERTEX(-3868.293701171875, 454.914794921875, 8688.333984375000, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[190] := MakeD3DLVERTEX(0.001748455572, 1999.999755859375, 10000.000000000000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.500000000000);
    SPHERE_0004_ID_0008_Vertexes[191] := MakeD3DLVERTEX(0.001662879949, 454.914794921875, 9510.564453125000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[192] := MakeD3DLVERTEX(0.000000000000, 454.914794921875, 9510.564453125000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[193] := MakeD3DLVERTEX(0.000000000000, -938.926025390625, 8090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[194] := MakeD3DLVERTEX(3868.295166015625, 454.914794921875, 8688.333007812500, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[195] := MakeD3DLVERTEX(3290.568603515625, -938.926025390625, 7390.738281250000, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[196] := MakeD3DLVERTEX(7067.727539062500, 454.914794921875, 6363.809570312500, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[197] := MakeD3DLVERTEX(6012.168457031250, -938.926025390625, 5413.380371093750, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[198] := MakeD3DLVERTEX(9045.084960937500, 454.914794921875, 2938.926025390625, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[199] := MakeD3DLVERTEX(7694.208984375000, -938.926025390625, 2499.999755859375, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[200] := MakeD3DLVERTEX(9458.464843750000, 454.914794921875, -994.125183105469, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[201] := MakeD3DLVERTEX(8045.851562500000, -938.926025390625, -845.653442382813, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[202] := MakeD3DLVERTEX(8236.390625000000, 454.914794921875, -4755.283203125000, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[203] := MakeD3DLVERTEX(7006.292480468750, -938.926025390625, -4045.085693359375, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[204] := MakeD3DLVERTEX(5590.168945312500, 454.914794921875, -7694.208984375000, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[205] := MakeD3DLVERTEX(4755.282226562500, -938.926025390625, -6545.085449218750, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[206] := MakeD3DLVERTEX(1977.356811523438, 454.914794921875, -9302.736328125000, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[207] := MakeD3DLVERTEX(1682.040283203125, -938.926025390625, -7913.380859375000, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[208] := MakeD3DLVERTEX(-1977.358642578125, 454.914794921875, -9302.736328125000, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[209] := MakeD3DLVERTEX(-1682.041748046875, -938.926025390625, -7913.380371093750, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[210] := MakeD3DLVERTEX(-5590.170410156250, 454.914794921875, -7694.208007812500, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[211] := MakeD3DLVERTEX(-4755.283691406250, -938.926025390625, -6545.084472656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[212] := MakeD3DLVERTEX(-8236.390625000000, 454.914794921875, -4755.281738281250, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[213] := MakeD3DLVERTEX(-7006.292968750000, -938.926025390625, -4045.084472656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[214] := MakeD3DLVERTEX(-9458.464843750000, 454.914794921875, -994.123535156250, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[215] := MakeD3DLVERTEX(-8045.851562500000, -938.926025390625, -845.651977539063, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[216] := MakeD3DLVERTEX(-9045.083984375000, 454.914794921875, 2938.927490234375, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[217] := MakeD3DLVERTEX(-7694.208496093750, -938.926025390625, 2500.001220703125, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[218] := MakeD3DLVERTEX(-7067.726074218750, 454.914794921875, 6363.811523437500, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[219] := MakeD3DLVERTEX(-6012.167480468750, -938.926025390625, 5413.381347656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[220] := MakeD3DLVERTEX(-3868.293701171875, 454.914794921875, 8688.333984375000, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[221] := MakeD3DLVERTEX(-3290.567382812500, -938.926025390625, 7390.738769531250, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[222] := MakeD3DLVERTEX(0.001662879949, 454.914794921875, 9510.564453125000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.600000023842);
    SPHERE_0004_ID_0008_Vertexes[223] := MakeD3DLVERTEX(0.001414530328, -938.926025390625, 8090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.700000047684);
    SPHERE_0004_ID_0008_Vertexes[224] := MakeD3DLVERTEX(0.000000000000, -938.926025390625, 8090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[225] := MakeD3DLVERTEX(0.000000000000, -2045.085205078125, 5877.852050781250, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[226] := MakeD3DLVERTEX(3290.568603515625, -938.926025390625, 7390.738281250000, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[227] := MakeD3DLVERTEX(2390.737792968750, -2045.085205078125, 5369.684570312500, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[228] := MakeD3DLVERTEX(6012.168457031250, -938.926025390625, 5413.380371093750, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[229] := MakeD3DLVERTEX(4368.095214843750, -2045.085205078125, 3933.050292968750, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[230] := MakeD3DLVERTEX(7694.208984375000, -938.926025390625, 2499.999755859375, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[231] := MakeD3DLVERTEX(5590.169433593750, -2045.085205078125, 1816.356079101563, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[232] := MakeD3DLVERTEX(8045.851562500000, -938.926025390625, -845.653442382813, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[233] := MakeD3DLVERTEX(5845.652343750000, -2045.085205078125, -614.403076171875, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[234] := MakeD3DLVERTEX(7006.292480468750, -938.926025390625, -4045.085693359375, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[235] := MakeD3DLVERTEX(5090.369140625000, -2045.085205078125, -2938.926269531250, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[236] := MakeD3DLVERTEX(4755.282226562500, -938.926025390625, -6545.085449218750, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[237] := MakeD3DLVERTEX(3454.914062500000, -2045.085205078125, -4755.282226562500, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[238] := MakeD3DLVERTEX(1682.040283203125, -938.926025390625, -7913.380859375000, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[239] := MakeD3DLVERTEX(1222.073608398438, -2045.085205078125, -5749.406738281250, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[240] := MakeD3DLVERTEX(-1682.041748046875, -938.926025390625, -7913.380371093750, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[241] := MakeD3DLVERTEX(-1222.074707031250, -2045.085205078125, -5749.406250000000, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[242] := MakeD3DLVERTEX(-4755.283691406250, -938.926025390625, -6545.084472656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[243] := MakeD3DLVERTEX(-3454.915283203125, -2045.085205078125, -4755.281738281250, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[244] := MakeD3DLVERTEX(-7006.292968750000, -938.926025390625, -4045.084472656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[245] := MakeD3DLVERTEX(-5090.369140625000, -2045.085205078125, -2938.925292968750, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[246] := MakeD3DLVERTEX(-8045.851562500000, -938.926025390625, -845.651977539063, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[247] := MakeD3DLVERTEX(-5845.652343750000, -2045.085205078125, -614.402099609375, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[248] := MakeD3DLVERTEX(-7694.208496093750, -938.926025390625, 2500.001220703125, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[249] := MakeD3DLVERTEX(-5590.168945312500, -2045.085205078125, 1816.356933593750, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[250] := MakeD3DLVERTEX(-6012.167480468750, -938.926025390625, 5413.381347656250, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[251] := MakeD3DLVERTEX(-4368.094726562500, -2045.085205078125, 3933.051269531250, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[252] := MakeD3DLVERTEX(-3290.567382812500, -938.926025390625, 7390.738769531250, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[253] := MakeD3DLVERTEX(-2390.736816406250, -2045.085205078125, 5369.685058593750, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[254] := MakeD3DLVERTEX(0.001414530328, -938.926025390625, 8090.169921875000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.699999988079);
    SPHERE_0004_ID_0008_Vertexes[255] := MakeD3DLVERTEX(0.001027716207, -2045.085205078125, 5877.852050781250, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[256] := MakeD3DLVERTEX(0.000000000000, -2045.085205078125, 5877.852050781250, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[257] := MakeD3DLVERTEX(0.000000000000, -2755.283203125000, 3090.167968750000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[258] := MakeD3DLVERTEX(2390.737792968750, -2045.085205078125, 5369.684570312500, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[259] := MakeD3DLVERTEX(1256.884521484375, -2755.283203125000, 2823.008789062500, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[260] := MakeD3DLVERTEX(4368.095214843750, -2045.085205078125, 3933.050292968750, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[261] := MakeD3DLVERTEX(2296.442382812500, -2755.283203125000, 2067.725830078125, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[262] := MakeD3DLVERTEX(5590.169433593750, -2045.085205078125, 1816.356079101563, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[263] := MakeD3DLVERTEX(2938.924316406250, -2755.283203125000, 954.914306640625, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[264] := MakeD3DLVERTEX(5845.652343750000, -2045.085205078125, -614.403076171875, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[265] := MakeD3DLVERTEX(3073.239746093750, -2755.283203125000, -323.010650634766, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[266] := MakeD3DLVERTEX(5090.369140625000, -2045.085205078125, -2938.926269531250, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[267] := MakeD3DLVERTEX(2676.163818359375, -2755.283203125000, -1545.084106445313, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[268] := MakeD3DLVERTEX(3454.914062500000, -2045.085205078125, -4755.282226562500, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[269] := MakeD3DLVERTEX(1816.354980468750, -2755.283203125000, -2499.998779296875, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[270] := MakeD3DLVERTEX(1222.073608398438, -2045.085205078125, -5749.406738281250, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[271] := MakeD3DLVERTEX(642.481811523438, -2755.283203125000, -3022.640380859375, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[272] := MakeD3DLVERTEX(-1222.074707031250, -2045.085205078125, -5749.406250000000, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[273] := MakeD3DLVERTEX(-642.482360839844, -2755.283203125000, -3022.640380859375, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[274] := MakeD3DLVERTEX(-3454.915283203125, -2045.085205078125, -4755.281738281250, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[275] := MakeD3DLVERTEX(-1816.355468750000, -2755.283203125000, -2499.998291015625, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[276] := MakeD3DLVERTEX(-5090.369140625000, -2045.085205078125, -2938.925292968750, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[277] := MakeD3DLVERTEX(-2676.164306640625, -2755.283203125000, -1545.083618164063, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[278] := MakeD3DLVERTEX(-5845.652343750000, -2045.085205078125, -614.402099609375, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[279] := MakeD3DLVERTEX(-3073.239746093750, -2755.283203125000, -323.010131835938, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[280] := MakeD3DLVERTEX(-5590.168945312500, -2045.085205078125, 1816.356933593750, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[281] := MakeD3DLVERTEX(-2938.924072265625, -2755.283203125000, 954.914855957031, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[282] := MakeD3DLVERTEX(-4368.094726562500, -2045.085205078125, 3933.051269531250, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[283] := MakeD3DLVERTEX(-2296.442138671875, -2755.283203125000, 2067.726318359375, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[284] := MakeD3DLVERTEX(-2390.736816406250, -2045.085205078125, 5369.685058593750, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[285] := MakeD3DLVERTEX(-1256.884033203125, -2755.283203125000, 2823.009277343750, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[286] := MakeD3DLVERTEX(0.001027716207, -2045.085205078125, 5877.852050781250, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.800000011921);
    SPHERE_0004_ID_0008_Vertexes[287] := MakeD3DLVERTEX(0.000540302135, -2755.283203125000, 3090.167968750000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.900000035763);
    SPHERE_0004_ID_0008_Vertexes[288] := MakeD3DLVERTEX(0.000000000000, -2755.283203125000, 3090.167968750000, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[289] := MakeD3DLVERTEX(0.000000000000, -3000.000000000000, -0.000874227786, D3DCOLOR(16777215), D3DCOLOR(0), 0.000000000000, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[290] := MakeD3DLVERTEX(1256.884521484375, -2755.283203125000, 2823.008789062500, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[291] := MakeD3DLVERTEX(-0.000355580443, -3000.000000000000, -0.000798646768, D3DCOLOR(16777215), D3DCOLOR(0), -0.133333340287, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[292] := MakeD3DLVERTEX(2296.442382812500, -2755.283203125000, 2067.725830078125, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[293] := MakeD3DLVERTEX(-0.000649677881, -3000.000000000000, -0.000584972557, D3DCOLOR(16777215), D3DCOLOR(0), -0.266666680574, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[294] := MakeD3DLVERTEX(2938.924316406250, -2755.283203125000, 954.914306640625, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[295] := MakeD3DLVERTEX(-0.000831440033, -3000.000000000000, -0.000270151213, D3DCOLOR(16777215), D3DCOLOR(0), -0.400000005960, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[296] := MakeD3DLVERTEX(3073.239746093750, -2755.283203125000, -323.010650634766, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[297] := MakeD3DLVERTEX(-0.000869438692, -3000.000000000000, 0.000091381728, D3DCOLOR(16777215), D3DCOLOR(0), -0.533333361149, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[298] := MakeD3DLVERTEX(2676.163818359375, -2755.283203125000, -1545.084106445313, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[299] := MakeD3DLVERTEX(-0.000757103437, -3000.000000000000, 0.000437113922, D3DCOLOR(16777215), D3DCOLOR(0), -0.666666686535, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[300] := MakeD3DLVERTEX(1816.354980468750, -2755.283203125000, -2499.998779296875, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[301] := MakeD3DLVERTEX(-0.000513858104, -3000.000000000000, 0.000707265164, D3DCOLOR(16777215), D3DCOLOR(0), -0.800000011921, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[302] := MakeD3DLVERTEX(642.481811523438, -2755.283203125000, -3022.640380859375, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[303] := MakeD3DLVERTEX(-0.000181762109, -3000.000000000000, 0.000855123857, D3DCOLOR(16777215), D3DCOLOR(0), -0.933333337307, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[304] := MakeD3DLVERTEX(-642.482360839844, -2755.283203125000, -3022.640380859375, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[305] := MakeD3DLVERTEX(0.000181762269, -3000.000000000000, 0.000855123741, D3DCOLOR(16777215), D3DCOLOR(0), -1.066666722298, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[306] := MakeD3DLVERTEX(-1816.355468750000, -2755.283203125000, -2499.998291015625, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[307] := MakeD3DLVERTEX(0.000513858278, -3000.000000000000, 0.000707265048, D3DCOLOR(16777215), D3DCOLOR(0), -1.200000047684, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[308] := MakeD3DLVERTEX(-2676.164306640625, -2755.283203125000, -1545.083618164063, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[309] := MakeD3DLVERTEX(0.000757103437, -3000.000000000000, 0.000437113806, D3DCOLOR(16777215), D3DCOLOR(0), -1.333333373070, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[310] := MakeD3DLVERTEX(-3073.239746093750, -2755.283203125000, -323.010131835938, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[311] := MakeD3DLVERTEX(0.000869438692, -3000.000000000000, 0.000091381575, D3DCOLOR(16777215), D3DCOLOR(0), -1.466666698456, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[312] := MakeD3DLVERTEX(-2938.924072265625, -2755.283203125000, 954.914855957031, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[313] := MakeD3DLVERTEX(0.000831439975, -3000.000000000000, -0.000270151359, D3DCOLOR(16777215), D3DCOLOR(0), -1.600000023842, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[314] := MakeD3DLVERTEX(-2296.442138671875, -2755.283203125000, 2067.726318359375, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[315] := MakeD3DLVERTEX(0.000649677764, -3000.000000000000, -0.000584972673, D3DCOLOR(16777215), D3DCOLOR(0), -1.733333349228, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[316] := MakeD3DLVERTEX(-1256.884033203125, -2755.283203125000, 2823.009277343750, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[317] := MakeD3DLVERTEX(0.000355580356, -3000.000000000000, -0.000798646885, D3DCOLOR(16777215), D3DCOLOR(0), -1.866666674614, 1.000000000000);
    SPHERE_0004_ID_0008_Vertexes[318] := MakeD3DLVERTEX(0.000540302135, -2755.283203125000, 3090.167968750000, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 0.899999976158);
    SPHERE_0004_ID_0008_Vertexes[319] := MakeD3DLVERTEX(-0.000000000153, -3000.000000000000, -0.000874227786, D3DCOLOR(16777215), D3DCOLOR(0), -2.000000000000, 1.000000000000);
////////////////////////////////////////////////////////////////////////////////

    if (MainWAD <> '') and (MapName <> '') then
      LoadMap;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TDXViewerForm.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  DXInput.Keyboard.Enabled := False;
  DXInput.Keyboard.BindInputStates := False;
  DXInput.Mouse.Enabled := False;
  DXInput.Mouse.BindInputStates := False;

  if DisplayModeBox.ItemIndex >= 0 then
  begin
    regSceneWidth.Value :=
      (DisplayModeBox.Items.Objects[DisplayModeBox.ItemIndex] as TD3DSceneDisplayParam).Width;
    regSceneHeight.Value :=
      (DisplayModeBox.Items.Objects[DisplayModeBox.ItemIndex] as TD3DSceneDisplayParam).Height;
    regSceneBitCount.Value :=
      (DisplayModeBox.Items.Objects[DisplayModeBox.ItemIndex] as TD3DSceneDisplayParam).BitCount;
  end;

  if Renderthings1.Checked then
    regRenderThings.Value := 1
  else
    regRenderThings.Value := 0;
  if Sound1.Checked then
    regSoundOn.Value := 1
  else
    regSoundOn.Value := 0;
  if CheckNavigation1.Checked then
    regCheckNavigation.Value := 1
  else
    regCheckNavigation.Value := 0;
  if ShowAnimations1.Checked then
    regShowAnimations.Value := 1
  else
    regShowAnimations.Value := 0;

  for i := 0 to DisplayModeBox.Items.Count - 1 do
    DisplayModeBox.Items.Objects[i].Free;
  DisplayModeBox.Items.Clear;

  regUseHardwareAcceleration.Value := doHardware in DXDraw.Options;
  regSafeMode.Value := Scene.SafeMode;
  regTextureFiltering.Value := doFiltering;

  if (hSong <> 0) or (Song <> nil) then
  begin
    DV_PauseSong(hSong);
    DV_UnRegisterSong(hSong);
    ReallocMem(Song, 0);
    hSong := 0;
//
  end;
  DV_ShutdownMusic;

  FreeWADDIRCache;

  Scene.Free;
  Scene := nil;

  DestroyComponents;
////////////////////////////////////////////////////////////////////////////////
// Sky support
  FreeMem(SPHERE_0004_ID_0008_Vertexes, 320 * SizeOf(TD3DLVertex));
////////////////////////////////////////////////////////////////////////////////
  Clear2DPreviewData;
end;

function IsIntersect2D(obj: TD3DObject; aCenter: TD3DVector): boolean;
begin
  Result := sqrt(sqr(obj.Center.x - aCenter.x) + sqr(obj.Center.z - aCenter.z)) <= obj.Radius;
end;

{procedure TDXViewerForm.FrameSky(Time: Double);
var factor: TD3DValue;
    i: integer;
    mat: TD3DMatrix;
begin
  factor := (Time - oldTime) / 100;

  D3DUtil_SetRotateYMatrix(mat, factor);

  for i := 0 to 319 do
  begin
    D3D_VectorMatrixMultiply_Only_For_SphereRotation(
      SPHERE_0004_ID_0008_Vertexes[i].x,
      SPHERE_0004_ID_0008_Vertexes[i].y,
      SPHERE_0004_ID_0008_Vertexes[i].z,
      SPHERE_0004_ID_0008_Vertexes[i].x,
      SPHERE_0004_ID_0008_Vertexes[i].y,
      SPHERE_0004_ID_0008_Vertexes[i].z, mat);
  end;
end;}

procedure TDXViewerForm.FrameMovie(Time: Double);
var
  X, Y, Z,
  dX, dY, dZ: single;
  dt: single;
  changed: boolean;
begin
  if (not Application.Active) or (WindowState = wsMinimized) then
  begin
    if wasActive then
    begin
      DV_PauseSong(hSong);
      wasActive := False;
    end;
    Exit;
  end;

  if not wasActive then
  begin
    ResumeSong;
    wasActive := True;
  end;

  if NoteBook1.PageIndex <> 1 then
    Exit;

  if Sound1.Checked then
    DV_ProcessMusic;

  dt := Time - OldTime;
  if (dt <> 0.0) then // ΟΚ, we hope that we get a very very VERY big frame rate!!!!
  begin

//    FrameSky(Time);

    { Κίνηση με τα βέλη σε FullScreen }
    X := Scene.Position.X;
    Y := Scene.Position.Y;
    Z := Scene.Position.Z;
    dX := Scene.Rotation.X;
    dY := Scene.Rotation.Y;
    dZ := Scene.Rotation.Z;

    DXInput.Update;

    // check if run (shift button down!)
    if (isButton5 in DXInput.States) then
      vMaxPosition := 2 * vMax
    else
      vMaxPosition := vMax;

    if isButton3 in DXInput.States then
      Y := Y + vMaxPosition * dt
    else if isButton4 in DXInput.States then
      Y := Y - vMaxPosition * dt;
    Y := Max(FloorInfo.y1 + 0.5, Y);

    if (isButton5 in DXInput.States) then
    begin
      if isLeft in DXInput.States then
      begin
        WalkTime := WalkTime + dt;
        WalkDistance := WalkDistance + abs(dt * vMaxPosition);
        X := X - vMaxPosition*cos(dY)*dt;
        Z := Z + vMaxPosition*Sin(dY)*dt;
      end
      else if isRight in DXInput.States then
      begin
        WalkTime := WalkTime + dt;
        WalkDistance := WalkDistance + abs(dt * vMaxPosition);
        X := X + vMaxPosition*cos(dY)*dt;
        Z := Z - vMaxPosition*Sin(dY)*dt;
      end;
    end
    else
    begin
      if isLeft in DXInput.States then
        dY := dY - vMaxPosition*(dt * vRotation * g_DEGTORAD)
      else if isRight in DXInput.States then
        dY := dY + vMaxPosition*(dt * vRotation * g_DEGTORAD);

      if isButton1 in DXInput.States then
        dX := dX - vMaxPosition*(dt * vRotation * g_DEGTORAD)
      else if isButton2 in DXInput.States then
        dX := dX + vMaxPosition*(dt * vRotation * g_DEGTORAD);
    end;

    if (isUp in DXInput.States) then
    begin
      vTarget := vMaxPosition;

      AcceleratingSpeed := 2.5;
      BreakingSpeed := 0.0;

      BreakTimer.Enabled := False;
      AccelerateTimer.Enabled := True;

    // ταχύτητα: vPosition μέτρα/sec,
    // όταν 1 μονάδα συντεταγμένωv D3D αντιστοιχεί σε ένα μέτρο πραγματικού κόσμου
    end
    else if (isDown in DXInput.States) then
    begin
      vTarget := -vMaxPosition;

      AcceleratingSpeed := 0.0;
      BreakingSpeed := 2.5;

      BreakTimer.Enabled := True;
      AccelerateTimer.Enabled := False;
    end
    else
    begin
      vTarget := 0.0;
      if vPosition > 0.0 then
      begin
        AcceleratingSpeed := 0.0;
        BreakingSpeed := 1.5;
        AccelerateTimer.Enabled := False;
        BreakTimer.Enabled := True;
      end
      else if vPosition < 0.0 then
      begin
        AcceleratingSpeed := 1.5;
        BreakingSpeed := 0.0;
        AccelerateTimer.Enabled := True;
        BreakTimer.Enabled := False;
      end
    end;
    X := X + vPosition*sin(dY)*dt;
    Z := Z + vPosition*cos(dY)*dt;

    if Scene.CurrentSectorIndex > -1 then
    begin
      if dX < - pi / 4 then
        dX := - pi / 4
      else if dX > pi / 5 then
        dX := pi / 5;
    end
    else
    begin
      if dX < - pi / 2 then
        dX := - pi / 2
      else if dX > pi / 2 then
        dX := pi / 2;
    end;

    GetPositionInsideBoundingCube(@bCube, bCubeSize / 2.0, X, Y, Z);

    if Y > bCube.maxY + 3.0 then
      Scene.NearClippingPlane := 2.0 // Change Near Clipping Plane
    else
      Scene.NearClippingPlane := 0.3; // Change Near Clipping Plane

    changed := False;
    if not VectorEquel(Scene.Position, MakeD3DVECTOR(X, Y, Z)) then
    begin
      changed := True;

      Scene.Position := MakeD3DVECTOR(X, Y, Z);

      // Walk move emulation!
      if Scene.CurrentSectorIndex > -1 then
      begin
        WalkTime := WalkTime + dt;
        WalkDistance := WalkDistance + abs(dt * vPosition);
        dX := dX + (cos(WalkTime * g_2_PI) * vRotation * g_DEGTORAD) / 100;
      end
    end;

    if not VectorEquel(Scene.Rotation, MakeD3DVECTOR(dX, dY, dZ)) then
    begin
      changed := True;

      Scene.Rotation := MakeD3DVECTOR(dX, dY, dZ);
    end;

    if changed then
      Scene.CullSurfaces(CULLDISTANCE);

    // last render time
    OldTime := Time;
  end;
end;

procedure TDXViewerForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  Application Close Full Screen
  if Key = VK_ESCAPE then
  begin
    if (doFullScreen in DXDraw.Options) then
      AdjustFullScreen
  end
  else if (Key = Ord('S')) then
  begin
    Sound1Click(Sender);
  end
  else if (Key = Ord('T')) then
  begin
    Renderthings1Click(Sender);
  end
  else if (Key = Ord('A')) then
  begin
    ShowAnimations1Click(Sender);
  end;

//  Screen mode change
  if (ssAlt in Shift) and (Key = VK_RETURN) then
    AdjustFullScreen;
end;

procedure TDXViewerForm.ApplicationEvents1Activate(Sender: TObject);
begin
  if Scene = nil then
    Exit;

  if DXDraw.Visible then
  try
    DXDraw.Finalize;
    DXDraw.Initialize;
    TryFocusControl(DXDraw);
    Scene.ForceReCalc;
  except
  end;
  DoForegroundForms(self);
end;

procedure TDXViewerForm.DXDrawFinalize(Sender: TObject);
begin
//
end;

procedure TDXViewerForm.AdjustFullScreen(const rlevel: integer = 0);
begin
  if rlevel > 0 then
  begin
    if rlevel > 1 then
      Exit;
    if not (doFullScreen in DXDraw.Options) then
      Exit;
  end;

  DXDraw.Finalize;
  if (doFullScreen in DXDraw.Options) then
  begin
    DXInput.Mouse.Enabled := False;
    DXInput.Mouse.BindInputStates := False;
    RestoreWindow;
    Visible := True;
    DXDraw.Cursor := crDefault;
    Screen.Cursor := crDefault;
    Menu := MainMenu1;
    BorderStyle := bsSizeable;
    DXDraw.Options := DXDraw.Options - [doFullScreen] + [doFlip];
    if NoteBook1.PageIndex = 1 then
      TryFocusControl(DXDraw);
    ShowHint := True;
    WIN_EnableAltTab;
  end
  else
  begin
    Notebook1.PageIndex := 1;
    PageControl1.ActivePageIndex := 1;
    WIN_DisableAltTab;
    if DisplayModeBox.ItemIndex >= 0 then
    begin
      DXDraw.Display.Width :=
        (DisplayModeBox.Items.Objects[DisplayModeBox.ItemIndex] as TD3DSceneDisplayParam).Width;
      DXDraw.Display.Height :=
        (DisplayModeBox.Items.Objects[DisplayModeBox.ItemIndex] as TD3DSceneDisplayParam).Height;
      DXDraw.Display.BitCount :=
        (DisplayModeBox.Items.Objects[DisplayModeBox.ItemIndex] as TD3DSceneDisplayParam).BitCount;
    end
    else
    begin
      DXDraw.Display.Width := DefSceneWidth;
      DXDraw.Display.Height := DefSceneHeight;
      DXDraw.Display.BitCount := DefSceneBitCount;
    end;
    ShowHint := False;
    TryFocusControl(DXDraw);
    StoreWindow;
    Visible := False;
    Menu := nil;
    DXDraw.Cursor := crNone;
    Screen.Cursor := crNone;
    BorderStyle := bsNone;
    DXDraw.Options := DXDraw.Options + [doFullScreen] - [doFlip];
    DXInput.Mouse.Enabled := True;
    DXInput.Mouse.BindInputStates := True;
  end;
  try
    DXDraw.Initialize;
  except
    on E : Exception do
    begin
      serrormessage := E.ClassName + '() : ' + E.Message;
      AdjustFullScreen(rlevel + 1);
      Exit;
    end;
  end;
  Scene.ForceReCalc;
  Scene.ReInitialize;
end;

procedure TDXViewerForm.About1Click(Sender: TObject);
begin
  AboutDialog1.Execute;
end;

procedure TDXViewerForm.LoadMap(const doFast: boolean = False);
var i: integer;
    b2: boolean;
    cs: TCriticalSection;
    minY, minY1: TD3DValue;
    typ: TIDSoftWADType;
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
    obj: TObject;
    songsize: integer;
    musname: string;
//    sInfo: TD3DSoundInfo;

  procedure MakeDefFloorHeights;
  var btm: TD3DValue;
  begin
    btm := Scene.BoundingCube.minY - DEFDOOMIMPORTFACTOR / 64 * 1.5;
    FloorInfo.y1 := btm;
    FloorInfo.y2 := btm;
    FloorInfo.y3 := btm;
    FloorInfo.y4 := btm;
  end;

var
  sTime, eTime: integer;
begin
  sTime := GetTickCount;

  Timer1.Enabled := False;

  cs := TCriticalSection.Create;

  if (hSong <> 0) or (Song <> nil) then
  begin
    DV_UnRegisterSong(hSong);
    ReallocMem(Song, 0);
    hSong := 0;
//    DV_PauseSong(hSong);
  end;

  StepSoundTimer.Enabled := False;
  WalkTime := 0.0;
  WalkDistance := 0.0;
  LastStepSoundAt := 0.0;
  LastBreathSoundAt := 0.0;
  vMaxPosition := 0.0; // we can't walk
  AcceleratingSpeed := 0.0;
  BreakingSpeed := 0.0;
  vPosition := 0.0;
  vRotation := 20.0;
  vTarget := 0.0;
  fScale2D := 1.0;
  xShift := 0.0;
  yShift := 0.0;
  lastWidth := Image1.Width;
  lastHeight := Image1.Height;

  BreakTimer.Enabled := False;
  AccelerateTimer.Enabled := False;

  Screen.Cursor := crHourglass;
  isLoading := True;
  b2 := DXTimer.Enabled;
  DXTimer.Enabled := False;
  try
    cs.Enter;
    if doFast then
      Scene.FastClear
    else
      Scene.New;

    Scene.ForcePosition(MakeD3DVector(0, 0, 0));
    Scene.ForceRotation(MakeD3DVector(0, 0, 0));

{    typ := GetMapData(Scene, MainWAD, PWAD, MapName, DEFDOOMIMPORTFACTOR, lFactor, True, doThings);
    GetSectorData(Scene, MainWAD, PWAD, MapName, DEFDOOMIMPORTFACTOR, lFactor, False);}
    typ := ReadWadDirectory(MainWAD, dir, numEntries);
    try
      musname := DV_GetMusicName(typ, MapName);
      if (PWAD <> MainWAD) and ReadEntry(PWAD, musname, Song, songsize) then
      begin
        hSong := DV_RegisterSong(Song, songsize);
        DV_PlaySong(hSong, True);
        ResumeSong;
      end
      else if ReadEntry(MainWAD, musname, Song, songsize, dir, numEntries) then
      begin
        hSong := DV_RegisterSong(Song, songsize);
        DV_PlaySong(hSong, True);
        ResumeSong;
      end;

      ReadMapData(PWAD, MapName,
        lThings, numThings,
        lLineDefs, numLineDefs,
        lSideDefs, numSideDefs,
        lVertexes, numVertexes,
        lSectors, numSectors,
        typ);
      try
        GetMapData(Scene,
          lThings, numThings,
          lLineDefs, numLineDefs,
          lSideDefs, numSideDefs,
          lVertexes, numVertexes,
          lSectors, numSectors,
          dir, numEntries,
          MainWAD, PWAD, MapName,
          DEFDOOMIMPORTFACTOR, lFactor,
          True,
          doThings,
          typ);
        GetSectorData(Scene,
          lThings, numThings,
          lLineDefs, numLineDefs,
          lSideDefs, numSideDefs,
          lVertexes, numVertexes,
          lSectors, numSectors,
          MainWAD, PWAD, MapName,
          DEFDOOMIMPORTFACTOR, lFactor,
          False);
      finally
        ClearMapData(
          lThings, numThings,
          lLineDefs, numLineDefs,
          lSideDefs, numSideDefs,
          lVertexes, numVertexes,
          lSectors, numSectors);
      end;
    finally
      FreeMem(pointer(dir), numEntries * SizeOf(TDoomDirEntry));
    end;

    Scene.ReduceMemory;
    AdjustThings;
    Scene.ReleaseUnusedObjects;

    minY := g_HUGE;
    for i := 0 to Scene.CacheSectorCollections.Count - 1 do
    begin
      obj := Scene.CacheSectorCollections.Objects[i];
      if obj <> nil then
      begin
        (obj as TD3DSectorCollection).Info2.CheckNavigation := CheckNavigation1.Checked;
        (obj as TD3DSectorCollection).Info2.DrawTheObjects := False;
        (obj as TD3DSectorCollection).gravityFactor := DEFDOOMIMPORTFACTOR / 64 * 9.81 / 2; // *
        if (obj as TD3DSectorCollection).BoundingCube.minY < minY then
          minY := (obj as TD3DSectorCollection).BoundingCube.minY;
      end;
    end;

    bCube := Scene.BoundingCube;
    bCubeSize :=
      Max(
        Max(bCube.maxX - bCube.minX, bCube.maxY - bCube.minY),
          bCube.maxZ - bCube.minZ);

    skyTexture := GetDoomSkyTexture(typ, MapName);

    if skyTexture <> '' then
    begin
      skyTexture := GetWadLinkDescription(MainWAD, skyTexture);
      Scene.AddPolygonData(SPHERE_0004_ID_0008_Vertexes, 320, D3DPT_TRIANGLESTRIP, skyTexture);
    end;

    Scene.ReleaseUnusedTextures;

    minY1 := g_HUGE;

    if minY = minY1 then
    begin
      MakeDefFloorHeights;
    end
    else
    begin
      minY := minY - DEFDOOMIMPORTFACTOR / 64 * 1.5;
{      if minY < Scene.BoundingCube.minY - DEFDOOMIMPORTFACTOR / 64 * 1.5 then
        MakeDefFloorHeights
      else}
      begin
        FloorInfo.y1 := minY;
        FloorInfo.y2 := minY;
        FloorInfo.y3 := minY;
        FloorInfo.y4 := minY;
      end;
    end;
    FloorInfo.TextureName := skyTexture;
{    if skyTexture <> '' then
    begin
      FloorInfo.C1 := clWhite;
      FloorInfo.C2 := clWhite;
      FloorInfo.C3 := clWhite;
      FloorInfo.C4 := clWhite;
    end
    else}
    begin
      FloorInfo.C1 := clLtGray;
      FloorInfo.C2 := clLtGray;
      FloorInfo.C3 := clLtGray;
      FloorInfo.C4 := clLtGray;
    end;
    Scene.AddSurface(ID3D_Quadrangle, @FloorInfo);

//    Scene.StartVertexFog(clLtGray, 255, 10.0, 20.0);

    Read2DMap;
    Make2DPreview;
    AdjustFocus;

    LastBreathSoundAt := Scene.Time;

    StepSoundTimer.Enabled := True;

    if DXDraw.Visible then
    begin
      DXDraw.Finalize;
      DXDraw.Initialize;
      TryFocusControl(DXDraw);
      Scene.ForceReCalc;
    end;

  finally
    vMaxPosition := vMax; // we can now walk
    Scene.CullSurfaces(CULLDISTANCE);

    FullScreen1.Enabled := True;
    FullScreen2.Enabled := True;

    isLoading := False;
    DXTimer.Enabled := b2;
    cs.Release;
    cs.Free;
    Screen.Cursor := crDefault;
  end;
  Timer1.Enabled := True;

  eTime := GetTickCount;
  printf(FloatToStr((eTime - sTime)/1000) + ' secs,  Triangles = ' + IntToStr(Scene.GetNumTriangles));
//  ShowMessage(FloatToStr((eTime - sTime)/1000) + ' secs,  Triangles = ' + IntToStr(Scene.GetNumTriangles));
end;

procedure TDXViewerForm.OpenClick(Sender: TObject);
var s: TStringList;
begin
  s := TStringList.Create;
  try
    if QueryImportDoomMap(self, MainWAD, PWAD, MapName, lFactor, doThings, s) then
    begin
      NextMap.Visible := False;
      ComboBox1.Visible := False;
      PrevMap.Visible := False;
      ComboBox1.Items.Clear;
      if MainWAD = '' then
        ErrorNoFileSelectMessageBox.Execute
      else if MapName = '' then
        ErrorNoMapSelectedMessageBox.Execute
      else
      begin
        PrevMap.Visible := True;
        ComboBox1.Visible := True;
        NextMap.Visible := True;
        ComboBox1.Items.AddStrings(s);
        ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(MapName);
        ComboBox1.Enabled := ComboBox1.Items.Count > 0;
        PrevMap.Enabled := ComboBox1.ItemIndex > 0;
        NextMap.Enabled := ComboBox1.ItemIndex <> ComboBox1.Items.Count - 1;
        if PWAD = '' then
          PWAD := MainWAD;
        LoadMap;
      end;
    end;
  finally
    s.Free;
  end;
end;

procedure TDXViewerForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

resourceString
  rsFmtTitle = 'DoomViewer - Map: %s - File: %s';

procedure TDXViewerForm.Read2DMap;
begin
  Clear2DPreviewData;
  ReadMapData(PWAD, MapName,
    lThings, numThings,
    lLineDefs, numLineDefs,
    lSideDefs, numSideDefs,
    lVertexes, numVertexes,
    lSegs, numSegs,
    lSubSectors, numSubSectors,
    lSectors, numSectors);
  Caption := Format(rsFmtTitle, [MkShortName(MapName), MkShortName(PWAD)]);
end;

procedure TDXViewerForm.FormResize(Sender: TObject);
begin
  if lastWidth <> 0 then
    xShift := xShift * Image1.Width / lastWidth;
  if lastHeight <> 0 then
    yShift := yShift * Image1.Height / lastHeight;
  lastWidth := Image1.Width;
  lastHeight := Image1.Height;

  if Visible then
  begin
    Screen.Cursor := crHourglass;
    try
      Make2DPreview;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
  ResumeSong;
end;

procedure TDXViewerForm.Make2DPreview;
begin
  Image1.Picture.Bitmap.Width := Image1.Width;
  Image1.Picture.Bitmap.Height := Image1.Height;
  Preview2DWADMap(lLineDefs, numLineDefs, lVertexes, numVertexes,
                  lSegs, numSegs, lSubSectors, numSubSectors,
                  Image1.Picture.Bitmap.Canvas, Image1.Width, Image1.Height,
                  xShift, yShift, fScale2D);
  Image1.Picture.Bitmap.Canvas.Font.Color := RGB(192, 0, 0);
  Image1.Picture.Bitmap.Canvas.Font.Style :=
    Image1.Picture.Bitmap.Canvas.Font.Style + [fsBold];
  Image1.Picture.Bitmap.Canvas.TextOut(5, 5, GetMapName(MainWAD, MapName));
end;

procedure TDXViewerForm.Clear2DPreviewData;
begin
  ReallocMem(lLineDefs, 0);
  numLineDefs := 0;
  ReallocMem(lVertexes, 0);
  numVertexes := 0;
  ReallocMem(lSegs, 0);
  numSegs := 0;
  ReallocMem(lSubSectors, 0);
  numSubSectors := 0;
  ReallocMem(lThings, 0);
  numThings := 0;
  ReallocMem(lSideDefs, 0);
  numSideDefs := 0;
  ReallocMem(lSectors, 0);
  numSectors := 0;
end;

procedure TDXViewerForm.FullScreenClick(Sender: TObject);
begin
  AdjustFullScreen;
end;

procedure TDXViewerForm.DisplayModeBoxChange(Sender: TObject);
begin
  AdjustFocus;
end;

procedure TDXViewerForm.PrevMapClick(Sender: TObject);
begin
  if ComboBox1.ItemIndex > 0 then
  begin
    ComboBox1.ItemIndex := ComboBox1.ItemIndex - 1;
    PrevMap.Enabled := False;
    NextMap.Enabled := False;
    ComboBox1.Enabled := True;
    MapName := ComboBox1.Items.Strings[ComboBox1.ItemIndex];
    LoadMap(True);
    PrevMap.Enabled := ComboBox1.ItemIndex > 0;
    NextMap.Enabled := True;
  end;
end;

procedure TDXViewerForm.NextMapClick(Sender: TObject);
begin
  if ComboBox1.ItemIndex < ComboBox1.Items.Count - 1 then
  begin
    ComboBox1.ItemIndex := ComboBox1.ItemIndex + 1;
    PrevMap.Enabled := False;
    NextMap.Enabled := False;
    ComboBox1.Enabled := True;
    MapName := ComboBox1.Items.Strings[ComboBox1.ItemIndex];
    LoadMap(True);
    PrevMap.Enabled := True;
    NextMap.Enabled := ComboBox1.ItemIndex < ComboBox1.Items.Count - 1;
  end;
end;

procedure TDXViewerForm.ComboBox1Change(Sender: TObject);
begin
  MapName := ComboBox1.Items.Strings[ComboBox1.ItemIndex];
  PrevMap.Enabled := False;
  NextMap.Enabled := False;
  LoadMap(True);
  PrevMap.Enabled := ComboBox1.ItemIndex > 0;
  NextMap.Enabled := ComboBox1.ItemIndex < ComboBox1.Items.Count - 1;
  AdjustFocus;
end;

procedure TDXViewerForm.CopyClick(Sender: TObject);
var
  aBitmap: TBitmap;
  r: TRect;
begin
  if NoteBook1.PageIndex = 0 then
  begin
    aBitmap := TBitmap.Create;
    try
      aBitmap.Width := Image1.Picture.Bitmap.Width;
      aBitmap.Height := Image1.Picture.Bitmap.Height;
      if aBitmap.Width * aBitmap.Height <> 0 then
      begin
        SetRect(r, 0, 0, aBitmap.Width, aBitmap.Height);
        aBitmap.Canvas.CopyRect(r, Image1.Picture.Bitmap.Canvas, r);
        Clipboard.Assign(aBitmap);
      end
      else
        ClipboardErrorMessageBox.Execute;
    finally
      aBitmap.Free;
    end;
  end
  else if NoteBook1.PageIndex = 1 then
  begin
    aBitmap := TBitmap.Create;
    try
      aBitmap.Width := DXDraw.Width;
      aBitmap.Height := DXDraw.Height;
      if aBitmap.Width * aBitmap.Height <> 0 then
      begin
        SetRect(r, 0, 0, aBitmap.Width, aBitmap.Height);
        aBitmap.Canvas.CopyRect(r, DXDraw.Surface.Canvas, r);
        DXDraw.Surface.Canvas.Release;
        Clipboard.Assign(aBitmap);
      end
      else
        ClipboardErrorMessageBox.Execute;
    finally
      aBitmap.Free;
    end;
  end;
end;

procedure TDXViewerForm.N2D1Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  NoteBook1.PageIndex := 0;
end;

procedure TDXViewerForm.N3D1Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  NoteBook1.PageIndex := 1;
end;

procedure TDXViewerForm.View1Click(Sender: TObject);
begin
  N2D1.Enabled := PageControl1.ActivePageIndex <> 0;
  N3D1.Enabled := PageControl1.ActivePageIndex <> 1;
end;

procedure TDXViewerForm.ApplicationEvents1Hint(Sender: TObject);
begin
  if Trim(Application.Hint) = EmptyStr then
    StatusBar1.Panels[0].Text := ' ' + Application.Title
  else
    StatusBar1.Panels[0].Text := ' ' + Trim(Application.Hint);
end;

resourceString
  rsMailTo = 'mailto';
  rsJimmyValavanis = 'jimmyvalavanis';
  rsProvider = 'yahoo.gr';
  rsSubject = 'subject';
  rsFmtMail = '%s:%s@%s?%s=%s';

procedure TDXViewerForm.Contactme1Click(Sender: TObject);
begin
  ShellExecute(
    handle,
      PChar(rsOpen),
        PChar(Format(rsFmtMail, [rsMailTo, rsJimmyValavanis, rsProvider, rsSubject, Application.Title])),
          nil, nil, SW_SHOWNORMAL);
end;

procedure TDXViewerForm.AdjustThings;
var
  i: integer;
  CullThings: boolean;
  obj: TObject;
begin
  CullThings := not Renderthings1.Checked;
  for i := 0 to Scene.Surfaces.Count - 1 do
  begin
    obj := Scene.Surfaces.Objects[i];
    if (obj as TD3DObject).GetTypeID = ID3D_EXOBJECT then
      (obj as TD3DExObject).Culled := CullThings
    else if (obj as TD3DObject).GetTypeID = ID3D_STUBOBJECT then
      (obj as TD3DStubObject).Culled := CullThings
  end;
end;

procedure TDXViewerForm.CheckBox1Click(Sender: TObject);
begin
  AdjustThings;
  AdjustFocus;
end;

procedure TDXViewerForm.AdjustFocus;
begin
  if Visible and NoteBook1.Visible then
  try
    if NoteBook1.PageIndex = 1 then
    begin
      if not TryFocusControl(DXDraw) then
        TryFocusControl(NoteBook1);
    end
    else
      TryFocusControl(NoteBook1);
  except
  end;
end;

procedure TDXViewerForm.FormShow(Sender: TObject);
begin
  AdjustFocus;
end;

procedure TDXViewerForm.ApplicationEvents1Deactivate(Sender: TObject);
begin
//  DrawThread.Enabled := False;
end;

procedure TDXViewerForm.QuickInfo1Click(Sender: TObject);
begin
  with TQuickInfoForm.Create(nil) do
  try
    ShowModal
  finally
    Free;
  end;
end;

procedure TDXViewerForm.HomePage1Click(Sender: TObject);
begin
  ShellExecute(
    handle,
      PChar(rsOpen),
        PChar(rsHomePage),
          nil, nil, SW_SHOWNORMAL);
end;

resourceString
  rsExtPNG = '.png';
  rsExtJPG1 = '.jpg';
  rsExtJPG2 = '.jpeg';
  rsExtBMP = '.bmp';
  rsExtPPM = '.ppm';
  rsExtM8 =  '.m8';
  rsExtTGA = '.tga';

procedure TDXViewerForm.Save2Click(Sender: TObject);
var
  ext: string;
  aBitmap: TBitmap;
  aPNG: TPNGObject;
  aJPG: TJpegImage;
  r: TRect;
begin
  SavePictureDialog1.FileName := '';
  if SavePictureDialog1.Execute then
  begin
    Screen.Cursor := crHourglass;
    try
      ext := ExtractFileExt(SavePictureDialog1.Filename);
      aBitmap := nil;
      if ext = '' then
      begin
        case SavePictureDialog1.FilterIndex of
          1: ext := rsExtPNG;
          2: ext := rsExtJPG1;
          3: ext := rsExtBMP;
          4: ext := rsExtPPM;
          5: ext := rsExtM8;
          6: ext := rsExtTGA;
        else
          begin
            MessageBox1.Execute;
            Exit;
          end;
        end;
        SavePictureDialog1.Filename := SavePictureDialog1.Filename + ext;
      end;
      ext := UpperCase(ext);
      if ext = UpperCase(rsExtBMP) then
        aBitmap := TBitmap.Create
      else if ext = UpperCase(rsExtM8) then
        aBitmap := TM8Bitmap.Create
      else if ext = UpperCase(rsExtPPM) then
        aBitmap := TPPMBitmap.Create
      else if ext = UpperCase(rsExtTGA) then
        aBitmap := TTGABitmap.Create
      else if (UpperCase(ext) = UpperCase(rsExtPNG)) or (UpperCase(ext) = UpperCase(rsExtJPG1)) then
        aBitmap := TTGABitmap.Create;
      if Assigned(aBitmap) then
      begin
        try
          if NoteBook1.PageIndex = 0 then
            aBitmap.Assign(Image1.Picture.Bitmap)
          else if NoteBook1.PageIndex = 1 then
          begin
            aBitmap.Width := DXDraw.Width;
            aBitmap.Height := DXDraw.Height;
            if aBitmap.Width * aBitmap.Height <> 0 then
            begin
              aBitmap.PixelFormat := pf32bit;
              SetRect(r, 0, 0, aBitmap.Width, aBitmap.Height);
              aBitmap.Canvas.CopyRect(r, DXDraw.Surface.Canvas, r);
              DXDraw.Surface.Canvas.Release;
            end;
          end;
          if (UpperCase(ext) = UpperCase(rsExtPNG)) or (UpperCase(ext) = UpperCase(rsExtJPG1)) then
          begin
            if UpperCase(ext) = UpperCase(rsExtPNG) then // png
            begin
              aPNG := TPNGObject.Create;
              try
                aPNG.Assign(aBitmap);
                CreateBackupFile(SavePictureDialog1.Filename);
                aPNG.SaveToFile(SavePictureDialog1.Filename);
              finally
                aPNG.Free;
              end;
            end
            else // jpg
            begin
              aJPG := TJpegImage.Create;
              try
                aJPG.Assign(aBitmap);
                CreateBackupFile(SavePictureDialog1.Filename);
                aJPG.SaveToFile(SavePictureDialog1.Filename);
              finally
                aJPG.Free;
              end;
            end;
          end
          else
          begin // others
            CreateBackupFile(SavePictureDialog1.Filename);
            aBitmap.SaveToFile(SavePictureDialog1.Filename);
          end;
        finally
          aBitmap.Free;
        end
      end
      else // undetermined image type
        MessageBox1.Execute;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;


const
  StepSoundRawData: array[0..17723] of Byte = (
    $52, $49, $46, $46, $34, $45, $00, $00, $57, $41, $56, $45, $66, $6D, $74,
    $20, $10, $00, $00, $00, $01, $00, $01, $00, $22, $56, $00, $00, $44, $AC,
    $00, $00, $02, $00, $10, $00, $64, $61, $74, $61, $10, $45, $00, $00, $F9,
    $FF, $10, $00, $12, $00, $4C, $00, $65, $00, $47, $00, $3C, $00, $33, $00,
    $1C, $00, $05, $00, $C2, $FF, $5F, $00, $E6, $FF, $D6, $FF, $13, $FF, $8B,
    $00, $88, $FF, $F4, $FD, $26, $FC, $78, $FC, $24, $FF, $B1, $FC, $B8, $FA,
    $AA, $FB, $C8, $FE, $AC, $FA, $8C, $F5, $2A, $FC, $A3, $01, $47, $FC, $12,
    $FE, $09, $01, $4B, $03, $D9, $FE, $4E, $02, $6C, $04, $91, $05, $AF, $05,
    $BA, $01, $AF, $FC, $0D, $FB, $2B, $FE, $89, $FD, $E9, $FC, $DE, $FC, $6C,
    $01, $A9, $FD, $D1, $FF, $5F, $02, $10, $00, $3B, $00, $D2, $00, $10, $00,
    $19, $00, $E8, $00, $AF, $00, $B1, $FE, $1F, $FF, $66, $01, $76, $02, $77,
    $02, $CF, $03, $D5, $03, $78, $03, $98, $04, $7F, $04, $AB, $00, $F7, $01,
    $2E, $01, $F1, $FD, $12, $01, $EE, $02, $E4, $FF, $C9, $FE, $E9, $00, $FB,
    $FF, $12, $FD, $76, $FC, $69, $01, $62, $FD, $CE, $FB, $12, $FF, $E9, $01,
    $A8, $FF, $CB, $FD, $0E, $FF, $01, $FF, $40, $00, $BF, $FE, $B3, $FF, $73,
    $00, $89, $01, $28, $FB, $F5, $FB, $67, $02, $86, $03, $66, $FE, $CB, $FB,
    $E8, $FB, $51, $00, $B7, $03, $52, $00, $3A, $F8, $00, $FD, $57, $02, $6A,
    $FC, $FF, $FC, $BB, $FE, $D4, $FD, $6E, $FF, $45, $FF, $D4, $FD, $59, $FE,
    $88, $02, $07, $02, $BD, $FD, $79, $FE, $B8, $02, $CE, $00, $5C, $FF, $F2,
    $01, $38, $00, $8C, $00, $E6, $FE, $3E, $FF, $34, $00, $B6, $FF, $45, $FF,
    $99, $FF, $70, $FF, $7E, $00, $A8, $01, $6C, $01, $0C, $01, $9D, $FC, $7E,
    $FF, $61, $FF, $71, $FE, $DA, $FF, $3B, $FF, $6F, $00, $99, $00, $DA, $01,
    $83, $FE, $55, $00, $07, $FE, $CE, $FF, $A2, $FE, $87, $FC, $25, $FF, $62,
    $FE, $89, $FD, $3C, $FD, $65, $FD, $62, $FE, $D0, $FC, $96, $FB, $05, $FD,
    $6A, $FA, $DE, $FA, $C0, $FA, $50, $FB, $3B, $FA, $3E, $F9, $93, $FB, $92,
    $F8, $6B, $F9, $56, $FC, $5E, $FA, $BE, $F8, $9D, $FA, $52, $FB, $8B, $FB,
    $74, $FB, $AC, $FC, $7C, $FC, $05, $FC, $CD, $FD, $19, $FC, $B2, $FC, $26,
    $FE, $87, $FE, $ED, $FD, $07, $FF, $26, $FF, $18, $00, $23, $01, $CC, $01,
    $19, $02, $30, $04, $A3, $03, $2D, $03, $FA, $03, $77, $05, $E4, $04, $CD,
    $04, $9D, $07, $F6, $04, $56, $06, $E7, $05, $92, $05, $F6, $06, $70, $08,
    $A9, $08, $BA, $09, $3A, $0A, $13, $0A, $A1, $09, $FF, $09, $6F, $0A, $C2,
    $0A, $B9, $0A, $AF, $0A, $7A, $0A, $33, $0B, $C1, $0B, $90, $0B, $CD, $0B,
    $B2, $0B, $C5, $0B, $BE, $0B, $59, $0B, $DB, $0A, $D8, $0A, $FB, $09, $F3,
    $09, $2A, $09, $D1, $08, $DC, $08, $93, $07, $C6, $06, $8A, $06, $B5, $06,
    $33, $06, $34, $05, $0C, $05, $B3, $05, $89, $05, $63, $04, $0A, $04, $22,
    $04, $19, $04, $ED, $03, $3A, $04, $4E, $04, $0A, $04, $0D, $04, $1A, $04,
    $72, $03, $D9, $03, $17, $04, $ED, $03, $FA, $03, $94, $04, $76, $04, $BF,
    $03, $96, $04, $DE, $05, $39, $05, $E2, $04, $5D, $05, $F9, $05, $07, $06,
    $E4, $05, $02, $06, $14, $06, $DD, $05, $8B, $05, $80, $05, $85, $05, $CC,
    $05, $AD, $05, $A8, $05, $47, $05, $2B, $05, $6C, $05, $21, $05, $5C, $04,
    $6E, $04, $39, $04, $20, $04, $E2, $03, $39, $03, $4E, $03, $48, $03, $AD,
    $02, $6C, $02, $F1, $01, $D0, $01, $3C, $02, $4C, $01, $29, $01, $E1, $00,
    $32, $00, $C0, $FF, $6D, $FF, $EA, $FF, $84, $FF, $8A, $FE, $67, $FE, $FD,
    $FD, $8C, $FD, $DE, $FC, $F4, $FC, $73, $FC, $67, $FC, $03, $FC, $9B, $FB,
    $18, $FB, $80, $FA, $78, $FA, $EA, $F9, $5D, $F9, $22, $F9, $5C, $F9, $92,
    $F9, $39, $F9, $36, $F9, $E7, $F8, $88, $F8, $FD, $F7, $B2, $F7, $69, $F7,
    $DE, $F7, $B4, $F7, $2E, $F7, $ED, $F7, $F4, $F7, $12, $F8, $87, $F7, $60,
    $F7, $E9, $F7, $18, $F8, $C7, $F7, $7A, $F7, $B5, $F7, $26, $F8, $E1, $F7,
    $0D, $F7, $83, $F7, $63, $F7, $75, $F7, $3D, $F7, $D0, $F6, $35, $F7, $83,
    $F7, $64, $F7, $78, $F7, $8B, $F7, $76, $F7, $2D, $F7, $FA, $F6, $95, $F7,
    $A8, $F7, $38, $F7, $5F, $F7, $C2, $F7, $21, $F8, $F6, $F7, $EF, $F7, $FD,
    $F7, $32, $F8, $FE, $F7, $0B, $F8, $ED, $F7, $76, $F8, $FB, $F8, $9C, $F8,
    $4F, $F8, $6F, $F8, $30, $F8, $E9, $F7, $D7, $F7, $AF, $F7, $1C, $F8, $FD,
    $F7, $7F, $F8, $F0, $F8, $DF, $F8, $EE, $F8, $49, $F9, $7E, $F9, $C1, $F9,
    $1B, $F9, $21, $F9, $78, $F9, $87, $F9, $0E, $FA, $C3, $F9, $F3, $F9, $1B,
    $FA, $66, $FA, $BE, $FA, $4C, $FA, $8A, $FA, $A6, $FA, $C6, $FA, $1F, $FB,
    $75, $FB, $29, $FB, $16, $FB, $18, $FB, $5D, $FB, $AB, $FB, $FE, $FB, $07,
    $FC, $59, $FC, $30, $FC, $29, $FC, $9F, $FC, $97, $FC, $E1, $FC, $DD, $FC,
    $42, $FD, $78, $FD, $54, $FD, $1F, $FD, $7C, $FD, $88, $FD, $D2, $FD, $DA,
    $FD, $BA, $FD, $E3, $FD, $3B, $FE, $C0, $FE, $AE, $FE, $57, $FE, $7F, $FE,
    $DD, $FE, $C3, $FE, $F5, $FE, $3B, $FF, $19, $FF, $34, $FF, $D1, $FF, $8A,
    $FF, $91, $FF, $E0, $FF, $FC, $FF, $46, $00, $35, $00, $5D, $00, $7E, $00,
    $C4, $00, $8F, $00, $48, $01, $70, $01, $01, $02, $28, $02, $74, $01, $D2,
    $01, $2D, $01, $78, $01, $19, $02, $9B, $02, $92, $02, $A2, $02, $A8, $02,
    $92, $02, $AD, $02, $77, $02, $4B, $02, $65, $02, $DA, $02, $CC, $02, $E0,
    $02, $23, $03, $4A, $03, $11, $03, $DE, $02, $C9, $02, $3B, $03, $94, $03,
    $0F, $03, $8A, $02, $70, $02, $70, $01, $F8, $00, $47, $01, $4A, $01, $10,
    $01, $F9, $03, $69, $05, $05, $03, $D9, $02, $33, $04, $B9, $03, $86, $02,
    $29, $03, $40, $03, $0B, $03, $19, $03, $5F, $03, $97, $03, $3B, $03, $0F,
    $03, $FE, $02, $A1, $02, $1C, $03, $2A, $03, $1D, $02, $F0, $01, $12, $02,
    $A2, $02, $9D, $02, $89, $02, $B4, $02, $31, $03, $64, $03, $ED, $02, $06,
    $03, $FC, $02, $1A, $03, $A5, $03, $D4, $02, $B0, $02, $61, $03, $B3, $03,
    $6E, $03, $6A, $03, $6D, $03, $FC, $03, $05, $04, $F1, $03, $EC, $03, $F5,
    $03, $72, $04, $6A, $04, $E4, $03, $46, $04, $6E, $04, $6D, $04, $F7, $04,
    $7A, $04, $82, $04, $9A, $04, $E8, $04, $4E, $05, $A0, $04, $F8, $04, $84,
    $04, $7D, $05, $E3, $05, $04, $06, $62, $05, $2E, $05, $C2, $04, $3B, $05,
    $86, $03, $92, $06, $F0, $02, $02, $05, $C8, $04, $34, $03, $F0, $05, $51,
    $05, $61, $06, $A3, $04, $73, $04, $F0, $02, $D1, $05, $54, $05, $6C, $03,
    $31, $02, $1E, $05, $9A, $02, $8B, $04, $06, $04, $CE, $03, $D8, $02, $0A,
    $03, $D9, $03, $A3, $03, $7A, $02, $52, $02, $4E, $05, $0F, $03, $51, $03,
    $92, $02, $7F, $03, $A7, $03, $F9, $02, $F2, $02, $7D, $02, $17, $03, $C7,
    $02, $45, $02, $B6, $02, $BC, $02, $3A, $03, $B2, $02, $E3, $01, $CC, $01,
    $AE, $03, $4B, $02, $A5, $02, $6E, $02, $FF, $02, $2D, $02, $33, $02, $09,
    $02, $65, $01, $6A, $02, $9C, $01, $AF, $01, $27, $02, $E2, $01, $52, $02,
    $B8, $01, $C4, $01, $EE, $01, $38, $01, $20, $02, $A0, $00, $1E, $01, $4F,
    $01, $55, $01, $06, $01, $86, $01, $A2, $01, $F1, $01, $3D, $00, $47, $00,
    $1A, $02, $F5, $01, $DF, $00, $B2, $00, $10, $01, $6A, $00, $37, $00, $2D,
    $00, $88, $FF, $E4, $FF, $DF, $00, $43, $00, $24, $00, $0D, $00, $AE, $01,
    $6E, $00, $B0, $FF, $67, $FF, $05, $00, $38, $00, $31, $00, $1B, $00, $57,
    $FF, $3B, $FF, $25, $00, $8E, $00, $1B, $00, $39, $FF, $7B, $FF, $45, $00,
    $C0, $FE, $5D, $FE, $6B, $FE, $F2, $FE, $27, $FF, $71, $FE, $02, $FE, $4D,
    $FF, $AC, $FE, $06, $FF, $0C, $FF, $5C, $FE, $5C, $FE, $1A, $FE, $F5, $FD,
    $1B, $FE, $88, $FE, $1A, $FE, $B8, $FD, $9B, $FE, $2D, $FF, $37, $FF, $BE,
    $FE, $96, $FE, $06, $FF, $10, $FE, $BB, $FD, $52, $FE, $AB, $FD, $F5, $FD,
    $0B, $FE, $84, $FD, $B6, $FD, $5E, $FD, $D2, $FD, $CD, $FD, $7D, $FD, $07,
    $FE, $BA, $FD, $FF, $FC, $AA, $FD, $AD, $FD, $F0, $FD, $E8, $FD, $5D, $FD,
    $EC, $FD, $E1, $FD, $B0, $FD, $7A, $FD, $0A, $FD, $F3, $FD, $04, $FE, $66,
    $FD, $A7, $FD, $B8, $FD, $F3, $FC, $C2, $FD, $17, $FE, $EF, $FD, $D2, $FD,
    $DE, $FD, $D2, $FE, $74, $FE, $7A, $FD, $C0, $FD, $BD, $FD, $29, $FD, $27,
    $FE, $7B, $FD, $EA, $FC, $E5, $FC, $54, $FD, $48, $FD, $6D, $FD, $69, $FD,
    $57, $FD, $1E, $FD, $82, $FD, $74, $FE, $7F, $FD, $DE, $FC, $36, $FD, $5F,
    $FD, $23, $FE, $09, $FE, $F2, $FC, $67, $FD, $EF, $FC, $F8, $FC, $1E, $FE,
    $9F, $FD, $6E, $FD, $67, $FD, $16, $FD, $F2, $FC, $FE, $FC, $30, $FD, $28,
    $FD, $83, $FD, $58, $FD, $FF, $FD, $83, $FD, $A1, $FD, $D7, $FD, $6F, $FD,
    $EA, $FD, $0D, $FE, $FF, $FD, $10, $FE, $B4, $FD, $B9, $FD, $CF, $FE, $1F,
    $FE, $40, $FD, $FA, $FD, $56, $FE, $8A, $FE, $75, $FE, $73, $FE, $4D, $FE,
    $CD, $FE, $D7, $FE, $83, $FE, $38, $FE, $A3, $FE, $EC, $FE, $B4, $FE, $D8,
    $FE, $BC, $FE, $F7, $FE, $6A, $FF, $69, $FF, $6D, $FF, $7A, $FF, $66, $FF,
    $5B, $FF, $A6, $FF, $F9, $FF, $D0, $FF, $9B, $FF, $FD, $FF, $C5, $FF, $0B,
    $00, $60, $00, $2A, $00, $2D, $00, $A1, $00, $B7, $00, $85, $00, $C3, $00,
    $6E, $00, $7E, $00, $CC, $00, $68, $00, $B9, $00, $89, $00, $9B, $00, $E2,
    $00, $B7, $00, $43, $01, $6E, $01, $FD, $00, $17, $01, $19, $01, $C0, $01,
    $A7, $01, $64, $01, $AE, $01, $7B, $01, $8D, $01, $A3, $01, $D0, $01, $A6,
    $01, $78, $02, $24, $02, $E5, $01, $6B, $02, $31, $02, $F5, $01, $5D, $02,
    $96, $02, $68, $02, $19, $02, $98, $02, $9E, $02, $89, $02, $7E, $02, $51,
    $02, $65, $02, $5C, $02, $DA, $02, $B3, $02, $15, $03, $C4, $02, $0A, $03,
    $4F, $02, $BB, $02, $2B, $03, $E7, $01, $0D, $03, $8A, $02, $A9, $02, $93,
    $02, $70, $02, $95, $02, $CB, $02, $9B, $02, $34, $02, $29, $02, $11, $02,
    $4A, $02, $A6, $01, $DC, $01, $2E, $02, $E2, $01, $BC, $01, $06, $02, $F0,
    $01, $F2, $01, $A0, $01, $E3, $01, $E9, $01, $93, $01, $CE, $01, $CE, $01,
    $70, $01, $D1, $01, $10, $02, $ED, $01, $C3, $01, $75, $01, $5C, $01, $88,
    $01, $A8, $01, $E5, $01, $3E, $01, $EB, $00, $64, $01, $7F, $01, $6C, $01,
    $69, $01, $4A, $01, $47, $01, $21, $01, $30, $01, $FD, $00, $EE, $00, $56,
    $01, $40, $01, $C3, $00, $A1, $00, $B4, $00, $C2, $00, $D3, $00, $B6, $00,
    $82, $00, $A3, $00, $91, $00, $74, $00, $EE, $FF, $17, $00, $6D, $00, $3A,
    $00, $57, $00, $31, $00, $71, $00, $3C, $00, $DE, $FF, $BF, $FF, $BA, $FF,
    $C9, $FF, $8F, $FF, $55, $FF, $67, $FF, $7D, $FF, $C3, $FF, $72, $FF, $5B,
    $FF, $7D, $FF, $9B, $FF, $75, $FF, $79, $FF, $A8, $FF, $26, $FF, $90, $FF,
    $5F, $FF, $7D, $FF, $85, $FF, $88, $FF, $34, $FF, $61, $FF, $97, $FF, $81,
    $FF, $28, $FF, $07, $FF, $35, $FF, $67, $FF, $3F, $FF, $0F, $FF, $29, $FF,
    $3D, $FF, $2C, $FF, $37, $FF, $49, $FF, $F6, $FE, $09, $FF, $6A, $FF, $53,
    $FF, $13, $FF, $09, $FF, $2A, $FF, $2D, $FF, $0E, $FF, $6A, $FF, $58, $FF,
    $3A, $FF, $42, $FF, $3C, $FF, $00, $FF, $09, $FF, $2D, $FF, $25, $FF, $F6,
    $FE, $03, $FF, $22, $FF, $97, $FE, $E7, $FE, $64, $FF, $10, $FF, $FB, $FE,
    $21, $FF, $29, $FF, $1D, $FF, $13, $FF, $38, $FF, $62, $FF, $88, $FF, $D0,
    $FF, $96, $FF, $78, $FF, $C2, $FF, $CB, $FF, $76, $FF, $5C, $FF, $89, $FF,
    $A1, $FF, $8B, $FF, $8B, $FF, $E6, $FF, $91, $FF, $78, $FF, $87, $FF, $A5,
    $FF, $76, $FF, $76, $FF, $7D, $FF, $92, $FF, $EB, $FF, $D7, $FF, $0F, $00,
    $FA, $FF, $AE, $FF, $A5, $FF, $C0, $FF, $BC, $FF, $E0, $FF, $A7, $FF, $9D,
    $FF, $B3, $FF, $C6, $FF, $5E, $FF, $3C, $FF, $67, $FF, $5E, $FF, $B6, $FF,
    $6E, $FF, $70, $FF, $7B, $FF, $C6, $FF, $A6, $FF, $6A, $FF, $85, $FF, $C0,
    $FF, $9D, $FF, $77, $FF, $A7, $FF, $B9, $FF, $88, $FF, $80, $FF, $B5, $FF,
    $8D, $FF, $8C, $FF, $73, $FF, $95, $FF, $94, $FF, $6E, $FF, $6C, $FF, $75,
    $FF, $4E, $FF, $44, $FF, $7E, $FF, $9E, $FF, $5A, $FF, $42, $FF, $FA, $FE,
    $E8, $FE, $14, $FF, $D9, $FE, $C2, $FE, $B3, $FE, $B6, $FE, $73, $FE, $34,
    $FE, $16, $FE, $8D, $FE, $62, $FE, $5A, $FE, $83, $FE, $6E, $FE, $32, $FE,
    $3E, $FE, $2D, $FE, $07, $FE, $4C, $FE, $51, $FE, $75, $FE, $1C, $FE, $FE,
    $FD, $53, $FE, $F6, $FD, $CE, $FD, $23, $FE, $43, $FE, $2F, $FE, $E8, $FD,
    $FD, $FD, $0D, $FE, $9D, $FD, $5B, $FD, $A6, $FD, $D6, $FD, $F8, $FD, $53,
    $FD, $DB, $FD, $0E, $FE, $AF, $FD, $81, $FD, $99, $FD, $BB, $FD, $1E, $FE,
    $D2, $FD, $A2, $FD, $A2, $FD, $8D, $FD, $A2, $FD, $E5, $FD, $CA, $FD, $74,
    $FD, $80, $FD, $C0, $FD, $AA, $FD, $BC, $FD, $04, $FE, $E7, $FD, $DE, $FD,
    $F7, $FD, $E4, $FD, $BE, $FD, $0F, $FE, $26, $FE, $36, $FE, $39, $FE, $69,
    $FE, $5E, $FE, $2A, $FE, $31, $FE, $0E, $FE, $74, $FE, $94, $FE, $98, $FE,
    $DF, $FE, $8D, $FE, $6C, $FE, $E0, $FE, $EA, $FE, $9D, $FE, $8D, $FE, $83,
    $FE, $E5, $FE, $EE, $FE, $32, $FF, $19, $FF, $B7, $FE, $D3, $FE, $0A, $FF,
    $59, $FF, $46, $FF, $E5, $FE, $31, $FF, $6C, $FF, $11, $FF, $F2, $FE, $2A,
    $FF, $3E, $FF, $34, $FF, $B5, $FF, $78, $FF, $4F, $FF, $5C, $FF, $7F, $FF,
    $57, $FF, $89, $FF, $6D, $FF, $29, $FF, $5F, $FF, $E8, $FF, $C5, $FF, $70,
    $FF, $AA, $FF, $C4, $FF, $EF, $FF, $CD, $FF, $E2, $FF, $E6, $FF, $DD, $FF,
    $BC, $FF, $BA, $FF, $E5, $FF, $AB, $FF, $C8, $FF, $B7, $00, $3C, $00, $BC,
    $FF, $56, $00, $0A, $00, $0C, $00, $DB, $FF, $03, $00, $0A, $00, $46, $00,
    $1E, $00, $63, $00, $79, $00, $66, $00, $44, $00, $A3, $00, $7C, $00, $1B,
    $00, $BF, $00, $E4, $00, $50, $00, $5E, $00, $C6, $00, $1E, $00, $18, $00,
    $4A, $00, $A3, $00, $F8, $FF, $87, $00, $AF, $01, $E0, $FF, $8C, $00, $1B,
    $02, $61, $00, $52, $00, $87, $00, $BF, $FF, $BC, $00, $4E, $00, $A9, $01,
    $9C, $00, $8E, $00, $94, $01, $48, $00, $A1, $00, $CD, $00, $B2, $00, $53,
    $00, $CD, $00, $76, $00, $65, $00, $65, $00, $AF, $00, $65, $00, $4C, $00,
    $BB, $00, $A2, $00, $58, $00, $3B, $01, $3B, $01, $A7, $00, $95, $00, $0E,
    $01, $07, $01, $E6, $00, $37, $01, $46, $01, $46, $01, $21, $01, $28, $01,
    $E5, $00, $51, $01, $16, $01, $E4, $00, $03, $01, $42, $01, $74, $01, $12,
    $01, $47, $01, $33, $01, $04, $01, $3D, $01, $FA, $00, $E8, $00, $3C, $01,
    $B6, $01, $D5, $01, $A2, $01, $6E, $01, $04, $02, $EA, $01, $7B, $01, $66,
    $01, $5D, $01, $BA, $01, $5A, $01, $C5, $01, $93, $01, $28, $01, $8E, $01,
    $BD, $01, $74, $01, $6E, $01, $5F, $01, $34, $01, $A1, $01, $45, $01, $47,
    $01, $59, $01, $91, $01, $64, $01, $3E, $01, $39, $01, $01, $01, $43, $01,
    $1D, $02, $54, $02, $F8, $01, $CA, $01, $73, $01, $F1, $00, $07, $01, $DE,
    $00, $76, $03, $26, $01, $35, $FF, $6A, $03, $46, $01, $CE, $00, $A7, $02,
    $92, $01, $CF, $00, $4A, $01, $57, $01, $BF, $01, $49, $01, $97, $02, $A4,
    $01, $EC, $00, $F0, $01, $32, $02, $31, $01, $63, $01, $BA, $01, $6B, $01,
    $1D, $01, $3B, $01, $8D, $01, $6F, $01, $30, $01, $CC, $01, $78, $01, $1D,
    $01, $93, $01, $28, $02, $8C, $01, $8F, $01, $A7, $01, $CA, $01, $CE, $01,
    $BC, $01, $E0, $01, $30, $02, $29, $02, $02, $02, $44, $02, $AF, $02, $60,
    $02, $C5, $02, $01, $03, $EA, $02, $4A, $03, $64, $03, $7B, $03, $9A, $03,
    $BE, $03, $E7, $03, $6B, $04, $3D, $04, $3A, $04, $48, $04, $3B, $04, $79,
    $04, $13, $04, $A9, $03, $FA, $03, $91, $03, $8A, $03, $69, $03, $10, $03,
    $C1, $02, $44, $03, $92, $02, $38, $02, $4D, $02, $49, $02, $37, $02, $B2,
    $01, $AA, $01, $A4, $01, $87, $01, $04, $01, $13, $01, $A0, $01, $63, $00,
    $C9, $00, $49, $01, $36, $00, $56, $01, $7B, $00, $44, $00, $9B, $00, $20,
    $00, $87, $00, $6E, $00, $3E, $FF, $4E, $00, $38, $00, $74, $FF, $8D, $00,
    $BE, $FF, $3A, $01, $2C, $00, $B0, $FF, $E4, $FF, $C4, $FF, $92, $FF, $C9,
    $00, $79, $00, $83, $00, $89, $00, $4A, $FF, $74, $00, $B7, $FF, $E1, $FF,
    $0F, $00, $1A, $FF, $ED, $FF, $E6, $FF, $70, $FF, $77, $FF, $52, $FF, $F4,
    $FE, $BE, $FF, $A9, $FE, $BA, $FE, $84, $FF, $00, $FF, $B1, $FF, $46, $FF,
    $AF, $FE, $40, $FF, $7C, $FF, $A0, $FE, $C2, $FF, $58, $FF, $E9, $FF, $B1,
    $FF, $DA, $FE, $55, $FF, $BF, $FF, $F3, $FE, $1B, $00, $63, $FF, $C3, $FE,
    $E0, $FF, $63, $FF, $93, $FF, $9E, $FF, $D0, $FE, $27, $00, $5B, $FF, $40,
    $FF, $74, $00, $33, $FF, $D7, $FF, $85, $FF, $A6, $FF, $EB, $FF, $B3, $FF,
    $1E, $00, $5C, $FF, $FE, $FE, $9E, $FF, $C0, $FE, $00, $00, $B0, $FF, $F6,
    $FE, $1E, $00, $7D, $FE, $CC, $FF, $AC, $FF, $DE, $FE, $A5, $FE, $FC, $FF,
    $71, $FF, $7C, $FD, $0A, $02, $57, $FE, $D5, $FE, $68, $00, $65, $FE, $23,
    $00, $37, $FF, $61, $FE, $4F, $FF, $1E, $FE, $24, $00, $E6, $00, $CF, $FD,
    $E2, $FF, $4D, $FE, $4F, $FE, $05, $00, $73, $FE, $98, $FF, $DE, $FE, $1F,
    $FF, $33, $FF, $78, $FF, $F4, $FE, $DD, $FE, $FA, $FE, $00, $FF, $86, $FE,
    $F9, $FE, $E9, $FE, $C9, $FD, $CD, $FE, $99, $FF, $D3, $FF, $B0, $FE, $32,
    $FF, $70, $FF, $AB, $FF, $73, $FE, $BF, $FF, $CA, $FF, $5B, $FE, $15, $00,
    $85, $FE, $CE, $FF, $BF, $FF, $D5, $FF, $26, $00, $44, $FF, $06, $00, $7B,
    $FF, $13, $00, $27, $00, $A2, $FF, $0A, $00, $40, $00, $2E, $FF, $22, $00,
    $13, $00, $FA, $FF, $E6, $00, $8C, $FF, $89, $FF, $C2, $FF, $3D, $00, $B9,
    $00, $C0, $FF, $B0, $00, $39, $00, $8F, $00, $49, $00, $8D, $FF, $76, $00,
    $18, $00, $40, $FF, $E4, $00, $34, $FF, $7B, $FF, $FD, $FF, $5A, $FE, $41,
    $FF, $F1, $FF, $FF, $FF, $3F, $FE, $52, $FF, $6C, $00, $A3, $00, $C3, $FF,
    $9F, $FF, $FB, $FE, $3D, $FF, $AC, $FF, $76, $00, $C2, $FF, $D3, $FF, $A5,
    $00, $87, $FD, $88, $FF, $EB, $00, $06, $FE, $26, $00, $81, $FE, $D7, $FF,
    $F6, $00, $03, $FD, $B5, $FE, $D3, $01, $78, $FD, $2A, $01, $14, $FE, $A3,
    $FF, $08, $00, $4D, $FD, $3E, $01, $88, $FF, $3D, $FE, $A7, $FF, $CD, $01,
    $B1, $FC, $4C, $FF, $F0, $00, $9B, $FE, $2A, $FF, $21, $FF, $5D, $FF, $90,
    $FF, $57, $FD, $1A, $02, $D1, $FE, $E6, $FE, $23, $01, $90, $FE, $91, $FE,
    $9B, $00, $60, $FF, $B4, $FF, $01, $00, $5E, $FC, $D0, $02, $EE, $FB, $50,
    $FF, $F1, $03, $5A, $FD, $4D, $FE, $94, $00, $70, $FF, $FA, $FE, $AE, $FF,
    $6C, $FF, $16, $00, $A8, $FF, $4A, $FF, $D3, $FF, $FE, $FD, $1B, $FE, $D0,
    $FF, $2E, $FE, $94, $00, $3C, $FF, $CF, $FE, $FE, $FE, $BF, $FD, $31, $FF,
    $C0, $FD, $1A, $00, $C5, $FE, $51, $FD, $66, $00, $BD, $FC, $8A, $FF, $B7,
    $FF, $C1, $FD, $08, $FF, $BB, $FE, $52, $00, $BF, $FF, $5E, $FE, $61, $FF,
    $BD, $FE, $FF, $FE, $BE, $FE, $F3, $FB, $8F, $02, $7E, $FD, $BE, $FF, $E3,
    $FF, $28, $FD, $2C, $FF, $FD, $FD, $C8, $01, $7C, $FF, $E1, $FE, $5A, $00,
    $58, $FF, $C5, $FD, $2A, $01, $0C, $FD, $14, $01, $17, $02, $A5, $FD, $0B,
    $FE, $53, $01, $EA, $FD, $2C, $FE, $31, $FF, $C9, $FE, $C9, $FF, $F3, $FF,
    $75, $00, $F0, $FE, $B3, $FC, $70, $FF, $6D, $02, $E8, $FC, $67, $FF, $CC,
    $01, $32, $00, $D8, $FE, $EE, $FD, $41, $01, $3B, $FF, $FF, $00, $B4, $FF,
    $EE, $FE, $88, $FE, $55, $FF, $BC, $01, $D2, $00, $8A, $FE, $23, $01, $D3,
    $00, $43, $FD, $76, $01, $03, $00, $91, $FE, $CC, $FE, $B5, $02, $15, $01,
    $18, $FF, $A1, $00, $5D, $01, $DC, $FF, $8C, $FF, $7E, $00, $D8, $FE, $C2,
    $FE, $53, $02, $51, $FF, $BF, $FC, $8B, $01, $57, $00, $3D, $FE, $B4, $FE,
    $49, $FD, $61, $01, $54, $FF, $4C, $FF, $43, $02, $12, $02, $6D, $03, $04,
    $05, $33, $00, $29, $F8, $93, $F5, $61, $00, $99, $FD, $5C, $FA, $AA, $F6,
    $CE, $F8, $6E, $FE, $4E, $02, $EC, $07, $DF, $03, $CE, $00, $E5, $FE, $B0,
    $FD, $1F, $FF, $8B, $FD, $ED, $FE, $23, $FB, $36, $F9, $93, $FE, $D7, $FF,
    $5F, $00, $A1, $FE, $3C, $03, $2B, $01, $EC, $07, $A5, $02, $07, $FE, $3C,
    $02, $BC, $01, $BF, $02, $7B, $FF, $0D, $FC, $AB, $01, $B3, $01, $FF, $FF,
    $69, $01, $EC, $FF, $8C, $FF, $D3, $01, $09, $01, $27, $03, $89, $FE, $21,
    $FC, $4A, $00, $5A, $00, $11, $01, $1E, $00, $FA, $02, $5C, $01, $5E, $00,
    $F4, $01, $E6, $00, $38, $00, $03, $00, $E5, $FE, $4E, $00, $12, $FD, $E2,
    $FD, $C0, $FF, $88, $FF, $19, $01, $B7, $02, $00, $02, $D2, $00, $D7, $FF,
    $3D, $00, $95, $01, $CB, $FE, $25, $FF, $CA, $FF, $C6, $00, $2E, $00, $95,
    $FD, $24, $00, $AB, $FD, $3A, $05, $58, $07, $C6, $FC, $49, $FF, $3E, $03,
    $DB, $03, $CA, $02, $8E, $FE, $74, $FF, $EE, $FE, $EC, $FB, $5D, $FB, $C4,
    $FB, $56, $06, $18, $14, $65, $2E, $66, $2F, $43, $0B, $97, $E6, $EA, $E1,
    $64, $FB, $2F, $00, $67, $F4, $60, $F4, $01, $EF, $44, $F0, $BD, $F4, $12,
    $03, $91, $24, $81, $25, $97, $15, $43, $F4, $F8, $E0, $65, $FD, $84, $0F,
    $3C, $F9, $23, $E9, $A5, $D8, $E0, $EB, $96, $1B, $B7, $26, $60, $18, $E9,
    $FA, $3A, $F1, $9A, $21, $64, $18, $28, $F3, $5A, $ED, $0B, $FC, $48, $07,
    $4D, $03, $7F, $FC, $D4, $FD, $D5, $FF, $1E, $FF, $BC, $00, $69, $FA, $15,
    $FC, $49, $02, $C3, $FE, $26, $FF, $88, $00, $21, $00, $D4, $FF, $B6, $FD,
    $A1, $FE, $0B, $03, $3D, $02, $B3, $02, $4A, $01, $58, $FD, $DF, $FF, $12,
    $01, $2E, $FE, $A4, $FD, $24, $FC, $36, $00, $35, $01, $38, $FE, $E0, $01,
    $B3, $02, $7E, $02, $FD, $FF, $70, $FC, $2B, $FE, $9F, $00, $1A, $01, $3C,
    $FF, $16, $FE, $75, $FF, $98, $FE, $9E, $FE, $86, $FF, $E4, $FE, $CF, $FE,
    $AC, $01, $4B, $01, $54, $00, $B0, $FF, $2E, $FE, $63, $FD, $74, $FD, $43,
    $FD, $35, $FF, $AC, $00, $73, $FE, $70, $FE, $2C, $FE, $86, $FF, $3A, $FF,
    $AC, $FC, $71, $FF, $5E, $01, $FB, $FE, $D8, $FC, $48, $FB, $A9, $FE, $8D,
    $03, $52, $FF, $5D, $FE, $36, $00, $37, $01, $D8, $00, $0F, $00, $32, $FD,
    $C5, $FC, $35, $01, $C2, $00, $D0, $FE, $FA, $FB, $DA, $FC, $EE, $01, $49,
    $01, $49, $03, $C2, $FF, $24, $FC, $A2, $FE, $5E, $02, $15, $02, $75, $FF,
    $75, $FD, $B5, $FE, $84, $01, $E0, $00, $92, $00, $64, $FF, $6E, $01, $D4,
    $01, $D7, $FE, $61, $FF, $91, $FF, $91, $FF, $F3, $FF, $AD, $FD, $56, $FD,
    $C0, $FF, $94, $FF, $AA, $FF, $25, $00, $01, $01, $47, $00, $95, $01, $FF,
    $01, $8B, $FF, $05, $00, $DF, $00, $5F, $FF, $23, $01, $E3, $FF, $84, $FF,
    $05, $00, $11, $FE, $9E, $FE, $7E, $FF, $49, $00, $85, $00, $7F, $FE, $6F,
    $00, $5A, $00, $33, $FE, $88, $00, $88, $00, $7E, $FF, $8B, $01, $5D, $02,
    $4E, $00, $73, $FE, $4A, $FF, $3B, $FF, $7E, $FF, $3C, $00, $C2, $FF, $28,
    $FF, $0E, $FF, $AC, $00, $78, $FF, $1C, $FF, $63, $00, $28, $02, $D2, $01,
    $44, $FF, $BE, $FE, $57, $00, $77, $00, $34, $01, $17, $00, $A1, $FF, $49,
    $FF, $80, $FE, $A1, $FF, $0A, $00, $74, $00, $12, $01, $F2, $FF, $51, $00,
    $AE, $00, $6B, $FF, $F7, $FF, $AB, $00, $22, $01, $CC, $02, $36, $01, $74,
    $FF, $21, $FE, $B9, $FE, $39, $00, $77, $FF, $F6, $FF, $36, $00, $83, $00,
    $FA, $00, $39, $00, $9A, $FE, $D9, $FF, $32, $FF, $80, $FF, $4F, $FF, $95,
    $FF, $CD, $00, $3B, $01, $12, $FF, $61, $FE, $10, $FF, $3D, $00, $65, $00,
    $5D, $FF, $14, $01, $7D, $00, $FA, $FF, $B7, $00, $39, $01, $4C, $00, $DA,
    $FE, $E1, $FE, $AC, $FF, $97, $FF, $94, $FF, $E6, $FF, $E8, $FF, $90, $00,
    $09, $01, $99, $00, $AA, $FF, $34, $FF, $4B, $FF, $F3, $FE, $0B, $FF, $CE,
    $FF, $83, $00, $18, $01, $2B, $FF, $7B, $FF, $12, $00, $6B, $00, $E9, $FF,
    $BC, $FF, $77, $FF, $6C, $FF, $5A, $FF, $11, $FF, $5C, $FF, $27, $00, $23,
    $00, $BE, $FF, $C9, $FF, $98, $00, $1D, $01, $18, $00, $A3, $FF, $AA, $FF,
    $DA, $00, $1D, $00, $9E, $FF, $05, $FF, $7C, $FF, $EF, $00, $8B, $00, $FA,
    $FF, $4D, $FF, $77, $00, $F2, $00, $E8, $00, $CC, $00, $8B, $FF, $E5, $FF,
    $D7, $FF, $08, $00, $5E, $00, $D0, $FF, $ED, $FF, $3B, $FF, $2C, $FF, $1D,
    $00, $67, $01, $D8, $00, $A6, $FF, $B5, $FE, $66, $FF, $27, $00, $72, $00,
    $A5, $FF, $68, $FF, $32, $FF, $75, $FF, $F7, $FE, $31, $FE, $23, $FE, $2C,
    $FF, $AD, $00, $42, $00, $F1, $FF, $BA, $FE, $75, $FF, $E0, $FF, $13, $FF,
    $36, $FF, $B7, $FF, $A0, $FF, $07, $00, $3D, $00, $10, $01, $FF, $00, $5E,
    $00, $47, $00, $33, $FF, $5F, $FF, $E3, $FF, $99, $00, $6B, $00, $F1, $FF,
    $AD, $FF, $9B, $FF, $11, $00, $F1, $FF, $84, $FF, $13, $FF, $80, $FF, $40,
    $00, $A2, $FF, $43, $FF, $D7, $00, $46, $00, $A1, $FF, $54, $00, $7A, $01,
    $00, $02, $FD, $FF, $58, $00, $6F, $00, $93, $00, $12, $00, $83, $00, $5D,
    $FF, $76, $FF, $1C, $00, $81, $00, $F8, $FF, $0F, $00, $3A, $00, $59, $00,
    $AE, $FF, $B3, $FF, $2D, $FF, $69, $FF, $A6, $00, $77, $00, $CE, $FF, $97,
    $FF, $B2, $00, $4C, $00, $7A, $FF, $33, $FF, $33, $00, $47, $00, $79, $FF,
    $24, $00, $00, $01, $47, $FF, $5B, $FF, $09, $00, $A5, $FF, $0C, $00, $08,
    $00, $74, $00, $E6, $00, $8F, $00, $E9, $FF, $3A, $FF, $BA, $FF, $60, $FF,
    $0B, $00, $21, $00, $B2, $FF, $EC, $FE, $2C, $FF, $EF, $01, $20, $02, $5A,
    $FF, $59, $FE, $86, $FF, $01, $00, $8A, $01, $7B, $00, $43, $00, $5C, $00,
    $B2, $FF, $E6, $FF, $44, $00, $42, $01, $1C, $01, $86, $00, $36, $01, $9D,
    $01, $11, $00, $0E, $00, $C9, $00, $E5, $00, $B1, $00, $D9, $01, $9A, $01,
    $E6, $00, $47, $00, $86, $00, $D9, $00, $02, $01, $77, $01, $F3, $00, $13,
    $01, $2B, $00, $A0, $FD, $3D, $FE, $1D, $00, $0C, $00, $D4, $01, $8F, $02,
    $66, $01, $E3, $00, $57, $00, $2E, $00, $F0, $00, $D2, $00, $7A, $00, $EB,
    $FF, $4D, $FF, $E5, $00, $52, $01, $A6, $00, $EF, $FF, $EF, $FF, $73, $00,
    $47, $01, $DE, $00, $2F, $00, $72, $00, $7F, $00, $32, $00, $C3, $FF, $92,
    $FF, $1D, $00, $DD, $FF, $2A, $00, $D2, $00, $E1, $FF, $49, $00, $87, $00,
    $FB, $FF, $DC, $00, $92, $FF, $5E, $FF, $9E, $00, $8D, $00, $FD, $FF, $D2,
    $FF, $FD, $FF, $7E, $01, $69, $01, $F9, $00, $FB, $00, $AB, $00, $EA, $00,
    $BC, $00, $E5, $FF, $36, $00, $1C, $01, $26, $01, $9B, $00, $11, $00, $F4,
    $FF, $71, $00, $2A, $01, $19, $01, $B8, $FF, $53, $FF, $E2, $FF, $09, $00,
    $6D, $00, $21, $01, $BF, $01, $54, $01, $0F, $00, $CD, $FF, $6D, $00, $57,
    $00, $B4, $FF, $FD, $FF, $C1, $FF, $F3, $FF, $C1, $FF, $ED, $FF, $8C, $00,
    $A4, $00, $2A, $00, $BB, $FF, $C2, $FF, $77, $00, $01, $01, $DC, $00, $AC,
    $00, $3C, $00, $F5, $FF, $BD, $FF, $F7, $FE, $BB, $FF, $5C, $00, $37, $00,
    $11, $00, $17, $00, $6B, $00, $D7, $00, $19, $01, $B6, $00, $12, $00, $39,
    $00, $D3, $00, $0C, $00, $A7, $FF, $5E, $FF, $11, $00, $6A, $FF, $C5, $FE,
    $2E, $00, $E2, $00, $50, $00, $DE, $FF, $EB, $FF, $57, $00, $FE, $FF, $A5,
    $FF, $9D, $FF, $61, $FF, $32, $FF, $71, $FF, $84, $FF, $A2, $FF, $A6, $00,
    $C9, $00, $51, $FF, $88, $FF, $D3, $FF, $6B, $00, $6C, $00, $2C, $00, $76,
    $00, $90, $FF, $E5, $FE, $95, $FF, $8A, $00, $04, $02, $FD, $01, $DE, $00,
    $C3, $00, $59, $01, $A7, $00, $21, $00, $BC, $FF, $BB, $FF, $18, $00, $26,
    $00, $F7, $FF, $73, $00, $89, $01, $55, $01, $81, $00, $7C, $FE, $14, $FE,
    $51, $FF, $CD, $FF, $94, $FF, $CB, $FF, $3D, $00, $49, $01, $8F, $01, $26,
    $01, $0D, $01, $23, $00, $3D, $FF, $BF, $FE, $01, $FF, $49, $FF, $AE, $FF,
    $C5, $FF, $82, $FF, $98, $FF, $FB, $FF, $85, $00, $F8, $00, $CF, $00, $D8,
    $00, $AA, $00, $A1, $FF, $11, $FF, $24, $FF, $0C, $00, $36, $00, $68, $00,
    $5E, $00, $16, $00, $04, $00, $37, $00, $73, $00, $11, $01, $10, $01, $5F,
    $00, $16, $00, $C4, $FF, $61, $FF, $F1, $FF, $90, $00, $08, $00, $87, $FF,
    $D9, $FF, $6C, $00, $0A, $01, $5A, $00, $7C, $00, $86, $00, $68, $FF, $C7,
    $FF, $1F, $00, $B1, $FF, $9C, $FF, $18, $00, $0E, $00, $17, $00, $82, $00,
    $F3, $00, $51, $00, $94, $FF, $9A, $FF, $D0, $FF, $FC, $FF, $26, $00, $18,
    $00, $6C, $FF, $A4, $FF, $D7, $00, $32, $01, $6E, $00, $2B, $00, $2A, $00,
    $66, $00, $93, $00, $74, $FF, $0F, $FF, $C9, $FF, $6C, $00, $2A, $00, $89,
    $FF, $8B, $FF, $B8, $00, $13, $01, $81, $00, $11, $00, $50, $FF, $45, $FF,
    $FE, $FF, $43, $00, $0D, $00, $A8, $FF, $F5, $FE, $20, $FF, $0D, $00, $8E,
    $00, $A0, $00, $0B, $00, $58, $FF, $68, $FF, $D9, $FF, $FC, $FF, $7D, $FF,
    $60, $FF, $B3, $FF, $B2, $FF, $AC, $FF, $81, $FF, $14, $00, $23, $01, $F8,
    $00, $1C, $00, $35, $FF, $47, $FF, $5B, $00, $9D, $00, $1A, $00, $D7, $FF,
    $82, $FF, $0F, $00, $3D, $00, $0E, $00, $EA, $FF, $49, $00, $67, $00, $7A,
    $00, $F6, $FF, $FA, $FF, $88, $00, $A7, $00, $72, $00, $01, $00, $53, $00,
    $AE, $00, $84, $00, $CC, $FF, $3C, $00, $54, $00, $0E, $00, $57, $FF, $D6,
    $FF, $41, $00, $57, $00, $BF, $FF, $0D, $00, $1D, $00, $58, $00, $46, $00,
    $AC, $FF, $94, $FF, $DD, $FF, $39, $00, $0E, $00, $27, $00, $3E, $00, $14,
    $00, $07, $00, $BB, $FF, $62, $FF, $92, $FF, $28, $00, $62, $00, $1F, $00,
    $8A, $FF, $A1, $FF, $29, $00, $A0, $00, $6C, $00, $25, $00, $46, $00, $5C,
    $00, $C7, $FF, $7D, $FF, $CE, $FF, $F0, $FF, $0F, $00, $18, $00, $66, $00,
    $93, $00, $82, $00, $68, $00, $2D, $00, $55, $00, $24, $00, $EA, $FF, $C5,
    $FF, $FB, $FF, $41, $00, $98, $00, $90, $00, $46, $00, $B5, $00, $71, $00,
    $FF, $FF, $EB, $FF, $26, $00, $04, $00, $B7, $FF, $04, $00, $0D, $00, $3E,
    $00, $E7, $FF, $09, $00, $50, $00, $1F, $00, $71, $00, $AC, $00, $1C, $00,
    $CD, $FF, $FF, $FF, $18, $00, $14, $00, $DF, $FF, $14, $00, $34, $00, $1C,
    $00, $DE, $FF, $D6, $FF, $E9, $FF, $2E, $00, $F3, $FF, $CC, $FF, $E7, $FF,
    $00, $00, $47, $00, $CA, $FF, $84, $FF, $E3, $FF, $CC, $FF, $81, $FF, $AC,
    $FF, $BA, $FF, $D5, $FF, $A7, $FF, $CC, $FF, $D0, $FF, $86, $FF, $A7, $FF,
    $C8, $FF, $75, $FF, $54, $FF, $8C, $FF, $58, $FF, $1E, $FF, $3D, $FF, $90,
    $FF, $90, $FF, $87, $FF, $4E, $FF, $8D, $FF, $94, $FF, $DA, $FE, $8A, $FE,
    $EA, $FE, $09, $FF, $57, $FF, $83, $FF, $EF, $FE, $F7, $FE, $FB, $FE, $E3,
    $FE, $00, $FF, $D0, $FE, $E4, $FE, $39, $FF, $F4, $FE, $B3, $FE, $F9, $FE,
    $10, $FF, $F9, $FE, $FD, $FE, $90, $FE, $97, $FE, $99, $FE, $A8, $FE, $BF,
    $FE, $FC, $FE, $23, $FF, $14, $FF, $DA, $FE, $B0, $FE, $FC, $FE, $D5, $FE,
    $A2, $FE, $74, $FE, $B8, $FE, $0B, $FF, $04, $FF, $C4, $FE, $02, $FF, $50,
    $FF, $A9, $FF, $75, $FF, $29, $FF, $F5, $FE, $00, $FF, $F5, $FE, $04, $FF,
    $01, $FF, $1E, $FF, $6C, $FF, $59, $FF, $39, $FF, $3B, $FF, $48, $FF, $56,
    $FF, $42, $FF, $1F, $FF, $5C, $FF, $7A, $FF, $40, $FF, $59, $FF, $70, $FF,
    $A2, $FF, $66, $FF, $48, $FF, $76, $FF, $BE, $FF, $AD, $FF, $7A, $FF, $BC,
    $FF, $CB, $FF, $EE, $FF, $B3, $FF, $48, $FF, $78, $FF, $EB, $FF, $04, $00,
    $B8, $FF, $82, $FF, $9D, $FF, $DA, $FF, $C0, $FF, $A6, $FF, $D0, $FF, $40,
    $00, $7B, $00, $2E, $00, $0F, $00, $0E, $00, $D4, $FF, $EF, $FF, $13, $00,
    $FA, $FF, $FD, $FF, $54, $00, $5F, $00, $DB, $FF, $B9, $FF, $F1, $FF, $08,
    $00, $4B, $00, $2A, $00, $02, $00, $49, $00, $73, $00, $AB, $00, $5F, $00,
    $1A, $00, $25, $00, $17, $00, $3C, $00, $43, $00, $44, $00, $47, $00, $4A,
    $00, $59, $00, $AB, $00, $53, $00, $EE, $FF, $0A, $00, $1D, $00, $61, $00,
    $9A, $00, $0C, $00, $3C, $00, $90, $00, $87, $00, $49, $00, $CF, $FF, $D7,
    $FF, $56, $00, $A6, $00, $3A, $00, $05, $00, $31, $00, $98, $00, $DB, $00,
    $CE, $00, $7B, $00, $69, $00, $2F, $00, $24, $00, $72, $00, $7D, $00, $47,
    $00, $45, $00, $94, $00, $94, $00, $71, $00, $3A, $00, $56, $00, $61, $00,
    $17, $00, $F3, $FF, $0F, $00, $51, $00, $7F, $00, $5C, $00, $1C, $00, $51,
    $00, $79, $00, $FE, $FF, $16, $00, $2A, $00, $4A, $00, $4E, $00, $D3, $FF,
    $C2, $FF, $41, $00, $55, $00, $29, $00, $11, $00, $75, $00, $AD, $00, $A9,
    $00, $60, $00, $2E, $00, $74, $00, $B0, $00, $5B, $00, $43, $00, $5B, $00,
    $55, $00, $62, $00, $1F, $00, $25, $00, $2C, $00, $8A, $00, $7A, $00, $52,
    $00, $58, $00, $47, $00, $37, $00, $5A, $00, $64, $00, $67, $00, $3C, $00,
    $25, $00, $20, $00, $46, $00, $48, $00, $2A, $00, $2C, $00, $3B, $00, $2D,
    $00, $0A, $00, $C3, $FF, $F4, $FF, $3D, $00, $27, $00, $FD, $FF, $1D, $00,
    $63, $00, $97, $00, $69, $00, $41, $00, $3E, $00, $10, $00, $03, $00, $CD,
    $FF, $3E, $00, $8E, $00, $2E, $00, $EC, $FF, $EE, $FF, $01, $00, $43, $00,
    $3A, $00, $2B, $00, $23, $00, $E1, $FF, $0B, $00, $4E, $00, $73, $00, $A2,
    $00, $A6, $00, $0A, $00, $BA, $FF, $00, $00, $47, $00, $6D, $00, $61, $00,
    $3E, $00, $2A, $00, $2B, $00, $24, $00, $F9, $FF, $15, $00, $49, $00, $2F,
    $00, $E5, $FF, $01, $00, $32, $00, $69, $00, $36, $00, $ED, $FF, $E3, $FF,
    $17, $00, $34, $00, $E4, $FF, $B8, $FF, $09, $00, $F1, $FF, $DF, $FF, $EC,
    $FF, $F8, $FF, $03, $00, $04, $00, $3C, $00, $31, $00, $22, $00, $14, $00,
    $E2, $FF, $C5, $FF, $2F, $00, $41, $00, $E0, $FF, $B7, $FF, $CA, $FF, $C7,
    $FF, $0A, $00, $14, $00, $32, $00, $21, $00, $D4, $FF, $05, $00, $34, $00,
    $49, $00, $3D, $00, $16, $00, $EF, $FF, $E8, $FF, $3B, $00, $90, $00, $70,
    $00, $22, $00, $ED, $FF, $06, $00, $42, $00, $C4, $FF, $50, $FF, $C9, $FF,
    $40, $00, $FC, $FF, $D4, $FF, $11, $00, $34, $00, $F9, $FF, $AF, $FF, $D6,
    $FF, $EA, $FF, $E3, $FF, $46, $00, $0D, $00, $CA, $FF, $1C, $00, $13, $00,
    $38, $00, $21, $00, $DE, $FF, $01, $00, $D3, $FF, $AA, $FF, $FA, $FF, $1A,
    $00, $18, $00, $33, $00, $0B, $00, $33, $00, $26, $00, $D8, $FF, $E1, $FF,
    $2F, $00, $2F, $00, $00, $00, $07, $00, $2A, $00, $00, $00, $E6, $FF, $CA,
    $FF, $DC, $FF, $FF, $FF, $CC, $FF, $D5, $FF, $BF, $FF, $BA, $FF, $02, $00,
    $F8, $FF, $FE, $FF, $1C, $00, $C7, $FF, $C8, $FF, $F5, $FF, $DA, $FF, $D5,
    $FF, $97, $FF, $68, $FF, $93, $FF, $C9, $FF, $F9, $FF, $E2, $FF, $8A, $FF,
    $89, $FF, $D6, $FF, $ED, $FF, $01, $00, $15, $00, $06, $00, $D4, $FF, $E0,
    $FF, $F8, $FF, $D1, $FF, $C1, $FF, $D9, $FF, $90, $FF, $95, $FF, $3C, $00,
    $03, $00, $B9, $FF, $96, $FF, $A4, $FF, $02, $00, $D0, $FF, $41, $00, $6B,
    $00, $B5, $FF, $92, $FF, $CD, $FF, $E8, $FF, $1D, $00, $34, $00, $CD, $FF,
    $8F, $FF, $A6, $FF, $BE, $FF, $CD, $FF, $C7, $FF, $DF, $FF, $C4, $FF, $C9,
    $FF, $03, $00, $07, $00, $CB, $FF, $E8, $FF, $E0, $FF, $E1, $FF, $BA, $FF,
    $A1, $FF, $DC, $FF, $16, $00, $CE, $FF, $9E, $FF, $E3, $FF, $25, $00, $0E,
    $00, $03, $00, $EE, $FF, $FE, $FF, $18, $00, $08, $00, $1C, $00, $1E, $00,
    $F2, $FF, $C1, $FF, $BD, $FF, $C4, $FF, $0A, $00, $21, $00, $20, $00, $DE,
    $FF, $BB, $FF, $C1, $FF, $E4, $FF, $FE, $FF, $1D, $00, $16, $00, $0A, $00,
    $E1, $FF, $FE, $FF, $4F, $00, $2F, $00, $00, $00, $E3, $FF, $ED, $FF, $C4,
    $FF, $E3, $FF, $21, $00, $0B, $00, $D8, $FF, $A5, $FF, $8D, $FF, $F1, $FF,
    $12, $00, $EE, $FF, $BA, $FF, $E1, $FF, $37, $00, $1B, $00, $EE, $FF, $E6,
    $FF, $CC, $FF, $DE, $FF, $F7, $FF, $2A, $00, $ED, $FF, $B0, $FF, $1F, $00,
    $56, $00, $63, $00, $1A, $00, $FD, $FF, $F9, $FF, $E0, $FF, $1D, $00, $2D,
    $00, $28, $00, $5B, $00, $45, $00, $1D, $00, $3B, $00, $83, $00, $4E, $00,
    $1A, $00, $34, $00, $18, $00, $07, $00, $4E, $00, $7E, $00, $38, $00, $16,
    $00, $39, $00, $26, $00, $14, $00, $59, $00, $8F, $00, $76, $00, $57, $00,
    $8F, $00, $64, $00, $30, $00, $38, $00, $26, $00, $35, $00, $49, $00, $50,
    $00, $7B, $00, $73, $00, $8F, $00, $64, $00, $D9, $FF, $3E, $00, $79, $00,
    $AA, $00, $C2, $00, $A5, $00, $91, $00, $9D, $00, $C0, $00, $57, $00, $44,
    $00, $B2, $00, $E2, $00, $BD, $00, $80, $00, $42, $00, $95, $00, $D6, $00,
    $C4, $00, $A3, $00, $68, $00, $28, $00, $88, $00, $B6, $00, $87, $00, $91,
    $00, $7B, $00, $56, $00, $7D, $00, $7F, $00, $70, $00, $99, $00, $6B, $00,
    $9A, $00, $A5, $00, $73, $00, $4E, $00, $62, $00, $54, $00, $A9, $00, $D5,
    $00, $73, $00, $98, $00, $AF, $00, $8B, $00, $A2, $00, $90, $00, $A5, $00,
    $B2, $00, $67, $00, $8D, $00, $B5, $00, $94, $00, $BA, $00, $C0, $00, $71,
    $00, $5B, $00, $6A, $00, $74, $00, $99, $00, $79, $00, $78, $00, $7A, $00,
    $4E, $00, $95, $00, $DF, $00, $BC, $00, $89, $00, $7C, $00, $53, $00, $2E,
    $00, $F9, $FF, $EF, $FF, $4A, $00, $68, $00, $49, $00, $64, $00, $D5, $00,
    $AF, $00, $6A, $00, $1C, $00, $3E, $00, $46, $00, $31, $00, $55, $00, $66,
    $00, $4E, $00, $52, $00, $33, $00, $1A, $00, $70, $00, $4F, $00, $EB, $FF,
    $BA, $FF, $98, $FF, $0B, $00, $2A, $00, $12, $00, $0B, $00, $07, $00, $2F,
    $00, $2A, $00, $EA, $FF, $DC, $FF, $C8, $FF, $A9, $FF, $F7, $FF, $EB, $FF,
    $10, $00, $1A, $00, $F2, $FF, $A2, $FF, $BC, $FF, $C8, $FF, $FA, $FF, $E2,
    $FF, $A5, $FF, $BD, $FF, $ED, $FF, $F7, $FF, $F6, $FF, $07, $00, $D5, $FF,
    $87, $FF, $72, $FF, $C4, $FF, $9B, $FF, $90, $FF, $8F, $FF, $7E, $FF, $BD,
    $FF, $09, $00, $13, $00, $E7, $FF, $88, $FF, $A4, $FF, $EE, $FF, $ED, $FF,
    $95, $FF, $8C, $FF, $BA, $FF, $00, $00, $24, $00, $F9, $FF, $B2, $FF, $FA,
    $FF, $12, $00, $FE, $FF, $C4, $FF, $9C, $FF, $A4, $FF, $C6, $FF, $AD, $FF,
    $C0, $FF, $AE, $FF, $D1, $FF, $16, $00, $25, $00, $00, $00, $EE, $FF, $1B,
    $00, $E7, $FF, $B4, $FF, $AB, $FF, $B3, $FF, $9B, $FF, $C0, $FF, $00, $00,
    $F1, $FF, $E5, $FF, $FF, $FF, $C0, $FF, $C9, $FF, $DF, $FF, $F1, $FF, $D5,
    $FF, $A5, $FF, $C8, $FF, $DA, $FF, $BD, $FF, $A7, $FF, $F3, $FF, $F6, $FF,
    $A7, $FF, $6D, $FF, $75, $FF, $DB, $FF, $E7, $FF, $C4, $FF, $CA, $FF, $AF,
    $FF, $A6, $FF, $DD, $FF, $14, $00, $34, $00, $CA, $FF, $C0, $FF, $25, $00,
    $DD, $FF, $C2, $FF, $01, $00, $D2, $FF, $B0, $FF, $DA, $FF, $F0, $FF, $03,
    $00, $CE, $FF, $E4, $FF, $FB, $FF, $FC, $FF, $45, $00, $F7, $FF, $C9, $FF,
    $15, $00, $E9, $FF, $DB, $FF, $F2, $FF, $15, $00, $57, $00, $15, $00, $CF,
    $FF, $18, $00, $2D, $00, $39, $00, $FB, $FF, $C9, $FF, $EA, $FF, $43, $00,
    $40, $00, $DD, $FF, $94, $FF, $FD, $FF, $54, $00, $1C, $00, $EA, $FF, $AE,
    $FF, $B7, $FF, $EA, $FF, $EC, $FF, $EB, $FF, $D3, $FF, $0D, $00, $11, $00,
    $E8, $FF, $CA, $FF, $04, $00, $0D, $00, $D7, $FF, $F5, $FF, $1A, $00, $26,
    $00, $D8, $FF, $D8, $FF, $EA, $FF, $CC, $FF, $46, $00, $0B, $00, $81, $FF,
    $F4, $FF, $E1, $FF, $D1, $FF, $C0, $FF, $BB, $FF, $F7, $FF, $19, $00, $0D,
    $00, $EA, $FF, $BB, $FF, $D4, $FF, $DF, $FF, $D0, $FF, $C8, $FF, $CE, $FF,
    $CD, $FF, $14, $00, $FA, $FF, $C9, $FF, $F0, $FF, $DC, $FF, $B6, $FF, $F2,
    $FF, $01, $00, $F6, $FF, $02, $00, $04, $00, $44, $00, $07, $00, $E2, $FF,
    $DC, $FF, $08, $00, $42, $00, $19, $00, $F1, $FF, $FD, $FF, $F0, $FF, $E7,
    $FF, $EC, $FF, $C2, $FF, $A0, $FF, $E4, $FF, $E6, $FF, $E4, $FF, $FE, $FF,
    $F6, $FF, $F1, $FF, $F4, $FF, $E2, $FF, $B4, $FF, $B5, $FF, $C8, $FF, $E4,
    $FF, $C6, $FF, $D6, $FF, $01, $00, $DF, $FF, $C7, $FF, $F3, $FF, $F3, $FF,
    $FE, $FF, $DD, $FF, $D8, $FF, $FE, $FF, $E6, $FF, $D7, $FF, $F8, $FF, $04,
    $00, $CD, $FF, $EA, $FF, $DA, $FF, $F1, $FF, $EE, $FF, $B7, $FF, $BA, $FF,
    $BA, $FF, $C2, $FF, $E7, $FF, $05, $00, $F7, $FF, $B5, $FF, $D5, $FF, $D1,
    $FF, $DA, $FF, $E0, $FF, $C7, $FF, $CF, $FF, $BF, $FF, $E3, $FF, $FB, $FF,
    $C9, $FF, $E3, $FF, $F0, $FF, $BD, $FF, $B6, $FF, $C1, $FF, $CC, $FF, $C7,
    $FF, $E5, $FF, $EF, $FF, $D0, $FF, $A2, $FF, $C1, $FF, $01, $00, $2B, $00,
    $D9, $FF, $BC, $FF, $0C, $00, $0E, $00, $FE, $FF, $CA, $FF, $D2, $FF, $F5,
    $FF, $9F, $FF, $9F, $FF, $D1, $FF, $A6, $FF, $C9, $FF, $0E, $00, $E5, $FF,
    $E1, $FF, $E8, $FF, $E2, $FF, $D9, $FF, $F8, $FF, $FC, $FF, $C6, $FF, $F5,
    $FF, $06, $00, $FB, $FF, $F4, $FF, $E1, $FF, $E7, $FF, $F5, $FF, $ED, $FF,
    $CD, $FF, $E1, $FF, $01, $00, $E1, $FF, $06, $00, $F4, $FF, $E6, $FF, $16,
    $00, $08, $00, $F7, $FF, $CD, $FF, $E9, $FF, $E8, $FF, $D4, $FF, $C5, $FF,
    $B8, $FF, $F0, $FF, $FD, $FF, $CE, $FF, $FF, $FF, $07, $00, $E9, $FF, $1B,
    $00, $2F, $00, $F3, $FF, $ED, $FF, $D6, $FF, $22, $00, $2C, $00, $39, $00,
    $23, $00, $2B, $00, $37, $00, $2A, $00, $5B, $00, $48, $00, $01, $00, $00,
    $00, $22, $00, $45, $00, $47, $00, $28, $00, $3B, $00, $38, $00, $1E, $00,
    $0D, $00, $30, $00, $41, $00, $2C, $00, $1B, $00, $00, $00, $27, $00, $2A,
    $00, $00, $00, $2E, $00, $61, $00, $32, $00, $30, $00, $41, $00, $38, $00,
    $08, $00, $F1, $FF, $1C, $00, $39, $00, $2F, $00, $11, $00, $2A, $00, $01,
    $00, $00, $00, $01, $00, $FA, $FF, $07, $00, $1D, $00, $1B, $00, $14, $00,
    $48, $00, $14, $00, $F0, $FF, $DE, $FF, $E5, $FF, $04, $00, $0C, $00, $06,
    $00, $0C, $00, $06, $00, $0B, $00, $1B, $00, $F9, $FF, $FD, $FF, $E7, $FF,
    $D1, $FF, $F1, $FF, $04, $00, $1D, $00, $0E, $00, $F7, $FF, $FB, $FF, $0D,
    $00, $F7, $FF, $E4, $FF, $F7, $FF, $11, $00, $23, $00, $4D, $00, $00, $00,
    $B6, $FF, $C8, $FF, $E8, $FF, $E3, $FF, $C1, $FF, $DA, $FF, $BD, $FF, $E2,
    $FF, $DD, $FF, $A7, $FF, $C7, $FF, $E2, $FF, $E1, $FF, $D2, $FF, $A5, $FF,
    $87, $FF, $D8, $FF, $1E, $00, $F8, $FF, $BE, $FF, $C6, $FF, $DD, $FF, $C9,
    $FF, $C2, $FF, $D8, $FF, $CA, $FF, $AF, $FF, $DC, $FF, $FC, $FF, $C8, $FF,
    $98, $FF, $CA, $FF, $C9, $FF, $D0, $FF, $CC, $FF, $D0, $FF, $E7, $FF, $BB,
    $FF, $B1, $FF, $A3, $FF, $AD, $FF, $FA, $FF, $A9, $FF, $84, $FF, $D6, $FF,
    $B9, $FF, $BB, $FF, $E8, $FF, $CE, $FF, $D0, $FF, $D4, $FF, $AC, $FF, $B8,
    $FF, $D0, $FF, $C2, $FF, $B1, $FF, $B6, $FF, $D5, $FF, $C4, $FF, $B1, $FF,
    $AC, $FF, $B5, $FF, $AA, $FF, $D7, $FF, $C9, $FF, $E5, $FF, $D2, $FF, $B2,
    $FF, $9B, $FF, $8D, $FF, $BB, $FF, $B7, $FF, $AD, $FF, $9F, $FF, $B6, $FF,
    $DD, $FF, $BB, $FF, $8B, $FF, $B8, $FF, $BF, $FF, $C7, $FF, $D9, $FF, $8B,
    $FF, $A4, $FF, $EC, $FF, $DD, $FF, $D2, $FF, $AC, $FF, $8C, $FF, $E3, $FF,
    $FC, $FF, $D9, $FF, $B2, $FF, $D0, $FF, $CE, $FF, $BF, $FF, $CE, $FF, $AA,
    $FF, $A4, $FF, $D5, $FF, $F3, $FF, $C3, $FF, $B3, $FF, $CD, $FF, $FD, $FF,
    $02, $00, $B9, $FF, $B0, $FF, $D6, $FF, $B5, $FF, $C0, $FF, $AF, $FF, $80,
    $FF, $E3, $FF, $FA, $FF, $FE, $FF, $E9, $FF, $A6, $FF, $DE, $FF, $DF, $FF,
    $DC, $FF, $EC, $FF, $BB, $FF, $BA, $FF, $E4, $FF, $CE, $FF, $A4, $FF, $9A,
    $FF, $CA, $FF, $F0, $FF, $BC, $FF, $C4, $FF, $DF, $FF, $D8, $FF, $E5, $FF,
    $D5, $FF, $C9, $FF, $E9, $FF, $BA, $FF, $C6, $FF, $02, $00, $E9, $FF, $F2,
    $FF, $F8, $FF, $CC, $FF, $CE, $FF, $D0, $FF, $F5, $FF, $FF, $FF, $E8, $FF,
    $FE, $FF, $00, $00, $FA, $FF, $FF, $FF, $06, $00, $14, $00, $FA, $FF, $D3,
    $FF, $FF, $FF, $24, $00, $04, $00, $EB, $FF, $FA, $FF, $05, $00, $27, $00,
    $12, $00, $E8, $FF, $10, $00, $2E, $00, $2F, $00, $04, $00, $EC, $FF, $05,
    $00, $01, $00, $FA, $FF, $E1, $FF, $03, $00, $24, $00, $2E, $00, $27, $00,
    $07, $00, $22, $00, $38, $00, $4A, $00, $4A, $00, $1D, $00, $3F, $00, $44,
    $00, $38, $00, $12, $00, $2B, $00, $3C, $00, $32, $00, $20, $00, $25, $00,
    $32, $00, $14, $00, $03, $00, $1B, $00, $36, $00, $0D, $00, $21, $00, $34,
    $00, $1F, $00, $FC, $FF, $28, $00, $21, $00, $08, $00, $15, $00, $4D, $00,
    $56, $00, $33, $00, $1D, $00, $2D, $00, $3B, $00, $28, $00, $37, $00, $1C,
    $00, $37, $00, $10, $00, $28, $00, $29, $00, $22, $00, $4C, $00, $57, $00,
    $54, $00, $2C, $00, $22, $00, $5C, $00, $7E, $00, $5D, $00, $3D, $00, $52,
    $00, $64, $00, $43, $00, $46, $00, $56, $00, $68, $00, $52, $00, $81, $00,
    $A1, $00, $88, $00, $6B, $00, $59, $00, $28, $00, $82, $00, $7E, $00, $5C,
    $00, $71, $00, $68, $00, $65, $00, $3B, $00, $42, $00, $5E, $00, $5A, $00,
    $4D, $00, $58, $00, $81, $00, $4D, $00, $55, $00, $75, $00, $71, $00, $81,
    $00, $45, $00, $58, $00, $59, $00, $4B, $00, $47, $00, $51, $00, $43, $00,
    $58, $00, $36, $00, $1B, $00, $24, $00, $20, $00, $22, $00, $34, $00, $39,
    $00, $4D, $00, $3C, $00, $31, $00, $4A, $00, $53, $00, $19, $00, $18, $00,
    $39, $00, $19, $00, $12, $00, $29, $00, $42, $00, $17, $00, $1C, $00, $1B,
    $00, $1C, $00, $17, $00, $12, $00, $14, $00, $20, $00, $35, $00, $37, $00,
    $4B, $00, $57, $00, $4C, $00, $42, $00, $5D, $00, $3A, $00, $21, $00, $3D,
    $00, $57, $00, $45, $00, $4B, $00, $5B, $00, $4D, $00, $37, $00, $2F, $00,
    $55, $00, $43, $00, $1F, $00, $35, $00, $35, $00, $46, $00, $69, $00, $47,
    $00, $4C, $00, $3C, $00, $3E, $00, $34, $00, $35, $00, $43, $00, $43, $00,
    $18, $00, $12, $00, $37, $00, $20, $00, $0E, $00, $36, $00, $4B, $00, $28,
    $00, $23, $00, $21, $00, $37, $00, $35, $00, $35, $00, $48, $00, $19, $00,
    $09, $00, $0B, $00, $11, $00, $27, $00, $0C, $00, $F3, $FF, $EB, $FF, $F8,
    $FF, $15, $00, $0E, $00, $F0, $FF, $FC, $FF, $ED, $FF, $E5, $FF, $F5, $FF,
    $F2, $FF, $F6, $FF, $D6, $FF, $D5, $FF, $08, $00, $00, $00, $E9, $FF, $EF,
    $FF, $F7, $FF, $ED, $FF, $02, $00, $ED, $FF, $D0, $FF, $ED, $FF, $E7, $FF,
    $01, $00, $0C, $00, $F3, $FF, $0E, $00, $FE, $FF, $E0, $FF, $CC, $FF, $EE,
    $FF, $F2, $FF, $DD, $FF, $D8, $FF, $ED, $FF, $08, $00, $F4, $FF, $ED, $FF,
    $DC, $FF, $E0, $FF, $FA, $FF, $08, $00, $05, $00, $01, $00, $07, $00, $04,
    $00, $D1, $FF, $EC, $FF, $12, $00, $FB, $FF, $D8, $FF, $DC, $FF, $EA, $FF,
    $F6, $FF, $FC, $FF, $FE, $FF, $F8, $FF, $E4, $FF, $CD, $FF, $CD, $FF, $C0,
    $FF, $BE, $FF, $CD, $FF, $D4, $FF, $BE, $FF, $A7, $FF, $D1, $FF, $BD, $FF,
    $B5, $FF, $E1, $FF, $CE, $FF, $AB, $FF, $C8, $FF, $E1, $FF, $E6, $FF, $E0,
    $FF, $DA, $FF, $CF, $FF, $BE, $FF, $CC, $FF, $D2, $FF, $E1, $FF, $E1, $FF,
    $D5, $FF, $D4, $FF, $E6, $FF, $D2, $FF, $DF, $FF, $CA, $FF, $B3, $FF, $C5,
    $FF, $BC, $FF, $E1, $FF, $EC, $FF, $E4, $FF, $CD, $FF, $B8, $FF, $B5, $FF,
    $C7, $FF, $B5, $FF, $CD, $FF, $D9, $FF, $B0, $FF, $A9, $FF, $C3, $FF, $D7,
    $FF, $C2, $FF, $E3, $FF, $DF, $FF, $E5, $FF, $FC, $FF, $C9, $FF, $B3, $FF,
    $B5, $FF, $D3, $FF, $C9, $FF, $CD, $FF, $C7, $FF, $AE, $FF, $B2, $FF, $CB,
    $FF, $D8, $FF, $C9, $FF, $A1, $FF, $B4, $FF, $D1, $FF, $E3, $FF, $E6, $FF,
    $C4, $FF, $B5, $FF, $9D, $FF, $BD, $FF, $E4, $FF, $D3, $FF, $B4, $FF, $CD,
    $FF, $C4, $FF, $93, $FF, $B1, $FF, $EE, $FF, $E0, $FF, $C9, $FF, $A8, $FF,
    $CA, $FF, $BB, $FF, $AB, $FF, $D0, $FF, $BF, $FF, $C6, $FF, $E9, $FF, $FE,
    $FF, $ED, $FF, $BE, $FF, $AD, $FF, $B6, $FF, $CA, $FF, $CE, $FF, $D0, $FF,
    $AD, $FF, $C4, $FF, $FC, $FF, $C2, $FF, $CD, $FF, $F1, $FF, $E8, $FF, $DD,
    $FF, $DC, $FF, $D4, $FF, $F4, $FF, $DC, $FF, $BF, $FF, $C7, $FF, $EE, $FF,
    $E9, $FF, $DC, $FF, $C2, $FF, $D6, $FF, $C6, $FF, $AB, $FF, $A6, $FF, $B1,
    $FF, $DD, $FF, $BD, $FF, $B1, $FF, $D4, $FF, $E7, $FF, $DA, $FF, $D4, $FF,
    $F0, $FF, $0C, $00, $E7, $FF, $DC, $FF, $DD, $FF, $FA, $FF, $E5, $FF, $D8,
    $FF, $F0, $FF, $EA, $FF, $C7, $FF, $F3, $FF, $F4, $FF, $D6, $FF, $E8, $FF,
    $F8, $FF, $CC, $FF, $C9, $FF, $01, $00, $ED, $FF, $DD, $FF, $D9, $FF, $DA,
    $FF, $E6, $FF, $B7, $FF, $B7, $FF, $E5, $FF, $DA, $FF, $D7, $FF, $DB, $FF,
    $DA, $FF, $D9, $FF, $DD, $FF, $DE, $FF, $FC, $FF, $FF, $FF, $EE, $FF, $CE,
    $FF, $D7, $FF, $F0, $FF, $F2, $FF, $C7, $FF, $D8, $FF, $03, $00, $E2, $FF,
    $E8, $FF, $E9, $FF, $C9, $FF, $E9, $FF, $F6, $FF, $DC, $FF, $CF, $FF, $D6,
    $FF, $FF, $FF, $07, $00, $DC, $FF, $E6, $FF, $E2, $FF, $E2, $FF, $F2, $FF,
    $DD, $FF, $F4, $FF, $E9, $FF, $09, $00, $1F, $00, $04, $00, $34, $00, $24,
    $00, $12, $00, $20, $00, $2B, $00, $33, $00, $20, $00, $1B, $00, $35, $00,
    $00, $00, $01, $00, $48, $00, $39, $00, $21, $00, $27, $00, $31, $00, $44,
    $00, $49, $00, $2E, $00, $33, $00, $5B, $00, $68, $00, $45, $00, $34, $00,
    $30, $00, $2A, $00, $34, $00, $1B, $00, $3B, $00, $37, $00, $2F, $00, $3C,
    $00, $2A, $00, $3C, $00, $3B, $00, $11, $00, $14, $00, $27, $00, $24, $00,
    $10, $00, $FA, $FF, $F0, $FF, $17, $00, $3D, $00, $36, $00, $1C, $00, $23,
    $00, $2E, $00, $07, $00, $24, $00, $2F, $00, $2D, $00, $18, $00, $2B, $00,
    $4A, $00, $3E, $00, $38, $00, $42, $00, $34, $00, $35, $00, $28, $00, $3A,
    $00, $32, $00, $19, $00, $38, $00, $4F, $00, $4F, $00, $3B, $00, $3C, $00,
    $55, $00, $22, $00, $11, $00, $39, $00, $07, $00, $1D, $00, $2D, $00, $44,
    $00, $48, $00, $46, $00, $3C, $00, $4C, $00, $35, $00, $3F, $00, $47, $00,
    $3B, $00, $45, $00, $5A, $00, $48, $00, $54, $00, $26, $00, $31, $00, $24,
    $00, $31, $00, $41, $00, $3C, $00, $2D, $00, $36, $00, $47, $00, $33, $00,
    $42, $00, $21, $00, $1E, $00, $39, $00, $38, $00, $29, $00, $27, $00, $3C,
    $00, $26, $00, $0B, $00, $0E, $00, $0B, $00, $31, $00, $1F, $00, $FD, $FF,
    $F7, $FF, $0E, $00, $00, $00, $2D, $00, $EB, $FF, $FB, $FF, $17, $00, $13,
    $00, $02, $00, $14, $00, $F0, $FF, $00, $00, $0F, $00, $22, $00, $1A, $00,
    $10, $00, $1B, $00, $0F, $00, $25, $00, $F1, $FF, $0B, $00, $FA, $FF, $00,
    $00, $10, $00, $14, $00, $1D, $00, $41, $00, $1F, $00, $0C, $00, $19, $00,
    $09, $00, $EF, $FF, $EB, $FF, $02, $00, $20, $00, $16, $00, $23, $00, $0C,
    $00, $41, $00, $1E, $00, $00, $00, $0B, $00, $01, $00, $11, $00, $0E, $00,
    $0A, $00, $04, $00, $23, $00, $F0, $FF, $0A, $00, $EE, $FF, $13, $00, $F6,
    $FF, $EF, $FF, $25, $00, $24, $00, $F7, $FF, $FD, $FF, $0C, $00, $0B, $00,
    $0C, $00, $0F, $00, $D0, $FF, $01, $00, $07, $00, $28, $00, $16, $00, $1F,
    $00, $1B, $00, $1C, $00, $13, $00, $14, $00, $10, $00, $12, $00, $1B, $00,
    $09, $00, $0E, $00, $01, $00, $23, $00, $33, $00, $13, $00, $EF, $FF, $F1,
    $FF, $FE, $FF, $22, $00, $16, $00, $F8, $FF, $FE, $FF, $0A, $00, $04, $00,
    $00, $00, $E8, $FF, $FB, $FF, $F3, $FF, $EC, $FF, $EF, $FF, $ED, $FF, $EE,
    $FF, $FF, $FF, $EE, $FF, $E9, $FF, $F7, $FF, $D8, $FF, $F6, $FF, $EE, $FF,
    $E1, $FF, $E3, $FF, $DD, $FF, $CA, $FF, $CB, $FF, $D6, $FF, $DA, $FF, $E6,
    $FF, $DE, $FF, $D0, $FF, $C5, $FF, $F2, $FF, $01, $00, $D2, $FF, $C7, $FF,
    $E1, $FF, $F0, $FF, $F4, $FF, $EF, $FF, $04, $00, $E8, $FF, $DB, $FF, $F1,
    $FF, $FB, $FF, $EA, $FF, $06, $00, $FF, $FF, $DF, $FF, $E5, $FF, $D7, $FF,
    $DD, $FF, $BF, $FF, $DD, $FF, $D2, $FF, $DF, $FF, $E4, $FF, $D9, $FF, $F4,
    $FF, $E6, $FF, $E8, $FF, $F7, $FF, $C5, $FF, $C7, $FF, $E7, $FF, $D5, $FF,
    $D7, $FF, $C7, $FF, $DC, $FF, $F0, $FF, $F6, $FF, $E7, $FF, $E9, $FF, $CF,
    $FF, $D9, $FF, $F0, $FF, $D5, $FF, $E3, $FF, $FC, $FF, $F2, $FF, $DB, $FF,
    $EA, $FF, $E9, $FF, $CC, $FF, $E3, $FF, $EE, $FF, $EB, $FF, $E5, $FF, $DB,
    $FF, $D8, $FF, $F7, $FF, $EA, $FF, $06, $00, $E0, $FF, $DF, $FF, $FA, $FF,
    $F5, $FF, $D3, $FF, $F4, $FF, $FC, $FF, $E5, $FF, $13, $00, $E8, $FF, $EA,
    $FF, $E2, $FF, $D6, $FF, $C8, $FF, $CA, $FF, $B7, $FF, $00, $00, $FE, $FF,
    $DD, $FF, $05, $00, $F0, $FF, $05, $00, $F3, $FF, $F7, $FF, $FA, $FF, $EE,
    $FF, $D2, $FF, $CE, $FF, $D3, $FF, $D6, $FF, $E8, $FF, $DE, $FF, $DF, $FF,
    $F6, $FF, $F1, $FF, $D5, $FF, $EA, $FF, $FB, $FF, $F8, $FF, $DE, $FF, $D8,
    $FF, $E4, $FF, $00, $00, $F4, $FF, $D5, $FF, $E8, $FF, $E9, $FF, $D4, $FF,
    $F1, $FF, $0A, $00, $E8, $FF, $D4, $FF, $DE, $FF, $E7, $FF, $DC, $FF, $F9,
    $FF, $F4, $FF, $D0, $FF, $CA, $FF, $E2, $FF, $F8, $FF, $05, $00, $F9, $FF,
    $DD, $FF, $F4, $FF, $EF, $FF, $E5, $FF, $F4, $FF, $D0, $FF, $E7, $FF, $DE,
    $FF, $C6, $FF, $DE, $FF, $E7, $FF, $C3, $FF, $E0, $FF, $F3, $FF, $DB, $FF,
    $D3, $FF, $D9, $FF, $E4, $FF, $FE, $FF, $DD, $FF, $DF, $FF, $E9, $FF, $E1,
    $FF, $F6, $FF, $06, $00, $07, $00, $FD, $FF, $EF, $FF, $F8, $FF, $09, $00,
    $F5, $FF, $E1, $FF, $F2, $FF, $F6, $FF, $F7, $FF, $ED, $FF, $E9, $FF, $E9,
    $FF, $FB, $FF, $F1, $FF, $ED, $FF, $F5, $FF, $DB, $FF, $DF, $FF, $D7, $FF,
    $E2, $FF, $E5, $FF, $EF, $FF, $DB, $FF, $EF, $FF, $00, $00, $00, $00, $F3,
    $FF, $EF, $FF, $00, $00, $00, $00, $F1, $FF, $10, $00, $2F, $00, $07, $00,
    $B5, $FF, $16, $00, $29, $00, $E2, $FF, $32, $00, $11, $00, $AB, $FF, $06,
    $00, $2A, $00, $1B, $00, $F2, $FF, $00, $00, $10, $00, $E7, $FF, $1D, $00,
    $34, $00, $2E, $00, $15, $00, $00, $00, $02, $00, $0A, $00, $17, $00, $2B,
    $00, $31, $00, $20, $00, $27, $00, $1E, $00, $29, $00, $2B, $00, $27, $00,
    $2D, $00, $1A, $00, $2A, $00, $24, $00, $12, $00, $23, $00, $10, $00, $FC,
    $FF, $14, $00, $2B, $00, $24, $00, $1D, $00, $32, $00, $32, $00, $17, $00,
    $1B, $00, $18, $00, $14, $00, $0A, $00, $0C, $00, $18, $00, $28, $00, $17,
    $00, $12, $00, $1E, $00, $0C, $00, $00, $00, $1A, $00, $2E, $00, $22, $00,
    $1D, $00, $20, $00, $13, $00, $15, $00, $21, $00, $10, $00, $09, $00, $0F,
    $00, $17, $00, $FE, $FF, $FE, $FF, $1A, $00, $25, $00, $25, $00, $15, $00,
    $22, $00, $1B, $00, $1D, $00, $21, $00, $00, $00, $FF, $FF, $11, $00, $19,
    $00, $04, $00, $FF, $FF, $0A, $00, $F3, $FF, $F6, $FF, $0C, $00, $04, $00,
    $08, $00, $0E, $00, $06, $00, $00, $00, $0A, $00, $17, $00, $0E, $00, $05,
    $00, $0C, $00, $0B, $00, $FC, $FF, $FF, $FF, $0C, $00, $FB, $FF, $F3, $FF,
    $F3, $FF, $0D, $00, $05, $00, $FB, $FF, $F9, $FF, $F7, $FF, $08, $00, $00,
    $00, $00, $00, $01, $00, $FC, $FF, $0C, $00, $0C, $00, $FA, $FF, $F5, $FF,
    $FF, $FF, $FF, $FF, $F8, $FF, $F9, $FF, $07, $00, $06, $00, $E3, $FF, $FD,
    $FF, $FF, $FF, $DC, $FF, $E9, $FF, $F8, $FF, $F2, $FF, $F5, $FF, $00, $00,
    $FF, $FF, $03, $00, $EC, $FF, $ED, $FF, $F0, $FF, $F7, $FF, $F3, $FF, $05,
    $00, $11, $00, $FB, $FF, $08, $00, $14, $00, $0F, $00, $16, $00, $08, $00,
    $06, $00, $06, $00, $0B, $00, $1A, $00, $0C, $00, $F8, $FF, $ED, $FF, $F2,
    $FF, $EE, $FF, $EC, $FF, $EC, $FF, $EA, $FF, $EA, $FF, $F0, $FF, $F6, $FF,
    $EB, $FF, $F4, $FF, $FA, $FF, $E3, $FF, $E5, $FF, $E8, $FF, $E2, $FF, $D1,
    $FF, $DE, $FF, $EE, $FF, $F4, $FF, $F1, $FF, $EE, $FF, $F2, $FF, $F5, $FF,
    $ED, $FF, $F9, $FF, $F8, $FF, $FC, $FF, $FA, $FF, $F2, $FF, $E6, $FF, $EF,
    $FF, $07, $00, $F0, $FF, $F1, $FF, $01, $00, $F4, $FF, $F7, $FF, $F2, $FF,
    $E6, $FF, $E8, $FF, $DC, $FF, $E5, $FF, $F7, $FF, $EE, $FF, $F2, $FF, $E3,
    $FF, $DA, $FF, $DE, $FF, $D2, $FF, $DB, $FF, $D8, $FF, $D4, $FF, $E0, $FF,
    $E4, $FF, $E6, $FF, $DC, $FF, $EB, $FF, $E9, $FF, $DF, $FF, $E5, $FF, $EA,
    $FF, $E5, $FF, $E1, $FF, $EC, $FF, $E9, $FF, $E6, $FF, $EA, $FF, $F4, $FF,
    $EE, $FF, $F3, $FF, $F4, $FF, $EA, $FF, $EE, $FF, $F0, $FF, $EF, $FF, $ED,
    $FF, $E9, $FF, $E4, $FF, $EB, $FF, $E3, $FF, $DF, $FF, $EF, $FF, $03, $00,
    $EF, $FF, $E6, $FF, $01, $00, $00, $00, $F6, $FF, $E8, $FF, $F4, $FF, $FC,
    $FF, $FA, $FF, $F2, $FF, $F6, $FF, $E0, $FF, $DA, $FF, $EB, $FF, $F7, $FF,
    $F9, $FF, $E2, $FF, $ED, $FF, $F4, $FF, $EF, $FF, $EC, $FF, $F5, $FF, $F1,
    $FF, $F1, $FF, $EE, $FF, $E7, $FF, $F6, $FF, $F8, $FF, $F8, $FF, $F6, $FF,
    $FE, $FF, $0A, $00, $FC, $FF, $02, $00, $00, $00, $03, $00, $05, $00, $08,
    $00, $03, $00, $F0, $FF, $EC, $FF, $FC, $FF, $07, $00, $04, $00, $05, $00,
    $01, $00, $F6, $FF, $FB, $FF, $03, $00, $05, $00, $FA, $FF, $03, $00, $F5,
    $FF, $F7, $FF, $0D, $00, $0C, $00, $00, $00, $F5, $FF, $FC, $FF, $F6, $FF,
    $03, $00, $FA, $FF, $0E, $00, $FD, $FF, $F6, $FF, $F5, $FF, $01, $00, $0D,
    $00, $09, $00, $03, $00, $FD, $FF, $F8, $FF, $FA, $FF, $FC, $FF, $FD, $FF,
    $00, $00, $07, $00, $00, $00, $FE, $FF, $00, $00, $11, $00, $0D, $00, $01,
    $00, $02, $00, $02, $00, $FD, $FF, $F4, $FF, $03, $00, $05, $00, $05, $00,
    $05, $00, $03, $00, $07, $00, $12, $00, $00, $00, $00, $00, $12, $00, $06,
    $00, $01, $00, $06, $00, $01, $00, $01, $00, $04, $00, $FF, $FF, $FB, $FF,
    $FA, $FF, $04, $00, $FF, $FF, $F5, $FF, $FF, $FF, $00, $00, $00, $00, $07,
    $00, $FE, $FF, $F3, $FF, $FA, $FF, $EE, $FF, $FF, $FF, $00, $00, $EB, $FF,
    $F3, $FF, $F9, $FF, $FE, $FF, $F4, $FF, $F3, $FF, $F5, $FF, $03, $00, $11,
    $00, $FC, $FF, $04, $00, $0E, $00, $FF, $FF, $FC, $FF, $04, $00, $F2, $FF,
    $F3, $FF, $EB, $FF, $EA, $FF, $F7, $FF, $FD, $FF, $F4, $FF, $F2, $FF, $08,
    $00, $FA, $FF, $04, $00, $FF, $FF, $02, $00, $FD, $FF, $04, $00, $03, $00,
    $03, $00, $0D, $00, $FC, $FF, $00, $00, $0B, $00, $FB, $FF, $F9, $FF, $0A,
    $00, $FE, $FF, $05, $00, $16, $00, $11, $00, $05, $00, $04, $00, $F8, $FF,
    $FC, $FF, $F1, $FF, $05, $00, $12, $00, $FB, $FF, $F7, $FF, $01, $00, $02,
    $00, $FB, $FF, $11, $00, $05, $00, $EE, $FF, $FA, $FF, $FF, $FF, $EB, $FF,
    $F7, $FF, $FD, $FF, $F2, $FF, $EC, $FF, $E8, $FF, $EF, $FF, $F4, $FF, $EE,
    $FF, $F1, $FF, $F0, $FF, $F9, $FF, $F5, $FF, $EF, $FF, $F2, $FF, $FB, $FF,
    $F4, $FF, $E2, $FF, $EE, $FF, $ED, $FF, $F1, $FF, $E1, $FF, $E6, $FF, $DE,
    $FF, $F3, $FF, $F0, $FF, $E8, $FF, $E5, $FF, $EF, $FF, $F2, $FF, $EF, $FF,
    $F8, $FF, $E7, $FF, $F5, $FF, $EB, $FF, $E4, $FF, $F7, $FF, $F1, $FF, $E7,
    $FF, $F9, $FF, $F8, $FF, $01, $00, $F8, $FF, $E9, $FF, $FA, $FF, $15, $00,
    $0C, $00, $F4, $FF, $00, $00, $FA, $FF, $EA, $FF, $EE, $FF, $F9, $FF, $0E,
    $00, $0F, $00, $02, $00, $04, $00, $00, $00, $01, $00, $F8, $FF, $01, $00,
    $08, $00, $07, $00, $09, $00, $08, $00, $0A, $00, $06, $00, $12, $00, $11,
    $00, $EE, $FF, $FA, $FF, $07, $00, $03, $00, $14, $00, $10, $00, $0F, $00,
    $15, $00, $11, $00, $FE, $FF, $18, $00, $10, $00, $27, $00, $09, $00, $0B,
    $00, $13, $00, $13, $00, $0E, $00, $F1, $FF, $E3, $FF, $0D, $00, $18, $00,
    $15, $00, $21, $00, $03, $00, $F8, $FF, $EA, $FF, $0C, $00, $1A, $00, $03,
    $00, $F0, $FF, $04, $00, $12, $00, $E6, $FF, $FF, $FF, $E8, $FF, $DA, $FF,
    $00, $00, $14, $00, $E4, $FF, $EB, $FF, $24, $00, $03, $00, $F2, $FF, $FC,
    $FF, $03, $00, $20, $00, $00, $00, $2C, $00, $FB, $FF, $04, $00, $16, $00,
    $00, $00, $DD, $FF, $EB, $FF, $27, $00, $22, $00, $1A, $00, $07, $00, $1E,
    $00, $04, $00, $02, $00, $00, $00, $17, $00, $02, $00, $07, $00, $2B, $00,
    $18, $00, $F4, $FF, $12, $00, $1E, $00, $03, $00, $F0, $FF, $01, $00, $19,
    $00, $F8, $FF, $F1, $FF, $02, $00, $1F, $00, $2B, $00, $17, $00, $0B, $00,
    $1E, $00, $E4, $FF, $21, $00, $1C, $00, $F3, $FF, $F8, $FF, $2A, $00, $1D,
    $00, $0F, $00, $2B, $00, $FB, $FF, $13, $00, $37, $00, $01, $00, $10, $00,
    $FD, $FF, $1E, $00, $0E, $00, $0D, $00, $14, $00, $FB, $FF, $2E, $00, $13,
    $00, $1D, $00, $1C, $00, $10, $00, $1F, $00, $1E, $00, $18, $00, $1D, $00,
    $18, $00, $0C, $00, $06, $00, $0C, $00, $15, $00, $0C, $00, $13, $00, $29,
    $00, $14, $00, $16, $00, $1A, $00, $24, $00, $1F, $00, $10, $00, $15, $00,
    $13, $00, $22, $00, $26, $00, $19, $00, $20, $00, $18, $00, $21, $00, $07,
    $00, $12, $00, $15, $00, $18, $00, $14, $00, $1D, $00, $17, $00, $21, $00,
    $1C, $00, $1E, $00, $1F, $00, $1A, $00, $14, $00, $16, $00, $11, $00, $1E,
    $00, $23, $00, $1A, $00, $1E, $00, $14, $00, $16, $00, $19, $00, $14, $00,
    $15, $00, $21, $00, $16, $00, $10, $00, $22, $00, $23, $00, $0A, $00, $08,
    $00, $10, $00, $09, $00, $0A, $00, $02, $00, $06, $00, $14, $00, $0E, $00,
    $06, $00, $0F, $00, $08, $00, $05, $00, $0C, $00, $18, $00, $0C, $00, $0E,
    $00, $0B, $00, $08, $00, $04, $00, $0A, $00, $04, $00, $0A, $00, $11, $00,
    $08, $00, $12, $00, $03, $00, $0A, $00, $12, $00, $07, $00, $06, $00, $10,
    $00, $0A, $00, $02, $00, $08, $00, $06, $00, $0C, $00, $0A, $00, $FF, $FF,
    $FD, $FF, $FB, $FF, $FA, $FF, $FA, $FF, $FE, $FF, $0A, $00, $0D, $00, $0A,
    $00, $FC, $FF, $F2, $FF, $EC, $FF, $FA, $FF, $04, $00, $FF, $FF, $02, $00,
    $01, $00, $FA, $FF, $00, $00, $FB, $FF, $FA, $FF, $ED, $FF, $FF, $FF, $09,
    $00, $FB, $FF, $02, $00, $06, $00, $F8, $FF, $F5, $FF, $01, $00, $00, $00,
    $FC, $FF, $F8, $FF, $FD, $FF, $01, $00, $F8, $FF, $00, $00, $F9, $FF, $EC,
    $FF, $F7, $FF, $0B, $00, $FC, $FF, $FE, $FF, $05, $00, $EB, $FF, $EA, $FF,
    $F4, $FF, $F3, $FF, $F6, $FF, $F4, $FF, $F7, $FF, $EF, $FF, $E9, $FF, $F0,
    $FF, $F9, $FF, $E4, $FF, $E2, $FF, $FB, $FF, $F9, $FF, $F7, $FF, $F6, $FF,
    $F3, $FF, $E9, $FF, $ED, $FF, $01, $00, $FA, $FF, $EA, $FF, $EE, $FF, $F8,
    $FF, $EE, $FF, $F6, $FF, $F9, $FF, $03, $00, $FE, $FF, $F1, $FF, $EA, $FF,
    $E5, $FF, $F2, $FF, $F0, $FF, $F0, $FF, $F1, $FF, $F6, $FF, $F8, $FF, $EB,
    $FF, $E4, $FF, $F4, $FF, $F8, $FF, $FE, $FF, $F9, $FF, $F7, $FF, $02, $00,
    $F3, $FF, $EB, $FF, $EE, $FF, $F0, $FF, $E4, $FF, $EE, $FF, $EB, $FF, $EF,
    $FF, $F7, $FF, $F0, $FF, $F2, $FF, $F5, $FF, $EA, $FF, $EA, $FF, $F0, $FF,
    $F9, $FF, $F5, $FF, $ED, $FF, $E6, $FF, $EC, $FF, $F2, $FF, $FE, $FF, $F6,
    $FF, $E5, $FF, $F2, $FF, $F6, $FF, $FF, $FF, $F9, $FF, $F0, $FF, $E1, $FF,
    $EC, $FF, $ED, $FF, $EF, $FF, $E9, $FF, $EC, $FF, $EF, $FF, $F6, $FF, $EF,
    $FF, $F3, $FF, $F4, $FF, $F7, $FF, $EE, $FF, $E7, $FF, $EF, $FF, $EF, $FF,
    $F8, $FF, $FD, $FF, $FC, $FF, $F8, $FF, $F3, $FF, $F0, $FF, $EF, $FF, $E0,
    $FF, $E8, $FF, $F1, $FF, $F3, $FF, $F3, $FF, $F6, $FF, $F7, $FF, $F9, $FF,
    $ED, $FF, $DD, $FF, $EF, $FF, $F6, $FF, $F7, $FF, $F5, $FF, $F8, $FF, $EC,
    $FF, $F3, $FF, $FB, $FF, $F1, $FF, $F0, $FF, $F0, $FF, $EB, $FF, $F2, $FF,
    $F7, $FF, $E7, $FF, $F0, $FF, $F9, $FF, $F0, $FF, $F4, $FF, $EE, $FF, $E9,
    $FF, $EA, $FF, $EB, $FF, $F3, $FF, $ED, $FF, $E6, $FF, $F4, $FF, $F0, $FF,
    $FA, $FF, $F3, $FF, $EA, $FF, $EC, $FF, $E7, $FF, $E7, $FF, $EF, $FF, $EF,
    $FF, $EE, $FF, $E8, $FF, $EE, $FF, $F2, $FF, $EF, $FF, $E3, $FF, $EA, $FF,
    $E2, $FF, $EA, $FF, $ED, $FF, $E6, $FF, $E4, $FF, $ED, $FF, $F4, $FF, $E9,
    $FF, $EF, $FF, $F1, $FF, $F8, $FF, $FC, $FF, $F9, $FF, $F2, $FF, $FF, $FF,
    $FB, $FF, $F1, $FF, $EF, $FF, $FF, $FF, $01, $00, $FF, $FF, $F8, $FF, $F7,
    $FF, $05, $00, $FF, $FF, $01, $00, $F9, $FF, $FF, $FF, $01, $00, $00, $00,
    $FA, $FF, $FA, $FF, $F0, $FF, $F4, $FF, $F8, $FF, $F9, $FF, $00, $00, $01,
    $00, $FF, $FF, $FE, $FF, $F9, $FF, $F1, $FF, $00, $00, $FC, $FF, $F3, $FF,
    $00, $00, $01, $00, $FC, $FF, $FB, $FF, $F7, $FF, $01, $00, $FE, $FF, $F9,
    $FF, $FB, $FF, $F3, $FF, $F8, $FF, $FC, $FF, $F0, $FF, $F6, $FF, $F3, $FF,
    $EF, $FF, $ED, $FF, $EE, $FF, $F4, $FF, $FC, $FF, $FE, $FF, $F3, $FF, $EF,
    $FF, $E6, $FF, $F3, $FF, $FC, $FF, $03, $00, $05, $00, $FC, $FF, $FE, $FF,
    $EF, $FF, $F5, $FF, $00, $00, $F9, $FF, $F3, $FF, $FD, $FF, $00, $00, $FD,
    $FF, $F3, $FF, $04, $00, $FB, $FF, $F1, $FF, $F7, $FF, $FB, $FF, $F9, $FF,
    $EC, $FF, $F7, $FF, $F5, $FF, $F9, $FF, $F9, $FF, $F1, $FF, $FB, $FF, $05,
    $00, $FD, $FF, $FD, $FF, $02, $00, $FD, $FF, $EF, $FF, $FD, $FF, $FC, $FF,
    $F6, $FF, $FD, $FF, $FC, $FF, $F7, $FF, $F4, $FF, $F4, $FF, $FC, $FF, $00,
    $00, $FC, $FF, $03, $00, $FA, $FF, $F6, $FF, $FE, $FF, $08, $00, $05, $00,
    $FE, $FF, $06, $00, $09, $00, $F6, $FF, $00, $00, $FE, $FF, $03, $00, $08,
    $00, $05, $00, $00, $00, $02, $00, $00, $00, $07, $00, $03, $00, $00, $00,
    $00, $00, $03, $00, $09, $00, $0A, $00, $03, $00, $01, $00, $02, $00, $FB,
    $FF, $04, $00, $05, $00, $FD, $FF, $00, $00, $FF, $FF, $F4, $FF, $04, $00,
    $0C, $00, $09, $00, $FC, $FF, $02, $00, $02, $00, $00, $00, $00, $00, $08,
    $00, $04, $00, $F7, $FF, $00, $00, $07, $00, $04, $00, $00, $00, $04, $00,
    $00, $00, $01, $00, $0A, $00, $08, $00, $F8, $FF, $FA, $FF, $0B, $00, $04,
    $00, $05, $00, $FE, $FF, $03, $00, $FE, $FF, $FE, $FF, $03, $00, $02, $00,
    $00, $00, $FE, $FF, $00, $00, $05, $00, $02, $00, $0A, $00, $10, $00, $09,
    $00, $03, $00, $0D, $00, $09, $00, $14, $00, $14, $00, $0D, $00, $0A, $00,
    $04, $00, $FA, $FF, $FA, $FF, $08, $00, $06, $00, $0A, $00, $08, $00, $05,
    $00, $09, $00, $07, $00, $FF, $FF, $F9, $FF, $FC, $FF, $01, $00, $03, $00,
    $03, $00, $FC, $FF, $0A, $00, $04, $00, $00, $00, $04, $00, $02, $00, $FC,
    $FF, $02, $00, $00, $00, $02, $00, $05, $00, $01, $00, $FE, $FF, $FA, $FF,
    $FD, $FF, $02, $00, $0B, $00, $01, $00, $00, $00, $02, $00, $00, $00, $00,
    $00, $01, $00, $00, $00, $F8, $FF, $FB, $FF, $F7, $FF, $F4, $FF, $FB, $FF,
    $01, $00, $01, $00, $F4, $FF, $EE, $FF, $F2, $FF, $EE, $FF, $F0, $FF, $EF,
    $FF, $EA, $FF, $E9, $FF, $F0, $FF, $F2, $FF, $EA, $FF, $E9, $FF, $E4, $FF,
    $EC, $FF, $F0, $FF, $EC, $FF, $E2, $FF, $EC, $FF, $EC, $FF, $E5, $FF, $E6,
    $FF, $EF, $FF, $EB, $FF, $E5, $FF, $EE, $FF, $E7, $FF, $E3, $FF, $DF, $FF,
    $E3, $FF, $EA, $FF, $F0, $FF, $ED, $FF, $EA, $FF, $EA, $FF, $EA, $FF, $E8,
    $FF, $E7, $FF, $EF, $FF, $F1, $FF, $E7, $FF, $E3, $FF, $E6, $FF, $EA, $FF,
    $EE, $FF, $E7, $FF, $ED, $FF, $EC, $FF, $EC, $FF, $EC, $FF, $EB, $FF, $F2,
    $FF, $F8, $FF, $FB, $FF, $EF, $FF, $EF, $FF, $F3, $FF, $F5, $FF, $F6, $FF,
    $EF, $FF, $EF, $FF, $EB, $FF, $F2, $FF, $F1, $FF, $F0, $FF, $F4, $FF, $ED,
    $FF, $EE, $FF, $EC, $FF, $F7, $FF, $FB, $FF, $F8, $FF, $FC, $FF, $FD, $FF,
    $F5, $FF, $F2, $FF, $F8, $FF, $FD, $FF, $FE, $FF, $FB, $FF, $03, $00, $02,
    $00, $FA, $FF, $01, $00, $05, $00, $03, $00, $02, $00, $0D, $00, $0D, $00,
    $02, $00, $06, $00, $03, $00, $00, $00, $06, $00, $03, $00, $02, $00, $04,
    $00, $08, $00, $00, $00, $F7, $FF, $F9, $FF, $03, $00, $03, $00, $F8, $FF,
    $F4, $FF, $06, $00, $04, $00, $00, $00, $05, $00, $06, $00, $00, $00, $FD,
    $FF, $FE, $FF, $03, $00, $07, $00, $01, $00, $F1, $FF, $FC, $FF, $FF, $FF,
    $FC, $FF, $04, $00, $02, $00, $FD, $FF, $FF, $FF, $01, $00, $FC, $FF, $F9,
    $FF, $FF, $FF, $06, $00, $0C, $00, $0A, $00, $0A, $00, $07, $00, $09, $00,
    $06, $00, $04, $00, $0B, $00, $0A, $00, $12, $00, $1A, $00, $15, $00, $0C,
    $00, $06, $00, $04, $00, $03, $00, $07, $00, $06, $00, $13, $00, $0C, $00,
    $08, $00, $0B, $00, $10, $00, $12, $00, $12, $00, $15, $00, $17, $00, $10,
    $00, $0F, $00, $14, $00, $12, $00, $15, $00, $18, $00, $1A, $00, $13, $00,
    $15, $00, $19, $00, $0C, $00, $16, $00, $11, $00, $11, $00, $10, $00, $13,
    $00, $18, $00, $0E, $00, $0E, $00, $16, $00, $15, $00, $0F, $00, $15, $00,
    $11, $00, $13, $00, $1C, $00, $16, $00, $1C, $00, $19, $00, $10, $00, $1A,
    $00, $15, $00, $13, $00, $14, $00, $1F, $00, $13, $00, $13, $00, $1B, $00,
    $1C, $00, $1F, $00, $19, $00, $18, $00, $0F, $00, $13, $00, $1A, $00, $1D,
    $00, $1F, $00, $18, $00, $10, $00, $10, $00, $11, $00, $10, $00, $13, $00,
    $16, $00, $15, $00, $19, $00, $19, $00, $10, $00, $0F, $00, $12, $00, $14,
    $00, $09, $00, $12, $00, $10, $00, $13, $00, $14, $00, $14, $00, $0E, $00,
    $02, $00, $0B, $00, $12, $00, $0F, $00, $11, $00, $0F, $00, $03, $00, $0F,
    $00, $13, $00, $08, $00, $04, $00, $0D, $00, $0E, $00, $09, $00, $08, $00,
    $08, $00, $00, $00, $FF, $FF, $05, $00, $02, $00, $03, $00, $07, $00, $07,
    $00, $14, $00, $0F, $00, $04, $00, $08, $00, $0B, $00, $0A, $00, $0A, $00,
    $06, $00, $03, $00, $05, $00, $09, $00, $02, $00, $FB, $FF, $FB, $FF, $FE,
    $FF, $04, $00, $FF, $FF, $FA, $FF, $04, $00, $08, $00, $03, $00, $05, $00,
    $01, $00, $FE, $FF, $FD, $FF, $01, $00, $01, $00, $05, $00, $F8, $FF, $FC,
    $FF, $01, $00, $02, $00, $0A, $00, $01, $00, $FF, $FF, $FF, $FF, $FC, $FF,
    $FD, $FF, $02, $00, $01, $00, $FF, $FF, $03, $00, $00, $00, $01, $00, $00,
    $00, $FE, $FF, $FB, $FF, $FF, $FF, $F9, $FF, $FE, $FF, $FA, $FF, $F8, $FF,
    $FD, $FF, $F7, $FF, $F9, $FF, $00, $00, $08, $00, $FC, $FF, $FC, $FF, $F7,
    $FF, $FD, $FF, $FF, $FF, $FB, $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FC, $FF,
    $FD, $FF, $FA, $FF, $F6, $FF, $FE, $FF, $FC, $FF, $F5, $FF, $F5, $FF, $FA,
    $FF, $F6, $FF, $F4, $FF, $F9, $FF, $F6, $FF, $F7, $FF, $F6, $FF, $F4, $FF,
    $EF, $FF, $F5, $FF, $F9, $FF, $FB, $FF, $F0, $FF, $F0, $FF, $F5, $FF, $F6,
    $FF, $F0, $FF, $F6, $FF, $FB, $FF, $F9, $FF, $F1, $FF, $EF, $FF, $EC, $FF,
    $EB, $FF, $EF, $FF, $F9, $FF, $F9, $FF, $EA, $FF, $EC, $FF, $F1, $FF, $F5,
    $FF, $FE, $FF, $F7, $FF, $F7, $FF, $F6, $FF, $FB, $FF, $F7, $FF, $F3, $FF,
    $F7, $FF, $EF, $FF, $F5, $FF, $F4, $FF, $E9, $FF, $ED, $FF, $FD, $FF, $F3,
    $FF, $F6, $FF, $F7, $FF, $F1, $FF, $F3, $FF, $F5, $FF, $F4, $FF, $EF, $FF,
    $F9, $FF, $F6, $FF, $F1, $FF, $F6, $FF, $F4, $FF, $EE, $FF, $F7, $FF, $F1,
    $FF, $F8, $FF, $FA, $FF, $EF, $FF, $F9, $FF, $F5, $FF, $F8, $FF, $F7, $FF,
    $F6, $FF, $F6, $FF, $02, $00, $FA, $FF, $F3, $FF, $FB, $FF, $FD, $FF, $F2,
    $FF, $F7, $FF, $02, $00, $F6, $FF, $F7, $FF, $F9, $FF, $FE, $FF, $FA, $FF,
    $F7, $FF, $F6, $FF, $F6, $FF, $F3, $FF, $F1, $FF, $F6, $FF, $00, $00, $F6,
    $FF, $EF, $FF, $F5, $FF, $F5, $FF, $F5, $FF, $F8, $FF, $FD, $FF, $F8, $FF,
    $F8, $FF, $F9, $FF, $F8, $FF, $F3, $FF, $F5, $FF, $F9, $FF, $FB, $FF, $F8,
    $FF, $F9, $FF, $F0, $FF, $EF, $FF, $F7, $FF, $F8, $FF, $F7, $FF, $F0, $FF,
    $EF, $FF, $EA, $FF, $F0, $FF, $FD, $FF, $F9, $FF, $FA, $FF, $F8, $FF, $F1,
    $FF, $EE, $FF, $EE, $FF, $FE, $FF, $FA, $FF, $F1, $FF, $F6, $FF, $EF, $FF,
    $EC, $FF, $F6, $FF, $F2, $FF, $F9, $FF, $FE, $FF, $FE, $FF, $FB, $FF, $F8,
    $FF, $F5, $FF, $EC, $FF, $F3, $FF, $00, $00, $02, $00, $FB, $FF, $F8, $FF,
    $01, $00, $FD, $FF, $F2, $FF, $F4, $FF, $F8, $FF, $F7, $FF, $FB, $FF, $F3,
    $FF, $F1, $FF, $F3, $FF, $F5, $FF, $F9, $FF, $F9, $FF, $F2, $FF, $F7, $FF,
    $F3, $FF, $F3, $FF, $F8, $FF, $F6, $FF, $F7, $FF, $F6, $FF, $FB, $FF, $FE,
    $FF, $F9, $FF, $FA, $FF, $FE, $FF, $FF, $FF, $FB, $FF, $F0, $FF, $FA, $FF,
    $F2, $FF, $ED, $FF, $F0, $FF, $F6, $FF, $F8, $FF, $F1, $FF, $EA, $FF, $EE,
    $FF, $F0, $FF, $F3, $FF, $FB, $FF, $F7, $FF, $F5, $FF, $EE, $FF, $F1, $FF,
    $FB, $FF, $F7, $FF, $F3, $FF, $F2, $FF, $F6, $FF, $F5, $FF, $EC, $FF, $ED,
    $FF, $EE, $FF, $F6, $FF, $F7, $FF, $FC, $FF, $F4, $FF, $ED, $FF, $F6, $FF,
    $F9, $FF, $F5, $FF, $F7, $FF, $FD, $FF, $F8, $FF, $F5, $FF, $FC, $FF, $FC,
    $FF, $FE, $FF, $F2, $FF, $FB, $FF, $FF, $FF, $FC, $FF, $F4, $FF, $FA, $FF,
    $F6, $FF, $FA, $FF, $FA, $FF, $FA, $FF, $FA, $FF, $F9, $FF, $01, $00, $01,
    $00, $F9, $FF, $F6, $FF, $F6, $FF, $F5, $FF, $FD, $FF, $F9, $FF, $FC, $FF,
    $FE, $FF, $FD, $FF, $FE, $FF, $00, $00, $FA, $FF, $F7, $FF, $FB, $FF, $FB,
    $FF, $FD, $FF, $FB, $FF, $FF, $FF, $FE, $FF, $FB, $FF, $F7, $FF, $FC, $FF,
    $FD, $FF, $F9, $FF, $F9, $FF, $FC, $FF, $F8, $FF, $FD, $FF, $F7, $FF, $02,
    $00, $02, $00, $00, $00, $01, $00, $FB, $FF, $FB, $FF, $FA, $FF, $FA, $FF,
    $00, $00, $00, $00, $F8, $FF, $01, $00, $00, $00, $FF, $FF, $FA, $FF, $FF,
    $FF, $00, $00, $FE, $FF, $FA, $FF, $01, $00, $01, $00, $FE, $FF, $FE, $FF,
    $F7, $FF, $FB, $FF, $FE, $FF, $FF, $FF, $FA, $FF, $FA, $FF, $F9, $FF, $FD,
    $FF, $FC, $FF, $FB, $FF, $FF, $FF, $FC, $FF, $FD, $FF, $00, $00, $00, $00,
    $FB, $FF, $02, $00, $04, $00, $01, $00, $FF, $FF, $FD, $FF, $FA, $FF, $FF,
    $FF, $07, $00, $FF, $FF, $00, $00, $FE, $FF, $FE, $FF, $FC, $FF, $01, $00,
    $FF, $FF, $00, $00, $02, $00, $FF, $FF, $FA, $FF, $05, $00, $04, $00, $FD,
    $FF, $FF, $FF, $06, $00, $04, $00, $FF, $FF, $01, $00, $06, $00, $07, $00,
    $0A, $00, $06, $00, $05, $00, $03, $00, $0E, $00, $04, $00, $03, $00, $02,
    $00, $03, $00, $03, $00, $07, $00, $0B, $00, $02, $00, $00, $00, $08, $00,
    $0A, $00, $05, $00, $08, $00, $10, $00, $0D, $00, $0A, $00, $0A, $00, $07,
    $00, $10, $00, $0D, $00, $0C, $00, $0C, $00, $0A, $00, $0C, $00, $10, $00,
    $0D, $00, $10, $00, $09, $00, $0B, $00, $0C, $00, $08, $00, $0C, $00, $10,
    $00, $0E, $00, $09, $00, $0B, $00, $0D, $00, $06, $00, $08, $00, $09, $00,
    $06, $00, $09, $00, $0E, $00, $11, $00, $0C, $00, $12, $00, $11, $00, $11,
    $00, $09, $00, $0E, $00, $09, $00, $0A, $00, $04, $00, $03, $00, $0B, $00,
    $0F, $00, $0E, $00, $0F, $00, $0A, $00, $0A, $00, $0A, $00, $0C, $00, $10,
    $00, $0E, $00, $11, $00, $13, $00, $0F, $00, $04, $00, $0B, $00, $06, $00,
    $09, $00, $09, $00, $06, $00, $08, $00, $09, $00, $09, $00, $0A, $00, $08,
    $00, $01, $00, $02, $00, $0A, $00, $0C, $00, $04, $00, $09, $00, $08, $00,
    $0C, $00, $0D, $00, $0D, $00, $0D, $00, $0E, $00, $08, $00, $05, $00, $05,
    $00, $02, $00, $00, $00, $04, $00, $00, $00, $01, $00, $00, $00, $01, $00,
    $00, $00, $FD, $FF, $FF, $FF, $04, $00, $08, $00, $05, $00, $05, $00, $07,
    $00, $03, $00, $04, $00, $02, $00, $00, $00, $01, $00, $00, $00, $00, $00,
    $FF, $FF, $01, $00, $FE, $FF, $FC, $FF, $FE, $FF, $FD, $FF, $03, $00, $03,
    $00, $04, $00, $04, $00, $FE, $FF, $FC, $FF, $FB, $FF, $FE, $FF, $00, $00,
    $03, $00, $03, $00, $01, $00, $00, $00, $01, $00, $05, $00, $06, $00, $00,
    $00, $05, $00, $05, $00, $08, $00, $00, $00, $FF, $FF, $FF, $FF, $FE, $FF,
    $01, $00, $04, $00, $00, $00, $00, $00, $00, $00, $FE, $FF, $00, $00, $07,
    $00, $00, $00, $00, $00, $05, $00, $02, $00, $FF, $FF, $FE, $FF, $00, $00,
    $FF, $FF, $03, $00, $02, $00, $05, $00, $FF, $FF, $04, $00, $04, $00, $00,
    $00, $02, $00, $FE, $FF, $F7, $FF, $FA, $FF, $FB, $FF, $00, $00, $00, $00,
    $FF, $FF, $00, $00, $00, $00, $00, $00, $04, $00, $FD, $FF, $FC, $FF, $01,
    $00, $FC, $FF, $FB, $FF, $F9, $FF, $F7, $FF, $F9, $FF, $FC, $FF, $FA, $FF,
    $FF, $FF, $F9, $FF, $F8, $FF, $F2, $FF, $F3, $FF, $F9, $FF, $F8, $FF, $F4,
    $FF, $F1, $FF, $F4, $FF, $F6, $FF, $FA, $FF, $F9, $FF, $F8, $FF, $F9, $FF,
    $FC, $FF, $F4, $FF, $F3, $FF, $FA, $FF, $F8, $FF, $F9, $FF, $F7, $FF, $F8,
    $FF, $F4, $FF, $F3, $FF, $F9, $FF, $F6, $FF, $F6, $FF, $F6, $FF, $F4, $FF,
    $F8, $FF, $F6, $FF, $F7, $FF, $F6, $FF, $F9, $FF, $FD, $FF, $F2, $FF, $EB,
    $FF, $F1, $FF, $F6, $FF, $F1, $FF, $F4, $FF, $F5, $FF, $F6, $FF, $F2, $FF,
    $F2, $FF, $F1, $FF, $EE, $FF, $F2, $FF, $F4, $FF, $F1, $FF, $F0, $FF, $F0,
    $FF, $F0, $FF, $F1, $FF, $F1, $FF, $F5, $FF, $F3, $FF, $F1, $FF, $F0, $FF,
    $F4, $FF, $F2, $FF, $ED, $FF, $ED, $FF, $F3, $FF, $F6, $FF, $F0, $FF, $F0,
    $FF, $F2, $FF, $F1, $FF, $F0, $FF, $EE, $FF, $EE, $FF, $E8, $FF, $F3, $FF,
    $EF, $FF, $EB, $FF, $E7, $FF, $E8, $FF, $ED, $FF, $F1, $FF, $F0, $FF, $F2,
    $FF, $F1, $FF, $F2, $FF, $F4, $FF, $F1, $FF, $F3, $FF, $F1, $FF, $EA, $FF,
    $F0, $FF, $F7, $FF, $F4, $FF, $F3, $FF, $F0, $FF, $EE, $FF, $F2, $FF, $F2,
    $FF, $F4, $FF, $F0, $FF, $F3, $FF, $EB, $FF, $E6, $FF, $E8, $FF, $EE, $FF,
    $EC, $FF, $F1, $FF, $F3, $FF, $F3, $FF, $ED, $FF, $E8, $FF, $E7, $FF, $ED,
    $FF, $F5, $FF, $F7, $FF, $F8, $FF, $ED, $FF, $EE, $FF, $EE, $FF, $F0, $FF,
    $EE, $FF, $EB, $FF, $F2, $FF, $EF, $FF, $F3, $FF, $F3, $FF, $ED, $FF, $EC,
    $FF, $F3, $FF, $EE, $FF, $F2, $FF, $F3, $FF, $F1, $FF, $F2, $FF, $F6, $FF,
    $F9, $FF, $FA, $FF, $F3, $FF, $F3, $FF, $F6, $FF, $F7, $FF, $F4, $FF, $F8,
    $FF, $F5, $FF, $F3, $FF, $F7, $FF, $FD, $FF, $F8, $FF, $FC, $FF, $F9, $FF,
    $F9, $FF, $F7, $FF, $F6, $FF, $FB, $FF, $FA, $FF, $FB, $FF, $FA, $FF, $FC,
    $FF, $FC, $FF, $F7, $FF, $F9, $FF, $F5, $FF, $F8, $FF, $F5, $FF, $FC, $FF,
    $F4, $FF, $FA, $FF, $F5, $FF, $F6, $FF, $FA, $FF, $FD, $FF, $00, $00, $F4,
    $FF, $FC, $FF, $F6, $FF, $F5, $FF, $FE, $FF, $FB, $FF, $F8, $FF, $FC, $FF,
    $FE, $FF, $F7, $FF, $FD, $FF, $FD, $FF, $FB, $FF, $FF, $FF, $00, $00, $FF,
    $FF, $FB, $FF, $00, $00, $FD, $FF, $00, $00, $FE, $FF, $02, $00, $00, $00,
    $00, $00, $03, $00, $04, $00, $00, $00, $FD, $FF, $00, $00, $FE, $FF, $FE,
    $FF, $00, $00, $FF, $FF, $FD, $FF, $03, $00, $03, $00, $02, $00, $03, $00,
    $03, $00, $02, $00, $06, $00, $03, $00, $03, $00, $00, $00, $04, $00, $00,
    $00, $03, $00, $03, $00, $07, $00, $06, $00, $0A, $00, $07, $00, $06, $00,
    $06, $00, $03, $00, $01, $00, $00, $00, $04, $00, $07, $00, $07, $00, $03,
    $00, $04, $00, $06, $00, $0A, $00, $04, $00, $03, $00, $04, $00, $01, $00,
    $01, $00, $08, $00, $09, $00, $08, $00, $09, $00, $07, $00, $03, $00, $01,
    $00, $03, $00, $05, $00, $00, $00, $02, $00, $02, $00, $03, $00, $01, $00,
    $01, $00, $04, $00, $FF, $FF, $02, $00, $04, $00, $01, $00, $FF, $FF, $02,
    $00, $01, $00, $02, $00, $03, $00, $03, $00, $02, $00, $01, $00, $03, $00,
    $00, $00, $00, $00, $00, $00, $01, $00, $03, $00, $01, $00, $03, $00, $03,
    $00, $00, $00, $00, $00, $03, $00, $01, $00, $FF, $FF, $02, $00, $02, $00,
    $02, $00, $08, $00, $08, $00, $01, $00, $00, $00, $01, $00, $00, $00, $FF,
    $FF, $00, $00, $FE, $FF, $FF, $FF, $01, $00, $02, $00, $01, $00, $08, $00,
    $05, $00, $00, $00, $01, $00, $05, $00, $02, $00, $05, $00, $04, $00, $01,
    $00, $02, $00, $02, $00, $01, $00, $02, $00, $FE, $FF, $02, $00, $03, $00,
    $04, $00, $05, $00, $01, $00, $00, $00, $FD, $FF, $00, $00, $03, $00, $05,
    $00, $03, $00, $02, $00, $01, $00, $FD, $FF, $FE, $FF, $FE, $FF, $FD, $FF,
    $03, $00, $03, $00, $04, $00, $00, $00, $00, $00, $02, $00, $01, $00, $08,
    $00, $02, $00, $07, $00, $02, $00, $04, $00, $05, $00, $04, $00, $05, $00,
    $02, $00, $FF, $FF, $05, $00, $05, $00, $04, $00, $04, $00, $06, $00, $06,
    $00, $01, $00, $01, $00, $01, $00, $05, $00, $05, $00, $00, $00, $02, $00,
    $01, $00, $04, $00, $04, $00, $07, $00, $03, $00, $05, $00, $05, $00, $06,
    $00, $00, $00, $05, $00, $03, $00, $00, $00, $04, $00, $02, $00, $04, $00,
    $0A, $00, $09, $00, $06, $00, $02, $00, $00, $00, $07, $00, $08, $00, $09,
    $00, $05, $00, $02, $00, $00, $00, $05, $00, $08, $00, $08, $00, $01, $00,
    $00, $00, $01, $00, $01, $00, $FE, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FC,
    $FF, $00, $00, $00, $00, $FF, $FF, $FD, $FF, $00, $00, $02, $00, $00, $00,
    $FD, $FF, $FF, $FF, $00, $00, $FE, $FF, $FC, $FF, $FA, $FF, $FB, $FF, $F9,
    $FF, $00, $00, $FB, $FF, $FC, $FF, $FF, $FF, $FA, $FF, $F6, $FF, $F6, $FF,
    $FC, $FF, $FC, $FF, $FD, $FF, $FA, $FF, $F9, $FF, $F9, $FF, $FE, $FF, $FD,
    $FF, $F8, $FF, $F6, $FF, $F7, $FF, $F8, $FF, $F5, $FF, $F7, $FF, $F5, $FF,
    $FD, $FF, $FB, $FF, $F9, $FF, $F6, $FF, $F8, $FF, $F9, $FF, $FE, $FF, $F9,
    $FF, $F9, $FF, $F7, $FF, $FA, $FF, $FC, $FF, $F9, $FF, $F5, $FF, $F3, $FF,
    $F2, $FF, $F2, $FF, $F6, $FF, $F5, $FF, $F6, $FF, $F9, $FF, $F8, $FF, $FB,
    $FF, $F7, $FF, $FC, $FF, $FC, $FF, $F8, $FF, $F8, $FF, $F7, $FF, $FC, $FF,
    $F8, $FF, $FC, $FF, $FD, $FF, $F8, $FF, $F9, $FF, $F5, $FF, $F6, $FF, $F9,
    $FF, $F8, $FF, $FB, $FF, $FA, $FF, $F5, $FF, $F7, $FF, $FB, $FF, $F9, $FF,
    $FA, $FF, $F5, $FF, $F9, $FF, $F8, $FF, $F8, $FF, $FC, $FF, $FE, $FF, $FA,
    $FF, $F9, $FF, $F7, $FF, $FC, $FF, $FB, $FF, $FA, $FF, $FF, $FF, $FE, $FF,
    $FF, $FF, $FD, $FF, $F8, $FF, $F8, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FC,
    $FF, $00, $00, $FB, $FF, $FD, $FF, $FF, $FF, $FF, $FF, $00, $00, $02, $00,
    $FE, $FF, $01, $00, $02, $00, $FF, $FF, $FF, $FF, $00, $00, $FE, $FF, $FF,
    $FF, $00, $00, $FD, $FF, $FC, $FF, $FB, $FF, $F9, $FF, $01, $00, $FD, $FF,
    $01, $00, $06, $00, $03, $00, $FB, $FF, $FF, $FF, $00, $00, $FF, $FF, $FA,
    $FF, $FA, $FF, $00, $00, $FC, $FF, $FC, $FF, $FF, $FF, $00, $00, $01, $00,
    $FE, $FF, $FD, $FF, $00, $00, $FC, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $02,
    $00, $01, $00, $FD, $FF, $02, $00, $00, $00, $03, $00, $03, $00, $03, $00,
    $00, $00, $FD, $FF, $FE, $FF, $00, $00, $00, $00, $00, $00, $FE, $FF, $03,
    $00, $00, $00, $FF, $FF, $FF, $FF, $03, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $02, $00, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $01, $00, $03, $00, $01, $00, $FF, $FF, $FF, $FF, $FF, $FF,
    $00, $00, $01, $00, $F9, $FF, $FA, $FF, $00, $00, $04, $00, $00, $00, $00,
    $00, $01, $00, $03, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF,
    $03, $00, $02, $00, $03, $00, $04, $00, $05, $00, $00, $00, $00, $00, $01,
    $00, $02, $00, $FD, $FF, $00, $00, $02, $00, $FF, $FF, $00, $00, $03, $00,
    $03, $00, $01, $00, $02, $00, $02, $00, $01, $00, $00, $00, $04, $00, $01,
    $00, $00, $00, $00, $00, $05, $00, $04, $00, $00, $00, $03, $00, $05, $00,
    $02, $00, $03, $00, $05, $00, $05, $00, $03, $00, $01, $00, $01, $00, $03,
    $00, $03, $00, $03, $00, $02, $00, $03, $00, $06, $00, $01, $00, $00, $00,
    $00, $00, $03, $00, $00, $00, $01, $00, $FF, $FF, $02, $00, $02, $00, $00,
    $00, $00, $00, $FE, $FF, $02, $00, $01, $00, $00, $00, $00, $00, $FE, $FF,
    $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $01,
    $00, $01, $00, $00, $00, $FE, $FF, $01, $00, $01, $00, $03, $00, $FF, $FF,
    $00, $00, $FB, $FF, $FB, $FF, $FC, $FF, $FE, $FF, $FC, $FF, $FE, $FF, $FE,
    $FF, $FC, $FF, $FC, $FF, $FD, $FF, $FC, $FF, $F9, $FF, $F9, $FF, $FA, $FF,
    $F6, $FF, $FA, $FF, $FB, $FF, $F7, $FF, $F6, $FF, $F3, $FF, $F8, $FF, $F9,
    $FF, $F9, $FF, $F6, $FF, $F9, $FF, $F8, $FF, $F9, $FF, $F9, $FF, $F8, $FF,
    $F8, $FF, $F6, $FF, $FA, $FF, $F9, $FF, $F5, $FF, $F7, $FF, $F9, $FF, $F8,
    $FF, $F7, $FF, $FA, $FF, $F7, $FF, $F5, $FF, $F3, $FF, $F6, $FF, $F5, $FF,
    $F6, $FF, $F7, $FF, $F7, $FF, $F6, $FF, $F7, $FF, $F3, $FF, $F7, $FF, $F5,
    $FF, $F7, $FF, $F8, $FF, $F9, $FF, $F8, $FF, $F5, $FF, $F7, $FF, $F7, $FF,
    $F9, $FF, $FA, $FF, $F5, $FF, $F6, $FF, $F7, $FF, $F6, $FF, $F9, $FF, $F2,
    $FF, $F8, $FF, $F9, $FF, $F8, $FF, $FB, $FF, $F6, $FF, $F6, $FF, $F9, $FF,
    $FA, $FF, $F9, $FF, $FA, $FF, $F7, $FF, $F7, $FF, $F9, $FF, $F9, $FF, $FD,
    $FF, $FD, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $00, $00, $FD, $FF,
    $FD, $FF, $FF, $FF, $FB, $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FB,
    $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FB, $FF,
    $FC, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $01, $00, $01, $00, $01,
    $00, $FF, $FF, $00, $00, $FC, $FF, $00, $00, $FF, $FF, $FE, $FF, $FE, $FF,
    $00, $00, $00, $00, $FF, $FF, $00, $00, $00, $00, $FD, $FF, $00, $00, $00,
    $00, $FD, $FF, $FC, $FF, $00, $00, $FD, $FF, $FF, $FF, $00, $00, $00, $00,
    $01, $00, $FD, $FF, $00, $00, $00, $00, $00, $00, $FE, $FF, $00, $00, $FE,
    $FF, $00, $00, $00, $00, $00, $00, $FD, $FF, $01, $00, $FD, $FF, $FE, $FF,
    $01, $00, $00, $00, $00, $00, $FF, $FF, $01, $00, $FE, $FF, $00, $00, $FE,
    $FF, $00, $00, $01, $00, $FF, $FF, $FF, $FF, $FE, $FF, $02, $00, $FD, $FF,
    $02, $00, $00, $00, $00, $00, $FF, $FF, $01, $00, $FD, $FF, $00, $00, $02,
    $00, $FD, $FF, $FF, $FF, $FC, $FF, $00, $00, $FF, $FF, $00, $00, $00, $00,
    $02, $00, $00, $00, $FE, $FF, $01, $00, $02, $00, $00, $00, $FF, $FF, $01,
    $00, $02, $00, $02, $00, $00, $00, $00, $00, $FF, $FF, $00, $00, $FF, $FF,
    $00, $00, $FE, $FF, $FB, $FF, $FE, $FF, $FD, $FF, $FB, $FF, $FD, $FF, $FF,
    $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FD, $FF, $00, $00,
    $FB, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FA, $FF, $FC, $FF, $FD, $FF, $00,
    $00, $FD, $FF, $FC, $FF, $FF, $FF, $FB, $FF, $FC, $FF, $FC, $FF, $FC, $FF,
    $FB, $FF, $FC, $FF, $FC, $FF, $FC, $FF, $FB, $FF, $FA, $FF, $FB, $FF, $F9,
    $FF, $FE, $FF, $FB, $FF, $FE, $FF, $FD, $FF, $FA, $FF, $FB, $FF, $FD, $FF,
    $FA, $FF, $FB, $FF, $F8, $FF, $F9, $FF, $FB, $FF, $FA, $FF, $FD, $FF, $FB,
    $FF, $FB, $FF, $FD, $FF, $FB, $FF, $FC, $FF, $FC, $FF, $F9, $FF, $FD, $FF,
    $FD, $FF, $FC, $FF, $FA, $FF, $FB, $FF, $FB, $FF, $FD, $FF, $FB, $FF, $FD,
    $FF, $F9, $FF, $FA, $FF, $FC, $FF, $FC, $FF, $F9, $FF, $F8, $FF, $FD, $FF,
    $F9, $FF, $FF, $FF, $FB, $FF, $FC, $FF, $FD, $FF, $F9, $FF, $FD, $FF, $F9,
    $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FA, $FF, $FC, $FF, $F8, $FF, $FD, $FF,
    $F8, $FF, $FF, $FF, $FB, $FF, $FB, $FF, $FD, $FF, $FB, $FF, $FC, $FF, $FC,
    $FF, $F9, $FF, $FD, $FF, $FC, $FF, $FD, $FF, $FA, $FF, $FB, $FF, $FC, $FF,
    $FC, $FF, $FB, $FF, $FC, $FF, $FD, $FF, $FA, $FF, $FF, $FF, $FE, $FF, $FD,
    $FF, $FA, $FF, $FE, $FF, $FC, $FF, $FC, $FF, $FE, $FF, $FD, $FF, $FE, $FF,
    $FD, $FF, $FB, $FF, $FD, $FF, $FE, $FF, $FD, $FF, $FD, $FF, $FC, $FF, $FE,
    $FF, $FF, $FF, $FD, $FF, $FC, $FF, $FB, $FF, $FC, $FF, $FC, $FF, $FE, $FF,
    $FD, $FF, $FA, $FF, $FF, $FF, $FD, $FF, $FB, $FF, $FC, $FF, $FC, $FF, $FD,
    $FF, $FC, $FF, $FD, $FF, $FA, $FF, $FC, $FF, $FD, $FF, $FE, $FF, $FC, $FF,
    $FD, $FF, $FD, $FF, $F9, $FF, $FE, $FF, $FC, $FF, $FB, $FF, $FC, $FF, $FB,
    $FF, $FB, $FF, $FF, $FF, $FE, $FF, $FB, $FF, $FE, $FF, $FE, $FF, $FA, $FF,
    $FE, $FF, $FC, $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FC, $FF, $FD, $FF, $FA,
    $FF, $FB, $FF, $FC, $FF, $FE, $FF, $FB, $FF, $FE, $FF, $FD, $FF, $FF, $FF,
    $FB, $FF, $FE, $FF, $FC, $FF, $FF, $FF, $00, $00, $FF, $FF, $00, $00, $FD,
    $FF, $FD, $FF, $FD, $FF, $FC, $FF, $FD, $FF, $FE, $FF, $FD, $FF, $FE, $FF,
    $FF, $FF, $FD, $FF, $FF, $FF, $00, $00, $FE, $FF, $FC, $FF, $FD, $FF, $00,
    $00, $00, $00, $FF, $FF, $00, $00, $01, $00, $FF, $FF, $FE, $FF, $FE, $FF,
    $FC, $FF, $FB, $FF, $FE, $FF, $FC, $FF, $00, $00, $00, $00, $00, $00, $FE,
    $FF, $00, $00, $FE, $FF, $01, $00, $00, $00, $FF, $FF, $FF, $FF, $FD, $FF,
    $00, $00, $FE, $FF, $00, $00, $FD, $FF, $00, $00, $FF, $FF, $00, $00, $FF,
    $FF, $FE, $FF, $FF, $FF, $00, $00, $FE, $FF, $01, $00, $FE, $FF, $FF, $FF,
    $00, $00, $00, $00, $FF, $FF, $00, $00, $FD, $FF, $00, $00, $00, $00, $FD,
    $FF, $FE, $FF, $00, $00, $FD, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FD, $FF,
    $FF, $FF, $00, $00, $FD, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF,
    $FF, $FE, $FF, $00, $00, $00, $00, $FF, $FF, $00, $00, $00, $00, $FF, $FF,
    $00, $00, $00, $00, $00, $00, $FD, $FF, $FF, $FF, $FF, $FF, $00, $00, $00,
    $00, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $FF, $FF, $00, $00, $00, $00,
    $FE, $FF, $00, $00, $00, $00, $FE, $FF, $01, $00, $FD, $FF, $01, $00, $FE,
    $FF, $01, $00, $FE, $FF, $FF, $FF, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FE, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $00, $00, $FF, $FF, $FF,
    $FF, $00, $00, $00, $00, $FF, $FF, $00, $00, $FE, $FF, $FF, $FF, $FE, $FF,
    $FF, $FF, $FE, $FF, $00, $00, $FD, $FF, $FD, $FF, $00, $00, $00, $00, $00,
    $00, $FF, $FF, $FE, $FF, $00, $00, $00, $00, $FF, $FF, $00, $00, $00, $00,
    $00, $00, $01, $00, $FF, $FF, $FC, $FF, $00, $00, $FB, $FF, $01, $00, $FE,
    $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FD, $FF,
    $00, $00, $FE, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FD,
    $FF, $FC, $FF, $FF, $FF, $FB, $FF, $FF, $FF, $FE, $FF, $00, $00, $FD, $FF,
    $FE, $FF, $FC, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FB, $FF, $00,
    $00, $FC, $FF, $FC, $FF, $FA, $FF, $FD, $FF, $FD, $FF, $FF, $FF, $FF, $FF,
    $FD, $FF, $FD, $FF, $FC, $FF, $FE, $FF, $FD, $FF, $FC, $FF, $FA, $FF, $FD,
    $FF, $FC, $FF, $FD, $FF, $FC, $FF, $FC, $FF, $00, $00, $FE, $FF, $FD, $FF,
    $FB, $FF, $FE, $FF, $FB, $FF, $FD, $FF, $FC, $FF, $FD, $FF, $00, $00, $FD,
    $FF, $00, $00, $FE, $FF, $00, $00, $FE, $FF, $FF, $FF, $FC, $FF, $FE, $FF,
    $FF, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $00, $00, $FD,
    $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FE, $FF, $00, $00, $FC, $FF, $FE, $FF,
    $FE, $FF, $FD, $FF, $00, $00, $FC, $FF, $FD, $FF, $FD, $FF, $FF, $FF, $FE,
    $FF, $FE, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $FD, $FF,
    $FD, $FF, $FD, $FF, $FC, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FC, $FF, $FE,
    $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FF, $FF,
    $FE, $FF, $FE, $FF, $FD, $FF, $FF, $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FF,
    $FF, $FC, $FF, $FD, $FF, $FF, $FF, $FC, $FF, $FF, $FF, $FC, $FF, $FE, $FF,
    $FE, $FF, $FF, $FF, $FC, $FF, $00, $00, $FA, $FF, $00, $00, $FE, $FF, $FE,
    $FF, $FF, $FF, $FE, $FF, $00, $00, $FC, $FF, $01, $00, $FE, $FF, $00, $00,
    $FD, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $00, $00, $00, $00, $FF, $FF, $FF,
    $FF, $00, $00, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FD, $FF,
    $FF, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FC, $FF, $FF, $FF, $FD,
    $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FD, $FF, $00, $00, $FF, $FF, $FD, $FF,
    $FF, $FF, $FB, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FD, $FF, $00,
    $00, $FF, $FF, $00, $00, $FE, $FF, $FE, $FF, $00, $00, $FC, $FF, $02, $00,
    $FC, $FF, $01, $00, $FD, $FF, $FD, $FF, $FF, $FF, $FF, $FF, $00, $00, $FC,
    $FF, $FF, $FF, $FF, $FF, $FD, $FF, $00, $00, $FE, $FF, $FC, $FF, $00, $00,
    $00, $00, $FD, $FF, $FF, $FF, $FC, $FF, $00, $00, $FB, $FF, $FE, $FF, $FD,
    $FF, $FD, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $00, $00, $FE, $FF,
    $FE, $FF, $FF, $FF, $FD, $FF, $FF, $FF, $FF, $FF, $FD, $FF, $00, $00, $FD,
    $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $00, $00, $FF, $FF, $FF, $FF,
    $FE, $FF, $FF, $FF, $00, $00, $00, $00, $FF, $FF, $FD, $FF, $00, $00, $FF,
    $FF, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $00, $00, $FF, $FF, $FE, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $FF, $FF, $FF, $FF, $FE, $FF, $01, $00, $00, $00, $00, $00, $FF, $FF,
    $FF, $FF, $01, $00, $FE, $FF, $00, $00, $FE, $FF, $00, $00, $00, $00, $FF,
    $FF, $00, $00, $FF, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $00, $00, $FE, $FF,
    $FF, $FF, $00, $00, $FF, $FF, $00, $00, $FF, $FF, $00, $00, $00, $00, $00,
    $00, $00, $00, $01, $00, $FF, $FF, $00, $00, $00, $00, $FF, $FF, $FE, $FF,
    $FF, $FF, $FE, $FF, $01, $00, $FF, $FF, $00, $00, $00, $00, $FF, $FF, $FF,
    $FF, $00, $00, $FF, $FF, $00, $00, $FF, $FF, $01, $00, $FD, $FF, $00, $00,
    $00, $00, $FF, $FF, $00, $00, $FF, $FF, $01, $00, $FD, $FF, $00, $00, $00,
    $00, $FE, $FF, $00, $00, $FF, $FF, $00, $00, $FF, $FF, $01, $00, $FD, $FF,
    $02, $00, $FE, $FF, $00, $00, $00, $00, $FF, $FF, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $FF, $FF, $00, $00, $00, $00, $FF, $FF, $00, $00,
    $FF, $FF, $FD, $FF, $00, $00, $FE, $FF, $00, $00, $FF, $FF, $01, $00, $FC,
    $FF, $01, $00, $FF, $FF, $00, $00, $FF, $FF, $00, $00, $00, $00, $FE, $FF,
    $00, $00, $FE, $FF, $00, $00, $FF, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FE,
    $FF, $00, $00, $FE, $FF, $00, $00, $FE, $FF, $00, $00, $FE, $FF, $00, $00,
    $FF, $FF, $FF, $FF, $FE, $FF, $00, $00, $FE, $FF, $FE, $FF, $00, $00, $FF,
    $FF, $FF, $FF, $FE, $FF, $FD, $FF, $00, $00, $FD, $FF, $FF, $FF, $FD, $FF,
    $00, $00, $FD, $FF, $00, $00, $FE, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FE,
    $FF, $FF, $FF, $FD, $FF, $FE, $FF, $00, $00, $FD, $FF, $FF, $FF, $FE, $FF,
    $FE, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $FF,
    $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FF, $FF,
    $FC, $FF, $FF, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $FF,
    $FF, $FC, $FF, $FF, $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FE, $FF,
    $FC, $FF, $00, $00, $FD, $FF, $FD, $FF, $FE, $FF, $FC, $FF, $FC, $FF, $FF,
    $FF, $FD, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FD, $FF, $FE, $FF, $FD, $FF,
    $FC, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FD,
    $FF, $FD, $FF, $FD, $FF, $FD, $FF, $FF, $FF, $FC, $FF, $FF, $FF, $FF, $FF,
    $FC, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FD, $FF, $FD,
    $FF, $FD, $FF, $FF, $FF, $FD, $FF, $00, $00, $FD, $FF, $FF, $FF, $FE, $FF,
    $FD, $FF, $FE, $FF, $FC, $FF, $FE, $FF, $FC, $FF, $FE, $FF, $FE, $FF, $FF,
    $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FC, $FF, $FE, $FF, $FF, $FF,
    $FD, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FC, $FF, $FF, $FF, $FD, $FF, $FF,
    $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FD, $FF,
    $FD, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FD, $FF, $FF, $FF, $FC,
    $FF, $FF, $FF, $FE, $FF, $FD, $FF, $FF, $FF, $FC, $FF, $00, $00, $FD, $FF,
    $FE, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FE,
    $FF, $FD, $FF, $FE, $FF, $FE, $FF, $FC, $FF, $FF, $FF, $FC, $FF, $FE, $FF,
    $FC, $FF, $FE, $FF, $FE, $FF, $FC, $FF, $FF, $FF, $FD, $FF, $FE, $FF, $FD,
    $FF, $FD, $FF, $FE, $FF, $FD, $FF, $FF, $FF, $FC, $FF, $FF, $FF, $FC, $FF,
    $FF, $FF, $FD, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FD, $FF, $FF,
    $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FD, $FF, $FE, $FF,
    $FE, $FF, $FD, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FD,
    $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FE, $FF, $FE, $FF,
    $FE, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FC, $FF, $00, $00, $FE, $FF, $FE,
    $FF, $FF, $FF, $FC, $FF, $FF, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FD, $FF,
    $FF, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $00, $00, $FD, $FF, $FF,
    $FF, $FF, $FF, $FD, $FF, $00, $00, $FD, $FF, $00, $00, $FE, $FF, $FF, $FF,
    $FE, $FF, $FF, $FF, $FD, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $00,
    $00, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FE, $FF,
    $00, $00, $FF, $FF, $FF, $FF, $00, $00, $FE, $FF, $00, $00, $FE, $FF, $FF,
    $FF, $FE, $FF, $FF, $FF, $FD, $FF, $00, $00, $FD, $FF, $FF, $FF, $FE, $FF,
    $FF, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FF,
    $FF, $FE, $FF, $FF, $FF, $FE, $FF, $00, $00, $FE, $FF, $00, $00, $FE, $FF,
    $00, $00, $FE, $FF, $00, $00, $FF, $FF, $00, $00, $FD, $FF, $00, $00, $FF,
    $FF, $FF, $FF, $FF, $FF, $00, $00, $FC, $FF, $00, $00, $FE, $FF, $FE, $FF,
    $00, $00, $FF, $FF, $FF, $FF, $00, $00, $FE, $FF, $FF, $FF, $FE, $FF, $00,
    $00, $FD, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,
    $FE, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FE,
    $FF, $00, $00, $FD, $FF, $00, $00, $FE, $FF, $FD, $FF, $00, $00, $FD, $FF,
    $FF, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FD, $FF, $FF,
    $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FD, $FF,
    $FF, $FF, $FD, $FF, $FF, $FF, $FD, $FF, $FF, $FF, $FD, $FF, $FE, $FF, $FF,
    $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF,
    $FE, $FF, $FE, $FF, $00, $00, $FE, $FF, $FE, $FF, $FD, $FF, $FF, $FF, $FC,
    $FF, $FF, $FF, $FD, $FF, $FF, $FF, $FD, $FF, $00, $00, $FD, $FF, $FE, $FF,
    $FE, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FD, $FF, $00, $00, $FC,
    $FF, $00, $00, $FC, $FF, $00, $00, $FE, $FF, $FE, $FF, $FF, $FF, $FD, $FF,
    $FF, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FD,
    $FF, $00, $00, $FD, $FF, $00, $00, $FE, $FF, $FF, $FF, $FD, $FF, $FE, $FF,
    $FE, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FD, $FF, $FF, $FF, $FD, $FF, $FE,
    $FF, $FE, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FD, $FF, $FF, $FF,
    $FE, $FF, $FD, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FF,
    $FF, $FD, $FF, $00, $00, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FD, $FF,
    $00, $00, $FC, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FD, $FF, $FE, $FF, $FF,
    $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE, $FF,
    $FF, $FF, $FD, $FF, $00, $00, $FE, $FF, $FE, $FF, $00, $00, $FE, $FF, $FE,
    $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $00, $00,
    $FD, $FF, $00, $00, $FE, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $FE,
    $FF, $FF, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FD, $FF, $00, $00,
    $FE, $FF, $FE, $FF, $FF, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FF,
    $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $00, $00,
    $FC, $FF, $00, $00, $FD, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FE,
    $FF, $00, $00, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FF, $FF,
    $FE, $FF, $00, $00, $FD, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FD, $FF, $00,
    $00, $FE, $FF, $FF, $FF, $FD, $FF, $00, $00, $FD, $FF, $FF, $FF, $FF, $FF,
    $FF, $FF, $FD, $FF, $00, $00, $FF, $FF, $FD, $FF, $FF, $FF, $FE, $FF, $FF,
    $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FE, $FF,
    $FE, $FF, $00, $00, $FD, $FF, $FF, $FF, $00, $00, $FC, $FF, $00, $00, $FE,
    $FF, $FE, $FF, $00, $00, $FE, $FF, $FF, $FF, $FD, $FF, $FE, $FF, $00, $00,
    $FD, $FF, $FE, $FF, $FE, $FF, $FF, $FF, $FE, $FF, $FF, $FF, $FD, $FF, $00,
    $00, $FE, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $FE, $FF, $00, $00, $FD, $FF,
    $00, $00, $FF, $FF, $FE, $FF, $FE, $FF, $FE, $FF, $00, $00, $FD, $FF, $00,
    $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FE, $FF, $00, $00, $FE, $FF,
    $FF, $FF, $FE, $FF, $FE, $FF, $00, $00, $FD, $FF, $FF, $FF, $FF, $FF, $FE,
    $FF, $00, $00, $FD, $FF, $FE, $FF, $00, $00
  );

procedure TDXViewerForm.StepSoundTimerExecute(Sender: TObject);
var
  cs: TCriticalSection;
begin
  cs := TCriticalSection.Create;
  try
    cs.Enter;
    if LastStepSoundAt < WalkDistance - vMaxPosition / 2 then
    begin
      if ((doFullScreen in DXDraw.Options) or (Notebook1.PageIndex = 1)) and
          (Sound1.Checked) and
          (Checknavigation1.Checked) and
          (Scene.CurrentSectorIndex > -1) then
        sndPlaySound(PChar(@StepSoundRawData), SND_MEMORY or SND_ASYNC or SND_NODEFAULT);
      LastStepSoundAt := WalkDistance;
    end;
  finally
    cs.Release;
    cs.Free;
  end;
end;

procedure TDXViewerForm.AccelerateTimerExecute(Sender: TObject);
var
  cs: TCriticalSection;
begin
  cs := TCriticalSection.Create;
  try
    cs.Enter;
    if abs(AcceleratingSpeed) < g_EPSILON then
    begin
      AccelerateTimer.Enabled := False;
    end
    else
    begin
      if vPosition > (vTarget - g_EPSILON) then
      begin
        vPosition := vTarget;
        AccelerateTimer.Enabled := False;
      end;
      vPosition := Min(vTarget, vPosition + AcceleratingSpeed * 100 / 1000 * vMaxPosition){ / breakseconds!!!};
    end;
  finally
    cs.Release;
    cs.Free;
  end;
end;

procedure TDXViewerForm.BreakTimerExecute(Sender: TObject);
var
  cs: TCriticalSection;
begin
  cs := TCriticalSection.Create;
  try
    cs.Enter;
    if abs(BreakingSpeed) < g_EPSILON then
    begin
      AccelerateTimer.Enabled := False; // ?
    end
    else
    begin
      if vPosition < (vTarget + g_EPSILON) then
      begin
        vPosition := vTarget;
        BreakTimer.Enabled := False;
      end;
      vPosition := Max(vTarget, vPosition - BreakingSpeed * 100 / 1000 * vMaxPosition);
    end;
  finally
    cs.Release;
    cs.Free;
  end;
end;

procedure TDXViewerForm.Renderthings1Click(Sender: TObject);
begin
  Renderthings1.Checked := not Renderthings1.Checked;
  AdjustThings;
end;

procedure TDXViewerForm.Sound1Click(Sender: TObject);
begin
  Sound1.Checked := not Sound1.Checked;
  ResumeSong;
end;

procedure TDXViewerForm.Checknavigation1Click(Sender: TObject);
begin
  CheckNavigation1.Checked := not CheckNavigation1.Checked;
  AdjustNavigation;
end;

procedure TDXViewerForm.AdjustNavigation;
var
  i: integer;
begin
  for i := 0 to Scene.CacheSectorCollections.Count - 1 do
  begin
    (Scene.CacheSectorCollections.Objects[i] as TD3DSectorCollection).Info2.CheckNavigation :=
      CheckNavigation1.Checked
  end;
  Scene.ForceRecalc;
end;

procedure TDXViewerForm.Options1Click(Sender: TObject);
begin
  Renderthings1.Enabled := doThings;
  Hardware1.Checked := doHardware in DXDraw.Options;
  SafeModerendering1.Enabled := Scene <> nil;
  if Scene <> nil then
    SafeModerendering1.Checked := Scene.SafeMode;
end;

procedure TDXViewerForm.SafeModerendering1Click(Sender: TObject);
begin
  SafeModerendering1.Checked := not SafeModerendering1.Checked;
  SetSafeMode(SafeModerendering1.Checked);
end;

// Θέτουμε το αν θα χρησιμοποιούμε Software ή Hardware &
// ρυθμίζουμε ανάλογα τα FullScreen1 & FullScreen2 και τα Hints τους
procedure TDXViewerForm.SetHardWare(flag: boolean; fStartup: boolean = False);
begin
  if not fStartup then DXDraw.Finalize;
  if flag then
    DXDraw.Options := DXDraw.Options + [doHardWare] - [doSystemMemory]
  else
    DXDraw.Options := DXDraw.Options - [doHardWare] + [doSystemMemory];
  if not fStartup then
  begin
    DXDraw.Initialize;
    Scene.ForceReCalc;
    Scene.ReInitialize;
  end;
end;

procedure TDXViewerForm.SetSafeMode(flag: boolean; fStartup: boolean = False);
begin
  Scene.SafeMode := flag;
  if flag then
  begin
    if doHardWare in DXDraw.Options then
    begin
      SetHardware(False, fStartUp);
      SetHardware(True, fStartUp);
    end;
  end
  else
  begin
    DXDraw.Finalize;
    DXDraw.Initialize;
  end;
end;

procedure TDXViewerForm.Hardware1Click(Sender: TObject);
begin
  Hardware1.Checked := not Hardware1.Checked;
  SetHardWare(Hardware1.Checked);
end;

procedure TDXViewerForm.ResumeSong;
begin
  if Sound1.Checked and (NoteBook1.PageIndex = 1) then
    DV_ResumeSong(hSong)
  else
    DV_PauseSong(hSong);
end;

procedure TDXViewerForm.PageControl1Change(Sender: TObject);
begin
  NoteBook1.PageIndex := PageControl1.ActivePageIndex;
  if NoteBook1.PageIndex = 1 then
    TryFocusControl(DXDraw);
  ResumeSong;
end;

procedure TDXViewerForm.DXDrawClick(Sender: TObject);
begin
  TryFocusControl(DXDraw);
end;

procedure TDXViewerForm.Notebook1Click(Sender: TObject);
begin
  TryFocusControl(Notebook1);
end;

procedure TDXViewerForm.ZoomIn2D;
var
  tmp: single;
begin
  tmp := fScale2D;
  if fScale2D < 25.0 then
    fScale2D := (fScale2D * 1.04);
  if fScale2D > 25.0 then
    fScale2D := 25.0;
  xShift := xShift * fScale2D / tmp;
  yShift := yShift * fScale2D / tmp;
  Make2DPreview;
end;

procedure TDXViewerForm.ZoomOut2D;
var
  tmp: single;
begin
  tmp := fScale2D;
  if fScale2D > 0.5 then
    fScale2D := (fScale2D / 1.04);
  if fScale2D < 0.5 then
    fScale2D := 0.5;
  xShift := xShift * fScale2D / tmp;
  yShift := yShift * fScale2D / tmp;
  Make2DPreview;
end;

procedure TDXViewerForm.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if NoteBook1.PageIndex = 0 then
  begin
    ZoomOut2D;
    Handled := True;
  end;
end;

procedure TDXViewerForm.FormMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if NoteBook1.PageIndex = 0 then
  begin
    ZoomIn2D;
    Handled := True;
  end;
end;

procedure TDXViewerForm.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    xShift := xShift + X - Image1.Width / 2;
    yShift := yShift + Y - Image1.Height / 2;
    Make2DPreview;
  end;
end;

procedure TDXViewerForm.Image1DblClick(Sender: TObject);
begin
  fScale2D := 1.0;
  xShift := 0.0;
  yShift := 0.0;
  Make2DPreview;
end;

procedure TDXViewerForm.Timer1Timer(Sender: TObject);
begin
  if NoteBook1.PageIndex = 0 then
  begin
    DXInput.Update;

    if (isButton3 in DXInput.States) then
      ZoomIn2D
    else if (isButton4 in DXInput.States) then
      ZoomOut2D;

    if (isUp in DXInput.States) then
    begin
      yShift := yShift - 5.0;
      Make2DPreview;
    end
    else if (isDown in DXInput.States) then
    begin
      yShift := yShift + 5.0;
      Make2DPreview;
    end;

    if (isLeft in DXInput.States) then
    begin
      xShift := xShift - 5.0;
      Make2DPreview;
    end
    else if (isRight in DXInput.States) then
    begin
      xShift := xShift + 5.0;
      Make2DPreview;
    end;
  end;
end;

procedure TDXViewerForm.DXTimerActivate(Sender: TObject);
begin
  ResumeSong;
end;

procedure TDXViewerForm.DXTimerDeactivate(Sender: TObject);
begin
  DV_PauseSong(hSong);
end;

procedure TDXViewerForm.ShowAnimations1Click(Sender: TObject);
begin
  ShowAnimations1.Checked := not ShowAnimations1.Checked;
end;

procedure TDXViewerForm.TextureFiltering1Click(Sender: TObject);
begin
  TextureFiltering1.Checked := not TextureFiltering1.Checked;
  doFiltering := TextureFiltering1.Checked;
  regTextureFiltering.Value := doFiltering;
end;

end.
