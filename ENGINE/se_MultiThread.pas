{$I defs.inc}

unit se_MultiThread;

interface

type
  threadfunc_t = function(p: pointer): integer; stdcall;

type
  TDThread = class;

  threadinfo_t = record
    thread: TDThread;
  end;
  Pthreadinfo_t = ^threadinfo_t;

  TDThread = class
  private
    suspended: boolean;
  protected
    ffunc: threadfunc_t;
    fparms: Pointer;
    fid: Integer;
    info: threadinfo_t;
    fstatus: integer;
    fterminated: boolean;
    finterval: integer;
  public
    constructor Create(const func: threadfunc_t = nil);
    destructor Destroy; override;
    procedure Activate(const parms: pointer); overload;
    procedure Activate(const func: threadfunc_t; const parms: pointer); overload;
    procedure Wait;
    function CheckJobDone: Boolean;
    function IsIdle: Boolean;
  end;

const
  THR_DEAD = 0;
  THR_ACTIVE = 1;
  THR_IDLE = 2;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t = nil; const parms2: pointer = nil
  ); overload;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t; const parms2: pointer;
  const func3: threadfunc_t; const parms3: pointer;
  const func4: threadfunc_t = nil; const parms4: pointer = nil
  ); overload;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t; const parms2: pointer;
  const func3: threadfunc_t; const parms3: pointer;
  const func4: threadfunc_t; const parms4: pointer;
  const func5: threadfunc_t; const parms5: pointer;
  const func6: threadfunc_t = nil; const parms6: pointer = nil
  ); overload;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t; const parms2: pointer;
  const func3: threadfunc_t; const parms3: pointer;
  const func4: threadfunc_t; const parms4: pointer;
  const func5: threadfunc_t; const parms5: pointer;
  const func6: threadfunc_t; const parms6: pointer;
  const func7: threadfunc_t; const parms7: pointer;
  const func8: threadfunc_t = nil; const parms8: pointer = nil
  ); overload;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t; const parms2: pointer;
  const func3: threadfunc_t; const parms3: pointer;
  const func4: threadfunc_t; const parms4: pointer;
  const func5: threadfunc_t; const parms5: pointer;
  const func6: threadfunc_t; const parms6: pointer;
  const func7: threadfunc_t; const parms7: pointer;
  const func8: threadfunc_t; const parms8: pointer;
  const func9: threadfunc_t; const parms9: pointer;
  const func10: threadfunc_t = nil; const parms10: pointer = nil;
  const func11: threadfunc_t = nil; const parms11: pointer = nil;
  const func12: threadfunc_t = nil; const parms12: pointer = nil
  ); overload;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t; const parms2: pointer;
  const func3: threadfunc_t; const parms3: pointer;
  const func4: threadfunc_t; const parms4: pointer;
  const func5: threadfunc_t; const parms5: pointer;
  const func6: threadfunc_t; const parms6: pointer;
  const func7: threadfunc_t; const parms7: pointer;
  const func8: threadfunc_t; const parms8: pointer;
  const func9: threadfunc_t; const parms9: pointer;
  const func10: threadfunc_t; const parms10: pointer;
  const func11: threadfunc_t; const parms11: pointer;
  const func12: threadfunc_t; const parms12: pointer;
  const func13: threadfunc_t; const parms13: pointer;
  const func14: threadfunc_t = nil; const parms14: pointer = nil;
  const func15: threadfunc_t = nil; const parms15: pointer = nil;
  const func16: threadfunc_t = nil; const parms16: pointer = nil;
  const func17: threadfunc_t = nil; const parms17: pointer = nil
  ); overload;

function MT_SpawnTimer(const func: threadfunc_t; const interval: integer; const parms: pointer = nil): integer;

function MT_SetTimerInterval(const id: integer; const interval: integer): integer;

function MT_KillTimer(const id: integer): boolean;

const
  MT_INFINITE = MAXINT;

implementation

uses
  Windows, Classes, SysUtils;

function I_CreateProcess(p: threadfunc_t; parm: pointer; suspended: boolean): integer;
var
  id: LongWord;
begin
  if suspended then
    result := CreateThread(nil, $1000, @p, parm, CREATE_SUSPENDED, id)
  else
    result := CreateThread(nil, $1000, @p, parm, 0, id);
end;

function ThreadWorker(p: Pointer): integer; stdcall;
var
  th: TDThread;
begin
  result := 0;
  th := Pthreadinfo_t(p).thread;
  while true do
  begin
    while (th.fstatus = THR_IDLE) and (not th.fterminated) do
    begin
      Sleep(0);
    end;
    if th.fterminated then
      exit;
    if th.finterval <> MAXINT then
    begin
      th.ffunc(th.fparms);
      if th.fterminated then
        exit;
    end;
    if th.finterval > 0 then
    begin
      if th.finterval = MAXINT then
        Sleep(100)
      else
        Sleep(th.finterval);
      if th.fterminated then
        exit;
    end
    else
      th.fstatus := THR_IDLE;
  end;
end;

constructor TDThread.Create(const func: threadfunc_t = nil);
begin
  fterminated := false;
  ffunc := func;
  fparms := nil;
  fstatus := THR_IDLE;
  finterval := -1;
  info.thread := Self;
  fid := I_CreateProcess(@ThreadWorker, @info, true);
  suspended := true;
end;

destructor TDThread.Destroy;
var
  msecs: integer;
begin
  fterminated := true;
  fstatus := THR_DEAD;
  msecs := finterval + 100;
  if msecs > 1000 then
    msecs := 1000;
  WaitForSingleObject(fid, msecs);
  Inherited Destroy;
end;

// JVAL: Should check for fstatus, but it is not called while active
procedure TDThread.Activate(const parms: pointer);
begin
  if not Assigned(ffunc) then
    raise Exception.Create('TDThread.Activate(): Null function pointer');
  fparms := parms;
  fstatus := THR_ACTIVE;
  suspended := false;
  ResumeThread(fid);
end;

procedure TDThread.Activate(const func: threadfunc_t; const parms: pointer);
begin
  ffunc := func;
  Activate(parms);
end;

procedure TDThread.Wait;
begin
  if suspended then
    Exit;

  while fstatus = THR_ACTIVE do
    Sleep(0);

  suspended := true;
  SuspendThread(fid);
end;

function TDThread.CheckJobDone: Boolean;
begin
  if fstatus = THR_IDLE then
  begin
    if not suspended then
    begin
      suspended := true;
      SuspendThread(fid);
    end;
    result := true;
  end
  else
    result := false;
end;

function TDThread.IsIdle: Boolean;
begin
  result := fstatus = THR_IDLE;
end;

////////////////////////////////////////////////////////////////////////////////

const
  NUMEXECTHREADS = 16;

var
  exec_threads: array[0..NUMEXECTHREADS - 1] of TDThread;
  mt_execute_fetched: boolean = False;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t = nil; const parms2: pointer = nil
  );
begin
  if mt_execute_fetched then
    raise Exception.Create('MT_Execute(): Invalid recoursive call.'#13#10);

  mt_execute_fetched := True;

  if @func2 <> nil then
  begin
    exec_threads[0].Activate(func2, parms2);
    if @func1 = nil then
      raise Exception.Create('MT_Execute(): Called with null application thread function.'#13#10)
    else
      func1(parms1);
    exec_threads[0].Wait;
  end
  else if @func1 = nil then
    raise Exception.Create('MT_Execute(): Called with null application thread function.'#13#10)
  else
    func1(parms1);

  mt_execute_fetched := False;
end;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t; const parms2: pointer;
  const func3: threadfunc_t; const parms3: pointer;
  const func4: threadfunc_t = nil; const parms4: pointer = nil
  );
var
  nt: integer;
  i: integer;
begin
  if mt_execute_fetched then
    raise Exception.Create('MT_Execute(): Invalid recoursive call.'#13#10);

  mt_execute_fetched := True;

  nt := 0;
  if @func2 <> nil then
  begin
    exec_threads[nt].Activate(func2, parms2);
    inc(nt);
  end;
  if @func3 <> nil then
  begin
    exec_threads[nt].Activate(func3, parms3);
    inc(nt);
  end;
  if @func4 <> nil then
  begin
    exec_threads[nt].Activate(func4, parms4);
    inc(nt);
  end;
  if @func1 = nil then
    raise Exception.Create('MT_Execute(): Called with null application thread function.'#13#10)
  else
    func1(parms1);
  for i := 0 to nt - 1 do
    exec_threads[i].Wait;
  mt_execute_fetched := False;
end;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t; const parms2: pointer;
  const func3: threadfunc_t; const parms3: pointer;
  const func4: threadfunc_t; const parms4: pointer;
  const func5: threadfunc_t; const parms5: pointer;
  const func6: threadfunc_t = nil; const parms6: pointer = nil
  ); overload;
var
  nt: integer;
  i: integer;
begin
  if mt_execute_fetched then
    raise Exception.Create('MT_Execute(): Invalid recoursive call.'#13#10);

  mt_execute_fetched := True;

  nt := 0;
  if @func2 <> nil then
  begin
    exec_threads[nt].Activate(func2, parms2);
    inc(nt);
  end;
  if @func3 <> nil then
  begin
    exec_threads[nt].Activate(func3, parms3);
    inc(nt);
  end;
  if @func4 <> nil then
  begin
    exec_threads[nt].Activate(func4, parms4);
    inc(nt);
  end;
  if @func5 <> nil then
  begin
    exec_threads[nt].Activate(func5, parms5);
    inc(nt);
  end;
  if @func6 <> nil then
  begin
    exec_threads[nt].Activate(func6, parms6);
    inc(nt);
  end;
  if @func1 = nil then
    raise Exception.Create('MT_Execute(): Called with null application thread function.'#13#10)
  else
    func1(parms1);
  for i := 0 to nt - 1 do
    exec_threads[i].Wait;
  mt_execute_fetched := False;
end;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t; const parms2: pointer;
  const func3: threadfunc_t; const parms3: pointer;
  const func4: threadfunc_t; const parms4: pointer;
  const func5: threadfunc_t; const parms5: pointer;
  const func6: threadfunc_t; const parms6: pointer;
  const func7: threadfunc_t; const parms7: pointer;
  const func8: threadfunc_t = nil; const parms8: pointer = nil
  ); overload;
var
  nt: integer;
  i: integer;
begin
  if mt_execute_fetched then
    raise Exception.Create('MT_Execute(): Invalid recoursive call.'#13#10);

  mt_execute_fetched := True;

  nt := 0;
  if @func2 <> nil then
  begin
    exec_threads[nt].Activate(func2, parms2);
    inc(nt);
  end;
  if @func3 <> nil then
  begin
    exec_threads[nt].Activate(func3, parms3);
    inc(nt);
  end;
  if @func4 <> nil then
  begin
    exec_threads[nt].Activate(func4, parms4);
    inc(nt);
  end;
  if @func5 <> nil then
  begin
    exec_threads[nt].Activate(func5, parms5);
    inc(nt);
  end;
  if @func6 <> nil then
  begin
    exec_threads[nt].Activate(func6, parms6);
    inc(nt);
  end;
  if @func7 <> nil then
  begin
    exec_threads[nt].Activate(func7, parms7);
    inc(nt);
  end;
  if @func8 <> nil then
  begin
    exec_threads[nt].Activate(func8, parms8);
    inc(nt);
  end;
  if @func1 = nil then
    raise Exception.Create('MT_Execute(): Called with null application thread function.'#13#10)
  else
    func1(parms1);
  for i := 0 to nt - 1 do
    exec_threads[i].Wait;
  mt_execute_fetched := False;
end;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t; const parms2: pointer;
  const func3: threadfunc_t; const parms3: pointer;
  const func4: threadfunc_t; const parms4: pointer;
  const func5: threadfunc_t; const parms5: pointer;
  const func6: threadfunc_t; const parms6: pointer;
  const func7: threadfunc_t; const parms7: pointer;
  const func8: threadfunc_t; const parms8: pointer;
  const func9: threadfunc_t; const parms9: pointer;
  const func10: threadfunc_t = nil; const parms10: pointer = nil;
  const func11: threadfunc_t = nil; const parms11: pointer = nil;
  const func12: threadfunc_t = nil; const parms12: pointer = nil
  ); overload;
var
  nt: integer;
  i: integer;
begin
  if mt_execute_fetched then
    raise Exception.Create('MT_Execute(): Invalid recoursive call.'#13#10);

  mt_execute_fetched := True;

  nt := 0;
  if @func2 <> nil then
  begin
    exec_threads[nt].Activate(func2, parms2);
    inc(nt);
  end;
  if @func3 <> nil then
  begin
    exec_threads[nt].Activate(func3, parms3);
    inc(nt);
  end;
  if @func4 <> nil then
  begin
    exec_threads[nt].Activate(func4, parms4);
    inc(nt);
  end;
  if @func5 <> nil then
  begin
    exec_threads[nt].Activate(func5, parms5);
    inc(nt);
  end;
  if @func6 <> nil then
  begin
    exec_threads[nt].Activate(func6, parms6);
    inc(nt);
  end;
  if @func7 <> nil then
  begin
    exec_threads[nt].Activate(func7, parms7);
    inc(nt);
  end;
  if @func8 <> nil then
  begin
    exec_threads[nt].Activate(func8, parms8);
    inc(nt);
  end;
  if @func9 <> nil then
  begin
    exec_threads[nt].Activate(func9, parms9);
    inc(nt);
  end;
  if @func10 <> nil then
  begin
    exec_threads[nt].Activate(func10, parms10);
    inc(nt);
  end;
  if @func11 <> nil then
  begin
    exec_threads[nt].Activate(func11, parms11);
    inc(nt);
  end;
  if @func12 <> nil then
  begin
    exec_threads[nt].Activate(func12, parms12);
    inc(nt);
  end;
  if @func1 = nil then
    raise Exception.Create('MT_Execute(): Called with null application thread function.'#13#10)
  else
    func1(parms1);
  for i := 0 to nt - 1 do
    exec_threads[i].Wait;
  mt_execute_fetched := False;
end;

procedure MT_Execute(
  const func1: threadfunc_t; const parms1: pointer;
  const func2: threadfunc_t; const parms2: pointer;
  const func3: threadfunc_t; const parms3: pointer;
  const func4: threadfunc_t; const parms4: pointer;
  const func5: threadfunc_t; const parms5: pointer;
  const func6: threadfunc_t; const parms6: pointer;
  const func7: threadfunc_t; const parms7: pointer;
  const func8: threadfunc_t; const parms8: pointer;
  const func9: threadfunc_t; const parms9: pointer;
  const func10: threadfunc_t; const parms10: pointer;
  const func11: threadfunc_t; const parms11: pointer;
  const func12: threadfunc_t; const parms12: pointer;
  const func13: threadfunc_t; const parms13: pointer;
  const func14: threadfunc_t = nil; const parms14: pointer = nil;
  const func15: threadfunc_t = nil; const parms15: pointer = nil;
  const func16: threadfunc_t = nil; const parms16: pointer = nil;
  const func17: threadfunc_t = nil; const parms17: pointer = nil
  ); overload;
var
  nt: integer;
  i: integer;
begin
  if mt_execute_fetched then
    raise Exception.Create('MT_Execute(): Invalid recoursive call.'#13#10);

  mt_execute_fetched := True;

  nt := 0;
  if @func2 <> nil then
  begin
    exec_threads[nt].Activate(func2, parms2);
    inc(nt);
  end;
  if @func3 <> nil then
  begin
    exec_threads[nt].Activate(func3, parms3);
    inc(nt);
  end;
  if @func4 <> nil then
  begin
    exec_threads[nt].Activate(func4, parms4);
    inc(nt);
  end;
  if @func5 <> nil then
  begin
    exec_threads[nt].Activate(func5, parms5);
    inc(nt);
  end;
  if @func6 <> nil then
  begin
    exec_threads[nt].Activate(func6, parms6);
    inc(nt);
  end;
  if @func7 <> nil then
  begin
    exec_threads[nt].Activate(func7, parms7);
    inc(nt);
  end;
  if @func8 <> nil then
  begin
    exec_threads[nt].Activate(func8, parms8);
    inc(nt);
  end;
  if @func9 <> nil then
  begin
    exec_threads[nt].Activate(func9, parms9);
    inc(nt);
  end;
  if @func10 <> nil then
  begin
    exec_threads[nt].Activate(func10, parms10);
    inc(nt);
  end;
  if @func11 <> nil then
  begin
    exec_threads[nt].Activate(func11, parms11);
    inc(nt);
  end;
  if @func12 <> nil then
  begin
    exec_threads[nt].Activate(func12, parms12);
    inc(nt);
  end;
  if @func13 <> nil then
  begin
    exec_threads[nt].Activate(func13, parms13);
    inc(nt);
  end;
  if @func14 <> nil then
  begin
    exec_threads[nt].Activate(func14, parms14);
    inc(nt);
  end;
  if @func15 <> nil then
  begin
    exec_threads[nt].Activate(func15, parms15);
    inc(nt);
  end;
  if @func16 <> nil then
  begin
    exec_threads[nt].Activate(func16, parms16);
    inc(nt);
  end;
  if @func17 <> nil then
  begin
    exec_threads[nt].Activate(func17, parms17);
    inc(nt);
  end;
  if @func1 = nil then
    raise Exception.Create('MT_Execute(): Called with null application thread function.'#13#10)
  else
    func1(parms1);
  for i := 0 to nt - 1 do
    exec_threads[i].Wait;
  mt_execute_fetched := False;
end;

var
  threadpool: TStringList;

function MT_SpawnTimer(const func: threadfunc_t; const interval: integer; const parms: pointer = nil): integer;
var
  i: integer;
  th: TDThread;
begin
  Result := -1;
  for i := 0 to threadpool.Count - 1 do
    if threadpool.Strings[i] = '-' then
    begin
      Result := i;
      Break;
    end;

  if Result = -1 then
    Result := threadpool.Add('x');

  th := TDThread.Create(func);
  th.finterval := interval;

  threadpool.Objects[Result] := th;
end;

function MT_KillTimer(const id: integer): boolean;
var
  th: TDThread;
begin
  if id < 0 then
  begin
    Result := False;
    Exit;
  end;

  if id >= threadpool.Count then
  begin
    Result := False;
    Exit;
  end;

  if threadpool.Strings[id] = '-' then
  begin
    Result := False;
    Exit;
  end;

  threadpool.Strings[id] := '-';
  th := threadpool.Objects[id] as TDThread;
  th.Free;
  threadpool.Objects[id] := nil;
  Result := True;
end;

function MT_SetTimerInterval(const id: integer; const interval: integer): integer;
var
  th: TDThread;
begin
  if id < 0 then
  begin
    Result := -1;
    Exit;
  end;

  if id >= threadpool.Count then
  begin
    Result := -1;
    Exit;
  end;

  if threadpool.Strings[id] = '-' then
  begin
    Result := -1;
    Exit;
  end;

  th := threadpool.Objects[id] as TDThread;
  Result := th.finterval;
  th.finterval := interval;
end;

procedure MT_Init;
var
  i: integer;
begin
  threadpool := TStringList.Create;
  for i := 0 to NUMEXECTHREADS - 1 do
    exec_threads[i] := TDThread.Create;
end;

procedure MT_ShutDown;
var
  i: integer;
begin
  for i := 0 to threadpool.Count - 1 do
    threadpool.Objects[i].Free;
  threadpool.Free;

  for i := 0 to NUMEXECTHREADS - 1 do
    exec_threads[i].Free;
end;

initialization
  MT_Init;

finalization
  MT_ShutDown;

end.

