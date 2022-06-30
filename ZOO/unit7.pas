unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm7 }

  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form7: TForm7;

implementation
uses Unit1, Unit2;

{$R *.lfm}

{ TForm7 }

procedure TForm7.Button2Click(Sender: TObject);
begin
  Form7.Hide;
end;

procedure TForm7.Button1Click(Sender: TObject);
var s: string;
begin
  s:='DELETE FROM MAIN';
  Unit1.Form1.InsertSQL(Form1.SQLQuery1, s);
  s:='SELECT * FROM MAIN order by ID';
  Unit1.Form1.SelectSQL(Form1.SQLQuery1, s);
  if Unit2.Form2.SQLQuery1.Active=false then begin
    Unit2.Form2.SQLQuery1.Active:= True;
    end;
  if Unit2.Form2.SQLQuery1.Active=True then begin
    Unit2.Form2.SQLQuery1.Active:= False;
    end;
  Form7.Hide;
end;

end.

