unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DBCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;

implementation
uses Unit1;

{$R *.lfm}

{ TForm4 }

procedure TForm4.Button1Click(Sender: TObject);
var s: string;
begin
  if (Edit1.Text = '') then begin
    Button1.Caption:='Ошибка';
    Abort;
  end else begin
  Button1.Caption:='Сохранить';
  s:='INSERT INTO yes_or_no(yes_or_no) values('''+Edit1.Text+''')';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM yes_or_no';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm4.Button2Click(Sender: TObject);
var s: string;
begin
  if (DBEdit1.Text = '') then begin
    Button2.Caption:='Ошибка';
    Abort;
  end else begin
  Button2.Caption:='Удалить';
  s:='DELETE FROM yes_or_no WHERE yes_or_no = '''+DBEdit1.Text+'''';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM yes_or_no';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  SQLQuery1.Active:=true;
end;

end.

