unit Unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm8 }

  TForm8 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form8: TForm8;

implementation
uses Unit1, Unit2;

{$R *.lfm}

{ TForm8 }

procedure TForm8.Button2Click(Sender: TObject);
begin
  Form8.Hide
end;

procedure TForm8.Button1Click(Sender: TObject);
var s: string;
begin
  s:='DELETE FROM ORDERS';
  Unit1.Form1.InsertSQL(Form2.SQLQuery1, s);
  s:='SELECT * FROM ORDERS order by ID_ORDER';
  Unit1.Form1.SelectSQL(Form2.SQLQuery1, s);
  Form8.Hide;
end;

end.

