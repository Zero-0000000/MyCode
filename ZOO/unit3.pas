unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, Forms, Controls, Graphics, Dialogs, DBGrids,
  DBCtrls, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
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
  if (Edit1.Text = '') or (Edit2.Text = '') then begin
    Button1.Caption:='Ошибка';
    Label3.Visible:=true;
    Abort;
  end else begin
  Button1.Caption:='Сохранить';
  Label3.Visible:=false;
  s:='INSERT INTO EMPLOYEE(NAME_EM, POSITION_EM) values('''+Edit1.Text+''','''+Edit2.Text+''')';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM EMPLOYEE ORDER BY NAME_EM';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
  var s: string;
begin
  s:='DELETE FROM EMPLOYEE WHERE NAME_EM = '''+DBEdit1.Text+'''';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM EMPLOYEE ORDER BY NAME_EM';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
end;

procedure TForm3.DBEdit1Change(Sender: TObject);
begin
  if (DBEdit1.Text = '') then begin
    button2.Visible:=false;
  Abort;
  end else begin
  button2.Visible:=true;
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  if SQLQuery1.Active=false then begin
    SQLQuery1.Active:= True;
    end;
end;

end.

