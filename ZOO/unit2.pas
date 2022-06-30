unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBCtrls, DBGrids, ExtCtrls, ComObj;

type
  TEdit = class(StdCtrls.TEdit)
  private
    Saved : string;
  end;

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Memo1: TMemo;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
uses Unit1, Unit3, Unit4, Unit8;

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button3Click(Sender: TObject);
begin
  if Unit3.Form3.SQLQuery1.Active=false then begin
      Unit3.Form3.SQLQuery1.Active:= True;
      end;
  Unit3.Form3.ShowModal;
end;

procedure TForm2.Button1Click(Sender: TObject);
  var s: string;
begin
  if (DBLookupComboBox1.text = '') or (DBLookupComboBox2.text = '') or (DBLookupComboBox3.text = '') or (Edit2.Text = '') then begin
    Button1.Caption:='Ошибка';
    Label1.Visible:=true;
    Abort;
  end else begin
  Button1.Caption:='Сохранить';
  Label1.Visible:=false;
  s:='INSERT INTO ORDERS(EMPLOYEE_NAME, BUYER_NAME, ID_PRODUCT, ADRESS_DELIVERY) values('''+DBLookupComboBox1.text+''','''+DBLookupComboBox2.text+''','''+DBLookupComboBox3.text+''','''+Edit2.Text+''')';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM ORDERS order by ID_ORDER';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
  var s: string;
begin
  s:='DELETE FROM ORDERS WHERE ID_ORDER = '''+DBEdit1.Text+'''';
  Unit1.Form1.InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM ORDERS order by ID_ORDER';
  Unit1.Form1.SelectSQL(SQLQuery1, s);
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  if Unit4.Form4.SQLQuery1.Active=false then begin
    Unit4.Form4.SQLQuery1.Active:= True;
    end;
  Unit4.Form4.ShowModal;
end;

procedure TForm2.Button5Click(Sender: TObject);
  var
  i,j,index: Integer;
  ExcelApp,sheet: Variant;
  begin
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Visible := False;
  ExcelApp.WorkBooks.Add(-4167);
  ExcelApp.WorkBooks[1].WorkSheets[1].name := 'Export';
  sheet:=ExcelApp.WorkBooks[1].WorkSheets['Export'];
  index:=1;
  DBGrid1.DataSource.DataSet.First;
  for i:=1 to DBGrid1.DataSource.DataSet.RecordCount do
  begin
  for j:=1 to DBGrid1.DataSource.DataSet.FieldCount do
  sheet.cells[index,j]:=DBGrid1.DataSource.DataSet.fields[j-1].AsWideString;
  inc(index);
  DBGrid1.DataSource.DataSet.Next;
  end;
  ExcelApp.Visible := true;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  Unit8.Form8.Show;
end;

procedure TForm2.DBEdit1Change(Sender: TObject);
begin
  if (DBEdit1.Text = '') then begin
    button2.Visible:=false;
    button6.Visible:=false;
  end else begin
  button2.Visible:=true;
  button6.Visible:=true;
  end;
end;

procedure TForm2.Edit1Change(Sender: TObject);
  var
      val : integer;
      p : integer;
    begin
      with Sender as TEdit do
        if (Text <> '') and not TryStrToInt(Text, val) then
        begin
          p := SelStart;
          Text := Saved;
          SelStart := p - 1;
        end
        else Saved := Text;
end;

procedure TForm2.Edit3Change(Sender: TObject);
  var x: string;
  var s: string;
  begin
      x:='''%'+Edit3.Text+'%''';
      with Form2 do
  begin
      s:='select * from ORDERS where ID_ORDER like '+x+' or EMPLOYEE_NAME like'+x+' or BUYER_NAME like'+x+' or ID_PRODUCT like'+x+' or ADRESS_DELIVERY like'+x+' order by ID_ORDER';
      Unit1.Form1.SelectSQL(SQLQuery1, s);
end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  if SQLQuery1.Active=false then begin
    SQLQuery1.Active:= True;
    end;
    Button3.Visible:=false;
    Button4.Visible:=false;
    Button5.Visible:=false;
    Button6.Visible:=false;
end;

end.

