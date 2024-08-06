unit uPerson;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  { TPerson }

  TPerson = class
  private
    FAge: integer;
    FName_: string;
    procedure SetAge(AValue: integer);
    procedure SetName_(AValue: string);
  public
    constructor Create(AName: string; AAge: integer);
    property Name_: string read FName_ write SetName_;
    property Age: integer read FAge write SetAge;
  end;

function ComparePerson(const Item1, Item2: TPerson): Integer;

implementation

{ TPerson }

function ComparePerson(const Item1, Item2: TPerson): Integer;
begin
  Result := AnsiCompareStr(Item1.Name_,Item2.Name_);
end;

procedure TPerson.SetAge(AValue: integer);
begin
  if FAge=AValue then Exit;
  FAge:=AValue;
end;

procedure TPerson.SetName_(AValue: string);
begin
  if FName_=AValue then Exit;
  FName_:=AValue;
end;

constructor TPerson.Create(AName: string; AAge: integer);
begin
  FName_:= AName;
  FAge:=AAge;
end;

end.

