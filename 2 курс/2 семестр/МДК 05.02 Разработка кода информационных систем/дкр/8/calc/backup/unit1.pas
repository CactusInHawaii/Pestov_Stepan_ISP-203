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

procedure TForm1.Button1Click(Sender: TObject);
var
  S, P: Double;
  n: Integer;
  ResSimple, ResCompound: Double;
begin
  try
    S := StrToFloat(Edit1.Text);
    P := StrToFloat(Edit2.Text);
    n := StrToInt(Edit3.Text);

    if (S < 0) or (P < 0) or (n < 0) then
      raise Exception.Create('Значения не могут быть отрицательными');

    ResSimple := S * (1 + (P / 100) * n);
    ResCompound := S * Power(1 + (P / 100), n);

    Label1.Caption := 'Простые: ' + FloatToStrF(ResSimple, ffFixed, 10, 2);
    Label2.Caption := 'Сложные: ' + FloatToStrF(ResCompound, ffFixed, 10, 2);

  except
    on E: Exception do
    begin
      Label1.Caption := 'Ошибка ввода!';
      Label2.Caption := 'Введите корректные числа';

      MessageDlg('Ошибка',
        'Проверьте введённые данные:' + sLineBreak +
        '• Сумма, процент и год должны быть числами' + sLineBreak +
        '• Значения не могут быть отрицательными',
        mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption := 'Калькулятор процентов';
end;

end.
