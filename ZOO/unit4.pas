unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, DBCtrls;

type
  TEdit = class(StdCtrls.TEdit)
  private
    Saved : string;
  end;

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
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
  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') then begin
    Button1.Caption:='Ошибка';
    Label4.Visible:=true;
    Abort;
  end else begin
  Button1.Caption:='Сохранить';
  Label4.Visible:=false;
  s:='INSERT INTO BUYERS(NAME, MOBILE_PHONE_NUM, EMAIL) values('''+Edit1.Text+''','''+Edit2.Text+''','''+Edit3.Text+''')';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM BUYERS ORDER BY NAME';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm4.Button2Click(Sender: TObject);
  var s: string;
begin
  s:='DELETE FROM BUYERS WHERE NAME = '''+DBEdit1.Text+'''';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM BUYERS ORDER BY NAME';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
end;

procedure TForm4.DBEdit1Change(Sender: TObject);
begin
  if (DBEdit1.Text = '') then begin
    button2.Visible:=false;
  Abort;
  end else begin
  button2.Visible:=true;
  end;
end;

procedure TForm4.Edit2Change(Sender: TObject);
  var
    val : integer;
    p : integer;
  begin
    with Sender as TEdit do
      if (Text <> '') and (Text <> '+') and not TryStrToInt(Text, val) then
      begin
        p := SelStart;
        Text := Saved;
        SelStart := p - 1;
      end
      else Saved := Text;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  if SQLQuery1.Active=false then begin
    SQLQuery1.Active:= True;
    end;
end;

end.

