unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, Math;

type
  TCalcOperator = (opNone, opAdd, opSubtract, opMultiply, opDivide);

  { TForm1 }

  TForm1 = class(TForm)
    // Фоновое изображение
    Image1: TImage;

    // Цифровые кнопки
    Seven: TSpeedButton;
    Eight: TSpeedButton;
    Nine: TSpeedButton;
    Four: TSpeedButton;
    Five: TSpeedButton;
    Six: TSpeedButton;
    One: TSpeedButton;
    Two: TSpeedButton;
    Three: TSpeedButton;
    Zero: TSpeedButton;
    Decimal_point: TSpeedButton;

    // Операции
    Plus: TSpeedButton;
    Minus: TSpeedButton;

    // Функциональные кнопки
    Square_root: TSpeedButton;
    x_squared: TSpeedButton;
    Reciprocal: TSpeedButton;

    // Служебные кнопки
    BtnEquals: TSpeedButton;
    Backspace: TSpeedButton;
    CE: TSpeedButton;
    C: TSpeedButton;

    // Дисплей
    Output: TLabel;

    procedure Button1Click(Sender: TObject);
    procedure Decimal_pointClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OutputClick(Sender: TObject);
    procedure Square_rootClick(Sender: TObject);
    procedure x_squaredClick(Sender: TObject);

  private
    Num1, Num2: Double;
    Operation: TCalcOperator;
    StartNewNumber: Boolean;
    HasDecimal: Boolean;

    // Вспомогательные методы
    procedure AddDigit(Digit: Char);
    procedure SetOperator(Op: TCalcOperator);
    procedure PerformCalculation;
    procedure ClearAll;
    procedure ClearEntry;
    procedure RemoveLastChar;
    procedure PerformUnaryOp(OpKind: Integer);

  public
    // Обработчики цифр
    procedure SevenClick(Sender: TObject);
    procedure EightClick(Sender: TObject);
    procedure NineClick(Sender: TObject);
    procedure FourClick(Sender: TObject);
    procedure FiveClick(Sender: TObject);
    procedure SixClick(Sender: TObject);
    procedure OneClick(Sender: TObject);
    procedure TwoClick(Sender: TObject);
    procedure ThreeClick(Sender: TObject);
    procedure ZeroClick(Sender: TObject);

    // Десятичная точка
    procedure DecimalClick(Sender: TObject);

    // Операции
    procedure PlusClick(Sender: TObject);
    procedure MinusClick(Sender: TObject);
    procedure MultiplyClick(Sender: TObject);
    procedure DivideClick(Sender: TObject);

    // Служебные
    procedure BtnEqualsClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure ClearEntryClick(Sender: TObject);
    procedure BackspaceClick(Sender: TObject);

    // Унарные функции
    procedure SquareRootClick(Sender: TObject);
    procedure SquareClick(Sender: TObject);
    procedure ReciprocalClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

end;

procedure TForm1.Decimal_pointClick(Sender: TObject);
begin

end;

//СОЗДАНИЕ ФОРМЫ
procedure TForm1.FormCreate(Sender: TObject);
begin
  Num1 := 0;
  Num2 := 0;
  Operation := opNone;
  StartNewNumber := True;
  HasDecimal := False;
  Output.Caption := '0';
  Output.Alignment := taRightJustify;

  // Запрет масштабирования окна
  Form1.BorderStyle := bsSingle;
  Form1.BorderIcons := [biSystemMenu, biMinimize];

  // Дизайн дисплея
  Output.Font.Name := 'Consolas';
  Output.Font.Size := 18;
  Output.Font.Color := clWhite;
end;

procedure TForm1.OutputClick(Sender: TObject);
begin

end;

procedure TForm1.Square_rootClick(Sender: TObject);
begin

end;

procedure TForm1.x_squaredClick(Sender: TObject);
begin

end;

//ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ

procedure TForm1.AddDigit(Digit: Char);
begin
  if StartNewNumber then
  begin
    Output.Caption := '';
    StartNewNumber := False;
    HasDecimal := False;
  end;

  if (Output.Caption = '0') and (Digit <> '.') then
    Output.Caption := Digit
  else
    Output.Caption := Output.Caption + Digit;

  Num1 := StrToFloatDef(Output.Caption, 0);
end;

procedure TForm1.SetOperator(Op: TCalcOperator);
begin
  Operation := Op;
  Num1 := StrToFloatDef(Output.Caption, 0);
  StartNewNumber := True;
  HasDecimal := False;
end;

procedure TForm1.PerformCalculation;
begin
  if StartNewNumber then Exit;

  Num2 := StrToFloatDef(Output.Caption, 0);

  case Operation of
    opAdd:      Num1 := Num1 + Num2;
    opSubtract: Num1 := Num1 - Num2;
    opMultiply: Num1 := Num1 * Num2;
    opDivide:
      if Num2 <> 0 then
        Num1 := Num1 / Num2
      else
      begin
        ShowMessage('Ошибка: деление на ноль!');
        ClearAll;
        Exit;
      end;
  else
    Exit;
  end;

  Output.Caption := FloatToStrF(Num1, ffGeneral, 15, 10);
  StartNewNumber := True;
end;

procedure TForm1.ClearAll;
begin
  Num1 := 0;
  Num2 := 0;
  Operation := opNone;
  StartNewNumber := True;
  HasDecimal := False;
  Output.Caption := '0';
end;

procedure TForm1.ClearEntry;
begin
  StartNewNumber := True;
  HasDecimal := False;
  Output.Caption := '0';
end;

procedure TForm1.RemoveLastChar;
var
  S: string;
begin
  S := Output.Caption;
  if Length(S) > 1 then
    Delete(S, Length(S), 1)
  else
    S := '0';

  Output.Caption := S;
  Num1 := StrToFloatDef(S, 0);
  HasDecimal := Pos('.', S) > 0;
end;

procedure TForm1.PerformUnaryOp(OpKind: Integer);
var
  X: Double;
begin
  X := StrToFloatDef(Output.Caption, 0);
  case OpKind of
    1: if X >= 0 then
       begin
         Num1 := Sqrt(X);
         Output.Caption := FloatToStrF(Num1, ffGeneral, 15, 10);
         StartNewNumber := True;
       end
       else
         ShowMessage('Нельзя извлечь корень из отрицательного числа!');
    2: begin
         Num1 := X * X;
         Output.Caption := FloatToStrF(Num1, ffGeneral, 15, 10);
         StartNewNumber := True;
       end;
    3: if X <> 0 then
       begin
         Num1 := 1 / X;
         Output.Caption := FloatToStrF(Num1, ffGeneral, 15, 10);
         StartNewNumber := True;
       end
       else
         ShowMessage('Ошибка: деление на ноль!');
  end;
end;

//ЦИФРЫ

procedure TForm1.SevenClick(Sender: TObject);
begin
  AddDigit('7');
end;

procedure TForm1.EightClick(Sender: TObject);
begin
  AddDigit('8');
end;

procedure TForm1.NineClick(Sender: TObject);
begin
  AddDigit('9');
end;

procedure TForm1.FourClick(Sender: TObject);
begin
  AddDigit('4');
end;

procedure TForm1.FiveClick(Sender: TObject);
begin
  AddDigit('5');
end;

procedure TForm1.SixClick(Sender: TObject);
begin
  AddDigit('6');
end;

procedure TForm1.OneClick(Sender: TObject);
begin
  AddDigit('1');
end;

procedure TForm1.TwoClick(Sender: TObject);
begin
  AddDigit('2');
end;

procedure TForm1.ThreeClick(Sender: TObject);
begin
  AddDigit('3');
end;

procedure TForm1.ZeroClick(Sender: TObject);
begin
  AddDigit('0');
end;

//ДЕСЯТИЧНАЯ ТОЧКА
procedure TForm1.DecimalClick(Sender: TObject);
begin
  if StartNewNumber then
  begin
    Output.Caption := '0';
    StartNewNumber := False;
  end;

  if Pos('.', Output.Caption) = 0 then
  begin
    Output.Caption := Output.Caption + '.';
    HasDecimal := True;
  end;
end;

// ====================== ОПЕРАЦИИ ======================
procedure TForm1.PlusClick(Sender: TObject);
begin
  SetOperator(opAdd);
end;

procedure TForm1.MinusClick(Sender: TObject);
begin
  SetOperator(opSubtract);
end;

procedure TForm1.MultiplyClick(Sender: TObject);
begin
  SetOperator(opMultiply);
end;

procedure TForm1.DivideClick(Sender: TObject);
begin
  SetOperator(opDivide);
end;

//РАВНО
procedure TForm1.BtnEqualsClick(Sender: TObject);
begin
  PerformCalculation;
end;

//C (полная очистка)
procedure TForm1.ClearClick(Sender: TObject);
begin
  ClearAll;
end;

//CE (очистка ввода)
procedure TForm1.ClearEntryClick(Sender: TObject);
begin
  ClearEntry;
end;

//BACKSPACE
procedure TForm1.BackspaceClick(Sender: TObject);
begin
  RemoveLastChar;
end;

//КОРЕНЬ
procedure TForm1.SquareRootClick(Sender: TObject);
begin
  PerformUnaryOp(1);
end;

//КВАДРАТ
procedure TForm1.SquareClick(Sender: TObject);
begin
  PerformUnaryOp(2);
end;

//1/x
procedure TForm1.ReciprocalClick(Sender: TObject);
begin
  PerformUnaryOp(3);
end;

end.
