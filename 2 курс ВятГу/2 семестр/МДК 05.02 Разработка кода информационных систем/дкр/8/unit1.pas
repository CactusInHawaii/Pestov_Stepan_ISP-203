unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  S, P: Double;
  n: Integer;
  ResSimple, ResCompound: Double;
begin

  S := StrToFloatDef(Edit1.Text, 0);
  P := StrToFloatDef(Edit2.Text, 0);
  n := StrToIntDef(Edit3.Text, 0);

  ResSimple := S * (1 + (P / 100) * n);

  ResCompound := S * Power(1 + (P / 100), n);

  Label1.Caption := 'Простые: ' + FloatToStrF(ResSimple, ffFixed, 10, 2);
  Label2.Caption := 'Сложные: ' + FloatToStrF(ResCompound, ffFixed, 10, 2);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

