unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DBCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
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
  Form3: TForm3;

implementation
uses Unit1;

{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
var s: string;
begin
  if (Edit1.Text = '') then begin
    Button1.Caption:='Ошибка';
    Abort;
  end else begin
  Button1.Caption:='Сохранить';
  s:='INSERT INTO soft_name(soft_name) values('''+Edit1.Text+''')';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM soft_name';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
var s: string;
begin
  if (DBEdit1.Text = '') then begin
    Button2.Caption:='Ошибка';
    Abort;
  end else begin
  Button2.Caption:='Удалить';
  s:='DELETE FROM soft_name WHERE id = '''+DBEdit1.Text+'''';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM soft_name';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  SQLQuery1.Active:=true;
end;

end.

