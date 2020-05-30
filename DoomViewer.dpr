//------------------------------------------------------------------------------
//
//  DoomViewer: Map Viewer for the games Doom, Heretic, Hexen & Strife.
//  Copyright (C) 2004-2018 by Jim Valavanis
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
//  Main Programm
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//  New site: https://sourceforge.net/projects/doomviewer/
//  Old Site: http://www.geocities.ws/jimmyvalavanis/applications/doomviewer.html
//------------------------------------------------------------------------------

program DoomViewer;

uses
  FastMM4 in 'FASTMM\FastMM4.pas',
  FastMM4Messages in 'FASTMM\FastMM4Messages.pas',
  Forms,
  se_DirectX in 'ENGINE\se_DirectX.pas',
  se_DirectShow in 'ENGINE\se_DirectShow.pas',
  se_DirectSound in 'ENGINE\se_DirectSound.pas',
  se_DirectXGraphics in 'ENGINE\se_DirectXGraphics.pas',
  se_DXCommon in 'ENGINE\se_DXCommon.pas',
  se_DirectDraw in 'ENGINE\se_DirectDraw.pas',
  se_WindowsMedia in 'ENGINE\se_WindowsMedia.pas',
  se_WADS in 'ENGINE\se_WADS.pas',
  se_D3DUtils in 'ENGINE\se_D3DUtils.pas',
  se_DXRTLMediaPlayer in 'ENGINE\se_DXRTLMediaPlayer.pas',
  se_DirectShowStuff in 'ENGINE\se_DirectShowStuff.pas',
  se_DirectShowUtils in 'ENGINE\se_DirectShowUtils.pas',
  se_DXClasses in 'ENGINE\se_DXClasses.pas',
  se_DXDUtils in 'ENGINE\se_DXDUtils.pas',
  se_DXMeshes in 'ENGINE\se_DXMeshes.pas',
  se_DXTables in 'ENGINE\se_DXTables.pas',
  se_DXDraws in 'ENGINE\se_DXDraws.pas',
  se_DXClass in 'ENGINE\se_DXClass.pas',
  se_DXConsts in 'ENGINE\se_DXConsts.pas',
  se_DXTexImg in 'ENGINE\se_DXTexImg.pas',
  se_DXRender in 'ENGINE\se_DXRender.pas',
  se_DXInput in 'ENGINE\se_DXInput.pas',
  se_DXTextureEffects in 'ENGINE\se_DXTextureEffects.pas',
  se_Main in 'ENGINE\se_Main.pas',
  se_MyD3DUtils in 'ENGINE\se_MyD3DUtils.pas',
  se_TempDXDraw in 'ENGINE\se_TempDXDraw.pas' {TempDXDrawForm},
  se_ZipFile in 'ENGINE\se_ZipFile.pas',
  se_Utils in 'ENGINE\se_Utils.pas',
  se_IDSoftData in 'ENGINE\se_IDSoftData.pas',
  se_DoomTypes in 'ENGINE\se_DoomTypes.pas',
  se_DoomUtils in 'ENGINE\se_DoomUtils.pas',
  se_DoomScriptEngine in 'ENGINE\se_DoomScriptEngine.pas',
  se_DoomThings in 'ENGINE\se_DoomThings.pas',
  se_HereticThings in 'ENGINE\se_HereticThings.pas',
  se_HexenThings in 'ENGINE\se_HexenThings.pas',
  se_StrifeThings in 'ENGINE\se_StrifeThings.pas',
  se_IDWADThingsCommon in 'ENGINE\se_IDWADThingsCommon.pas',
  se_DXSounds in 'ENGINE\se_DXSounds.pas',
  se_Wave in 'ENGINE\se_Wave.pas',
  se_RTLCompileParams in 'ENGINE\se_RTLCompileParams.pas',
  zBitmap in 'IMAGEFORMATS\zBitmap.pas',
  pcximage in 'IMAGEFORMATS\pcximage.pas',
  pngimage in 'IMAGEFORMATS\pngimage.pas',
  pnglang in 'IMAGEFORMATS\pnglang.pas',
  xGif in 'IMAGEFORMATS\xGIF.pas',
  xM8 in 'IMAGEFORMATS\xM8.pas',
  xPPM in 'IMAGEFORMATS\xPPM.pas',
  xStubGraphic in 'IMAGEFORMATS\xStubGraphic.pas',
  dibimage in 'IMAGEFORMATS\dibimage.pas',
  xTGA in 'IMAGEFORMATS\xTGA.pas',
  xWZ in 'IMAGEFORMATS\xWZ.pas',
  XPMenu in 'LIBRARY\XPMenu.pas',
  About in 'LIBRARY\About.pas' {AboutBox},
  Aboutdlg in 'LIBRARY\Aboutdlg.pas',
  AnotherReg in 'LIBRARY\AnotherReg.pas',
  binarydata in 'LIBRARY\binarydata.pas',
  DropDownButton in 'LIBRARY\DropDownButton.pas',
  MessageBox in 'LIBRARY\MessageBox.pas',
  rmBaseEdit in 'LIBRARY\rmBaseEdit.pas',
  rmBtnEdit in 'LIBRARY\rmBtnEdit.pas',
  rmLibrary in 'LIBRARY\rmLibrary.pas',
  rmSpeedBtns in 'LIBRARY\rmSpeedBtns.pas',
  smoothshow in 'LIBRARY\smoothshow.pas',
  zlibpas in 'ZLIB\zlibpas.pas',
  Unit1 in 'DOOMVIEWER\Unit1.pas' {DXViewerForm},
  QuickInfoFrm in 'DOOMVIEWER\QuickInfoFrm.pas' {QuickInfoForm},
  Splash in 'DOOMVIEWER\Splash.pas' {SplashForm},
  OpenDoomMapFrm in 'DOOMVIEWER\OpenDoomMapFrm.pas' {OpenDoomMapForm},
  dv_music in 'DOOMVIEWER\dv_music.pas',
  dv_argv in 'DOOMVIEWER\dv_argv.pas',
  dv_io in 'DOOMVIEWER\dv_io.pas',
  dv_delphi in 'DOOMVIEWER\dv_delphi.pas',
  dv_globals in 'DOOMVIEWER\dv_globals.pas',
  se_Crc32 in 'ENGINE\se_Crc32.pas',
  se_Midi in 'ENGINE\se_Midi.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'DoomViewer';
  Application.CreateForm(TDXViewerForm, DXViewerForm);
  Application.Run;
end.
