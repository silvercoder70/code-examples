{
The more things change...?

Going all the way back to 2008 with ...
Marco Cantù's Essential Pascal
https://www.marcocantu.com/epascal/English/default.htm

Memory and Dynamic Arrays...
https://www.marcocantu.com/epascal/English/ch08mem.htm

You will find similar content in his latest Object Pascal
text :)

Sometimes generics are overkill?!?
}

program example4;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.IOUtils;

{dynamic arrays}

type TStringDynArray_ = array of string; {look in IOUtils!} {TArray<string>}


procedure DebugArray(AValues: TStringDynArray_);
var
  L, H, Len: integer;
begin
  L := Low(AValues);
  H := High(AValues);
  Len := Length(AValues);
  WriteLn('Low = ', L, ', High = ', H, ', Len = ', Len);
end;


procedure DebugArrayContents0(AValues: TStringDynArray_);
var
  I: integer;
  S: string;
begin
  DebugArray(AValues);
  S := '';
  for I := Low(AValues) to High(AValues) do
  begin
    if S = '' then
      S := S + '[' + AValues[I]
    else
      S := S + ',' + AValues[I];
  end;
  S := S + ']';
  Writeln(S);
end;


procedure DebugArrayContents1(AValues: TStringDynArray_);
var
  I: integer;
  S: string;
begin
  DebugArray(AValues);
  S := '';
  for var Str in AValues do
  begin
    if S = '' then
      S := S + '[' + Str
    else
      S := S + ',' + Str;
  end;
  S := S + ']';
  Writeln(S);
end;


procedure AppendString(var StringArray: TStringDynArray_; ANewString: string);
begin
  SetLength(StringArray, Length(StringArray) + 1);
  StringArray[Length(StringArray) - 1] := ANewString;
end;


procedure Demo41;
var
  X, X2: TStringDynArray_;
begin
  WriteLn('Demo 4.1');
  SetLength(X, 3);
  X[0] := 'Alpha';
  X[1] := 'Bravo';
  X[2] := 'Charlie';
  DebugArrayContents0(X);
  AppendString(X, 'Delta');
  DebugArrayContents0(X);
  X2 := Copy(X, 2, 4);
  DebugArrayContents0(X2);
  WriteLn;
end;

procedure Demo42;
var
  X: TStringDynArray_;
begin
  WriteLn('Demo 4.2');
  X := ['Apple', 'Banana'];
  DebugArrayContents1(X);
  AppendString(X, 'Cucumber');
  DebugArrayContents1(X);
  WriteLn;
end;



begin
  try
    Demo41;
    Demo42;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
