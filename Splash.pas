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
//  Splash Form
//
//------------------------------------------------------------------------------
//  E-Mail: jimmyvalavanis@yahoo.gr
//  New site: https://sourceforge.net/projects/doomviewer/
//  Old Site: http://www.geocities.ws/jimmyvalavanis/applications/doomviewer.html
//------------------------------------------------------------------------------

unit Splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TSplashForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    VersionLabel: TLabel;
    Label3: TLabel;
    Image2: TImage;
    SplashImage: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    counter: integer;
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.DFM}

procedure TSplashForm.FormCreate(Sender: TObject);
begin
  Update;
end;

procedure TSplashForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TSplashForm.FormShow(Sender: TObject);
begin
  counter := 20;
  Timer1.Enabled := true;
end;

procedure TSplashForm.Timer1Timer(Sender: TObject);
begin
  dec(counter);
  SplashImage.Visible := True;
  case counter of
    9:
      SplashImage.Picture.Bitmap.Assign(Image3.Picture.Bitmap);
    8:
      SplashImage.Picture.Bitmap.Assign(Image4.Picture.Bitmap);
    7:
      SplashImage.Picture.Bitmap.Assign(Image5.Picture.Bitmap);
    6:
      SplashImage.Picture.Bitmap.Assign(Image6.Picture.Bitmap);
    5:
      SplashImage.Picture.Bitmap.Assign(Image7.Picture.Bitmap);
  else
    begin
       SplashImage.Width := 0;
       SplashImage.Height := 0;
    end;
  end;
  SplashImage.Update;
  if counter < 0 then
  begin
    Timer1.Enabled := false;
    Close;
  end;
end;

end.

