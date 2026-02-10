uses GraphABC;

var
  a, b: real;  // Пределы интегрирования

// Функция f(x) = x^3 - x^2 - 4x + 17
function F(x: real): real;
begin
  Result := x*x*x - x*x - 4*x + 17;
end;

// Автоматический масштаб под размер окна
function AutoScaleX: real;
begin
  // Автоматически подбираем масштаб по X чтобы вместить от -5 до 5
  Result := (WindowWidth - 100) / (10 * 90); // 100px отступы, 10 единиц по X
end;

function AutoScaleY: real;
begin
  // Автоматически подбираем масштаб по Y
  Result := (WindowHeight - 100) / (90 * 40); // 100px отступы, 60 единиц по Y
end;

// Рисуем оси с засечками
procedure DrawAxes;
VAR
  i: integer;
  scaleX, scaleY: real;
begin
  var w := WindowCenter;
  scaleX := AutoScaleX;
  scaleY := AutoScaleY;
  
  // Ось X
  SetPenColor(clBlack);
  SetPenWidth(2);
  Line(50, w.Y, WindowWidth - 50, w.Y);
  
  // Ось Y
  Line((w.X, 50), (w.X, WindowHeight - 50));
  
  // Стрелки
  Line(WindowWidth - 50, w.Y - 5, WindowWidth - 40, w.Y);
  Line(WindowWidth - 50, w.Y + 5, WindowWidth - 40, w.Y);
  Line(w.X - 5, 50, w.X, 40);
  Line(w.X + 5, 50, w.X, 40);
  
  // Подписи осей
  SetFontColor(clBlack);
  TextOut(WindowWidth - 30, w.Y - 20, 'X');
  TextOut(w.X + 10, 30, 'Y');
  
  // Засечки на оси X (от -5 до 5)
  for i := -5 to 5 do
  begin
    if i <> 0 then
    begin
      var xPos := w.X + Round(i * 30 * scaleX);
      Line(xPos, w.Y - 5, xPos, w.Y + 5);
      TextOut(xPos - 10, w.Y + 10, IntToStr(i));
    end;
  end;
  
  // Засечки на оси Y (от -20 до 40)
  for i := -50 to 50 do
  begin
    if (i <> 0) and (i mod 10 = 0) then
    begin
      var yPos := w.Y - Round(i * 30 * scaleY);
      Line(w.X - 5, yPos, w.X + 5, yPos);
      TextOut(w.X + 10, yPos - 10, IntToStr(i));
    end;
  end;
  
  // Ноль
  TextOut(w.X + 2, w.Y + 2, '0');
end;

// Рисуем график функции
procedure DrawGraph;
var
  x, y: real;
  i: integer;
  scaleX, scaleY: real;
  firstPoint: boolean;
begin
  
  var w:= WindowCenter;
  scaleX := AutoScaleX;
  scaleY := AutoScaleY;
  
  SetPenColor(clBlue);
  SetPenWidth(3);
  
  firstPoint := true;
  
  // Рисуем линию через точки (от -5 до 5 с шагом 0.01)
  for i := -500 to 500 do
  begin
    x := i / 100.0; // от -5 до 5 с шагом 0.01
    y := F(x);
    
    var screenX := w.X + Round(x * 30 * scaleX);
    var screenY := w.Y - Round(y * 30 * scaleY);
    
    // Проверяем, чтобы точка была в пределах окна
    if (screenX > 50) and (screenX < WindowWidth - 50) and
       (screenY > 50) and (screenY < WindowHeight - 50) then
    begin
      if firstPoint then
      begin
        MoveTo(screenX, screenY);
        firstPoint := false;
      end
      else
      begin
        LineTo(screenX, screenY);
      end;
    end
    else
    begin
      // Если точка вышла за границы, начинаем новую линию
      firstPoint := true;
    end;
  end;
end;

// Рисуем штриховку с шагом 1
procedure DrawHatching;
var
  centerX, centerY: integer;
  i: integer;
  x, y: real;
  scaleX, scaleY: real;
begin
  centerX := WindowWidth div 2;
  centerY := WindowHeight div 2;
  scaleX := AutoScaleX;
  scaleY := AutoScaleY;
  
  SetPenColor(clGreen);
  SetPenWidth(1);
  
  // Штриховка с шагом 1 от a до b
  i := Ceil(a); // Начинаем с наименьшего целого >= a
  while i <= Floor(b) do // Пока не достигнем наибольшего целого <= b
  begin
    x := i;
    y := F(x);
    
    var screenX := centerX + Round(x * 30 * scaleX);
    var screenY := centerY - Round(y * 30 * scaleY);
    var axisY := centerY; // Уровень оси X (y=0)
    
    // Рисуем штрих от оси X до функции
    Line(screenX, axisY, screenX, screenY);
    
    i := i + 1; // Шаг 1
  end;
  
  // Подписи a и b
  SetFontColor(clPurple);
  SetFontSize(12);
  TextOut(centerX + Round(a * 30 * scaleX) - 10, centerY + 30, 'a');
  TextOut(centerX + Round(b * 30 * scaleX) - 10, centerY + 30, 'b');
  
end;

// Основная отрисовка
procedure DrawAll;
begin
  ClearWindow(clWhite);
  
  // Информация о задании
  SetFontColor(clBlack);
  SetFontSize(14);
  TextOut(20, 20, 'Лабораторная работа №4');
  TextOut(20, 40, 'Пестов. Вариант 12');
  TextOut(20, 60, 'f(x) = x³ - x² - 4x + 17');
  TextOut(20, 80, 'Интервал интегрирования:');
  TextOut(20, 100, 'a = ' + FloatToStr(a) + ',  b = ' + FloatToStr(b));
  
  // Все элементы графика
  DrawAxes;
  DrawHatching;  // Штриховка от a и b до функции с шагом 1
  DrawGraph;     // График функции поверх штриховки
end;

// Инициализация
begin
  a := -2;
  b := 4;
  
  // Устанавливаем начальный размер окна
  SetWindowSize(800, 600);
  SetWindowTitle('График функции с интегрированием');
  
  // Подключаем обработчик изменения размера окна
  OnResize := DrawAll;
  
  DrawAll;
end.