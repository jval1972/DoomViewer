unit se_DirectShowUtils;

interface

uses
  Windows, Messages, Graphics, ActiveX, Sysutils, se_DirectShow, MMSystem,
  se_DirectSound, Controls, classes;

const
  WM_GRAPHNOTIFY = WM_APP + 1;      // Filter Graph Event
  IID_IPropertyBag          : TGUID = '{55272A00-42CB-11CE-8135-00AA004BB851}';
  IID_ISpecifyPropertyPages : TGUID = '{B196B28B-BAB4-101A-B69C-00AA00341D07}';
  MEDIASUBTYPE_MP42         : TGUID = '{3234504D-0000-0010-8000-00AA00389B71}'; // MS Mepg4 DMO
  MEDIASUBTYPE_DIVX         : TGUID = '{58564944-0000-0010-8000-00AA00389B71}'; // DIVX
  MEDIASUBTYPE_VOXWARE      : TGUID = '{00000075-0000-0010-8000-00AA00389B71}'; // VoxWare MetaSound
  IID_IPersistStream        : TGUID = '{00000109-0000-0000-C000-000000000046}';
  IID_IMoniker              : TGUID = '{0000000F-0000-0000-C000-000000000046}';
  
type
  TOverlayColor = record
    case integer of
      0:(low   : cardinal;
         hight : cardinal);
      1:(color : TColor);
    end;

  TFilePath =  array[0..MAX_PATH] of WChar;

// User OPerationS
  TDSUOPSFlag = (
    SelectVideoModePreference,
    PlayTitleOrAtTime,
    PlayChapter,
    PlayTitle,
    Stop,
    ReturnFromSubMenu,
    PlayChapterOrAtTime,
    PlayPrevOrReplayChapter,
    PlayNextChapter,
    PlayForwards,
    PlayBackwards,
    ShowMenuTitle,
    ShowMenuRoot,
    ShowMenuSubPic,
    ShowMenuAudio,
    ShowMenuAngle,
    ShowMenuChapter,
    CanResume,
    SelectOrActivateButton,
    CanStillOff,
    CanPauseOn,
    SelectAudioStream,
    SelectSubPicStream,
    SelectAngle,
    SelectKaraokeAudioPresentationMode

  );

  TDSUOPSKind = set of TDSUOPSFlag;

  TUOPS =  record
    TitlePlay                         : boolean; //2   Finds the media file with the specified title index and plays it back.
    ChapterPlay                       : boolean; //1   Plays the media file with the specified title index and chapter value.
    TimePlay                          : boolean; //0   Plays the media file with the specified title index, starting at the specified time.
    StopForResume                     : boolean; //3   Transitions playback to the DVD_DOMAIN_Stop state after saving resume information.
    GoUp                              : boolean; //4   Halts playback of the current media file and starts playback of the designated previous program chain (PGC).
    TimeSearch                        : boolean; //0,5 Halts playback of the current chapter and starts playback from the specified time in the same media file.
    ChapterSearch                     : boolean; //1,5 Halts playback of the current chapter and starts playback from the specified chapter value in the same media file.
    PrevPGSearch                      : boolean; //6   Halts playback of the current program and starts playback from the previous program within the program chain (PGC).
    TopPGSearch                       : boolean; //6   Halts playback of the current program and restarts playback of the current program within the program chain (PGC).
    NextPGSearch                      : boolean; //7   Halts playback of the current program and starts playback from the next program within the program chain (PGC).
    ForwardScan                       : boolean; //8   Search forward through the current disc at the specified speed.
    BackwardScan                      : boolean; //9   Search backward through the current disc at the specified speed.
    MenuCall_Title_Menu               : boolean; //10  Displays the specified menu on the screen.
    MenuCall_Root_Menu                : boolean; //11
    MenuCall_Sub_picture_Menu         : boolean; //12
    MenuCall_Audio_Menu               : boolean; //13
    MenuCall_Angle_Menu               : boolean; //14
    MenuCall_Chapter_Menu             : boolean; //15
    Resume                            : boolean; //16  Returns to playing back a title from a menu.
    UpperButtonSelect                 : boolean; //17  Selects the upper directional button from the displayed menu.
    LowerButtonSelect                 : boolean; //17  Selects the lower directional button from the displayed menu.
    LeftButtonSelect                  : boolean; //17  Selects the left directional button from the displayed menu.
    RightButtonSelect                 : boolean; //17  Selects the right directional button from the displayed menu.
    ButtonActivate                    : boolean; //17  Activates the selected button.
    ButtonSelectAndActivate           : boolean; //17  Selects and activates the specified button.
    StillOff                          : boolean; //18  Resumes playback, cancelling still mode.
    PauseOn                           : boolean; //19  Pauses the current media file playback.
    PauseOff                          : boolean; //19  Unpauses the current media file playback.
    AudioStreamChange                 : boolean; //20  Sets the current audio stream.
    SubpictureStreamChange            : boolean; //21  Enables or disables picture-in-picture mode and sets the subpicture to the specified source.
    AngleChange                       : boolean; //22  Sets the new display angle.
    KaraokeAudioPresentationModeChange: boolean; //23  Sets the audio playback mode to karaoke.
    VideoModePreferrence              : boolean; //24  Sets the video display mode the user prefers.
  end;

  TDSAMSeeking = (
    CanSeekAbsolute,
    CanSeekForwards,
    CanSeekBackwards,
    CanGetCurrentPos,
    CanGetStopPos,
    CanGetDuration,
    CanPlayBackwards,
    CanDoSegments,
    Source
  );
  TDSAMSeekingKind = set of TDSAMSeeking;

  function FileToPath(FileName: string): TFilePath;
  function GetEventCodeDef(code: longint): string;
  function IntToBin(Value: LongInt; Digits: Integer): String;
  function IntToUOPS(value : longint):TUOPS;
  function IntToTimeCode(x : longint): TDVD_TimeCode;
  function BinToInt(Value: String): LongInt;
  function TimeCodeToFrames(value : TDVD_TimeCode): ULONG;
  function ShowFilterPropertyPage(parent: TWinControl; Filter: IBaseFilter): HRESULT;
  function ShowPinPropertyPage(parent: TWinControl; Pin: IPin): HRESULT;
  function AddGraphToRot(Graph: IFilterGraph; out dwRegister: Longint): HRESULT;
  function RemoveGraphFromRot(dwRegister: longint): HRESULT;
  function GetErrorString(hr: HRESULT): string;
  function GetFOURCC(FOURCC: DWORD): string;
  function GetMediaTypeDescription(MediaType: TAM_Media_Type): string;

  // General purpose functions to copy and delete a task allocated AM_MEDIA_TYPE
  // structure which is useful when using the IEnumMediaFormats interface as
  // the implementation allocates the structures which you must later delete
  procedure DeleteMediaType(pmt: PAM_MEDIA_TYPE);
  function  CreateMediaType(pSrc: PAM_MEDIA_TYPE): PAM_MEDIA_TYPE;
  procedure CopyMediaType(pmtTarget: PAM_MEDIA_TYPE; pmtSource: PAM_MEDIA_TYPE);
  procedure FreeMediaType(mt: PAM_MEDIA_TYPE);

  //  Initialize a media type from a WAVEFORMATEX
  function CreateAudioMediaType(pwfx: PWaveFormatEx; pmt: PAM_MEDIA_TYPE; bSetFormat: boolean): HRESULT;
  function FOURCCMap(Fourcc: DWORD): TGUID;

  procedure FreeAndNil(var Obj); // Delphi4 compatibility
  function MAKEFOURCC(ch0, ch1, ch2, ch3: char): DWORD;

  function PersistToHex(obj: IPersistStream): string;
  function HexToPersist(str: String; GUID: TGUID): IPersistStream;
  
implementation

  function  FileToPath(FileName: string): TFilePath;
  begin
    MultiByteToWideChar(CP_ACP,0,Pchar(FileName),-1,Result,Sizeof(Result) div sizeof(Result[0]));
  end;

  function  GetEventCodeDef(code: longint): string;
  begin
    case code of
      EC_ACTIVATE                  : Result:= 'EC_ACTIVATE - A video window is being activated or deactivated.';
      EC_BUFFERING_DATA            : Result:= 'EC_BUFFERING_DATA - The graph is buffering data, or has stopped buffering data.';
      EC_CLOCK_CHANGED             : Result:= 'EC_CLOCK_CHANGED - The reference clock has changed.';
      EC_COMPLETE                  : Result:= 'EC_COMPLETE - All data from a particular stream has been rendered.';
      EC_DEVICE_LOST               : Result:= 'EC_DEVICE_LOST - A Plug and Play device was removed or has become available again.';
      EC_DISPLAY_CHANGED           : Result:= 'EC_DISPLAY_CHANGED - The display mode has changed.';
      EC_END_OF_SEGMENT            : Result:= 'EC_END_OF_SEGMENT - The end of a segment has been reached.';
      EC_ERROR_STILLPLAYING        : Result:= 'EC_ERROR_STILLPLAYING - An asynchronous command to run the graph has failed.';
      EC_ERRORABORT                : Result:= 'EC_ERRORABORT - An operation was aborted because of an error.';
      EC_FULLSCREEN_LOST           : Result:= 'EC_FULLSCREEN_LOST - The video renderer is switching out of full-screen mode.';
      EC_GRAPH_CHANGED             : Result:= 'EC_GRAPH_CHANGED - The filter graph has changed.';
      EC_NEED_RESTART              : Result:= 'EC_NEED_RESTART - A filter is requesting that the graph be restarted.';
      EC_NOTIFY_WINDOW             : Result:= 'EC_NOTIFY_WINDOW - Notifies a filter of the video renderer''s window.';
      EC_OLE_EVENT                 : Result:= 'EC_OLE_EVENT - A filter is passing a text string to the application.';
      EC_OPENING_FILE              : Result:= 'EC_OPENING_FILE - The graph is opening a file, or has finished opening a file.';
      EC_PALETTE_CHANGED           : Result:= 'EC_PALETTE_CHANGED - The video palette has changed.';
      EC_PAUSED                    : Result:= 'EC_PAUSED - A pause request has completed.';
      EC_QUALITY_CHANGE            : Result:= 'EC_QUALITY_CHANGE - The graph is dropping samples, for quality control.';
      EC_REPAINT                   : Result:= 'EC_REPAINT - A video renderer requires a repaint.';
      EC_SEGMENT_STARTED           : Result:= 'EC_SEGMENT_STARTED - A new segment has started.';
      EC_SHUTTING_DOWN             : Result:= 'EC_SHUTTING_DOWN - The filter graph is shutting down, prior to being destroyed.';
      EC_SNDDEV_IN_ERROR           : Result:= 'EC_SNDDEV_IN_ERROR - An audio device error has occurred on an input pin.';
      EC_SNDDEV_OUT_ERROR          : Result:= 'EC_SNDDEV_OUT_ERROR - An audio device error has occurred on an output pin.';
      EC_STARVATION                : Result:= 'EC_STARVATION - A filter is not receiving enough data.';
      EC_STEP_COMPLETE             : Result:= 'EC_STEP_COMPLETE - A filter performing frame stepping has stepped the specified number of frames.';
      EC_STREAM_CONTROL_STARTED    : Result:= 'EC_STREAM_CONTROL_STARTED - A stream-control start command has taken effect.';
      EC_STREAM_CONTROL_STOPPED    : Result:= 'EC_STREAM_CONTROL_STOPPED - A stream-control start command has taken effect.';
      EC_STREAM_ERROR_STILLPLAYING : Result:= 'EC_STREAM_ERROR_STILLPLAYING - An error has occurred in a stream. The stream is still playing.';
      EC_STREAM_ERROR_STOPPED      : Result:= 'EC_STREAM_ERROR_STOPPED - A stream has stopped because of an error.';
      EC_USERABORT                 : Result:= 'EC_USERABORT - The user has terminated playback.';
      EC_VIDEO_SIZE_CHANGED        : Result:= 'EC_VIDEO_SIZE_CHANGED - The native video size has changed.';
      EC_WINDOW_DESTROYED          : Result:= 'EC_WINDOW_DESTROYED - The video renderer was destroyed or removed from the graph.';
      EC_TIMECODE_AVAILABLE        : Result:= 'EC_TIMECODE_AVAILABLE- Sent by filter supporting timecode';
      EC_EXTDEVICE_MODE_CHANGE     : Result:= 'EC_EXTDEVICE_MODE_CHANGE - Sent by filter supporting IAMExtDevice';
      EC_CLOCK_UNSET               : Result:= 'EC_CLOCK_UNSET - notify the filter graph to unset the current graph clock';
      EC_TIME                      : Result:= 'EC_TIME - The requested reference time occurred (currently not used)';

      EC_DVD_ANGLE_CHANGE              : Result:= 'EC_DVD_ANGLE_CHANGE - Signals that either the number of available angles changed or that the current angle number changed.';
      EC_DVD_ANGLES_AVAILABLE          : Result:= 'EC_DVD_ANGLES_AVAILABLE - Indicates whether an angle block is being played and angle changes can be performed.';
      EC_DVD_AUDIO_STREAM_CHANGE       : Result:= 'EC_DVD_AUDIO_STREAM_CHANGE - Signals that the current audio stream number changed for the main title.';
      EC_DVD_BUTTON_AUTO_ACTIVATED     : Result:= 'EC_DVD_BUTTON_AUTO_ACTIVATED - Signals that a menu button has been automatically activated per instructions on the disc.';
      EC_DVD_BUTTON_CHANGE             : Result:= 'EC_DVD_BUTTON_CHANGE - Signals that either the number of available buttons changed or that the currently selected button number changed.';
      EC_DVD_CHAPTER_AUTOSTOP          : Result:= 'EC_DVD_CHAPTER_AUTOSTOP - Indicates that playback stopped as the Result of a call to the IDvdControl2::PlayChaptersAutoStop method.';
      EC_DVD_CHAPTER_START             : Result:= 'EC_DVD_CHAPTER_START - Signals that the DVD Navigator started playback of a new chapter in the current title.';
      EC_DVD_CMD_START                 : Result:= 'EC_DVD_CMD_START - Signals that a particular command has begun.';
      EC_DVD_CMD_END                   : Result:= 'EC_DVD_CMD_END - Signals that a particular command has completed.';
      EC_DVD_CURRENT_HMSF_TIME         : Result:= 'EC_DVD_CURRENT_HMSF_TIME - Signals the current time in DVD_HMSF_TIMECODE format at the beginning of every VOBU, which occurs every .4 to 1.0 sec.';
      EC_DVD_CURRENT_TIME              : Result:= 'EC_DVD_CURRENT_TIME - Signals the beginning of every video object unit (VOBU), a video segment which is 0.4 to 1.0 seconds in length.';
      EC_DVD_DISC_EJECTED              : Result:= 'EC_DVD_DISC_EJECTED - Signals that a disc has been ejected from the drive.';
      EC_DVD_DISC_INSERTED             : Result:= 'EC_DVD_DISC_INSERTED - Signals that a disc has been inserted into the drive.';
      EC_DVD_DOMAIN_CHANGE             : Result:= 'EC_DVD_DOMAIN_CHANGE - Indicates the DVD Navigator''s new domain.';
      EC_DVD_ERROR                     : Result:= 'EC_DVD_ERROR - Signals a DVD error condition.';
      EC_DVD_KARAOKE_MODE              : Result:= 'EC_DVD_KARAOKE_MODE - Indicates that the Navigator has either begun playing or finished playing karaoke data.';
      EC_DVD_NO_FP_PGC                 : Result:= 'EC_DVD_NO_FP_PGC - Indicates that the DVD disc does not have a FP_PGC (First Play Program Chain).';
      EC_DVD_PARENTAL_LEVEL_CHANGE     : Result:= 'EC_DVD_PARENTAL_LEVEL_CHANGE - Signals that the parental level of the authored content is about to change.';
      EC_DVD_PLAYBACK_RATE_CHANGE      : Result:= 'EC_DVD_PLAYBACK_RATE_CHANGE - Indicates that a playback rate change has been initiated and the new rate is in the parameter.';
      EC_DVD_PLAYBACK_STOPPED          : Result:= 'EC_DVD_PLAYBACK_STOPPED - Indicates that playback has been stopped. The DVD Navigator has completed playback of the title and did not find any other branching instruction for subsequent playback.';
      EC_DVD_PLAYPERIOD_AUTOSTOP       : Result:= 'EC_DVD_PLAYPERIOD_AUTOSTOP - Indicates that the Navigator has finished playing the segment specified in a call to PlayPeriodInTitleAutoStop.';
      EC_DVD_STILL_OFF                 : Result:= 'EC_DVD_STILL_OFF - Signals the end of any still.';
      EC_DVD_STILL_ON                  : Result:= 'EC_DVD_STILL_ON - Signals the beginning of any still.';
      EC_DVD_SUBPICTURE_STREAM_CHANGE  : Result:= 'EC_DVD_SUBPICTURE_STREAM_CHANGE - Signals that the current subpicture stream number changed for the main title.';
      EC_DVD_TITLE_CHANGE              : Result:= 'EC_DVD_TITLE_CHANGE - Indicates when the current title number changes.';
      EC_DVD_VALID_UOPS_CHANGE         : Result:= 'EC_DVD_VALID_UOPS_CHANGE - Signals that the available set of IDVDControl2 interface methods has changed.';
      EC_DVD_WARNING                   : Result:= 'EC_DVD_WARNING - Signals a DVD warning condition.'
    else
      Result := 'Unknow Graph Event!';
    end;
  end;

  function IntToBin(Value: LongInt; Digits: Integer): String;
  var
   i: Integer;
  begin
   Result:='';
   for i:=Digits downto 0 do
    if Value and (1 shl i)<>0 then
     Result:=Result + '1'
    else
     Result:=Result + '0';
  end;

   function IntToUOPS(value : longint):TUOPS;
  var temp : string;
  begin
    temp := inttobin(value,24);
  with Result do
  begin
     TitlePlay                          := (copy(temp,3,1)='1'); //2
     ChapterPlay                        := (copy(temp,2,1)='1'); //1
     TimePlay                           := (copy(temp,1,1)='1'); //0
     StopForResume                      := (copy(temp,4,1)='1'); //3
     GoUp                               := (copy(temp,5,1)='1'); //4
     TimeSearch                         := (copy(temp,1,1)='1')and(copy(temp,6,1)='1'); //0,5
     ChapterSearch                      := (copy(temp,2,1)='1')and(copy(temp,6,1)='1'); //1,5
     PrevPGSearch                       := (copy(temp,7,1)='1'); //6
     TopPGSearch                        := (copy(temp,7,1)='1'); //6
     NextPGSearch                       := (copy(temp,8,1)='1'); //7
     ForwardScan                        := (copy(temp,9,1)='1'); //8
     BackwardScan                       := (copy(temp,10,1)='1'); //9
     MenuCall_Title_Menu                := (copy(temp,11,1)='1'); //10
     MenuCall_Root_Menu                 := (copy(temp,12,1)='1'); //11
     MenuCall_Sub_picture_Menu          := (copy(temp,13,1)='1'); //12
     MenuCall_Audio_Menu                := (copy(temp,14,1)='1'); //13
     MenuCall_Angle_Menu                := (copy(temp,15,1)='1'); //14
     MenuCall_Chapter_Menu              := (copy(temp,16,1)='1'); //15
     Resume                             := (copy(temp,17,1)='1'); //16
     UpperButtonSelect                  := (copy(temp,18,1)='1'); //17
     LowerButtonSelect                  := (copy(temp,18,1)='1'); //17
     LeftButtonSelect                   := (copy(temp,18,1)='1'); //17
     RightButtonSelect                  := (copy(temp,18,1)='1'); //17
     ButtonActivate                     := (copy(temp,18,1)='1'); //17
     ButtonSelectAndActivate            := (copy(temp,18,1)='1'); //17
     StillOff                           := (copy(temp,19,1)='1'); //18
     PauseOn                            := (copy(temp,20,1)='1'); //19
     PauseOff                           := (copy(temp,20,1)='1'); //19
     AudioStreamChange                  := (copy(temp,21,1)='1'); //20
     SubpictureStreamChange             := (copy(temp,22,1)='1'); //21
     AngleChange                        := (copy(temp,23,1)='1'); //22
     KaraokeAudioPresentationModeChange := (copy(temp,24,1)='1'); //23
     VideoModePreferrence               := (copy(temp,25,1)='1'); //24
  end;
  end;

  function IntToTimeCode(x : longint): TDVD_TimeCode;
  var
     tc : TDVD_TimeCode;
     str: string;
  begin
    str := IntToBin(x,31);
    tc.Hours1        := bintoint(copy(str,29,4));
    tc.Hours10       := bintoint(copy(str,25,4));
    tc.Minutes1      := bintoint(copy(str,21,4));
    tc.Minutes10     := bintoint(copy(str,17,4));
    tc.Seconds1      := bintoint(copy(str,13,4));
    tc.Seconds10     := bintoint(copy(str,9,4));
    tc.Frames1       := bintoint(copy(str,5,4));
    tc.Frames10      := bintoint(copy(str,3,2));
    tc.FrameRateCode := bintoint(copy(str,1,2));
    Result := tc;
end;

  function BinToInt(Value: String): LongInt;
  var
     i,Digits: Integer;
     p : array[0..3]of integer;
  begin
     Result:=0;
     p[0]:=1;p[1]:=2;p[2]:=4;p[3]:=8;
     Digits:=Length(Value);
     for i := 1 to digits do
       begin
         if copy(value,i,1) = '1' then Result := Result+p[digits-i];
       end;
  end;

  function TimeCodeToFrames(value : TDVD_TimeCode): ULONG;
  var
    frate : ULONG;
  begin
    case value.FrameRateCode of
      1 : frate := 25;
      3 : frate := 30;
    else
      frate := 0;
    end;
    Result := ((value.Hours1+value.Hours10*10)*3600   +
               (value.Minutes1+value.Minutes10*10)*60 +
                value.Seconds1+value.Seconds10*10)*
                frate+value.Frames1+value.Frames10*10;
  end;

  function ShowFilterPropertyPage(parent: TWinControl; Filter: IBaseFilter): HRESULT;
  var
    SpecifyPropertyPages : ISpecifyPropertyPages;
    CAGUID  :TCAGUID;
    FilterInfo: TFilterInfo;
  begin
    Result := S_FALSE;
    if Filter = nil then Exit;
    Result := Filter.QueryInterface(IID_ISpecifyPropertyPages, SpecifyPropertyPages);
    if Result <> S_OK then Exit;
    Result := SpecifyPropertyPages.GetPages(CAGUID);
    if Result <> S_OK then Exit;
    Result := Filter.QueryFilterInfo(FilterInfo);
    if Result <> S_OK then Exit;
    if parent <> nil then
      Result := OleCreatePropertyFrame(parent.Handle, 0, 0, FilterInfo.achName, 1, @Filter, CAGUID.cElems, CAGUID.pElems, 0, 0, nil )
    else
      Result := OleCreatePropertyFrame(0, 0, 0, FilterInfo.achName, 1, @Filter, CAGUID.cElems, CAGUID.pElems, 0, 0, nil );
  end;

  function ShowPinPropertyPage(parent: TWinControl; Pin: IPin): HRESULT;
  var
    SpecifyPropertyPages: ISpecifyPropertyPages;
    CAGUID :TCAGUID;
    PinInfo: TPin_Info;
  begin
    Result := S_FALSE;
    if Pin = nil then Exit;
    Result := Pin.QueryInterface(IID_ISpecifyPropertyPages, SpecifyPropertyPages);
    if Result <> S_OK then Exit;
    Result := SpecifyPropertyPages.GetPages(CAGUID);
    if Result <> S_OK then Exit;
    Result := Pin.QueryPinInfo(PinInfo);
    if Result <> S_OK then Exit;
    if parent <> nil then
      Result := OleCreatePropertyFrame(parent.Handle, 0, 0, PinInfo.achName, 1, @Pin, CAGUID.cElems, CAGUID.pElems, 0, 0, nil )
    else
      Result := OleCreatePropertyFrame(0, 0, 0, PinInfo.achName, 1, @Pin, CAGUID.cElems, CAGUID.pElems, 0, 0, nil );
  end;

  //----------------------------------------------------------------------------
  // Enable Graphedit to connect with your filter graph
  //----------------------------------------------------------------------------
  function AddGraphToRot(Graph: IFilterGraph; out dwRegister: Longint): HRESULT;
  var
    Moniker: IMoniker;
    ROT    : IRunningObjectTable;
    wsz    : string[255];
  begin
    Result := GetRunningObjectTable(0, ROT);
    if (Result <> S_OK) then Exit;
    wsz := format('FilterGraph %p pid %x',[pointer(graph),GetCurrentProcessId()]);
    Result  := CreateItemMoniker('!', StringToOleStr(wsz), Moniker);
    if (Result <> S_OK) then Exit;
    Result  := ROT.Register(0, Graph, Moniker, dwRegister);
  end;

  //----------------------------------------------------------------------------
  // Disable Graphedit to connect with your filter graph
  //----------------------------------------------------------------------------
  function RemoveGraphFromRot(dwRegister: longint): HRESULT;
  var ROT: IRunningObjectTable;
  begin
    Result := GetRunningObjectTable(0, ROT);
    if (Result <> S_OK) then Exit;
    Result := ROT.Revoke(dwRegister);
  end;

  function GetErrorString(hr: HRESULT): string;
  var buffer: array[0..254] of char;
  begin
    AMGetErrorTextA(hr,@buffer,255);
    Result := buffer;
  end;

  // general purpose function to delete a heap allocated AM_MEDIA_TYPE structure
  // which is useful when calling IEnumMediaTypes::Next as the interface
  // implementation allocates the structures which you must later delete
  // the format block may also be a pointer to an interface to release
  procedure DeleteMediaType(pmt: PAM_MEDIA_TYPE);
  begin
    // allow nil pointers for coding simplicity
    if (pmt = nil) then Exit;
    FreeMediaType(pmt);
    CoTaskMemFree(pmt);
  end;

  // this also comes in useful when using the IEnumMediaTypes interface so
  // that you can copy a media type, you can do nearly the same by creating
  // a CMediaType object but as soon as it goes out of scope the destructor
  // will delete the memory it allocated (this takes a copy of the memory)
  function  CreateMediaType(pSrc: PAM_MEDIA_TYPE): PAM_MEDIA_TYPE;
  var pMediaType: PAM_MEDIA_TYPE;
  begin
    ASSERT(pSrc<>nil);

    // Allocate a block of memory for the media type
    pMediaType := CoTaskMemAlloc(sizeof(TAM_MEDIA_TYPE));
    if pMediaType = nil then
    begin
      Result := nil;
      Exit;
    end;

    // Copy the variable length format block
    CopyMediaType(pMediaType,pSrc);
    Result := pMediaType;
  end;

  //----------------------------------------------------------------------------
  // Copies a task-allocated AM_MEDIA_TYPE structure.
  //----------------------------------------------------------------------------
  procedure CopyMediaType(pmtTarget: PAM_MEDIA_TYPE; pmtSource: PAM_MEDIA_TYPE);
  begin
    //  We'll leak if we copy onto one that already exists - there's one
    //  case we can check like that - copying to itself.
    ASSERT(pmtSource <> pmtTarget);
    pmtTarget^ := pmtSource^;
    if (pmtSource.cbFormat <> 0) then
    begin
      ASSERT(pmtSource.pbFormat <> nil);
      pmtTarget.pbFormat := CoTaskMemAlloc(pmtSource.cbFormat);
      if (pmtTarget.pbFormat = nil) then
        pmtTarget.cbFormat := 0
      else
        CopyMemory(pmtTarget.pbFormat, pmtSource.pbFormat, pmtTarget.cbFormat);
    end;
    if (pmtTarget.pUnk <> nil) then  pmtTarget.pUnk._AddRef;
  end;

  procedure FreeMediaType(mt: PAM_MEDIA_TYPE);
  begin
    if (mt^.cbFormat <> 0) then
    begin
      CoTaskMemFree(mt^.pbFormat);
      // Strictly unnecessary but tidier
      mt^.cbFormat := 0;
      mt^.pbFormat := nil;
    end;
    if (mt^.pUnk <> nil) then mt^.pUnk := nil;
  end;

  //----------------------------------------------------------------------------
  //  Initializes a media type structure given a wave format structure.
  //----------------------------------------------------------------------------
  function CreateAudioMediaType(pwfx: PWaveFormatEx; pmt: PAM_MEDIA_TYPE; bSetFormat: boolean): HRESULT;
  begin
    pmt.majortype := MEDIATYPE_Audio;
    if (pwfx.wFormatTag = WAVE_FORMAT_EXTENSIBLE) then
      pmt.subtype := PWAVEFORMATEXTENSIBLE(pwfx).SubFormat
    else
      pmt.subtype := FOURCCMap(pwfx.wFormatTag);
    pmt.formattype           := FORMAT_WaveFormatEx;
    pmt.bFixedSizeSamples    := True;
    pmt.bTemporalCompression := False;
    pmt.lSampleSize          := pwfx.nBlockAlign;
    pmt.pUnk                 := nil;
    if (bSetFormat) then
    begin
      if (pwfx.wFormatTag = WAVE_FORMAT_PCM) then
        pmt.cbFormat := sizeof(TWAVEFORMATEX)
      else
        pmt.cbFormat := sizeof(TWAVEFORMATEX) + pwfx.cbSize;
      pmt.pbFormat := CoTaskMemAlloc(pmt.cbFormat);
      if (pmt.pbFormat = nil) then
      begin
        Result := E_OUTOFMEMORY;
        Exit;
      end;
      if (pwfx.wFormatTag = WAVE_FORMAT_PCM) then
      begin
        CopyMemory(pmt.pbFormat, pwfx, sizeof(PCMWAVEFORMAT));
        PWAVEFORMATEX(pmt.pbFormat).cbSize := 0;
      end
      else
      begin
        CopyMemory(pmt.pbFormat, pwfx, pmt.cbFormat);
      end;
    end;
    Result := S_OK;
  end;

  //XXXXXXXX-0000-0010-8000-00AA00389B71
  function  FOURCCMap(Fourcc: DWORD): TGUID;
  const
    tmpguid : TGUID = '{00000000-0000-0010-8000-00AA00389B71}';
  begin
    Result := tmpguid;
    Result.D1 := Fourcc;
  end;

  // trouve les 4 carracteres qui identifient le codec utilisé
  // find the 4 Characters Codes wich identifi codec used
  function GetFOURCC(FOURCC: DWORD): string;
  type
    TFOURCC = array[0..3] of char;
  var
    CC: TFOURCC;
  begin
    case FOURCC of
      0 : Result := 'RGB';
      1 : Result := 'RLE8';
      2 : Result := 'RLE4';
      3 : Result := 'BITFIELDS';
    else
      PDWORD(@CC)^ := FOURCC; // abracadabra
      Result := CC;
    end;
  end;

  //----------------------------------------------------------------------------
  // Donne une brève description du Media Type
  // Give a short Media Type description
  // Tell me if you find not listed media type
  //----------------------------------------------------------------------------
  function GetMediaTypeDescription(MediaType: TAM_Media_Type): string;
  begin
    // major types
    Result := 'Major Type: ';
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_AnalogAudio)   then Result := Result+'AnalogAudio'   else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_AnalogVideo)   then Result := Result+'Analogvideo'   else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_Audio)         then Result := Result+'Audio'         else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_AUXLine21Data) then Result := Result+'AUXLine21Data' else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_File)          then Result := Result+'File'          else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_Interleaved)   then Result := Result+'Interleaved'   else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_LMRT)          then Result := Result+'LMRT'          else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_Midi)          then Result := Result+'Midi'          else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_MPEG2_PES)     then Result := Result+'MPEG2_PES'     else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_ScriptCommand) then Result := Result+'ScriptCommand' else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_Stream)        then Result := Result+'Stream'        else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_Text)          then Result := Result+'Text'          else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_Timecode)      then Result := Result+'Timecode'      else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_URL_STREAM)    then Result := Result+'URL_STREAM'    else
    if IsEqualGUID(MediaType.majortype,MEDIATYPE_Video)         then Result := Result+'Video'         else
       Result := Result+'UnKnown ';
    // sub types
    Result := Result + ' - Sub Type: ';
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_CLPL) then Result := Result+'CLPL' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_YUYV) then Result := Result+'YUYV' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_IYUV) then Result := Result+'IYUV' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_YVU9) then Result := Result+'YVU9' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_Y411) then Result := Result+'Y411' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_Y41P) then Result := Result+'Y41P' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_YUY2) then Result := Result+'YUY2' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_YVYU) then Result := Result+'YVYU' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_UYVY) then Result := Result+'UYVY' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_Y211) then Result := Result+'Y211' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_YV12) then Result := Result+'YV12' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_CLJR) then Result := Result+'CLJR' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_IF09) then Result := Result+'IF09' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_CPLA) then Result := Result+'CPLA' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MJPG) then Result := Result+'MJPG' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_TVMJ) then Result := Result+'TVMJ' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_WAKE) then Result := Result+'WAKE' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_CFCC) then Result := Result+'CFCC' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_IJPG) then Result := Result+'IJPG' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_Plum) then Result := Result+'Plum' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DVCS) then Result := Result+'DVCS' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DVSD) then Result := Result+'DVSD' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MDVF) then Result := Result+'MDVF' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_RGB1) then Result := Result+'RGB1' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_RGB4) then Result := Result+'RGB4' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_RGB8) then Result := Result+'RGB8' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_RGB565) then Result := Result+'RGB565' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_RGB555) then Result := Result+'RGB555' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_RGB24) then Result := Result+'RGB24' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_RGB32) then Result := Result+'RGB32' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_ARGB32) then Result := Result+'ARGB32' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_Overlay) then Result := Result+'Overlay' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG1Packet) then Result := Result+'MPEG1Packet' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG1Payload) then Result := Result+'MPEG1Payload' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG1AudioPayload) then Result := Result+'MPEG1AudioPayload' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG1System) then Result := Result+'MPEG1System' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG1VideoCD) then Result := Result+'MPEG1VideoCD' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG1Video) then Result := Result+'MPEG1Video' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG1Audio) then Result := Result+'MPEG1Audio' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_Avi) then Result := Result+'Avi' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_Asf) then Result := Result+'Asf' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_QTMovie) then Result := Result+'QTMovie' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_QTRpza) then Result := Result+'QTRpza' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_QTSmc) then Result := Result+'QTSmc' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_QTRle) then Result := Result+'QTRle' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_QTJpeg) then Result := Result+'QTJpeg' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_PCMAudio_Obsolete) then Result := Result+'PCMAudio_Obsolete' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_PCM) then Result := Result+'PCM' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_WAVE) then Result := Result+'WAVE' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AU) then Result := Result+'AU' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AIFF) then Result := Result+'AIFF' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_dvsd_) then Result := Result+'dvsd_' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_dvhd) then Result := Result+'dvhd' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_dvsl) then Result := Result+'dvsl' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_Line21_BytePair) then Result := Result+'Line21_BytePair' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_Line21_GOPPacket) then Result := Result+'Line21_GOPPacket' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_Line21_VBIRawData) then Result := Result+'Line21_VBIRawData' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DRM_Audio) then Result := Result+'DRM_Audio' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_IEEE_FLOAT) then Result := Result+'IEEE_FLOAT' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DOLBY_AC3_SPDIF) then Result := Result+'DOLBY_AC3_SPDIF' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_RAW_SPORT) then Result := Result+'RAW_SPORT' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_SPDIF_TAG_241h) then Result := Result+'SPDIF_TAG_241h' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DssVideo) then Result := Result+'DssVideo' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DssAudio) then Result := Result+'DssAudio' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_VPVideo) then Result := Result+'VPVideo' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_VPVBI) then Result := Result+'VPVBI' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_NTSC_M) then Result := Result+'AnalogVideo_NTSC_M' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_PAL_B) then Result := Result+'AnalogVideo_PAL_B' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_PAL_D) then Result := Result+'AnalogVideo_PAL_D' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_PAL_G) then Result := Result+'AnalogVideo_PAL_G' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_PAL_H) then Result := Result+'AnalogVideo_PAL_H' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_PAL_I) then Result := Result+'AnalogVideo_PAL_I' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_PAL_M) then Result := Result+'AnalogVideo_PAL_M' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_PAL_N) then Result := Result+'AnalogVideo_PAL_N' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_PAL_N_COMBO) then Result := Result+'AnalogVideo_PAL_N_COMBO' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_SECAM_B) then Result := Result+'AnalogVideo_SECAM_B' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_SECAM_D) then Result := Result+'AnalogVideo_SECAM_D' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_SECAM_G) then Result := Result+'AnalogVideo_SECAM_G' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_SECAM_H) then Result := Result+'AnalogVideo_SECAM_H' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_SECAM_K) then Result := Result+'AnalogVideo_SECAM_K' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_SECAM_K1) then Result := Result+'AnalogVideo_SECAM_K1' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_AnalogVideo_SECAM_L) then Result := Result+'AnalogVideo_SECAM_L' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG2_VIDEO) then Result := Result+'MPEG2_VIDEO' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG2_PROGRAM) then Result := Result+'MPEG2_PROGRAM' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG2_TRANSPORT) then Result := Result+'MPEG2_TRANSPORT' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MPEG2_AUDIO) then Result := Result+'MPEG2_AUDIO' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DOLBY_AC3) then Result := Result+'DOLBY_AC3' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DVD_SUBPICTURE) then Result := Result+'DVD_SUBPICTURE' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DVD_LPCM_AUDIO) then Result := Result+'DVD_LPCM_AUDIO' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DTS) then Result := Result+'DTS' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_SDDS) then Result := Result+'SDDS' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DVD_NAVIGATION_PCI) then Result := Result+'PCI' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DVD_NAVIGATION_DSI) then Result := Result+'DSI' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DVD_NAVIGATION_PROVIDER) then Result := Result+'PROVIDER' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_MP42) then Result := Result+'MS-MPEG4' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_DIVX) then Result := Result+'DIVX' else
    if IsEqualGUID(MediaType.subtype,MEDIASUBTYPE_VOXWARE) then Result := Result+'VOXWARE_MetaSound' else
       Result := Result+'UnKnown ';

  // format
    Result := Result+ ' Format: ';
    if IsEqualGUID(MediaType.formattype,FORMAT_VideoInfo) then
    begin
      Result := Result+'VideoInfo ';
      if ((MediaType.cbFormat > 0) and assigned(MediaType.pbFormat)) then
      with PVideoInfoHeader(MediaType.pbFormat)^.bmiHeader do
      Result := Result + format('%s %dX%d, %d bits',
        [GetFOURCC(biCompression), biWidth, biHeight, biBitCount]);
    end
    else
    begin
      if IsEqualGUID(MediaType.formattype,FORMAT_VideoInfo2) then
      begin
        Result := Result+'VideoInfo2 ';
        if ((MediaType.cbFormat > 0) and assigned(MediaType.pbFormat)) then
        with PVideoInfoHeader2(MediaType.pbFormat)^.bmiHeader do
        Result := Result + format('%s %dX%d, %d bits',
          [GetFOURCC(biCompression), biWidth, biHeight, biBitCount]);
      end
      else
      begin
        if IsEqualGUID(MediaType.formattype,FORMAT_WaveFormatEx) then
        begin
          Result := Result+'WaveFormatEx: ';
          if ((MediaType.cbFormat > 0) and assigned(MediaType.pbFormat)) then
          case PWaveFormatEx(MediaType.pbFormat)^.wFormatTag of
            $0001: Result := Result+'PCM';  // common
            $0002: Result := Result+'ADPCM';
            $0003: Result := Result+'IEEE_FLOAT';
            $0005: Result := Result+'IBM_CVSD';
            $0006: Result := Result+'ALAW';
            $0007: Result := Result+'MULAW';
            $0010: Result := Result+'OKI_ADPCM';
            $0011: Result := Result+'DVI_ADPCM';
            $0012: Result := Result+'MEDIASPACE_ADPCM';
            $0013: Result := Result+'SIERRA_ADPCM';
            $0014: Result := Result+'G723_ADPCM';
            $0015: Result := Result+'DIGISTD';
            $0016: Result := Result+'DIGIFIX';
            $0017: Result := Result+'DIALOGIC_OKI_ADPCM';
            $0018: Result := Result+'MEDIAVISION_ADPCM';
            $0020: Result := Result+'YAMAHA_ADPCM';
            $0021: Result := Result+'SONARC';
            $0022: Result := Result+'DSPGROUP_TRUESPEECH';
            $0023: Result := Result+'ECHOSC1';
            $0024: Result := Result+'AUDIOFILE_AF36';
            $0025: Result := Result+'APTX';
            $0026: Result := Result+'AUDIOFILE_AF10';
            $0030: Result := Result+'DOLBY_AC2';
            $0031: Result := Result+'GSM610';
            $0032: Result := Result+'MSNAUDIO';
            $0033: Result := Result+'ANTEX_ADPCME';
            $0034: Result := Result+'CONTROL_RES_VQLPC';
            $0035: Result := Result+'DIGIREAL';
            $0036: Result := Result+'DIGIADPCM';
            $0037: Result := Result+'CONTROL_RES_CR10';
            $0038: Result := Result+'NMS_VBXADPCM';
            $0039: Result := Result+'CS_IMAADPCM';
            $003A: Result := Result+'ECHOSC3';
            $003B: Result := Result+'ROCKWELL_ADPCM';
            $003C: Result := Result+'ROCKWELL_DIGITALK';
            $003D: Result := Result+'XEBEC';
            $0040: Result := Result+'G721_ADPCM';
            $0041: Result := Result+'G728_CELP';
            $0050: Result := Result+'MPEG';
            $0055: Result := Result+'MPEGLAYER3';
            $0060: Result := Result+'CIRRUS';
            $0061: Result := Result+'ESPCM';
            $0062: Result := Result+'VOXWARE';
            $0063: Result := Result+'CANOPUS_ATRAC';
            $0064: Result := Result+'G726_ADPCM';
            $0065: Result := Result+'G722_ADPCM';
            $0066: Result := Result+'DSAT';
            $0067: Result := Result+'DSAT_DISPLAY';
            $0075: Result := Result+'VOXWARE'; // aditionnal  ???
            $0080: Result := Result+'SOFTSOUND';
            $0100: Result := Result+'RHETOREX_ADPCM';
            $0200: Result := Result+'CREATIVE_ADPCM';
            $0202: Result := Result+'CREATIVE_FASTSPEECH8';
            $0203: Result := Result+'CREATIVE_FASTSPEECH10';
            $0220: Result := Result+'QUARTERDECK';
            $0300: Result := Result+'FM_TOWNS_SND';
            $0400: Result := Result+'BTV_DIGITAL';
            $1000: Result := Result+'OLIGSM';
            $1001: Result := Result+'OLIADPCM';
            $1002: Result := Result+'OLICELP';
            $1003: Result := Result+'OLISBC';
            $1004: Result := Result+'OLIOPR';
            $1100: Result := Result+'LH_CODEC';
            $1400: Result := Result+'NORRIS';
          else
            Result := Result+'Unknown';
          end;

          with PWaveFormatEx(MediaType.pbFormat)^ do
          Result := Result + format(', %d Hertz, %d Bits, %d Channels',
            [nSamplesPerSec, cbSize, nChannels]);

        end
        else
        begin
          if IsEqualGUID(MediaType.formattype,FORMAT_MPEGVideo) then
          begin
            Result := Result+'MPEGVideo ';
            if ((MediaType.cbFormat > 0) and assigned(MediaType.pbFormat)) then
            with PMPEG1VIDEOINFO(MediaType.pbFormat)^.hdr.bmiHeader do
              Result := Result + format('%s %dX%d, %d bits',
              [GetFOURCC(biCompression), biWidth, biHeight, biBitCount]);

          end
          else
          begin
            if IsEqualGUID(MediaType.formattype,FORMAT_MPEG2Video) then
            begin
              Result := Result+'MPEGStreams ';
              if ((MediaType.cbFormat > 0) and assigned(MediaType.pbFormat)) then
              with PMPEG2VIDEOINFO(MediaType.pbFormat)^.hdr.bmiHeader do
                Result := Result + format('%s %dX%d, %d bits',
                [GetFOURCC(biCompression), biWidth, biHeight, biBitCount]);
            end
            else
            begin  // todo
              if IsEqualGUID(MediaType.formattype,FORMAT_DvInfo)        then Result := Result+'DvInfo' else
              if IsEqualGUID(MediaType.formattype,FORMAT_MPEGStreams)   then Result := Result+'MPEGStreams' else
              if IsEqualGUID(MediaType.formattype,FORMAT_DolbyAC3)      then Result := Result+'DolbyAC3' else
              if IsEqualGUID(MediaType.formattype,FORMAT_MPEG2Audio)    then Result := Result+'MPEG2Audio' else
              if IsEqualGUID(MediaType.formattype,FORMAT_DVD_LPCMAudio) then Result := Result+'DVD_LPCMAudio' else
                Result := Result+'Unknown';
            end;
          end;
        end;
      end;
    end;
  end;

  procedure FreeAndNil(var Obj);
  var
    Temp: TObject;
  begin
    Temp := TObject(Obj);
    Pointer(Obj) := nil;
    Temp.Free;
  end;

  function MAKEFOURCC(ch0, ch1, ch2, ch3: char): DWORD;
  begin
    Result := DWORD(BYTE(ch0)) or
    (DWORD(BYTE(ch1)) shl 8)   or
    (DWORD(BYTE(ch2)) shl 16)  or
    (DWORD(BYTE(ch3)) shl 24)
  end;

  // Functions to save and restor pesistent objects

  function PersistToHex(obj: IPersistStream): string;
  var
    MemStream : TMemoryStream;
    AdaStream : TStreamAdapter;
    dest      : pchar;
    size      : integer;
  begin
    if assigned(obj) then
    begin
      MemStream := TMemoryStream.Create;
      AdaStream := TStreamAdapter.Create(MemStream, soReference);
      OleSaveToStream(obj, AdaStream);
      size := MemStream.Size;
      getmem(dest, (Size * 2) + 1);
      zeromemory(dest, (Size * 2) + 1);
      bintohex(MemStream.Memory, dest, Size);
      Result := dest;
      freemem(dest, (Size * 2) + 1);
      AdaStream.Free;
      MemStream.Free;
    end
    else
      Result := '';
  end;

  function HexToPersist(str: String; GUID: TGUID): IPersistStream;
  var
    MemStream : TMemoryStream;
    AdaStream : TStreamAdapter;
    size      : integer;
  begin
    MemStream := TMemoryStream.Create;
    AdaStream := TStreamAdapter.Create(MemStream, soReference);
    size := length(str) div 2;
    MemStream.SetSize(size);
    HexToBin(pchar(str), MemStream.Memory, size);
    OleLoadFromStream(AdaStream, GUID, Result);
    AdaStream.Free;
    MemStream.Free;
  end;

end.
