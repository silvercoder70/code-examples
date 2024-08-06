program example6;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this }
  , fgl, uPerson;

type
  TPersonList = specialize TFPGList<TPerson>;

var
  LPersonList: TPersonList;
  LPersonInterator: specialize TFPGListEnumerator<TPerson>;
  LPerson: TPerson;

begin
  LPersonList := TPersonList.Create;
  LPersonList.Add(TPerson.Create('Malcolm', 30));
  LPersonList.Add(TPerson.Create('Bob', 19));
  LPersonList.Add(TPerson.Create('Alice', 30));
  LPersonList.Add(TPerson.Create('Charlie', 30));

  LPersonList.Sort(@ComparePerson);

  LPersonInterator := LPersonList.GetEnumerator;
  while LPersonInterator.MoveNext do
  begin
    LPerson := LPersonInterator.Current;
    Writeln('Person Name: ', LPerson.Name_, ', Age: ', LPerson.Age);
  end;

  LPersonList.Free;
  Readln;
end.

