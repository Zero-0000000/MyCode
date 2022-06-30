unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, Forms, Controls, Graphics, Dialogs, DBGrids,
  DBCtrls, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
uses Unit1, Unit5;

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button3Click(Sender: TObject);
begin
  Unit5.Form5.ShowModal;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  SQLQuery1.Active:=true;
end;

procedure TForm2.Button1Click(Sender: TObject);
var s: string;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or (DBLookupComboBox1.text = '') then begin
    Button1.Caption:='Ошибка';
    Abort;
  end else begin
  Button1.Caption:='Сохранить';
  s:='INSERT INTO pc_list(pc_name, user_name, office_number) values('''+Edit1.Text+''','''+Edit2.Text+''','''+DBLookupComboBox1.text+''')';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM pc_list';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var s: string;
begin
  if (DBEdit1.Text = '') then begin
    Button2.Caption:='Ошибка';
    Abort;
  end else begin
  Button2.Caption:='Удалить';
  s:='DELETE FROM pc_list WHERE id = '''+DBEdit1.Text+'''';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM pc_list';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
  end;
end;

end.

