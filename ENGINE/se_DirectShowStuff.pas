unit se_DirectShowstuff;

interface

uses
  Windows, Messages, Controls, OleServer, Classes, Forms, ActiveX, Graphics,
  SysUtils, ComCtrls, Consts, Math, se_DirectShow, se_DirectShowUtils, ComObj,
  se_WindowsMedia, ShellAPI;

type
  TDSGraph = class;

  TOnDebug = procedure(sender: TComponent; text: string) of object;

  //******************************************************************************
  //
  //  TDSFilterList declaration
  //  description: Enumerate all filters in a Filter Graph
  //
  //******************************************************************************

  TDSFilterList = class(TInterfaceList)
  private
    Graph: IFilterGraph;
    function GetFilter(Index: Integer): IBaseFilter;
    procedure PutFilter(Index: Integer; Item: IBaseFilter);
    function GetFilterInfo(index: Integer): TFilterInfo;
  public
    constructor Create(FilterGraph: IFilterGraph); overload;
    destructor Destroy; override;
    procedure Update;
    procedure Assign(FilterGraph: IFilterGraph);
    function First: IBaseFilter;
    function IndexOf(Item: IBaseFilter): Integer;
    function Add(Item: IBaseFilter): Integer;
    procedure Insert(Index: Integer; Item: IBaseFilter);
    function Last: IBaseFilter;
    function Remove(Item: IBaseFilter): Integer;
    property Items[Index: Integer]: IBaseFilter read GetFilter write PutFilter;
      default;
    property FilterInfo[Index: Integer]: TFilterInfo read GetFilterInfo;
  end;

  //******************************************************************************
  //
  // TDSVideoWindow declaration
  //
  //******************************************************************************
  TOnReceiveFiles = procedure(sender: TComponent; Files: cardinal) of object;
  TDSFilterConnector = class;
  TDSVideoWindow = class(TCustomControl)
  private
    FGraph: TDSGraph;
    FWindowInfo: TWindowInfo;
    FIsFullScreen: boolean;
    procedure SetGraph(grf: TDSGraph);
    function VideoAvailable: boolean;
    procedure CaptureCanvas(Sender: TObject);
    procedure ReleaseCanvas(Sender: TObject);
    function FindVideoWindow: THandle;
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      override;
    procedure MouseDown(Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Resize; override;
    procedure ConstrainedResize(var MinWidth, MinHeight, MaxWidth, MaxHeight:
      Integer); override;
    procedure Loaded; override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function StartFullScreen: boolean;
    function StopFullScreen: boolean;
    property IsFullScreen: boolean read FIsFullScreen;
    property VideoHandle: THandle read FindVideoWindow;
  published
    property Graph: TDSGraph read FGraph write SetGraph;
    property Visible;
    property ShowHint;
    property Anchors;
    property Canvas;
    property PopupMenu;
    property Align;
    property TabStop default True;

    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
  end;

  //******************************************************************************
  //
  // TDSTrackBar declaration
  //
  //******************************************************************************
{$IFNDEF VER120} // not available with delphi4
  TDSFilterGraph2 = class;

  TDSTrackBar = class(TTrackBar)
  private
    FTimerEnable: boolean;
    FInterval: Cardinal;
    FWindowHandle: HWND;
    FGraph: TDSFilterGraph2;
    procedure UpdateTimer;
    procedure WndProc2(var Msg: TMessage);
    procedure SetTimerEnabled(Value: Boolean);
    procedure SetGraph(grf: TDSFilterGraph2);
    function SeekingAvailable: boolean;
    function GetCapabilities: TDSAMSeekingKind;
    function GetRate: double;
    procedure SetRate(rate: Double);
    procedure ReceiveEndOfStream;
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Timer; dynamic;
    procedure Changed; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Capabilities: TDSAMSeekingKind read GetCapabilities;
    property Graph: TDSFilterGraph2 read FGraph write SetGraph;
    property Rate: double read GetRate write SetRate;
  end;
{$ENDIF}

  //******************************************************************************
  // TDSGraph declaration
  // Don't use directly !!
  // Used internaly to receive Events from a Filter Graph, connections ...
  //******************************************************************************
  TVideoSize = record
    Width: WORD;
    Height: WORD;
  end;

  TOnDSEvent = procedure(sender: TOleServer; Event, Param1, Param2: longint) of
    object;

  TOnGraphBufferingData = procedure(sender: TComponent; Buffering: boolean) of
    object;
  TOnGraphClockChanged = procedure(sender: TComponent) of object;
  TOnGraphComplete = procedure(sender: TComponent; Result: HRESULT; Renderer:
    IBaseFilter) of object;
  TOnGraphDeviceLost = procedure(sender: TComponent; Device: IUnknown; Removed:
    Boolean) of object;
  TOnGraphEndOfSegment = procedure(sender: TComponent; StreamTime:
    TREFERENCE_TIME; NumSegment: Cardinal) of object;
  TOnGraphErrorStillPlaying = procedure(sender: TComponent; Result: HRESULT) of
    object;
  TOnGraphErrorAbort = procedure(sender: TComponent; Result: HRESULT) of object;
  TOnGraphFullscreenLost = procedure(sender: TComponent; Renderer: IBaseFilter)
    of object;
  TOnGraphChanged = procedure(sender: TComponent) of object;
  TOnGraphOleEvent = procedure(sender: TComponent; String1, String2: string) of
    object;
  TOnGraphOpeningFile = procedure(sender: TComponent; opening: boolean) of
    object;
  TOnGraphPaletteChanged = procedure(sender: TComponent) of object;
  TOnGraphPaused = procedure(sender: TComponent; Result: HRESULT) of object;
  TOnGraphQualityChange = procedure(sender: TComponent) of object;
  TOnGraphSNDDevInError = procedure(sender: TComponent; OccurWhen: TSNDDEV_ERR;
    ErrorCode: DWORD) of object;
  TOnGraphSNDDevOutError = procedure(sender: TComponent; OccurWhen: TSNDDEV_ERR;
    ErrorCode: DWORD) of object;
  TOnGraphStepComplete = procedure(sender: TComponent) of object;
  TOnGraphStreamControlStarted = procedure(sender: TComponent; PinSender: IPin;
    Cookie: DWORD) of object;
  TOnGraphStreamControlStopped = procedure(sender: TComponent; PinSender: IPin;
    Cookie: DWORD) of object;
  TOnGraphStreamErrorStillPlaying = procedure(sender: TComponent; Operation:
    HRESULT; Value: DWORD) of object;
  TOnGraphStreamErrorStopped = procedure(sender: TComponent; Operation: HRESULT;
    Value: DWORD) of object;
  TOnGraphUserAbort = procedure(sender: TComponent) of object;
  TOnGraphVideoSizeChanged = procedure(sender: TComponent; size: TVideoSize) of
    object;
  TOnGraphTimeCodeAvailable = procedure(sender: TComponent; From: IBaseFilter;
    DeviceID: DWORD) of object;
  TOnGraphEXTDeviceModeChange = procedure(sender: TComponent; NewMode, DeviceID:
    DWORD) of object;
  TOnGraphClockUnset = procedure(sender: TComponent) of object;

  TDSGraph = class(TOleServer)
  private
    FVW: TDSVideoWindow;
    FHandle: HWND;
    FFilterList: TList;
    FTMPFilterList: TList;
    // ROT
    dwregister: longint;
    FRotEnabled: boolean;
    // WMF
    FWMFRegister: boolean;
    FWMKeyProvider: TWMKeyProvider;
    // All Events Code
    FOnDSEvent: TOnDSEvent;
    // Graph Events
    FOnGraphBufferingData: TOnGraphBufferingData;
    FOnGraphClockChanged: TOnGraphClockChanged;
    FOnGraphComplete: TOnGraphComplete;
    FOnGraphDeviceLost: TOnGraphDeviceLost;
    FOnGraphEndOfSegment: TOnGraphEndOfSegment;
    FOnGraphErrorStillPlaying: TOnGraphErrorStillPlaying;
    FOnGraphErrorAbort: TOnGraphErrorAbort;
    FOnGraphFullscreenLost: TOnGraphFullscreenLost;
    FOnGraphChanged: TOnGraphChanged;
    FOnGraphOleEvent: TOnGraphOleEvent;
    FOnGraphOpeningFile: TOnGraphOpeningFile;
    FOnGraphPaletteChanged: TOnGraphPaletteChanged;
    FOnGraphPaused: TOnGraphPaused;
    FOnGraphQualityChange: TOnGraphQualityChange;
    FOnGraphSNDDevInError: TOnGraphSNDDevInError;
    FOnGraphSNDDevOutError: TOnGraphSNDDevOutError;
    FOnGraphStepComplete: TOnGraphStepComplete;
    FOnGraphStreamControlStarted: TOnGraphStreamControlStarted;
    FOnGraphStreamControlStopped: TOnGraphStreamControlStopped;
    FOnGraphStreamErrorStillPlaying: TOnGraphStreamErrorStillPlaying;
    FOnGraphStreamErrorStopped: TOnGraphStreamErrorStopped;
    FOnGraphUserAbort: TOnGraphUserAbort;
    FOnGraphVideoSizeChanged: TOnGraphVideoSizeChanged;
    FOnGraphTimeCodeAvailable: TOnGraphTimeCodeAvailable;
    FOnGraphEXTDeviceModeChange: TOnGraphEXTDeviceModeChange;
    FOnGraphClockUnset: TOnGraphClockUnset;
    procedure WndProc(var Msg: TMessage);
    procedure FDoEvent;
    procedure DeleteFilters; dynamic;
    procedure AddFilter(filter: TDSFilterConnector);
    procedure RemoveFilter(filter: TDSFilterConnector);
  protected
    procedure DoEvent(Event, Param1, Param2: longint); dynamic;
    procedure SetROT(value: boolean);
    procedure SetWMFRegister(value: boolean);
  public
    VideoWindow: IVideoWindow;
    MediaSeeking: IMediaSeeking;
    MediaEventEx: IMediaEventEx;
    GraphBuilder: IGraphBuilder;
    MediaControl: IMediaControl;
    BasicAudio: IBasicAudio;
    BasicVideo2: IBasicVideo2;
    AMGraphStreams: IAMGraphStreams;
    FilterChain: IFilterChain;
    FilterMapper2: IFilterMapper2;
    GraphConfig: IGraphConfig;
    GraphVersion: IGraphVersion;
    MediaEventSink: IMediaEventSink;
    QueueCommand: IQueueCommand;
    ResourceManager: IResourceManager;
    VideoFrameStep: IVideoFrameStep;
    function Connected: boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure QueryInterfaces; dynamic;
    procedure Connect; override;
    procedure Disconnect; override;
  published
    property WMFRegister: boolean read FWMFRegister write FWMFRegister default
      False;
    property RotEnabled: boolean read FRotEnabled write FRotEnabled default
      False;
    property OnDSEvent: TOnDSEvent read FOnDSEvent write FOnDSEvent;
    property OnGraphBufferingData: TOnGraphBufferingData read
      FOnGraphBufferingData write FOnGraphBufferingData;
    property OnGraphClockChanged: TOnGraphClockChanged read FOnGraphClockChanged
      write FOnGraphClockChanged;
    property OnGraphComplete: TOnGraphComplete read FOnGraphComplete write
      FOnGraphComplete;
    property OnGraphDeviceLost: TOnGraphDeviceLost read FOnGraphDeviceLost write
      FOnGraphDeviceLost;
    property OnGraphEndOfSegment: TOnGraphEndOfSegment read FOnGraphEndOfSegment
      write FOnGraphEndOfSegment;
    property OnGraphErrorStillPlaying: TOnGraphErrorStillPlaying read
      FOnGraphErrorStillPlaying write FOnGraphErrorStillPlaying;
    property OnGraphErrorAbort: TOnGraphErrorAbort read FOnGraphErrorAbort write
      FOnGraphErrorAbort;
    property OnGraphFullscreenLost: TOnGraphFullscreenLost read
      FOnGraphFullscreenLost write FOnGraphFullscreenLost;
    property OnGraphChanged: TOnGraphChanged read FOnGraphChanged write
      FOnGraphChanged;
    property OnGraphOleEvent: TOnGraphOleEvent read FOnGraphOleEvent write
      FOnGraphOleEvent;
    property OnGraphOpeningFile: TOnGraphOpeningFile read FOnGraphOpeningFile
      write FOnGraphOpeningFile;
    property OnGraphPaletteChanged: TOnGraphPaletteChanged read
      FOnGraphPaletteChanged write FOnGraphPaletteChanged;
    property OnGraphPaused: TOnGraphPaused read FOnGraphPaused write
      FOnGraphPaused;
    property OnGraphQualityChange: TOnGraphQualityChange read
      FOnGraphQualityChange write FOnGraphQualityChange;
    property OnGraphSNDDevInError: TOnGraphSNDDevInError read
      FOnGraphSNDDevInError write FOnGraphSNDDevInError;
    property OnGraphSNDDevOutError: TOnGraphSNDDevOutError read
      FOnGraphSNDDevOutError write FOnGraphSNDDevOutError;
    property OnGraphStepComplete: TOnGraphStepComplete read FOnGraphStepComplete
      write FOnGraphStepComplete;
    property OnGraphStreamControlStarted: TOnGraphStreamControlStarted read
      FOnGraphStreamControlStarted write FOnGraphStreamControlStarted;
    property OnGraphStreamControlStopped: TOnGraphStreamControlStopped read
      FOnGraphStreamControlStopped write FOnGraphStreamControlStopped;
    property OnGraphStreamErrorStillPlaying: TOnGraphStreamErrorStillPlaying read
      FOnGraphStreamErrorStillPlaying write FOnGraphStreamErrorStillPlaying;
    property OnGraphStreamErrorStopped: TOnGraphStreamErrorStopped read
      FOnGraphStreamErrorStopped write FOnGraphStreamErrorStopped;
    property OnGraphUserAbort: TOnGraphUserAbort read FOnGraphUserAbort write
      FOnGraphUserAbort;
    property OnGraphVideoSizeChanged: TOnGraphVideoSizeChanged read
      FOnGraphVideoSizeChanged write FOnGraphVideoSizeChanged;
    property OnGraphTimeCodeAvailable: TOnGraphTimeCodeAvailable read
      FOnGraphTimeCodeAvailable write FOnGraphTimeCodeAvailable;
    property OnGraphEXTDeviceModeChange: TOnGraphEXTDeviceModeChange read
      FOnGraphEXTDeviceModeChange write FOnGraphEXTDeviceModeChange;
    property OnGraphClockUnset: TOnGraphClockUnset read FOnGraphClockUnset write
      FOnGraphClockUnset;
  end;

  //******************************************************************************
  //
  // TDSFilterGraph2 declaration
  // use IFilterGraph2 only
  //******************************************************************************
  TDSFilterGraph2 = class(TDSGraph)
  private
{$IFNDEF VER120}
    FTB: TDSTrackBar;
{$ENDIF}
  protected
    procedure InitServerData; override;
    procedure DoEvent(Event, Param1, Param2: longint); override;
  public
    FilterGraph2: IFilterGraph2;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure Disconnect; override;
    procedure QueryInterfaces; override;
    procedure ReleaseInterfaces; dynamic;
    procedure ClearGraph;
  end;

  //******************************************************************************
  //
  // TDSDVDGraph declaration
  //
  //******************************************************************************
  TOnDVDAudioStreamChange = procedure(sender: TComponent; stream, lcid: longint;
    Lang: string) of object;
  TOnDVDCurrentTime = procedure(sender: TComponent; heures, minutes, secondes,
    frames, frate: longint) of object;
  TOnDVDTitleChange = procedure(sender: TComponent; title: longint) of object;
  TOnDVDChapterStart = procedure(sender: TComponent; chapter: longint) of
    object;
  TOnDVDDomain = procedure(sender: TComponent) of object;
  TOnDVDAngleChange = procedure(sender: TComponent; total, current: longint) of
    object;
  TOnDVDValidUOPSChange = procedure(sender: TComponent; UOPS: TUOPS) of object;
  TOnDVDButtonChange = procedure(sender: TComponent; total, current: longint) of
    object;
  TOnDVDChapterAutoStop = procedure(sender: TComponent) of object;
  TOnDVDStillOn = procedure(sender: TComponent; NoButtonAvailable: boolean;
    seconds: longint) of object;
  TOnDVDStillOff = procedure(sender: TComponent) of object;
  TOnDVDSubpictureStreamChange = procedure(sender: TComponent; SubNum, lcid:
    longint; Lang: string) of object;
  TOnDVDError = procedure(sender: TComponent) of object;
  TOnDVDNoFP_PGC = procedure(sender: TComponent) of object;
  TOnDVDWarning = procedure(sender: TComponent) of object;
  TOnDVDPlaybackRateChange = procedure(sender: TComponent; rate: longint) of
    object;
  TOnDVDParentalLevelChange = procedure(sender: TComponent; level: longint) of
    object;
  TOnDVDPlaybackStopped = procedure(sender: TComponent) of object;
  TOnDVDAnglesAvailable = procedure(sender: TComponent; available: boolean) of
    object;
  TOnDVDPlayPeriodAutoStop = procedure(sender: TComponent) of object;
  TOnDVDButtonAutoActivated = procedure(sender: TComponent; Button: DWORD) of
    object;
  TOnDVDCMDStart = procedure(sender: TComponent; CmdID: DWORD) of object;
  TOnDVDCMDEnd = procedure(sender: TComponent; CmdID: DWORD) of object;
  TOnDVDDiscEjected = procedure(sender: TComponent) of object;
  TOnDVDDiscInserted = procedure(sender: TComponent) of object;
  TOnDVDCurrentHMSFTime = procedure(sender: TComponent; HMSFTimeCode:
    TDVD_HMSF_TIMECODE; TimeCode: TDVD_TimeCode) of object;
  TOnDVDKaraokeMode = procedure(sender: TComponent; Played: BOOL) of object;

  TDSDVDGraph = class(TDSGraph)
  private
    FOnDVDAudioStreamChange: TOnDVDAudioStreamChange;
    FOnDVDCurrentTime: TOnDVDCurrentTime;
    FOnDVDTitleChange: TOnDVDTitleChange;
    FOnDVDChapterStart: TOnDVDChapterStart;
    FOnDVDAngleChange: TOnDVDAngleChange;
    FOnDVDValidUOPSChange: TOnDVDValidUOPSChange;
    FOnDVDButtonChange: TOnDVDButtonChange;
    FOnDVDChapterAutoStop: TOnDVDChapterAutoStop;
    FOnDVDStillOn: TOnDVDStillOn;
    FOnDVDStillOff: TOnDVDStillOff;
    FOnDVDSubpictureStreamChange: TOnDVDSubpictureStreamChange;
    FOnDVDNoFP_PGC: TOnDVDNoFP_PGC;
    FOnDVDPlaybackRateChange: TOnDVDPlaybackRateChange;
    FOnDVDParentalLevelChange: TOnDVDParentalLevelChange;
    FOnDVDPlaybackStopped: TOnDVDPlaybackStopped;
    FOnDVDAnglesAvailable: TOnDVDAnglesAvailable;
    FOnDVDPlayPeriodAutoStop: TOnDVDPlayPeriodAutoStop;
    FOnDVDButtonAutoActivated: TOnDVDButtonAutoActivated;
    FOnDVDCMDStart: TOnDVDCMDStart;
    FOnDVDCMDEnd: TOnDVDCMDEnd;
    FOnDVDDiscEjected: TOnDVDDiscEjected;
    FOnDVDDiscInserted: TOnDVDDiscInserted;
    FOnDVDCurrentHMSFTime: TOnDVDCurrentHMSFTime;
    FOnDVDKaraokeMode: TOnDVDKaraokeMode;
    // DVD Warning
    FOnDVDWarningInvalidDVD1_0Disc: TOnDVDWarning; //=1,
    FOnDVDWarningFormatNotSupported: TOnDVDWarning; //=2,
    FOnDVDWarningIllegalNavCommand: TOnDVDWarning; //=3
    FOnDVDWarningOpen: TOnDVDWarning; //=4
    FOnDVDWarningSeek: TOnDVDWarning; //=5
    FOnDVDWarningRead: TOnDVDWarning; //=6
    // DVDDomain
    FOnDVDDomainFirstPlay: TOnDVDDomain;
    FOnDVDDomainVideoManagerMenu: TOnDVDDomain;
    FOnDVDDomainVideoTitleSetMenu: TOnDVDDomain;
    FOnDVDDomainTitle: TOnDVDDomain;
    FOnDVDDomainStop: TOnDVDDomain;
    // DVDError
    FOnDVDErrorUnexpected: TOnDVDError;
    FOnDVDErrorCopyProtectFail: TOnDVDError;
    FOnDVDErrorInvalidDVD1_0Disc: TOnDVDError;
    FOnDVDErrorInvalidDiscRegion: TOnDVDError;
    FOnDVDErrorLowParentalLevel: TOnDVDError;
    FOnDVDErrorMacrovisionFail: TOnDVDError;
    FOnDVDErrorIncompatibleSystemAndDecoderRegions: TOnDVDError;
    FOnDVDErrorIncompatibleDiscAndDecoderRegions: TOnDVDError;
  protected
    procedure InitServerData; override;
    procedure DoEvent(Event, Param1, Param2: longint); override;
  public
    DvdGraphBuilder: IDvdGraphBuilder;
    DvdControl2: IDvdControl2;
    DvdInfo2: IDvdInfo2;
    AMLine21Decoder: IAMLine21Decoder;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure Disconnect; override;
    procedure QueryInterfaces; override;
    procedure SaveBookmark(BookMarkFile: string);
    procedure RestoreBookmark(BookMarkFile: string);
  published
    property OnDVDAudioStreamChange: TOnDVDAudioStreamChange read
      FOnDVDAudioStreamChange write FOnDVDAudioStreamChange;
    property OnDVDCurrentTime: TOnDVDCurrentTime read FOnDVDCurrentTime write
      FOnDVDCurrentTime;
    property OnDVDTitleChange: TOnDVDTitleChange read FOnDVDTitleChange write
      FOnDVDTitleChange;
    property OnDVDChapterStart: TOnDVDChapterStart read FOnDVDChapterStart write
      FOnDVDChapterStart;
    property OnDVDAngleChange: TOnDVDAngleChange read FOnDVDAngleChange write
      FOnDVDAngleChange;
    property OnDVDValidUOPSChange: TOnDVDValidUOPSChange read
      FOnDVDValidUOPSChange write FOnDVDValidUOPSChange;
    property OnDVDButtonChange: TOnDVDButtonChange read FOnDVDButtonChange write
      FOnDVDButtonChange;
    property OnDVDChapterAutoStop: TOnDVDChapterAutoStop read
      FOnDVDChapterAutoStop write FOnDVDChapterAutoStop;
    property OnDVDStillOn: TOnDVDStillOn read FOnDVDStillOn write FOnDVDStillOn;
    property OnDVDStillOff: TOnDVDStillOff read FOnDVDStillOff write
      FOnDVDStillOff;
    property OnDVDSubpictureStreamChange: TOnDVDSubpictureStreamChange read
      FOnDVDSubpictureStreamChange write FOnDVDSubpictureStreamChange;
    property OnDVDNoFP_PGC: TOnDVDNoFP_PGC read FOnDVDNoFP_PGC write
      FOnDVDNoFP_PGC;
    property OnDVDPlaybackRateChange: TOnDVDPlaybackRateChange read
      FOnDVDPlaybackRateChange write FOnDVDPlaybackRateChange;
    property OnDVDParentalLevelChange: TOnDVDParentalLevelChange read
      FOnDVDParentalLevelChange write FOnDVDParentalLevelChange;
    property OnDVDPlaybackStopped: TOnDVDPlaybackStopped read
      FOnDVDPlaybackStopped write FOnDVDPlaybackStopped;
    property OnDVDAnglesAvailable: TOnDVDAnglesAvailable read
      FOnDVDAnglesAvailable write FOnDVDAnglesAvailable;
    property OnDVDPlayPeriodAutoStop: TOnDVDPlayPeriodAutoStop read
      FOnDVDPlayPeriodAutoStop write FOnDVDPlayPeriodAutoStop;
    property OnDVDButtonAutoActivated: TOnDVDButtonAutoActivated read
      FOnDVDButtonAutoActivated write FOnDVDButtonAutoActivated;
    property OnDVDCMDStart: TOnDVDCMDStart read FOnDVDCMDStart write
      FOnDVDCMDStart;
    property OnDVDCMDEnd: TOnDVDCMDEnd read FOnDVDCMDEnd write FOnDVDCMDEnd;
    property OnDVDDiscEjected: TOnDVDDiscEjected read FOnDVDDiscEjected write
      FOnDVDDiscEjected;
    property OnDVDDiscInserted: TOnDVDDiscInserted read FOnDVDDiscInserted write
      FOnDVDDiscInserted;
    property OnDVDCurrentHMSFTime: TOnDVDCurrentHMSFTime read
      FOnDVDCurrentHMSFTime write FOnDVDCurrentHMSFTime;
    property OnDVDKaraokeMode: TOnDVDKaraokeMode read FOnDVDKaraokeMode write
      FOnDVDKaraokeMode;
    //DVD Domain
    property OnDVDDomainFirstPlay: TOnDVDDomain read FOnDVDDomainFirstPlay write
      FOnDVDDomainFirstPlay;
    property OnDVDDomainVideoManagerMenu: TOnDVDDomain read
      FOnDVDDomainVideoManagerMenu write FOnDVDDomainVideoManagerMenu;
    property OnDVDDomainVideoTitleSetMenu: TOnDVDDomain read
      FOnDVDDomainVideoTitleSetMenu write FOnDVDDomainVideoTitleSetMenu;
    property OnDVDDomainTitle: TOnDVDDomain read FOnDVDDomainTitle write
      FOnDVDDomainTitle;
    property OnDVDDomainStop: TOnDVDDomain read FOnDVDDomainStop write
      FOnDVDDomainStop;
    //DVD Error
    property OnDVDErrorUnexpected: TOnDVDError read FOnDVDErrorUnexpected write
      FOnDVDErrorUnexpected;
    property OnDVDErrorCopyProtectFail: TOnDVDError read
      FOnDVDErrorCopyProtectFail write FOnDVDErrorCopyProtectFail;
    property OnDVDErrorInvalidDVD1_0Disc: TOnDVDError read
      FOnDVDErrorInvalidDVD1_0Disc write FOnDVDErrorInvalidDVD1_0Disc;
    property OnDVDErrorInvalidDiscRegion: TOnDVDError read
      FOnDVDErrorInvalidDiscRegion write FOnDVDErrorInvalidDiscRegion;
    property OnDVDErrorLowParentalLevel: TOnDVDError read
      FOnDVDErrorLowParentalLevel write FOnDVDErrorLowParentalLevel;
    property OnDVDErrorMacrovisionFail: TOnDVDError read
      FOnDVDErrorMacrovisionFail write FOnDVDErrorMacrovisionFail;
    property OnDVDErrorIncompatibleSystemAndDecoderRegions: TOnDVDError read
      FOnDVDErrorIncompatibleSystemAndDecoderRegions write
      FOnDVDErrorIncompatibleSystemAndDecoderRegions;
    property OnDVDErrorIncompatibleDiscAndDecoderRegions: TOnDVDError read
      FOnDVDErrorIncompatibleDiscAndDecoderRegions write
      FOnDVDErrorIncompatibleDiscAndDecoderRegions;
    //DVD Warning
    property OnDVDWarningInvalidDVD1_0Disc: TOnDVDWarning read
      FOnDVDWarningInvalidDVD1_0Disc write FOnDVDWarningInvalidDVD1_0Disc; //=1,
    property OnDVDWarningFormatNotSupported: TOnDVDWarning read
      FOnDVDWarningFormatNotSupported write FOnDVDWarningFormatNotSupported; //=2,
    property OnDVDWarningIllegalNavCommand: TOnDVDWarning read
      FOnDVDWarningIllegalNavCommand write FOnDVDWarningIllegalNavCommand; //=3
    property OnDVDWarningOpen: TOnDVDWarning read FOnDVDWarningOpen write
      FOnDVDWarningOpen; //=4
    property OnDVDWarningSeek: TOnDVDWarning read FOnDVDWarningSeek write
      FOnDVDWarningSeek; //=5
    property OnDVDWarningRead: TOnDVDWarning read FOnDVDWarningRead write
      FOnDVDWarningRead; //=6
  end;

  //******************************************************************************
  //
  // TDSCaptureGraph declaration
  //
  //******************************************************************************
  TDSCaptureGraph = class(TDSFilterGraph2)
  private
  protected
    procedure InitServerData; override;
  public
    CaptureGraphBuilder2: ICaptureGraphBuilder2;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect; override;
    procedure Disconnect; override;
    procedure QueryInterfaces; override;
    procedure ReleaseInterfaces; override;
  published
  end;

  //******************************************************************************
  //
  // TDSSysDevEnum declaration
  //
  //******************************************************************************
  PDSFilCatNode = ^TDSFilCatNode;
  TDSFilCatNode = record
    Moniker: string;
    FriendlyName: Shortstring;
    CLSID: TGUID;
  end;

  TDSSysDevEnum = class
  private
    FGUID: TGUID;
    FCategories: TList;
    FFilters: TList;
    ACategory: PDSFilCatNode;
    procedure GetCat(catlist: TList; CatGUID: TGUID);
    function GetCountCategories: Integer;
    function GetCountFilters: Integer;
    function GetCategory(item: Integer): TDSFilCatNode;
    function GetFilter(item: Integer): TDSFilCatNode;
  public
    procedure SelectGUIDCategory(GUID: TGUID);
    procedure SelectIndexCategory(index: Integer);
    property CountCategories: Integer read GetCountCategories;
    property CountFilters: Integer read GetCountFilters;
    property Categories[item: Integer]: TDSFilCatNode read GetCategory;
    property Filters[item: Integer]: TDSFilCatNode read GetFilter;
    function GetBaseFilterByIndex(index: Integer): IBaseFilter;
    function GetBaseFilterByGUID(GUID: TGUID): IBaseFilter;
    constructor Create; overload;
    constructor create(guid: TGUID); overload;
    destructor Destroy; override;
  end;

  //******************************************************************************
  //
  //  TDSMediaType Declaration
  //  Wrapper Class for CMediaType
  //
  //******************************************************************************

  TDSMediaType = class(TObject)
  private
    function GetMajorType: TGUID;
    procedure SetMajorType(MT: TGUID);
    function GetSubType: TGUID;
    procedure SetSubType(ST: TGUID);
    procedure SetFormatType(const GUID: TGUID);
    function GetFormatType: TGUID;
  public
    AMMediaType: PAM_MEDIA_TYPE;
    destructor Destroy; override;
    constructor Create; overload;
    constructor Create(majortype: TGUID); overload;
    constructor Create(mediatype: PAM_MEDIA_TYPE); overload;
    constructor Create(MTClass: TDSMediaType); overload;
    procedure Assign(MTClass: TDSMediaType); overload;
    procedure Assign(mediatype: PAM_MEDIA_TYPE); overload;
    function Equal(MTClass: TDSMediaType): boolean; overload;
    function NotEqual(MTClass: TDSMediaType): boolean; overload;
    function IsValid: boolean;
    function IsFixedSize: boolean;
    function IsTemporalCompressed: boolean;
    function GetSampleSize: ULONG;
    procedure SetSampleSize(SZ: ULONG);
    procedure SetVariableSize;
    procedure SetTemporalCompression(bCompressed: boolean);
    // read/write pointer to format - can't change length without
    // calling SetFormat, AllocFormatBuffer or ReallocFormatBuffer
    function Format: pointer;
    function FormatLength: ULONG;
    function SetFormat(pFormat: pointer; length: ULONG): boolean;
    procedure ResetFormatBuffer;
    function AllocFormatBuffer(length: ULONG): pointer;
    function ReallocFormatBuffer(length: ULONG): pointer;
    procedure InitMediaType;
    function MatchesPartial(ppartial: TDSMediaType): boolean;
    function IsPartiallySpecified: boolean;
    property MajorType: TGUID read GetMajorType write SetMajorType;
    property SubType: TGUID read GetSubType write SetSubType;
    property FormatType: TGUID read GetFormatType write SetFormatType;
  end;

  //******************************************************************************
  //
  //  TDSEnumMediaType Declaration
  //  Enum all Media Types availables on one Pin
  //
  //******************************************************************************

  TDSEnumMediaType = class(TObject)
  private
    FList: TList;
    function GetItem(Index: Integer): TDSMediaType;
    procedure SetItem(Index: Integer; Item: TDSMediaType);
    function GetMediaDescription(Index: Integer): string;
    function GetCount: Integer;
  public
    constructor Create; overload;
    constructor Create(Pin: IPin); overload;
    constructor Create(enum: IEnumMediaTypes); overload;
    constructor Create(FileName: TFileName); overload;
    destructor Destroy; override;
    procedure Assign(Pin: IPin); overload;
    procedure Assign(enum: IEnumMediaTypes); overload;
    procedure Assign(FileName: TFileName); overload;
    function Add(Item: TDSMediaType): Integer;
    procedure Clear;
    procedure Delete(Index: Integer);
    property Items[Index: Integer]: TDSMediaType read GetItem write SetItem;
    property MediaDescription[Index: Integer]: string read GetMediaDescription;
    property Count: Integer read GetCount;
  end;

  //******************************************************************************
  //
  //  TDSFilterConnector declaration
  //
  //******************************************************************************
  TOnFilterInGraph = procedure(sender: TComponent; connected: boolean) of
    object;

  TDSFilterConnector = class(TComponent)
  private
    FOnFilterInGraph: TOnFilterInGraph;
    FGraph: TDSGraph;
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetGraph(grf: TDSGraph); virtual;
    procedure DoOnFilterInGraph(connected: boolean); virtual;
  public
    BaseFilter: IBaseFilter;
    destructor Destroy; override;
    function IsFilterInGraph: boolean;
    function ShowPropertyPage(parent: TWinControl): boolean;
  published
    property Graph: TDSGraph read FGraph write SetGraph;
    property OnFilterInGraph: TOnFilterInGraph read FOnFilterInGraph write
      FOnFilterInGraph;
  end;

  //******************************************************************************
  //
  // TFilter declaration
  //
  //******************************************************************************
  TFilterProp = class(TPersistent)
  private
    FCategoryGUID: string;
    FCategoryName: string;
    FFilterGUID: string;
    FFilterName: string;
    FMoniker: string;
  published
    property Moniker: string read FMoniker write FMoniker stored True;
    property CategoryName: string read FCategoryName write FCategoryName;
    property FilterName: string read FFilterName write FFilterName;
    property CategoryGUID: string read FCategoryGUID write FCategoryGUID;
    property FilterGUID: string read FFilterGUID write FFilterGUID;
  end;

  TFilter = class(TDSFilterConnector)
  private
    FFilter: TFilterProp;
  protected
    procedure Loaded; override;
    procedure SetGraph(grf: TDSGraph); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;
  published
    property Filter: TFilterProp read FFilter write FFilter stored True;
  end;

  //******************************************************************************

implementation

//******************************************************************************
//
// TFilter implementation
//
//******************************************************************************

constructor TFilter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFilter := TFilterProp.Create;
end;

procedure TFilter.SetGraph(grf: TDSGraph);
begin
  FGraph := grf;
end;

procedure TFilter.Loaded;
var
  moniker: IMoniker;
begin
  inherited Loaded;
  if not (csdesigning in componentstate) then
  begin
    Moniker := HexToPersist(Filter.Moniker, IID_IMoniker) as IMoniker;
    if assigned(moniker) then
    begin
      Moniker.BindToObject(nil, nil, IID_IBaseFilter, BaseFilter);
      Moniker := nil;
    end;
    if assigned(Fgraph) then
      inherited SetGraph(FGraph);
  end;
end;

destructor TFilter.destroy;
begin
  BaseFilter := nil;
  FFilter.Free;
  inherited destroy;
end;

//******************************************************************************
//
//  TDSFilterConnector implementation
//
//******************************************************************************

destructor TDSFilterConnector.Destroy;
begin
  BaseFilter := nil;
  inherited Destroy;
end;

procedure TDSFilterConnector.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if ((AComponent = FGraph) and (Operation = opRemove)) then
    FGraph := nil;
end;

procedure TDSFilterConnector.SetGraph(grf: TDSGraph);
begin
  if csDesigning in ComponentState then
  begin
    if grf = FGraph then
      Exit;
    FGraph := grf;
  end
  else
  begin
    if assigned(FGraph) then
    begin
      FGraph.RemoveFilter(self);
      FGraph := nil;
    end;
    if assigned(grf) then
    begin
      FGraph := grf;
      FGraph.AddFilter(self);
    end;
  end;
end;

procedure TDSFilterConnector.DoOnFilterInGraph(connected: boolean);
begin
  if assigned(FOnFilterInGraph) then
    FOnFilterInGraph(self, connected);
end;

function TDSFilterConnector.IsFilterInGraph: boolean;
var
  FilterList: TDSFilterList;
begin
  Result := False;
  if not Assigned(FGraph) then
    Exit;
  if not FGraph.Connected then
    Exit;
  FilterList := TDSFilterList.Create(FGraph.GraphBuilder);
  if FilterList.IndexOf(BaseFilter) <> -1 then
    Result := True;
  FilterList.Free;
end;

function TDSFilterConnector.ShowPropertyPage(parent: TWinControl): boolean;
begin
  if ShowFilterPropertyPage(parent, BaseFilter) = S_OK then
    Result := True
  else
    Result := False;
end;

//******************************************************************************
//
// TDSVideoWindow implementation
//
//******************************************************************************

constructor TDSVideoWindow.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csDoubleClicks, csReflector];
  self.TabStop := True;
  self.Height := 120;
  self.Width := 160;
  self.color := $00100010;
  canvas.OnChanging := CaptureCanvas;
  canvas.OnChange := ReleaseCanvas;
end;

destructor TDSVideoWindow.Destroy;
begin
  inherited destroy;
end;

procedure TDSVideoWindow.WndProc(var Message: TMessage);
begin
  if ((Message.Msg = WM_CONTEXTMENU) and isFullScreen) then
  begin
    if assigned(PopupMenu) then
      if PopupMenu.AutoPopup then
      begin
        PopupMenu.Popup(mouse.CursorPos.X, mouse.CursorPos.Y);
        Message.Result := 1;
      end;
  end
  else
    inherited WndProc(Message);
end;

function TDSVideoWindow.FindVideoWindow: THandle;
begin
  Result := FindWindowEx(self.parent.Handle, 0, Pchar('VideoRenderer'),
    Pchar(name));
end;

procedure TDSVideoWindow.Loaded;
begin
  inherited Loaded;
  GetWindowInfo(self.Handle, FWindowInfo);
end;

procedure TDSVideoWindow.SetGraph(grf: TDSGraph);
begin
  if assigned(FGraph) then
    FGraph.FVW := nil;
  FGraph := grf;
  if assigned(FGraph) then
  begin
    FGraph.FVW := self;
    if VideoAvailable then
    begin
      with FGraph.VideoWindow do
      begin
        put_Owner(self.parent.Handle);
        put_Caption(Name);
        put_WindowStyle(FWindowInfo.dwStyle or WS_CHILD or WS_CLIPSIBLINGS);
        put_WindowStyleEx(FWindowInfo.dwExStyle);
        SetWindowPosition(self.Left, self.Top, self.Width, self.Height);
        put_MessageDrain(self.Handle);
      end;
    end;
  end;
end;

procedure TDSVideoWindow.ConstrainedResize(var MinWidth, MinHeight, MaxWidth,
  MaxHeight: Integer);
begin
  inherited ConstrainedResize(MinWidth, MinHeight, MaxWidth, MaxHeight);
  if VideoAvailable then
  begin
    FGraph.VideoWindow.SetWindowPosition(self.Left, self.Top, self.Width,
      self.Height);
  end;
end;

procedure TDSVideoWindow.Resize;
begin
  inherited Resize;
  if VideoAvailable then
  begin
    FGraph.VideoWindow.SetWindowPosition(self.Left, self.Top, self.Width,
      self.Height);
  end;
end;

procedure TDSVideoWindow.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if ((AComponent = FGraph) and (Operation = opRemove)) then
    Graph := nil;
end;

procedure TDSVideoWindow.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y:
  Integer);
begin
  if isfullscreen then
    inherited MouseUp(Button, Shift, mouse.CursorPos.X, mouse.CursorPos.Y)
  else
    inherited MouseUp(Button, Shift, X, Y)
end;

procedure TDSVideoWindow.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if isfullscreen then
    inherited MouseDown(Button, Shift, mouse.CursorPos.X, mouse.CursorPos.Y)
  else
    inherited MouseDown(Button, Shift, X, Y)
end;

procedure TDSVideoWindow.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if isfullscreen then
    inherited MouseMove(Shift, mouse.CursorPos.X, mouse.CursorPos.Y)
  else
    inherited MouseMove(Shift, X, Y)
end;

procedure TDSVideoWindow.CaptureCanvas(Sender: TObject);
var
  renderer: IBaseFilter;
  input: IPin;
  enum: IEnumPins;
  Overlay: IOverlay;
  wh: HWND;
  NewDC: HDC;
  colorkey: TColorKey;
  MyColor: TOverlayColor;
begin
  wh := FindVideoWindow;
  if wh <> 0 then
  begin
    NewDC := getdc(wh);
    self.Canvas.Handle := NewDC;
    if (FGraph.GraphBuilder.FindFilterByName('Video Renderer', renderer) = S_OK)
      then
    begin
      renderer.EnumPins(enum);
      enum.Next(1, input, nil);
      if (input.QueryInterface(IID_IOverlay, overlay) = S_OK) then
      begin
        overlay.GetDefaultColorKey(colorkey);
        MyColor.low := colorkey.LowColorValue;
        MyColor.hight := colorkey.HighColorValue;
        Canvas.Brush.Color := MyColor.color;
      end;
    end;
    releasedc(wh, NewDC);
  end;
end;

procedure TDSVideoWindow.ReleaseCanvas(Sender: TObject);
begin
  self.Canvas.Handle := 0;
end;

function TDSVideoWindow.VideoAvailable: boolean;
begin
  Result := False;
  if assigned(FGraph) then
    if assigned(FGraph.VideoWindow) then
      Result := True;
end;

function TDSVideoWindow.StartFullScreen: boolean;
begin
  Result := False;
  if VideoAvailable then
  begin
    with FGraph.VideoWindow do
    begin
      put_Owner(0);
      put_WindowStyle(FWindowInfo.dwStyle and not (WS_BORDER or WS_CAPTION or
        WS_THICKFRAME));
      put_WindowStyleEx(FWindowInfo.dwExStyle and not (WS_EX_CLIENTEDGE or
        WS_EX_STATICEDGE
        or WS_EX_WINDOWEDGE or WS_EX_DLGMODALFRAME) or WS_EX_TOPMOST);
      SetWindowPosition(0, 0, screen.Width, screen.Height);
      FIsFullScreen := True;
      Result := True;
    end;
  end;
end;

function TDSVideoWindow.StopFullScreen: boolean;
begin
  Result := False;
  if VideoAvailable then
  begin
    with FGraph.VideoWindow do
    begin
      put_Owner(self.Parent.Handle);
      put_WindowStyle(FWindowInfo.dwStyle or WS_CHILD or WS_CLIPSIBLINGS);
      put_WindowStyleEx(FWindowInfo.dwExStyle);
      SetWindowPosition(self.Left, self.Top, self.Width, self.Height);
      Result := True;
      FIsFullScreen := False;
      self.parent.SetFocus;
    end;
  end;
end;

//******************************************************************************
//
// TDSGraph implementation
//
//******************************************************************************

procedure TDSGraph.Connect;
var
  i, j: Integer;
  hr: HRESULT;
begin
  if FRotEnabled then
    SetRot(True);
  if FWMFRegister then
    SetWMFRegister(True);
  if FTMPFilterList.Count > 0 then
  begin
    for i := 0 to FTMPFilterList.Count - 1 do
    begin
      if assigned(TDSFilterConnector(FTMPFilterList.Items[i]).BaseFilter) then
      begin
        hr :=
          GraphBuilder.AddFilter(TDSFilterConnector(FTMPFilterList.Items[i]).BaseFilter,
          StringToOleStr(TDSFilterConnector(FTMPFilterList.Items[i]).name));
        if ((hr <> E_FAIL) and
          (hr <> E_OUTOFMEMORY) and
          (hr <> E_POINTER) and
          (hr <> HRESULT(VFW_E_CERTIFICATION_FAILURE)) and
          (hr <> HRESULT(VFW_E_DUPLICATE_NAME))) then
        begin
          FFilterList.Add(FTMPFilterList.Items[i]);
          TDSFilterConnector(FFilterList.Last).DoOnFilterInGraph(True);
        end;
      end;
    end;
    if FFilterList.Count > 0 then
      for i := 0 to FFilterList.Count - 1 do
      begin
        j := FTMPFilterList.IndexOf(FFilterList.Items[i]);
        if j <> -1 then
          FTMPFilterList.delete(j);
      end;
  end;
end;

procedure TDSGraph.Disconnect;
var
  i: Integer;
begin
  if not (csDesigning in ComponentState) then
  begin
    if RotEnabled then
      SetRot(False);
    if WMFRegister then
      SetWMFRegister(False);
    if not (csDesigning in ComponentState) then
      if FFilterList.Count > 0 then
        for i := 0 to FFilterList.Count - 1 do
        begin
          FTMPFilterList.Add(FFilterList.Items[i]);
          TDSFilterConnector(FFilterList.Items[i]).DoOnFilterInGraph(False);
        end;
    if not (csDestroying in ComponentState) then
      FFilterList.Clear;
  end;
end;

procedure TDSGraph.WndProc(var Msg: TMessage);
begin
  with Msg do
    if Msg = WM_GRAPHNOTIFY then
      try
        FDoEvent;
      except
        Application.HandleException(Self);
      end
    else
      Result := DefWindowProc(FHandle, Msg, wParam, lParam);
end;

constructor TDSGraph.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if not (csDesigning in ComponentState) then
  begin
{$WARN SYMBOL_DEPRECATED OFF}
    FHandle := AllocateHWnd(WndProc);
{$WARN SYMBOL_DEPRECATED ON}
    FFilterList := TList.Create;
    FTMPFilterList := TList.Create;
  end;
end;

destructor TDSGraph.Destroy;
begin
  if not (csDesigning in ComponentState) then
  begin
    FFilterList.Free;
    FTMPFilterList.Free;
{$WARN SYMBOL_DEPRECATED OFF}
    DeallocateHWnd(FHandle);
{$WARN SYMBOL_DEPRECATED ON}
  end;
  inherited Destroy;
end;

procedure TDSGraph.FDoEvent;
var
  hr: HRESULT;
  Event, Param1, Param2: LongInt;
begin
  if assigned(MediaEventEx) then
  begin
    hr := MediaEventEx.GetEvent(Event, Param1, Param2, 0);
    while (hr = S_OK) do
    begin
      MediaEventEx.FreeEventParams(Event, Param1, Param2);
      DoEvent(Event, Param1, Param2);
      hr := MediaEventEx.GetEvent(Event, Param1, Param2, 0);
    end;
  end;
end;

procedure TDSGraph.DoEvent(Event, Param1, Param2: longint);
begin
  if assigned(FOnDSEvent) then
    FOnDSEvent(self, Event, Param1, Param2);
  case Event of
    EC_BUFFERING_DATA: if assigned(FOnGraphBufferingData) then
        FOnGraphBufferingData(self, (Param1 = 1));
    EC_CLOCK_CHANGED: if assigned(FOnGraphClockChanged) then
        FOnGraphClockChanged(self);
    EC_COMPLETE: if assigned(FOnGraphComplete) then
        FOnGraphComplete(self, Param1, IBaseFilter(Param2));
    EC_DEVICE_LOST: if assigned(FOnGraphDeviceLost) then
        FOnGraphDeviceLost(self, IUnKnown(Param1), (Param2 = 1));
    EC_END_OF_SEGMENT: if assigned(FOnGraphEndOfSegment) then
        FOnGraphEndOfSegment(self, PReference_Time(Param1)^, Param2);
    EC_ERROR_STILLPLAYING: if assigned(FOnGraphErrorStillPlaying) then
        FOnGraphErrorStillPlaying(self, Param1);
    EC_ERRORABORT: if assigned(FOnGraphErrorAbort) then
        FOnGraphErrorAbort(self, Param1);
    EC_FULLSCREEN_LOST: if assigned(FOnGraphFullscreenLost) then
        FOnGraphFullscreenLost(self, IBaseFilter(Param2));
    EC_GRAPH_CHANGED: if assigned(FOnGraphChanged) then
        FOnGraphChanged(self);
    EC_OLE_EVENT: if assigned(FOnGraphOleEvent) then
        FOnGraphOleEvent(self, TBSTR(Param1), TBSTR(Param2));
    EC_OPENING_FILE: if assigned(FOnGraphOpeningFile) then
        FOnGraphOpeningFile(self, (Param1 = 1));
    EC_PALETTE_CHANGED: if assigned(FOnGraphPaletteChanged) then
        FOnGraphPaletteChanged(self);
    EC_PAUSED: if assigned(FOnGraphPaused) then
        FOnGraphPaused(self, Param1);
    EC_QUALITY_CHANGE: if assigned(FOnGraphQualityChange) then
        FOnGraphQualityChange(self);
    EC_SNDDEV_IN_ERROR: if assigned(FOnGraphSNDDevInError) then
        FOnGraphSNDDevInError(self, TSNDDEV_ERR(Param1), Param2);
    EC_SNDDEV_OUT_ERROR: if assigned(FOnGraphSNDDevOutError) then
        FOnGraphSNDDevOutError(self, TSNDDEV_ERR(Param1), Param2);
    EC_STEP_COMPLETE: if assigned(FOnGraphStepComplete) then
        FOnGraphStepComplete(self);
    EC_STREAM_CONTROL_STARTED: if assigned(FOnGraphStreamControlStarted) then
        FOnGraphStreamControlStarted(self, IPin(Param1), Param2);
    EC_STREAM_CONTROL_STOPPED: if assigned(FOnGraphStreamControlStopped) then
        FOnGraphStreamControlStopped(self, IPin(Param1), Param2);
    EC_STREAM_ERROR_STILLPLAYING: if assigned(FOnGraphStreamErrorStillPlaying)
      then
        FOnGraphStreamErrorStillPlaying(self, Param1, Param2);
    EC_STREAM_ERROR_STOPPED: if assigned(FOnGraphStreamErrorStopped) then
        FOnGraphStreamErrorStopped(self, Param1, Param2);
    EC_USERABORT: if assigned(FOnGraphUserAbort) then
        FOnGraphUserAbort(self);
    EC_VIDEO_SIZE_CHANGED: if assigned(FOnGraphVideoSizeChanged) then
        FOnGraphVideoSizeChanged(self, TVideoSize(Param1));
    EC_TIMECODE_AVAILABLE: if assigned(FOnGraphTimeCodeAvailable) then
        FOnGraphTimeCodeAvailable(self, IBaseFilter(Param1), Param2);
    EC_EXTDEVICE_MODE_CHANGE: if assigned(FOnGraphEXTDeviceModeChange) then
        FOnGraphEXTDeviceModeChange(self, Param1, Param2);
    EC_CLOCK_UNSET: if assigned(FOnGraphClockUnset) then
        FOnGraphClockUnset(self);
  end;
end;

function TDSGraph.Connected: boolean;
begin
  Result := (GraphBuilder <> nil);
end;

procedure TDSGraph.QueryInterfaces;
begin
  if Assigned(MediaEventEx) then
    MediaEventEx.SetNotifyFlags(0);
  MediaEventEx.SetNotifyWindow(FHandle, WM_GRAPHNOTIFY, ULONG(MediaEventEx));
  if assigned(FVW) then
    FVW.SetGraph(self);
end;

procedure TDSGraph.SetROT(value: boolean);
begin
  if connected then
    case value of
      True: AddGraphToROT(GraphBuilder, dwregister);
      False: RemoveGraphFromRot(dwregister);
    end;
end;

procedure TDSGraph.SetWMFRegister(value: boolean);
begin
  if connected then
    case value of
      True: WMCertificateAdd(self.GraphBuilder, FWMKeyProvider);
      False: WMCertificateRemove(self.GraphBuilder, FWMKeyProvider);
    end;
end;

procedure TDSGraph.DeleteFilters;
var
  FilterList: TDSFilterList;
  i, j: Integer;
  found: boolean;
begin
  if assigned(GraphBuilder) then
  begin
    if assigned(MediaControl) then
      MediaControl.Stop;
    FilterList := TDSFilterList.Create(GraphBuilder);
    if FilterList.Count > 0 then
      for j := 0 to FilterList.Count - 1 do
      begin
        found := False;
        if FFilterList.Count > 0 then
          for i := 0 to FFilterList.Count - 1 do
            if TDSFilterConnector(FFilterList.Items[i]).BaseFilter =
              FilterList.Items[j] then
            begin
              Found := True;
              break;
            end;
        if not Found then
          GraphBuilder.RemoveFilter(FilterList.Items[j]);
      end;
    FilterList.Free;
  end;
end;

procedure TDSGraph.AddFilter(filter: TDSFilterConnector);
var
  hr: HRESULT;
begin
  if connected then
  begin
    // ajouter le filtre a la liste réelle
    hr := GraphBuilder.AddFilter(Filter.BaseFilter,
      StringToOleStr(Filter.name));
    if ((hr <> E_FAIL) and
      (hr <> E_OUTOFMEMORY) and
      (hr <> E_POINTER) and
      (hr <> HRESULT(VFW_E_CERTIFICATION_FAILURE)) and
      (hr <> HRESULT(VFW_E_DUPLICATE_NAME))) then
    begin
      FFilterList.Add(filter);
      filter.DoOnFilterInGraph(True);
    end
    else
      FTMPFilterList.Add(filter)
  end
  else
  begin
    // ajouter le filtre a la liste temporaire
    FTMPFilterList.Add(filter)
  end;
end;

procedure TDSGraph.RemoveFilter(filter: TDSFilterConnector);
begin
  // retiter le filtre de la liste réelle ou temporaire
  if assigned(FFilterlist) then
    if FFilterlist.IndexOf(filter) <> -1 then
    begin
      FFilterlist.Remove(filter);
      filter.DoOnFilterInGraph(False);
    end;
  if assigned(FTMPFilterList) then
    if FTMPFilterlist.IndexOf(filter) <> -1 then
      FTMPFilterlist.Remove(filter);
end;

//******************************************************************************
//
// TDSFilterGraph2 implementation
//
//******************************************************************************

procedure TDSFilterGraph2.InitServerData;
const
  CServerData: TServerData = (
    ClassID: '{E436EBB3-524F-11CE-9F53-0020AF0BA770}'; // CLSID_FilterGraph
    IntfIID: '{36B73882-C2C8-11CF-8B46-00805F6CEF60}'; // IID_IFilterGraph2
    EventIID: '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData
end;

procedure TDSFilterGraph2.DoEvent(Event, Param1, Param2: longint);
begin
{$IFNDEF VER120}
  if assigned(FTB) then
    case Event of
      EC_COMPLETE: FTB.ReceiveEndOfStream;
      EC_CLOCK_CHANGED: FTB.Timer;
    end;
{$ENDIF}
  inherited DoEvent(Event, Param1, Param2);
end;

constructor TDSFilterGraph2.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //    Threaded := True; // default
end;

destructor TDSFilterGraph2.Destroy;
begin
  inherited Destroy;
end;

procedure TDSFilterGraph2.Connect;
var
  punk: IUnknown;
begin
  if FilterGraph2 = nil then
  begin
    punk := GetServer;
    FilterGraph2 := punk as IFilterGraph2;
    GraphBuilder := punk as IGraphBuilder; // compatibility
  end;
  inherited Connect;
end;

procedure TDSFilterGraph2.Disconnect;
begin
  if not (csDesigning in ComponentState) then
  begin
    if assigned(MediaEventEx) then
      MediaEventEx.SetNotifyFlags(AM_MEDIAEVENT_NONOTIFY);
    if assigned(MediaControl) then
      MediaControl.Stop;
    if FilterGraph2 <> nil then
    begin
      if RotEnabled then
        SetRot(False);
      if WMFRegister then
        SetWMFRegister(False);
      FilterGraph2 := nil;
      GraphBuilder := nil;
      MediaControl := nil;
      MediaEventEx := nil;
      VideoWindow := nil;
      BasicAudio := nil;
      BasicVideo2 := nil;
      MediaSeeking := nil;
      AMGraphStreams := nil;
      FilterChain := nil;
      FilterMapper2 := nil;
      GraphConfig := nil;
      GraphVersion := nil;
      MediaEventSink := nil;
      QueueCommand := nil;
      ResourceManager := nil;
      VideoFrameStep := nil;
    end;
  end;
  inherited disconnect;
end;

procedure TDSFilterGraph2.QueryInterfaces;
begin
  if FilterGraph2 <> nil then
  begin
    FilterGraph2.QueryInterface(IID_IMediaControl, MediaControl);
    FilterGraph2.QueryInterface(IID_IMediaEventEx, MediaEventEx);
    FilterGraph2.QueryInterface(IID_IVideoWindow, VideoWindow);
    FilterGraph2.QueryInterface(IID_IBasicAudio, BasicAudio);
    FilterGraph2.QueryInterface(IID_IBasicVideo2, BasicVideo2);
    FilterGraph2.QueryInterface(IID_IMediaSeeking, MediaSeeking);
    FilterGraph2.QueryInterface(IID_IAMGraphStreams, AMGraphStreams);
    FilterGraph2.QueryInterface(IID_IFilterChain, FilterChain);
    FilterGraph2.QueryInterface(IID_IFilterMapper2, FilterMapper2);
    FilterGraph2.QueryInterface(IID_IGraphConfig, GraphConfig);
    FilterGraph2.QueryInterface(IID_IGraphVersion, GraphVersion);
    FilterGraph2.QueryInterface(IID_IMediaEventSink, MediaEventSink);
    FilterGraph2.QueryInterface(IID_IQueueCommand, QueueCommand);
    FilterGraph2.QueryInterface(IID_IResourceManager, ResourceManager);
    FilterGraph2.QueryInterface(IID_IVideoFrameStep, VideoFrameStep);
  end;
  inherited QueryInterfaces;
{$IFNDEF VER120}
  if assigned(FTB) then
    FTB.SetGraph(self);
{$ENDIF}
end;

procedure TDSFilterGraph2.ReleaseInterfaces;
begin
  if Assigned(MediaEventEx) then
  begin
    MediaEventEx.SetNotifyFlags(AM_MEDIAEVENT_NONOTIFY);
    MediaEventEx.SetNotifyWindow(0, WM_GRAPHNOTIFY, ULONG(MediaEventEx));
  end;
  if assigned(MediaControl) then
    MediaControl.Stop;
  MediaControl := nil;
  MediaEventEx := nil;
  VideoWindow := nil;
  BasicAudio := nil;
  BasicVideo2 := nil;
  MediaSeeking := nil;
  AMGraphStreams := nil;
  FilterChain := nil;
  FilterMapper2 := nil;
  GraphConfig := nil;
  GraphVersion := nil;
  MediaEventSink := nil;
  QueueCommand := nil;
  ResourceManager := nil;
  VideoFrameStep := nil;
end;

procedure TDSFilterGraph2.ClearGraph;
begin
{$IFNDEF VER120}
  if assigned(GraphBuilder) then
  begin
    if assigned(FTB) then
      FTB.SetRate(1);
  end;
{$ENDIF}
  ReleaseInterfaces;
  DeleteFilters;
end;

//******************************************************************************
//
// TDSDVDGraph implementation
//
//******************************************************************************

procedure TDSDVDGraph.InitServerData;
const
  CServerData: TServerData = (
    ClassID: '{FCC152B7-F372-11D0-8E00-00C04FD7C08B}'; // CLSID_DvdGraphBuilder
    IntfIID: '{FCC152B6-F372-11d0-8E00-00C04FD7C08B}'; // IID_IDvdGraphBuilder
    EventIID: '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TDSDVDGraph.DoEvent(Event, Param1, Param2: longint);
var
  lcid: cardinal;
  achLang: array[0..MAX_PATH] of Char;
  tc: TDVD_TIMECODE;
  frate: Integer;
  hmsftc: TDVD_HMSF_TIMECODE;
begin
  inherited DoEvent(Event, Param1, Param2);
  case Event of
    EC_DVD_ANGLE_CHANGE: if Assigned(FOnDVDAngleChange) then
        FOnDVDAngleChange(self, Param1, Param2);
    EC_DVD_AUDIO_STREAM_CHANGE:
      begin
        if Assigned(FOnDVDAudioStreamChange) then
        begin
          DvdInfo2.GetAudioLanguage(Param1, lcid);
          GetLocaleInfo(lcid, LOCALE_SENGLANGUAGE, achLang, MAX_PATH);
          FOnDVDAudioStreamChange(self, Param1, lcid, string(achLang));
        end;
      end;
    EC_DVD_BUTTON_CHANGE: if Assigned(FOnDVDButtonChange) then
        FOnDVDButtonChange(self, Param1, Param2);
    EC_DVD_CHAPTER_AUTOSTOP: if Assigned(FOnDVDChapterAutoStop) then
        FOnDVDChapterAutoStop(self);
    EC_DVD_CHAPTER_START: if Assigned(FOnDVDChapterStart) then
        FOnDVDChapterStart(self, Param1);
    EC_DVD_CURRENT_TIME:
      begin
        if Assigned(FOnDVDCurrentTime) then
        begin
          tc := IntToTimeCode(Param1);
          case tc.FrameRateCode of
            1: frate := 25;
            3: frate := 30;
          else
            frate := 0;
          end;
          FOnDVDCurrentTime(self, tc.Hours1 + tc.Hours10 * 10, tc.Minutes1 +
            tc.Minutes10 * 10, tc.Seconds1 + tc.Seconds10 * 10, tc.Frames1 +
            tc.Frames10 * 10, frate);
        end;
      end;
    EC_DVD_DOMAIN_CHANGE:
      begin
        case Param1 of
          1: if Assigned(FOnDVDDomainFirstPlay) then
              FOnDVDDomainFirstPlay(self);
          2: if Assigned(FOnDVDDomainVideoManagerMenu) then
              FOnDVDDomainVideoManagerMenu(self);
          3: if Assigned(FOnDVDDomainVideoTitleSetMenu) then
              FOnDVDDomainVideoTitleSetMenu(self);
          4: if Assigned(FOnDVDDomainTitle) then
              FOnDVDDomainTitle(self);
          5: if Assigned(FOnDVDDomainStop) then
              FOnDVDDomainStop(self);
        end;
      end;
    EC_DVD_ERROR:
      begin
        case Param1 of
          1: if Assigned(FOnDVDErrorUnexpected) then
              FOnDVDErrorUnexpected(self);
          2: if Assigned(FOnDVDErrorCopyProtectFail) then
              FOnDVDErrorCopyProtectFail(self);
          3: if Assigned(FOnDVDErrorInvalidDVD1_0Disc) then
              FOnDVDErrorInvalidDVD1_0Disc(self);
          4: if Assigned(FOnDVDErrorInvalidDiscRegion) then
              FOnDVDErrorInvalidDiscRegion(self);
          5: if Assigned(FOnDVDErrorLowParentalLevel) then
              FOnDVDErrorLowParentalLevel(self);
          6: if Assigned(FOnDVDErrorMacrovisionFail) then
              FOnDVDErrorMacrovisionFail(self);
          7: if Assigned(FOnDVDErrorIncompatibleSystemAndDecoderRegions) then
              FOnDVDErrorIncompatibleSystemAndDecoderRegions(self);
          8: if Assigned(FOnDVDErrorIncompatibleDiscAndDecoderRegions) then
              FOnDVDErrorIncompatibleDiscAndDecoderRegions(self);
        end;
      end;
    EC_DVD_NO_FP_PGC: if Assigned(FOnDVDNoFP_PGC) then
        FOnDVDNoFP_PGC(self);
    EC_DVD_STILL_OFF: if Assigned(FOnDVDStillOff) then
        FOnDVDStillOff(self);
    EC_DVD_STILL_ON: if Assigned(FOnDVDStillOn) then
        FOnDVDStillOn(self, (Param1 = 1), Param2);
    EC_DVD_SUBPICTURE_STREAM_CHANGE:
      begin
        if Assigned(FOnDVDSubpictureStreamChange) then
        begin
          DvdInfo2.GetSubpictureLanguage(Param1, lcid);
          GetLocaleInfo(lcid, LOCALE_SENGLANGUAGE, achLang, MAX_PATH);
          FOnDVDSubpictureStreamChange(self, Param1, lcid, string(achLang));
        end;
      end;
    EC_DVD_TITLE_CHANGE: if Assigned(FOnDVDTitleChange) then
        FOnDVDTitleChange(self, Param1);
    EC_DVD_VALID_UOPS_CHANGE: if Assigned(FOnDVDValidUOPSChange) then
        FOnDVDValidUOPSChange(self, IntToUOPS(Param1));
    EC_DVD_WARNING:
      begin
        case Param1 of
          1: if Assigned(FOnDVDWarningInvalidDVD1_0Disc) then
              FOnDVDWarningInvalidDVD1_0Disc(self);
          2: if Assigned(FOnDVDWarningFormatNotSupported) then
              FOnDVDWarningFormatNotSupported(self);
          3: if Assigned(FOnDVDWarningIllegalNavCommand) then
              FOnDVDWarningIllegalNavCommand(self);
          4: if Assigned(FOnDVDWarningOpen) then
              FOnDVDWarningOpen(self);
          5: if Assigned(FOnDVDWarningSeek) then
              FOnDVDWarningSeek(self);
          6: if Assigned(FOnDVDWarningRead) then
              FOnDVDWarningRead(self);
        end;
      end;
    EC_DVD_PLAYBACK_RATE_CHANGE: if Assigned(FOnDVDPlaybackRateChange) then
        FOnDVDPlaybackRateChange(self, trunc(Param1 / 10000));
    EC_DVD_PARENTAL_LEVEL_CHANGE: if Assigned(FOnDVDParentalLevelChange) then
        FOnDVDParentalLevelChange(self, Param1);
    EC_DVD_PLAYBACK_STOPPED: if Assigned(FOnDVDPlaybackStopped) then
        FOnDVDPlaybackStopped(self);
    EC_DVD_ANGLES_AVAILABLE: if Assigned(FOnDVDAnglesAvailable) then
        FOnDVDAnglesAvailable(self, (Param1 = 1));
    EC_DVD_PLAYPERIOD_AUTOSTOP: if Assigned(FOnDVDPlayPeriodAutoStop) then
        FOnDVDPlayPeriodAutoStop(self);
    EC_DVD_BUTTON_AUTO_ACTIVATED: if Assigned(FOnDVDButtonAutoActivated) then
        FOnDVDButtonAutoActivated(self, Param1);
    EC_DVD_CMD_START: if Assigned(FOnDVDCMDStart) then
        FOnDVDCMDStart(self, Param1);
    EC_DVD_CMD_END: if Assigned(FOnDVDCMDEnd) then
        FOnDVDCMDEnd(self, Param1);
    EC_DVD_DISC_EJECTED: if Assigned(FOnDVDDiscEjected) then
        FOnDVDDiscEjected(self);
    EC_DVD_DISC_INSERTED: if Assigned(FOnDVDDiscInserted) then
        FOnDVDDiscInserted(self);
    EC_DVD_CURRENT_HMSF_TIME:
      begin
        if assigned(FOnDVDCurrentHMSFTime) then
        begin
          hmsftc := TDVD_HMSF_TIMECODE(param1);
          tc := IntToTimeCode(Param2);
          FOnDVDCurrentHMSFTime(self, hmsftc, tc);
        end;
      end;
    EC_DVD_KARAOKE_MODE: if assigned(FOnDVDKaraokeMode) then
        FOnDVDKaraokeMode(self, BOOL(Param1));
  end;
end;

constructor TDSDVDGraph.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TDSDVDGraph.Destroy;
begin
  inherited Destroy;
end;

procedure TDSDVDGraph.Connect;
var
  punk: IUnknown;
begin
  if DvdGraphBuilder = nil then
  begin
    punk := GetServer;
    DvdGraphBuilder := punk as IDvdGraphBuilder;
    DvdGraphBuilder.GetFiltergraph(GraphBuilder);
  end;
  inherited Connect;
end;

procedure TDSDVDGraph.Disconnect;
begin
  if DvdGraphBuilder <> nil then
  begin
    DvdGraphBuilder := nil;
    DvdControl2 := nil;
    DvdInfo2 := nil;
    AMLine21Decoder := nil;
  end;
  if Assigned(MediaEventEx) then
    MediaEventEx.SetNotifyFlags(AM_MEDIAEVENT_NONOTIFY);
  if GraphBuilder <> nil then
  begin
    GraphBuilder := nil;
    MediaControl := nil;
    MediaEventEx := nil;
    VideoWindow := nil;
    BasicAudio := nil;
    BasicVideo2 := nil;
    MediaSeeking := nil;
    AMGraphStreams := nil;
    FilterChain := nil;
    FilterMapper2 := nil;
    GraphConfig := nil;
    GraphVersion := nil;
    MediaEventSink := nil;
    QueueCommand := nil;
    ResourceManager := nil;
    VideoFrameStep := nil;
  end;
  inherited disconnect;
end;

procedure TDSDVDGraph.QueryInterfaces;
begin
  if DvdGraphBuilder <> nil then
  begin
    DvdGraphBuilder.GetDvdInterface(IID_IDvdControl2, DvdControl2);
    DvdGraphBuilder.GetDvdInterface(IID_IDvdInfo2, DvdInfo2);
    DvdGraphBuilder.GetDvdInterface(IID_IAMLine21Decoder, AMLine21Decoder);
  end;
  if GraphBuilder <> nil then
  begin
    GraphBuilder.QueryInterface(IID_IMediaControl, MediaControl);
    GraphBuilder.QueryInterface(IID_IMediaEventEx, MediaEventEx);
    GraphBuilder.QueryInterface(IID_IVideoWindow, VideoWindow);
    GraphBuilder.QueryInterface(IID_IBasicAudio, BasicAudio);
    GraphBuilder.QueryInterface(IID_IBasicVideo2, BasicVideo2);
    GraphBuilder.QueryInterface(IID_IMediaSeeking, MediaSeeking);
    GraphBuilder.QueryInterface(IID_IAMGraphStreams, AMGraphStreams);
    GraphBuilder.QueryInterface(IID_IFilterChain, FilterChain);
    GraphBuilder.QueryInterface(IID_IFilterMapper2, FilterMapper2);
    GraphBuilder.QueryInterface(IID_IGraphConfig, GraphConfig);
    GraphBuilder.QueryInterface(IID_IGraphVersion, GraphVersion);
    GraphBuilder.QueryInterface(IID_IMediaEventSink, MediaEventSink);
    GraphBuilder.QueryInterface(IID_IQueueCommand, QueueCommand);
    GraphBuilder.QueryInterface(IID_IResourceManager, ResourceManager);
    GraphBuilder.QueryInterface(IID_IVideoFrameStep, VideoFrameStep);
  end;
  inherited QueryInterfaces;
end;

procedure TDSDVDGraph.SaveBookmark(BookMarkFile: string);
const
  IID_IPersistStream: TGUID = '{00000109-0000-0000-C000-000000000046}';
var
  hr: HRESULT;
  Bookmark: IDvdState;
  pStorage: IStorage;
  pStream: IStream;
  PersistStream: IPersistStream;
begin
  if assigned(DVDInfo2) then
  begin
    DVDInfo2.GetState(Bookmark);
    StgCreateDocfile(StringToOleStr(BookMarkFile), STGM_CREATE or STGM_WRITE or
      STGM_SHARE_EXCLUSIVE, 0, pStorage);
    pStorage.CreateStream('BookMark', STGM_CREATE or STGM_WRITE or
      STGM_SHARE_EXCLUSIVE, 0, 0, pStream);
    hr := Bookmark.QueryInterface(IID_IPersistStream, PersistStream);
    if (SUCCEEDED(hr)) then
    begin
      OleSaveToStream(PersistStream, pStream);
      PersistStream := nil;
    end
    else
    begin
      PersistStream := nil;
      Exit;
    end;
  end;
end;

procedure TDSDVDGraph.RestoreBookmark(BookMarkFile: string);
var
  pStorage: IStorage;
  pStream: IStream;
  pBookmark: IDvdState;
  hr: HRESULT;
  obj: IDVDCmd;
begin
  if assigned(DVDControl2) then
  begin
    StgOpenStorage(StringToOleStr(BookMarkFile), nil, STGM_READ or
      STGM_SHARE_EXCLUSIVE, nil, 0, pStorage);
    pStorage.OpenStream('BookMark', nil, STGM_READ or STGM_SHARE_EXCLUSIVE, 0,
      pStream);
    OleLoadFromStream(pStream, IID_IDvdState, pBookmark);
    hr := DVDControl2.SetState(pBookmark, DVD_CMD_FLAG_None, obj);
    if not (failed(hr)) then
    begin
      obj.WaitForEnd;
      obj := nil;
    end;
  end;
end;

//******************************************************************************
//
// TDSCaptureGraph implementation
//
//******************************************************************************

procedure TDSCaptureGraph.InitServerData;
begin
  inherited InitServerData;
end;

constructor TDSCaptureGraph.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TDSCaptureGraph.Destroy;
begin
  inherited Destroy;
end;

procedure TDSCaptureGraph.Connect;
begin
  inherited Connect;
  if CaptureGraphBuilder2 = nil then
  begin
    CoCreateInstance(CLSID_CaptureGraphBuilder2, nil, CLSCTX_INPROC_SERVER,
      IID_ICaptureGraphBuilder2, CaptureGraphBuilder2);
    CaptureGraphBuilder2.SetFiltergraph(FilterGraph2);
  end;
end;

procedure TDSCaptureGraph.Disconnect;
begin
  if CaptureGraphBuilder2 <> nil then
  begin
    CaptureGraphBuilder2 := nil;
  end;
  inherited Disconnect;
end;

procedure TDSCaptureGraph.QueryInterfaces;
begin
  inherited QueryInterfaces;
end;

procedure TDSCaptureGraph.ReleaseInterfaces;
begin
  inherited ReleaseInterfaces;
end;

//******************************************************************************
//
// TDSSysDevEnum implementation
//
//******************************************************************************

procedure TDSSysDevEnum.GetCat(catlist: TList; CatGUID: TGUID);
var
  SysDevEnum: ICreateDevEnum;
  EnumCat: IEnumMoniker;
  Moniker: IMoniker;
  Fetched: ULONG;
  PropBag: IPropertyBag;
  Name: olevariant;
  hr: HRESULT;
  i: Integer;
begin
  if catList.Count > 0 then
    for i := 0 to (catList.Count - 1) do
      if assigned(catList.Items[i]) then
        Dispose(catList.Items[i]);
  catList.Clear;
  CocreateInstance(CLSID_SystemDeviceEnum, nil, CLSCTX_INPROC,
    IID_ICreateDevEnum, SysDevEnum);
  hr := SysDevEnum.CreateClassEnumerator(CatGUID, EnumCat, 0);
  if (hr = S_OK) then
  begin
    while (EnumCat.Next(1, Moniker, @Fetched) = S_OK) do
    begin
      Moniker.BindToStorage(nil, nil, IID_IPropertyBag, PropBag);
      new(ACategory);
      PropBag.Read('FriendlyName', Name, nil);
      ACategory^.FriendlyName := Name;
      if (PropBag.Read('CLSID', Name, nil) = S_OK) then
        ACategory^.CLSID := StringToGUID(Name)
      else
        ACategory^.CLSID := GUID_NULL;
      ACategory^.Moniker := PersistToHex(Moniker);
      catlist.Add(ACategory);
      PropBag := nil;
      Moniker := nil;
    end;
  end;
  EnumCat := nil;
  SysDevEnum := nil;
end;

constructor TDSSysDevEnum.Create;
begin
  FCategories := TList.Create;
  FFilters := TList.Create;
  getcat(FCategories, CLSID_ActiveMovieCategories);
end;

constructor TDSSysDevEnum.create(guid: TGUID);
begin
  FCategories := TList.Create;
  FFilters := TList.Create;
  getcat(FCategories, CLSID_ActiveMovieCategories);
  SelectGUIDCategory(guid);
end;

destructor TDSSysDevEnum.Destroy;
var
  i: Integer;
begin
  inherited Destroy;
  if FCategories.Count > 0 then
    for i := 0 to (FCategories.Count - 1) do
      if assigned(FCategories.Items[i]) then
        Dispose(FCategories.items[i]);
  FCategories.Clear;
  FreeAndNil(FCategories);
  if FFilters.Count > 0 then
    for i := 0 to (FFilters.Count - 1) do
      if assigned(FFilters.Items[i]) then
        Dispose(FFilters.Items[i]);
  FFilters.Clear;
  FreeAndNil(FFilters);
end;

function TDSSysDevEnum.GetCategory(item: Integer): TDSFilCatNode;
var
  PCategory: PDSFilCatNode;
begin
  PCategory := FCategories.Items[item];
  Result := PCategory^;
end;

function TDSSysDevEnum.GetFilter(item: Integer): TDSFilCatNode;
var
  PCategory: PDSFilCatNode;
begin
  PCategory := FFilters.Items[item];
  Result := PCategory^;
end;

function TDSSysDevEnum.GetCountCategories: Integer;
begin
  Result := FCategories.Count;
end;

function TDSSysDevEnum.GetCountFilters: Integer;
begin
  Result := FFilters.Count;
end;

procedure TDSSysDevEnum.SelectGUIDCategory(GUID: TGUID);
begin
  FGUID := GUID;
  getcat(FFilters, FGUID);
end;

procedure TDSSysDevEnum.SelectIndexCategory(index: Integer);
begin
  SelectGUIDCategory(Categories[index].CLSID);
end;

function TDSSysDevEnum.GetBaseFilterByIndex(index: Integer): IBaseFilter;
var
  SysDevEnum: ICreateDevEnum;
  EnumCat: IEnumMoniker;
  Moniker: IMoniker;
begin
  Result := nil;
  if ((index < CountFilters) and (index >= 0)) then
  begin
    CocreateInstance(CLSID_SystemDeviceEnum, nil, CLSCTX_INPROC,
      IID_ICreateDevEnum, SysDevEnum);
    SysDevEnum.CreateClassEnumerator(FGUID, EnumCat, 0);
    EnumCat.Skip(index);
    EnumCat.Next(1, Moniker, nil);
    Moniker.BindToObject(nil, nil, IID_IBaseFilter, Result);
    EnumCat.Reset;
    SysDevEnum := nil;
    EnumCat := nil;
    Moniker := nil;
  end
end;

function TDSSysDevEnum.GetBaseFilterByGUID(GUID: TGUID): IBaseFilter;
var
  i: Integer;
begin
  Result := nil;
  if countFilters > 0 then
    for i := 0 to CountFilters - 1 do
      if IsEqualGUID(GUID, Filters[i].CLSID) then
      begin
        Result := GetBaseFilterByIndex(i);
        Exit;
      end;
end;

//******************************************************************************
//
// TDSTrackBar implementation
//
//******************************************************************************
{$IFNDEF VER120}

constructor TDSTrackBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$WARN SYMBOL_DEPRECATED OFF}
  FWindowHandle := AllocateHWnd(WndProc2);
{$WARN SYMBOL_DEPRECATED ON}
  FInterval := 0;
  ThumbLength := 15;
  Height := 25;
  if assigned(FGRAPH) then
    SetGraph(FGRAPH);
  Settimerenabled(False);
end;

destructor TDSTrackBar.Destroy;
begin
  KillTimer(FWindowHandle, 1);
{$WARN SYMBOL_DEPRECATED OFF}
  DeallocateHWnd(FWindowHandle);
{$WARN SYMBOL_DEPRECATED ON}
  inherited Destroy;
end;

procedure TDSTrackBar.WndProc2(var Msg: TMessage);
begin
  with Msg do
    if Msg = WM_TIMER then
      try
        Timer;
      except
        Application.HandleException(Self);
      end
    else
      Result := DefWindowProc(FWindowHandle, Msg, wParam, lParam);
end;

procedure TDSTrackBar.UpdateTimer;
var
  y: int64;
begin
  if SeekingAvailable then
  begin
    KillTimer(FWindowHandle, 1);
    FGraph.MediaSeeking.GetDuration(y);
    FInterval := round((y * 0.0001) / (max * rate));
    if (FInterval <> 0) and FTimerEnable then
      if SetTimer(FWindowHandle, 1, FInterval, nil) = 0 then
        raise EOutOfResources.Create(SNoTimers);
  end;
end;

procedure TDSTrackBar.SetTimerEnabled(Value: Boolean);
begin
  if (Value <> FTimerEnable) then
  begin
    FTimerEnable := Value;
    UpdateTimer;
  end;
end;

procedure TDSTrackBar.Timer;
var
  x, y: int64;
begin
  if SeekingAvailable then
  begin
    FGraph.MediaSeeking.GetCurrentPosition(x);
    FGraph.MediaSeeking.GetDuration(y);
    SelStart := 0;
    SelEnd := round((x * max) / (y));
  end;
end;

procedure TDSTrackBar.Changed;
var
  SStart, SStop, y: int64;
begin
  inherited Changed;
  if SeekingAvailable then
  begin
    FGraph.MediaSeeking.GetDuration(y);
    SStart := round((Position * y) / max);
    FGraph.MediaSeeking.SetPositions(SStart, AM_SEEKING_AbsolutePositioning,
      SStop, AM_SEEKING_NoPositioning);
    Timer;
  end;
end;

procedure TDSTrackBar.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if ((AComponent = FGraph) and (Operation = opRemove)) then
    FGraph := nil;
end;

procedure TDSTrackBar.SetGraph(grf: TDSFilterGraph2);
var
  duration, SStart, SStop: int64;
begin
  if assigned(FGraph) then
    FGraph.FTB := nil;
  FGraph := grf;
  if assigned(FGraph) then
  begin
    FGraph.FTB := self;
    if SeekingAvailable then
    begin
      if ([CanSeekAbsolute, CanGetDuration] <= Capabilities) then
      begin
        SelStart := 0;
        Min := 0;
        FGraph.MediaSeeking.GetDuration(duration);
        SStart := 0;
        SStop := 0;
        FGraph.MediaSeeking.SetPositions(SStart, AM_SEEKING_AbsolutePositioning,
          SStop, AM_SEEKING_NoPositioning);
        Enabled := True;
        position := 0;
        SetTimerEnabled(True);
        UpdateTimer;
      end
      else
      begin
        SetTimerEnabled(False);
        SelEnd := 0;
        Enabled := False;
      end;
    end;
  end;
end;

function TDSTrackBar.SeekingAvailable: boolean;
begin
  Result := False;
  if assigned(FGraph) then
    if assigned(FGraph.MediaSeeking) then
      Result := True;
end;

function TDSTrackBar.GetCapabilities: TDSAMSeekingKind;
begin
  Result := [];
  if SeekingAvailable then
    FGraph.MediaSeeking.GetCapabilities(PULONG(@Result)^);
end;

function TDSTrackBar.GetRate: double;
begin
  Result := 0;
  if SeekingAvailable then
    FGraph.MediaSeeking.GetRate(Result);
end;

procedure TDSTrackBar.SetRate(rate: Double);
begin
  if (SeekingAvailable and (rate <> 0)) then
  begin
    FGraph.MediaSeeking.SetRate(rate);
    UpdateTimer;
  end;

end;

procedure TDSTrackBar.ReceiveEndOfStream;
begin
  FGraph.MediaControl.Stop;
  Position := 0;
  SelEnd := 0;
end;
{$ENDIF}
//******************************************************************************
//
//  TDSMediaType implementation
//
//******************************************************************************

destructor TDSMediaType.Destroy;
begin
  FreeMediaType(AMMediaType);
  dispose(AMMediaType);
  inherited Destroy;
end;

// copy constructor does a deep copy of the format block

constructor TDSMediaType.Create;
begin
  InitMediaType;
end;

constructor TDSMediaType.Create(majortype: TGUID);
begin
  InitMediaType;
  AMMediaType.majortype := majortype;
end;

constructor TDSMediaType.Create(mediatype: PAM_MEDIA_TYPE);
begin
  InitMediaType;
  CopyMediaType(AMMediaType, mediatype);
end;

constructor TDSMediaType.Create(MTClass: TDSMediaType);
begin
  InitMediaType;
  CopyMediaType(AMMediaType, MTClass.AMMediaType);
end;

// copy MTClass.AMMediaType to current AMMediaType

procedure TDSMediaType.Assign(MTClass: TDSMediaType);
begin
  if (MTClass <> self) then
  begin
    FreeMediaType(self.AMMediaType);
    CopyMediaType(self.AMMediaType, MTClass.AMMediaType);
  end;
end;

// this class inherits publicly from AM_MEDIA_TYPE so the compiler could generate
// the following assignment operator itself, however it could introduce some
// memory conflicts and leaks in the process because the structure contains
// a dynamically allocated block (pbFormat) which it will not copy correctly

procedure TDSMediaType.Assign(mediatype: PAM_MEDIA_TYPE);
begin
  if (mediatype <> self.AMMediaType) then
  begin
    FreeMediaType(self.AMMediaType);
    CopyMediaType(self.AMMediaType, mediatype);
  end;
end;

function TDSMediaType.Equal(MTClass: TDSMediaType): boolean;
begin
  // I don't believe we need to check sample size or
  // temporal compression flags, since I think these must
  // be represented in the type, subtype and format somehow. They
  // are pulled out as separate flags so that people who don't understand
  // the particular format representation can still see them, but
  // they should duplicate information in the format block.
  Result := ((IsEqualGUID(AMMediaType.majortype, MTClass.AMMediaType.majortype)
    = True) and
    (IsEqualGUID(AMMediaType.subtype, MTClass.AMMediaType.subtype) = True) and
    (IsEqualGUID(AMMediaType.formattype, MTClass.AMMediaType.formattype) = True)
      and
    (AMMediaType.cbFormat = MTClass.AMMediaType.cbFormat) and
    ((AMMediaType.cbFormat = 0) or
    (CompareMem(AMMediaType.pbFormat, MTClass.AMMediaType.pbFormat,
      AMMediaType.cbFormat))));
end;

// Check to see if they are equal

function TDSMediaType.NotEqual(MTClass: TDSMediaType): boolean;
begin
  if (self = MTClass) then
    Result := False
  else
    Result := True;
end;

// By default, TDSMediaType objects are initialized with a major type of GUID_NULL.
// Call this method to determine whether the object has been correctly initialized.

function TDSMediaType.IsValid: boolean;
begin
  Result := not IsEqualGUID(AMMediaType.majortype, GUID_NULL);
end;

// Determines if the samples have a fixed size or a variable size.

function TDSMediaType.IsFixedSize: boolean;
begin
  Result := AMMediaType.bFixedSizeSamples;
end;

// Determines if the stream uses temporal compression.

function TDSMediaType.IsTemporalCompressed: boolean;
begin
  Result := AMMediaType.bTemporalCompression;
end;

// If the sample size is fixed, returns the sample size in bytes. Otherwise,
// returns zero.

function TDSMediaType.GetSampleSize: ULONG;
begin
  if IsFixedSize then
    Result := AMMediaType.lSampleSize
  else
    Result := 0;
end;

// If value of sz is zero, the media type uses variable sample sizes. Otherwise,
// the sample size is fixed at sz bytes.

procedure TDSMediaType.SetSampleSize(SZ: ULONG);
begin
  if (sz = 0) then
  begin
    SetVariableSize;
  end
  else
  begin
    AMMediaType.bFixedSizeSamples := True;
    AMMediaType.lSampleSize := sz;
  end;
end;

// Specifies that samples do not have a fixed size.

procedure TDSMediaType.SetVariableSize;
begin
  AMMediaType.bFixedSizeSamples := False;
end;

// Specifies whether samples are compressed using temporal compression

procedure TDSMediaType.SetTemporalCompression(bCompressed: boolean);
begin
  AMMediaType.bTemporalCompression := bCompressed;
end;

// Retrieves a pointer to the format block.

function TDSMediaType.Format: pointer;
begin
  Result := AMMediaType.pbFormat;
end;

//Retrieves the length of the format block.

function TDSMediaType.FormatLength: ULONG;
begin
  Result := AMMediaType.cbFormat;
end;

function TDSMediaType.SetFormat(pFormat: pointer; length: ULONG): boolean;
begin
  if (nil = AllocFormatBuffer(length)) then
  begin
    Result := False;
    Exit;
  end;
  Assert(AMMediatype.pbFormat <> nil);
  CopyMemory(AMMediatype.pbFormat, pFormat, length);
  Result := True;
end;

// reset the format buffer

procedure TDSMediaType.ResetFormatBuffer;
begin
  if (AMMediaType.cbFormat <> 0) then
    CoTaskMemFree(AMMediaType.pbFormat);
  AMMediaType.cbFormat := 0;
  AMMediaType.pbFormat := nil;
end;

// allocate length bytes for the format and return a read/write pointer
// If we cannot allocate the new block of memory we return NULL leaving
// the original block of memory untouched (as does ReallocFormatBuffer)

function TDSMediaType.AllocFormatBuffer(length: ULONG): pointer;
var
  pNewFormat: pointer;
begin
  Assert(length <> 0);

  // do the types have the same buffer size
  if (AMMediaType.cbFormat = length) then
  begin
    Result := AMMediaType.pbFormat;
    Exit;
  end;

  // allocate the new format buffer
  pNewFormat := CoTaskMemAlloc(length);
  if (pNewFormat = nil) then
  begin
    if (length <= AMMediaType.cbFormat) then
    begin
      Result := AMMediatype.pbFormat; //reuse the old block anyway.
      Exit;
    end
    else
    begin
      Result := nil;
      Exit;
    end;
  end;

  // delete the old format
  if (AMMediaType.cbFormat <> 0) then
  begin
    Assert(AMMediaType.pbFormat <> nil);
    CoTaskMemFree(AMMediaType.pbFormat);
  end;

  AMMediaType.cbFormat := length;
  AMMediaType.pbFormat := pNewFormat;
  Result := AMMediaType.pbFormat;
end;

// reallocate length bytes for the format and return a read/write pointer
// to it. We keep as much information as we can given the new buffer size
// if this fails the original format buffer is left untouched. The caller
// is responsible for ensuring the size of memory required is non zero

function TDSMediaType.ReallocFormatBuffer(length: ULONG): pointer;
var
  pNewFormat: pointer;
begin
  Assert(length <> 0);

  // do the types have the same buffer size
  if (AMMediaType.cbFormat = length) then
  begin
    Result := AMMediaType.pbFormat;
    Exit;
  end;

  // allocate the new format buffer
  pNewFormat := CoTaskMemAlloc(length);
  if (pNewFormat = nil) then
  begin
    if (length <= AMMediaType.cbFormat) then
    begin
      Result := AMMediaType.pbFormat; //reuse the old block anyway.
      Exit;
    end
    else
    begin
      Result := nil;
      Exit;
    end;
  end;

  // copy any previous format (or part of if new is smaller)
  // delete the old format and replace with the new one
  if AMMediaType.cbFormat <> 0 then
  begin
    Assert(AMMediaType.pbFormat <> nil);
    CopyMemory(pNewFormat, AMMediaType.pbFormat, min(length,
      AMMediaType.cbFormat));
    CoTaskMemFree(AMMediaType.pbFormat);
  end;

  AMMediaType.cbFormat := length;
  AMMediaType.pbFormat := pNewFormat;
  Result := pNewFormat;
end;

// initialise a media type structure

procedure TDSMediaType.InitMediaType;
begin
  new(AMMediaType);
  ZeroMemory(AMMediaType, sizeof(TAM_MEDIA_TYPE));
  AMMediaType.lSampleSize := 1;
  AMMediaType.bFixedSizeSamples := True;
end;

//Determines if this media type matches a partially specified media type.

function TDSMediaType.MatchesPartial(ppartial: TDSMediaType): boolean;
begin
  if (not IsEqualGUID(ppartial.AMMediaType.majortype, GUID_NULL) and
    not IsEqualGUID(AMMediaType.majortype, ppartial.AMMediaType.majortype)) then
  begin
    Result := False;
    Exit;
  end;
  if (not IsEqualGUID(ppartial.AMMediaType.subtype, GUID_NULL) and
    not IsEqualGUID(AMMediaType.subtype, ppartial.AMMediaType.subtype)) then
  begin
    Result := False;
    Exit;
  end;

  if not IsEqualGUID(ppartial.AMMediaType.formattype, GUID_NULL) then
  begin
    // if the format block is specified then it must match exactly
    if not IsEqualGUID(AMMediaType.formattype, ppartial.AMMediaType.formattype)
      then
    begin
      Result := False;
      Exit;
    end;
    if AMMediaType.cbFormat <> ppartial.AMMediaType.cbFormat then
    begin
      Result := False;
      Exit;
    end;
    if ((AMMediaType.cbFormat <> 0) and
       (CompareMem(AMMediaType.pbFormat, ppartial.AMMediaType.pbFormat,
        AMMediaType.cbFormat) <> False)) then
    begin
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

// a partially specified media type can be passed to IPin::Connect
// as a constraint on the media type used in the connection.
// the type, subtype or format type can be null.

function TDSMediaType.IsPartiallySpecified: boolean;
begin
  Result := IsEqualGUID(AMMediaType.majortype, GUID_NULL) or
            IsEqualGUID(AMMediaType.formattype, GUID_NULL);
end;

function TDSMediaType.GetMajorType: TGUID;
begin
  Result := AMMediaType.majortype;
end;

procedure TDSMediaType.SetMajorType(MT: TGUID);
begin
  AMMediaType.majortype := MT;
end;

function TDSMediaType.GetSubType: TGUID;
begin
  Result := AMMediaType.subtype;
end;

procedure TDSMediaType.SetSubType(ST: TGUID);
begin
  AMMediaType.subtype := ST;
end;

// set the type of the media type format block, this type defines what you
// will actually find in the format pointer. For example FORMAT_VideoInfo or
// FORMAT_WaveFormatEx. In the future this may be an interface pointer to a
// property set. Before sending out media types this should be filled in.

procedure TDSMediaType.SetFormatType(const GUID: TGUID);
begin
  AMMediaType.formattype := GUID;
end;

function TDSMediaType.GetFormatType: TGUID;
begin
  Result := AMMediaType.formattype;
end;

//******************************************************************************
//
//  TDSEnumMediaType Implementation
//
//******************************************************************************

constructor TDSEnumMediaType.Create;
begin
  FList := TList.Create;
end;

constructor TDSEnumMediaType.Create(Pin: IPin);
var
  EnumMT: IEnumMediaTypes;
  hr: HRESULT;
begin
  FList := TList.Create;
  Assert(pin <> nil, 'IPin not assigned');
  hr := pin.EnumMediaTypes(EnumMT);
  if (hr <> S_OK) then
    Exit;
  Create(ENumMT);
end;

constructor TDSEnumMediaType.Create(enum: IEnumMediaTypes);
var
  pmt: PAM_Media_Type;
begin
  if (FList = nil) then
    FList := TList.Create;
  Assert(enum <> nil, 'IEnumMediaType not assigned');
  while (enum.Next(1, pmt, nil) = S_OK) do
  begin
    FList.Add(TDSMediaType.Create(pmt));
  end;
end;

constructor TDSEnumMediaType.Create(FileName: TFileName);
begin
  FList := TList.Create;
  Assign(FileName);
end;

destructor TDSEnumMediaType.Destroy;
begin
  Clear;
  FList.Free;
end;

procedure TDSEnumMediaType.Assign(Pin: IPin);
var
  EnumMT: IEnumMediaTypes;
  hr: HRESULT;
begin
  Clear;
  Assert(pin <> nil, 'IPin not assigned');
  hr := pin.EnumMediaTypes(EnumMT);
  if (hr <> S_OK) then
    Exit;
  Assign(ENumMT);
end;

procedure TDSEnumMediaType.Assign(enum: IEnumMediaTypes);
var
  pmt: PAM_Media_Type;
begin
  if (count <> 0) then
    Clear;
  Assert(enum <> nil, 'IEnumMediaType not assigned');
  while (enum.Next(1, pmt, nil) = S_OK) do
  begin
    FList.Add(TDSMediaType.Create(pmt));
  end;
end;

procedure TDSEnumMediaType.Assign(FileName: TFileName);
var
  MediaDet: IMediaDet;
  KeyProvider: TWMKeyProvider;
  hr: HRESULT;
  Streams: LongInt;
  i: longint;
  MediaType: TAM_Media_Type;
begin
  Clear;
  hr := CoCreateInstance(CLSID_MediaDet, nil, CLSCTX_INPROC, IID_IMediaDet,
    MediaDet);
  Assert(hr = S_OK, 'Media Detector not available');
  WMCertificateAdd(IFilterGraph(MediaDet), KeyProvider);
  hr := MediaDet.put_Filename(FileName);
  if hr <> S_OK then
  begin
    MediaDet := nil;
    Exit;
  end;
  MediaDet.get_OutputStreams(Streams);
  if streams > 0 then
  begin
    for i := 0 to (streams - 1) do
    begin
      MediaDet.put_CurrentStream(i);
      MediaDet.get_StreamMediaType(MediaType);
      FList.Add(TDSMediaType.Create(@MediaType));
    end;
  end;
  WMCertificateRemove(IFilterGraph(MediaDet), KeyProvider);
  MediaDet := nil;
end;

function TDSEnumMediaType.GetItem(Index: Integer): TDSMediaType;
begin
  Result := TDSMediaType(Flist.Items[index]);
end;

function TDSEnumMediaType.GetMediaDescription(Index: Integer): string;
begin
  Result := '';
  if ((index < count) and (index > -1)) then
    Result :=
      GetMediaTypeDescription(TDSMediaType(Flist.Items[index]).AMMediaType^);
end;

procedure TDSEnumMediaType.SetItem(Index: Integer; Item: TDSMediaType);
begin
  TDSMediaType(Flist.Items[index]).Assign(item);
end;

function TDSEnumMediaType.GetCount: Integer;
begin
  Assert(FList <> nil, 'TDSEnumMediaType not created');
  if FList <> nil then
    Result := FList.Count
  else
    Result := 0;
end;

function TDSEnumMediaType.Add(Item: TDSMediaType): Integer;
begin
  Result := FList.Add(Item);
end;

procedure TDSEnumMediaType.Clear;
var
  i: Integer;
begin
  if count <> 0 then
    for i := 0 to (count - 1) do
    begin
      if (FList.Items[i] <> nil) then
        TDSMediaType(FList.Items[i]).Free;
    end;
  FList.Clear;
end;

procedure TDSEnumMediaType.Delete(Index: Integer);
begin
  if (FList.Items[index] <> nil) then
    TDSMediaType(FList.Items[index]).Free;
  FList.Delete(index);
end;

//******************************************************************************
//
//  TDSFilterList implementation
//
//******************************************************************************

constructor TDSFilterList.Create(FilterGraph: IFilterGraph);
begin
  inherited Create;
  Graph := FilterGraph;
  Update;
end;

destructor TDSFilterList.Destroy;
begin
  inherited Destroy;
end;

procedure TDSFilterList.Update;
var
  EnumFilters: IEnumFilters;
  Filter: IBaseFilter;
begin
  if assigned(Graph) then
    Graph.EnumFilters(EnumFilters);
  while (EnumFilters.Next(1, Filter, nil) = S_OK) do
    add(Filter);
  EnumFilters := nil;
end;

procedure TDSFilterList.Assign(FilterGraph: IFilterGraph);
begin
  Clear;
  Graph := FilterGraph;
  Update;
end;

function TDSFilterList.GetFilter(Index: Integer): IBaseFilter;
begin
  Result := get(index) as IBaseFilter;
end;

procedure TDSFilterList.PutFilter(Index: Integer; Item: IBaseFilter);
begin
  put(index, Item);
end;

function TDSFilterList.First: IBaseFilter;
begin
  Result := GetFilter(0);
end;

function TDSFilterList.IndexOf(Item: IBaseFilter): Integer;
begin
  Result := inherited IndexOf(Item);
end;

function TDSFilterList.Add(Item: IBaseFilter): Integer;
begin
  Result := inherited Add(Item);
end;

procedure TDSFilterList.Insert(Index: Integer; Item: IBaseFilter);
begin
  inherited Insert(index, item);
end;

function TDSFilterList.Last: IBaseFilter;
begin
  Result := inherited Last as IBaseFilter;
end;

function TDSFilterList.Remove(Item: IBaseFilter): Integer;
begin
  Result := inherited Remove(Item);
end;

function TDSFilterList.GetFilterInfo(index: Integer): TFilterInfo;
begin
  if assigned(items[index]) then
    items[index].QueryFilterInfo(Result);
end;

end.

