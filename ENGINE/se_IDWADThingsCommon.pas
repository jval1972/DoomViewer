{$I defs.inc}

unit se_IDWADThingsCommon;

interface

const
  MF_SPAWNCEILING = 1;

const
  TICRATE = 35;
    
const
  MAXTEXANIMS = 8;

type
  PTextureAnim = ^TTextureAnim;
  TTextureAnim = record
    NumAnims: integer;
    Speed: integer;
    Anims: array[0..MAXTEXANIMS - 1] of string[8];
  end;

  PTextureAnimTable = ^TTextureAnimTable;
  TTextureAnimTable = array[0..$FF] of TTextureAnim;
  

type
// LookUp table
  TLookUpRec = record
    key: integer;   // Κωδικός για αναζήτηση
    index: integer; // Θέση στον πίνακα
  end;

  TSprite = record
    Name: string[4];
    Width: integer;
    Height: integer;
    ForceAnim: string[2];
    Key: integer; // = Integer(Name)
  end;
  PSprite = ^TSprite;

function GetSpriteTextureDimentions(const sprs: array of TSprite;
  const A: array of TLookUpRec; texKey: integer;
  var w, h: integer; var animEnd: char): boolean; overload;

function GetSpriteTextureDimentions(const sprs: array of TSprite;
  const A: array of TLookUpRec; tex: string;
  var w, h: integer; var animEnd: char): boolean; overload;

function GetSpriteTextureDimentions(const sprs: array of TSprite; texKey: integer;
  var w, h: integer; var animEnd: char): boolean; overload;

function GetSpriteTextureDimentions(const sprs: array of TSprite; tex: string;
  var w, h: integer; var animEnd: char): boolean; overload;

function GetWadSpriteKey(Name: string): integer;

procedure SortLookUpTable(var A: array of TLookUpRec);

function SearchLookUpTable(const A: array of TLookUpRec; const key: integer;
  var index: integer): boolean;

implementation

function ClosestPowerOf2(const x: integer): integer;
begin
  if x <= 2 then
    result := 2
  else if x <= 4 then
    result := 4
  else if x <= 8 then
    result :=  8
  else if x <= 16 then
    result := 16
  else if x <= 32 then
    result := 32
  else if x <= 64 then
    result := 64
  else if x <= 128 then
    result := 128
  else if x <= 256 then
    result := 256
  else if x <= 512 then
    result := 512
  else if x <= 1024 then
    result := 1024
  else if x <= 2048 then
    result := 2048
  else if x <= 4096 then
    result := 4096
  else if x <= 8192 then
    result := 8192
  else if x <= 16384 then
    result := 16384
  else
    result := x;
end;

function GetSpriteTextureDimentions(const sprs: array of TSprite;
  const A: array of TLookUpRec; texKey: integer;
  var w, h: integer; var animEnd: char): boolean;
var index: integer;
    pspr: PSprite;
begin
  result := SearchLookUpTable(A, texKey, index);
  if result then
  begin
    pspr := @sprs[index];
    w := ClosestPowerOf2(pspr.Width);
    h := ClosestPowerOf2(pspr.Height);
    animEnd := pspr.ForceAnim[2];
    if animEnd = #0 then animEnd := 'D';
  end;
end;

function GetSpriteTextureDimentions(const sprs: array of TSprite;
  const A: array of TLookUpRec; tex: string;
  var w, h: integer; var animEnd: char): boolean;
begin
  result := GetSpriteTextureDimentions(sprs, A, GetWadSpriteKey(tex), w, h, animEnd);
end;

function GetSpriteTextureDimentions(const sprs: array of TSprite; texKey: integer;
  var w, h: integer; var animEnd: char): boolean;
var i: integer;
    pspr: PSprite;
begin
  for i := low(sprs) to high(sprs) do
  begin
    pspr := @sprs[i];
    if texKey = pspr.Key then
    begin
      if (pspr.Width < 0) or (pspr.Height < 0) then
        result := false
      else
      begin
        w := ClosestPowerOf2(pspr.Width);
        h := ClosestPowerOf2(pspr.Height);
        animEnd := pspr.ForceAnim[2];
        if animEnd = #0 then animEnd := 'D';
        result := true;
      end;
      exit;
    end;
  end;
  result := false;
end;

function GetSpriteTextureDimentions(const sprs: array of TSprite; tex: string;
  var w, h: integer; var animEnd: char): boolean;
begin
  result := GetSpriteTextureDimentions(sprs, GetWadSpriteKey(tex), w, h, animEnd);
end;

function GetWadSpriteKey(Name: string): integer;
begin
  result := (ord(Name[1]) shl 24) or
            (ord(Name[2]) shl 16) or
            (ord(Name[3]) shl 8) or
            (ord(Name[4]));
end;

procedure SortLookUpTable(var A: array of TLookUpRec);
var tl: TLookUpRec;

  procedure DoQuickSort(const left, right: integer); register;
  var l, r: integer;
      lKey: integer;
  begin
    if right > left then
    begin
      l := left;
      r := right;
      lKey := A[left].key;
      while l < r do
      begin
        while (A[r].key > lKey) do dec(r);
        while (A[l].key <= lKey) and (l < r) do inc(l);
        if l < r then
        begin
          tl := A[l];
          A[l] := A[r];
          A[r] := tl;
        end;
      end;
      tl := A[left];
      A[left] := A[r];
      A[r] := tl;
      DoQuickSort(left, r - 1);
      DoQuickSort(r + 1, right)
    end
  end;

begin
  DoQuickSort(low(A), high(A));
end;

function SearchLookUpTable(const A: array of TLookUpRec; const key: integer;
  var index: integer): boolean;
var tmp: integer;
    idxtmp: integer;

  function DoSearch(const first, last: integer): integer; register;
  begin
    idxtmp := (first + last) div 2;
    tmp := A[idxtmp].key;
    if tmp = key then
      result := idxtmp
    else if first >= last then result := MAXINT
    else if tmp < key then
      result := DoSearch(idxtmp + 1, last)
    else
      result := DoSearch(first, idxtmp - 1)
  end;

begin
  tmp := DoSearch(low(A), high(A));
  if tmp <> MAXINT then
  begin
    result := true;
    index := A[tmp].index;
  end
  else
    result := false;
end;

end.
