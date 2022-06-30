unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, SQLDB, DB, Forms, Controls, Graphics,
  Dialogs, DBGrids, DBCtrls, StdCtrls, DateTimePicker, ComObj;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    DataSource1: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    IBConnection1: TIBConnection;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure DBLookupComboBox3Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelectSQL(SQL: TSQLQuery; s: string);
    procedure InsertSQL(SQL: TSQLQuery; s: string);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
uses Unit2, Unit3, Unit4, Unit6;

{$R *.lfm}

{ TForm1 }

procedure TForm1.SelectSQL(SQL: TSQLQuery; s: string);
begin
  SQL.Active:=FALSE;
  SQL.SQL.Clear;
  SQL.SQL.Add(s);
  SQL.Active:=true;
end;

procedure TForm1.InsertSQL(SQL: TSQLQuery; s: string);
begin
  SQL.Active:=FALSE;
  SQL.SQL.Clear;
  SQL.SQL.Add(s);
  SQL.ExecSQL;
end;

procedure TForm1.Button1Click(Sender: TObject);
var s: string;
begin
  if (DBLookupComboBox3.text = 'Платная') then begin
    if (DBLookupComboBox1.text = '') or (DBLookupComboBox2.text = '') or (DBLookupComboBox3.text = '') or (datetostr(DateTimePicker1.Date) = '') or (Edit1.Text = '') then begin
    Button1.Caption:='Ошибка';
    Abort;
  end else begin
  Button1.Caption:='Сохранить';
  s:='INSERT INTO soft_list(pc_name, SOFT_NAME, license, EXPIRATION_DATE, RENEWAL_PRICE) values('''+DBLookupComboBox1.text+''','''+DBLookupComboBox2.text+''','''+DBLookupComboBox3.text+''','''+datetostr(DateTimePicker1.Date)+''','''+Edit1.Text+''')';
  InsertSQL(SQLQuery1, s);
  end;
  end else begin
  if (DBLookupComboBox1.text = '') or (DBLookupComboBox2.text = '') or (DBLookupComboBox3.text = '') then begin
    Button1.Caption:='Ошибка';
    Abort;
  end else begin
  Button1.Caption:='Сохранить';
  s:='INSERT INTO soft_list(pc_name, SOFT_NAME, license, EXPIRATION_DATE, RENEWAL_PRICE) values('''+DBLookupComboBox1.text+''','''+DBLookupComboBox2.text+''','''+DBLookupComboBox3.text+''','''+datetostr(DateTimePicker2.Date)+''','''+Edit2.Text+''')';
  InsertSQL(SQLQuery1, s);
  end;
  end;
  s:='SELECT * FROM soft_list';
  SelectSQL(SQLQuery1, s);
end;

procedure TForm1.Button2Click(Sender: TObject);
var s: string;
begin
  if (DBEdit1.Text = '') then begin
    Button2.Caption:='Ошибка';
    Abort;
  end else begin
  Button2.Caption:='Удалить';
  s:='DELETE FROM soft_list WHERE id = '''+DBEdit1.Text+'''';
  InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM soft_list';
  SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Unit6.Form6.Show;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
i,j,index: Integer;
ExcelApp,col: Variant;
begin
  index:=1;
ExcelApp:=CreateOleObject('Excel.Application');
ExcelApp.Visible:=true;
ExcelApp.WorkBooks.Add(-4167);
ExcelApp.WorkBooks[1].WorkSheets[1].name:='Soft_List';
col:=ExcelApp.WorkBooks[1].WorkSheets['Soft_List'];
DBGrid1.DataSource.DataSet.First;
for i:=1 to DBGrid1.DataSource.DataSet.RecordCount do
begin
for j:=1 to DBGrid1.DataSource.DataSet.FieldCount do
col.cells[index,j]:=DBGrid1.DataSource.DataSet.fields[j-1].AsWideString;
inc(index);
DBGrid1.DataSource.DataSet.Next;
end;
ExcelApp.Visible:=true;
end;

procedure TForm1.Button8Click(Sender: TObject);
var x: string;
var s: string;
begin
  x:='''%'+DBLookupComboBox4.text+'%''';
  with Form1 do
begin
  s:='select * from soft_list where pc_name like'+x+' order by id';
  SelectSQL(SQLQuery1, s);
end;
end;

procedure TForm1.DBLookupComboBox3Change(Sender: TObject);
begin
  if (DBLookupComboBox3.text = 'Платная') then begin
    DateTimePicker1.Visible:=true;
    Edit1.Visible:=true;
    Label4.Visible:=true;
    Label5.Visible:=true;
    Button1.Top:=328;
    Button6.Top:=328;
    Form1.Height:=358;
  end else begin
    DateTimePicker1.Visible:=false;
    Edit1.Visible:=false;
    Label4.Visible:=false;
    Label5.Visible:=false;
    Button1.Top:=264;
    Button6.Top:=264;
    Form1.Height:=293;
  end;
end;

procedure TForm1.Edit3Change(Sender: TObject);
var x: string;
var s: string;
begin
  x:='''%'+Edit3.text+'%''';
  with Form1 do
begin
  s:='select * from soft_list where pc_name like'+x+' or SOFT_NAME like'+x+' or license like'+x+' or EXPIRATION_DATE like'+x+' or RENEWAL_PRICE like'+x+' order by id';
  SelectSQL(SQLQuery1, s);
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SQLQuery1.Active:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Unit2.Form2.ShowModal;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Unit3.Form3.ShowModal;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Unit4.Form4.ShowModal;
end;

end.

