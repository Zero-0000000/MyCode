unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form6: TForm6;

implementation

uses Unit1;

{$R *.lfm}

{ TForm6 }

procedure TForm6.Button1Click(Sender: TObject);
begin
  if (Edit2.Text = 'Admin') then begin
    if (Edit1.Text = '333222') then begin
      Unit1.Form1.Button3.Visible:=true;
      Unit1.Form1.Button4.Visible:=true;
      Unit1.Form1.Button5.Visible:=true;
      Unit1.Form1.Button6.Visible:=false;
      Unit1.Form1.Button1.Visible:=true;
      Unit1.Form1.Button2.Visible:=true;
      Unit1.Form1.DBLookupComboBox1.Visible:=true;
      Unit1.Form1.DBLookupComboBox2.Visible:=true;
      Unit1.Form1.DBLookupComboBox3.Visible:=true;
      Unit1.Form1.DateTimePicker1.Visible:=true;
      Unit1.Form1.DBEdit1.Visible:=true;
      Unit1.Form1.Label1.Visible:=true;
      Unit1.Form1.Label2.Visible:=true;
      Unit1.Form1.Label3.Visible:=true;
      Unit1.Form1.Label4.Visible:=true;
      Unit1.Form1.Label5.Visible:=true;
      Unit1.Form1.Edit1.Visible:=true;

      Unit1.Form1.Button7.Left:=672;
      Unit1.Form1.Button7.Top:=328;
      Unit1.Form1.Button8.Left:=600;
      Unit1.Form1.Button8.Top:=168;
      Unit1.Form1.Label6.Left:=416;
      Unit1.Form1.Label6.Top:=176;
      Unit1.Form1.Label7.Left:=416;
      Unit1.Form1.Label7.Top:=208;
      Unit1.Form1.DBLookupComboBox4.Left:=496;
      Unit1.Form1.DBLookupComboBox4.Top:=168;
      Unit1.Form1.Edit3.Left:=496;
      Unit1.Form1.Edit3.Top:=200;

      Unit1.Form1.Caption:='Soft List: Admin';
      Unit1.Form1.Height:=358;
      Form6.Hide;
    end else begin
        ShowMessage('Неверный логин или пароль');
    end;
  end else begin
    ShowMessage('Логин не существует!');
  end;
end;

end.

