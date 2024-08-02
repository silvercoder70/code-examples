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

program example5;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.IOUtils;

{dynamic arrays}

type TStringDynArray_ = TArray<string>;
//array of string; {look in IOUtils!} {TArray<string>}

procedure InsertionSort(var AValues: TStringDynArray_);
var
  Top, InsertionPos: integer;
  Cache :string;
Begin
  for Top := 1 to length(AValues) - 1 do
  begin
    Cache := AValues[Top];
    InsertionPos := Top;
    while (InsertionPos > 0) and
      (AValues[InsertionPos - 1] > Cache) do
    begin
      AValues[InsertionPos] := AValues[InsertionPos - 1];
      dec(InsertionPos);
    end;
    AValues[InsertionPos] := Cache;
  end;
end;

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

procedure Demo51;
var
  X: TStringDynArray_;
  S: string;
  X2: TArray<string>;
begin
  WriteLn('Demo 5.1');
  {
  SetLength(X, 4);
  X[0] := 'bravo';
  X[1] := 'delta';
  X[2] := 'charlie';
  X[3] := 'alpha';
  DebugArrayContents0(X);
  InsertionSort(X);
  DebugArrayContents0(X);
  WriteLn;
  exit;
  }
  S := '3,1,4';
  X2 := S.Split([',']);
  InsertionSort(X2);
  DebugArrayContents0(X2);
  WriteLn;
end;

begin
  try
    Demo51;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
