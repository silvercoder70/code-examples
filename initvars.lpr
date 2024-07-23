program initvars;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

type

  { TPointClass }

  TPointClass = class
  private
    X, Y: integer;
    FItems: TStringList;
  public
    constructor Create(AX, AY: integer);
    destructor Destroy; override;
    property X_: integer read X;
    property Y_: integer read Y;
  end;

{Code starts here for TPointClass}
constructor TPointClass.Create(AX, AY: integer);
begin
  inherited Create;
  WriteLn('In TPointClass.Create');
  if (AX <= 0) or (AY <= 0) then
    raise Exception.Create('AX or AY <= 0');

  X := AX;
  Y := AY;
  FItems := TStringList.Create;

  WriteLn('TPointClass.Create completed');
end;

destructor TPointClass.Destroy;
begin
  inherited Destroy;
  WriteLn('In TPointClass.Destroy');
  if Assigned(FItems) then
  begin
    WriteLn('TPointClass.Destroy::free FItems');
    FItems.Free;
  end;
end;

{Second test case}

function FindStreamHandler(filename: string): TStream;
begin
  result := Nil;
end;

procedure DoSomething(filename: string);
var
  stream: TStream;
  LItems: TStringlist;
begin
  stream := FindStreamHandler(filename);

  if not Assigned(stream) then
   raise Exception.Create('Could not find handler for ' + filename);

  stream.Seek(0, soFromBeginning);
  stream.Free;
end;

{Main test case(s)}

procedure Main;
var
  LI: integer = 1;
  LDouble: double = 3.14;
  LStr: string;
  LPoint: TPoint;
  LPt: TPointClass;
begin
  //TestInt;

  WriteLn('Test #1');
  WriteLn('Value of LI -');
  WriteLn(LI);
  WriteLn('-------------------------');

  WriteLn('Test #2');
  WriteLn('Value of LDouble -');
  WriteLn(LDouble);
  WriteLn('-------------------------');

  Exit;

  LPoint := Default(TPoint);
  WriteLn('Test #3');
  WriteLn('Value of LPoint -');
  WriteLn(LPoint.X, ' ', LPoint.Y);
  WriteLn('-------------------------');

  WriteLn('Test #4');
  WriteLn('Value of LStr -');
  WriteLn('[' + LStr + ']');
  WriteLn('-------------------------');

  {
  WriteLn('Test #5');
  LPt := Default(TPointClass);
  WriteLn('"Value" of LPt -');
  WriteLn(BoolToStr(Assigned(LPt), True));
  WriteLn('-------------------------');
  }

  WriteLn('Test #6');
  try
    LPt := TPointClass.Create(0,0);
    try
      WriteLn('LPt.X=' + LPt.X.ToString);
    except
      on e: Exception do
        WriteLn('Exception (3): ' + e.Message);
    end;
  except
    on e: Exception do
    begin
      WriteLn('Exception (2): ' + e.Message);
      LPt := nil;
    end;
  end;

  if Assigned(LPt) then
  begin
    WriteLn('LPt is assigned?');
    //WriteLn('LObj.ClassName=' + LObj.ClassName); {raises exception!}
  end
  else
    WriteLn('LPt is NOT assigned?');
  WriteLn('-------------------------');
end;

begin
  try
    Main;
    //DoSomething('xxx.log');
  except
    on e: Exception do
      WriteLn('Exception (1): ' + e.Message);
  end;

  readln;
end.



