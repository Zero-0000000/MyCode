unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, SQLDB, DB, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DBCtrls, DBGrids, ComObj;

type
  TEdit = class(StdCtrls.TEdit)
  private
    Saved : string;
  end;

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
    CheckBox1: TCheckBox;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    IBConnection1: TIBConnection;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelectSQL(SQL: TSQLQuery; str: string);
    procedure InsertSQL(SQL: TSQLQuery; str: string);
  private

  public

  end;

var
  Form1: TForm1;

implementation
uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7;

{$R *.lfm}

{ TForm1 }

procedure TForm1.SelectSQL(SQL: TSQLQuery; Str: string);
begin
  SQL.Active:=FALSE;
  SQL.SQL.Clear;
  SQL.SQL.Add(Str);
  SQL.Active:=true;
end;

procedure TForm1.InsertSQL(SQL: TSQLQuery; Str: string);
begin
  SQL.Active:=FALSE;
  SQL.SQL.Clear;
  SQL.SQL.Add(Str);
  SQL.ExecSQL;
  end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if Unit2.Form2.SQLQuery1.Active=false then begin
    Unit2.Form2.SQLQuery1.Active:= True;
    end;
  Unit2.Form2.ShowModal;
end;

procedure TForm1.Button1Click(Sender: TObject);
  var s: string;
begin
  if (Edit2.Text = '') or (DBLookupComboBox1.text = '') or (DBLookupComboBox2.text = '') or (Edit3.Text = '') then begin
    Button1.Caption:='Ошибка';
    Label1.Visible:=true;
    Abort;
  end else begin
  Button1.Caption:='Сохранить';
  Label1.Visible:=false;
  s:='INSERT INTO MAIN(NAME, TYPE_M, SUBTYPE, PRICE) values('''+Edit2.Text+''','''+DBLookupComboBox1.text+''','''+DBLookupComboBox2.text+''','''+Edit3.Text+''')';
  InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM MAIN order by ID';
  SelectSQL(SQLQuery1, s);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
  var s: string;
begin
  s:='DELETE FROM MAIN WHERE ID = '''+DBEdit1.Text+'''';
  InsertSQL(SQLQuery1, s);
  s:='SELECT * FROM MAIN order by ID';
  SelectSQL(SQLQuery1, s);
  if Unit2.Form2.SQLQuery1.Active=false then begin
    Unit2.Form2.SQLQuery1.Active:= True;
    end;
  if Unit2.Form2.SQLQuery1.Active=True then begin
    Unit2.Form2.SQLQuery1.Active:= False;
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if Unit5.Form5.SQLQuery1.Active=false then begin
    Unit5.Form5.SQLQuery1.Active:= True;
    end;
  Unit5.Form5.ShowModal;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if Unit6.Form6.SQLQuery1.Active=false then begin
    Unit6.Form6.SQLQuery1.Active:= True;
    end;
  Unit6.Form6.ShowModal;
end;

procedure TForm1.Button6Click(Sender: TObject);
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

procedure TForm1.Button7Click(Sender: TObject);
begin
  if SQLQuery1.Active=false then begin
    SQLQuery1.Active:= True;
    end;
  if Unit2.Form2.SQLQuery1.Active=false then begin
    Unit2.Form2.SQLQuery1.Active:= True;
    end;
  if Unit3.Form3.SQLQuery1.Active=false then begin
    Unit3.Form3.SQLQuery1.Active:= True;
    end;
  if Unit4.Form4.SQLQuery1.Active=false then begin
    Unit4.Form4.SQLQuery1.Active:= True;
    end;
  if Unit5.Form5.SQLQuery1.Active=false then begin
    Unit5.Form5.SQLQuery1.Active:= True;
    end;
  if Unit6.Form6.SQLQuery1.Active=false then begin
    Unit6.Form6.SQLQuery1.Active:= True;
    end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Unit7.Form7.Show;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if (CheckBox1.Checked = true) then begin
    Button4.Visible:=true;
    Button5.Visible:=true;
    Button6.Visible:=true;
    Button7.Visible:=true;
    Button8.Visible:=true;
    Unit2.Form2.Button3.Visible:=true;
    Unit2.Form2.Button4.Visible:=true;
    Unit2.Form2.Button5.Visible:=true;
    Unit2.Form2.Button6.Visible:=true;
  end else begin
    Button4.Visible:=false;
    Button5.Visible:=false;
    Button6.Visible:=false;
    Button7.Visible:=false;
    Button8.Visible:=false;
    Unit2.Form2.Button3.Visible:=false;
    Unit2.Form2.Button4.Visible:=false;
    Unit2.Form2.Button5.Visible:=false;
    Unit2.Form2.Button6.Visible:=false;
  end;
end;

procedure TForm1.DBEdit1Change(Sender: TObject);
begin
  if (DBEdit1.Text = '') then begin
    button2.Visible:=false;
    button8.Visible:=false;
  Abort;
  end else begin
  button2.Visible:=true;
  button8.Visible:=true;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
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

procedure TForm1.Edit3Change(Sender: TObject);
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

procedure TForm1.Edit4Change(Sender: TObject);
  var x: string;
  var s: string;
  begin
      x:='''%'+Edit4.Text+'%''';
      with Form1 do
  begin
      s:='select * from MAIN where ID like '+x+' or NAME like'+x+' or TYPE_M like'+x+' or SUBTYPE like'+x+' or PRICE like'+x+' order by ID';
      SelectSQL(SQLQuery1, s);
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if SQLQuery1.Active=false then begin
    SQLQuery1.Active:= True;
    end;
  Button4.Visible:=false;
    Button5.Visible:=false;
    Button6.Visible:=false;
    Button7.Visible:=false;
    Button8.Visible:=false;
end;

end.




