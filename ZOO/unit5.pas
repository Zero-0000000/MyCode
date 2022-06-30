unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DBCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form5: TForm5;

implementation
uses Unit1;

{$R *.lfm}

{ TForm5 }

procedure TForm5.Button1Click(Sender: TObject);
var s: string;
begin
  if (Edit1.Text = '') then begin
    Button1.Caption:='Ошибка';
    Abort;
  end else begin
  Button1.Caption:='Сохранить';
  s:='INSERT INTO TYPE_M(TYPE_M) values('''+Edit1.Text+''')';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM TYPE_M ORDER BY TYPE_M';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm5.Button2Click(Sender: TObject);
var s: string;
begin
  s:='DELETE FROM TYPE_M WHERE TYPE_M = '''+DBEdit1.Text+'''';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM TYPE_M ORDER BY TYPE_M';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
end;

procedure TForm5.DBEdit1Change(Sender: TObject);
begin
  if (DBEdit1.Text = '') then begin
    button2.Visible:=false;
  Abort;
  end else begin
  button2.Visible:=true;
  end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  if SQLQuery1.Active=false then begin
    SQLQuery1.Active:= True;
    end;
end;

end.

