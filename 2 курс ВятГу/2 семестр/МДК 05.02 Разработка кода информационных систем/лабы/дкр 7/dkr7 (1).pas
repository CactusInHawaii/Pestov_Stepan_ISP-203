

var 
  gx, gy, gSize, gDepth: real;

procedure Koch(x, y, len, angle: real; it: integer);
  procedure Rendering;
  begin
    var l := len / 3;
    foreach var a in |0.0, pi/3, -pi/3, 0.0| do
    begin
      Koch(x, y, l, angle + a, it - 1);
      x += l * cos(angle + a);
      y -= l * sin(angle + a);
    end;
  end;
begin
  if it = 0 then 
    Line(Round(x), Round(y), Round(x + len * cos(angle)), Round(y - len * sin(angle)))
  else Rendering;
end;

procedure DrawAll(tx:real; ty:real);
begin
  LockDrawing;
  ClearWindow;
  foreach var a in |0.0, -2*pi/3, 2*pi/3| do
  begin
    Koch(tx, ty, gSize, a, Round(gDepth));
    tx += gSize * cos(a);
    ty -= gSize * sin(a);
    
  end;
  Redraw;
end;

procedure KeyDown(key: integer);
begin
  case key of
    VK_Up: gDepth += 1; 
    VK_Down: if gDepth > 0 then gDepth -= 1;
    VK_Right: gSize+=10;
    VK_Left: if gSize > 0 then gSize -= 10;
  end;
  DrawAll(gx, gy); // перерисовка при любом нажатии
end;

procedure WindowResize();
begin
  // Пересчитываем центр исходя из новой высоты и ширины
  gx := (WindowWidth / 2) - (gSize / 2);
  gy := (WindowHeight / 2) - (gSize / 3); 
  DrawAll(gx, gy); // Перерисовываем в центре
end;

begin
  // Ввод данных
  Write('Введите size, depth: ');
  Read(gSize, gDepth);
  gx := (WindowWidth / 2) - (gSize / 2);
  gy := (WindowHeight / 2) - (gSize / 3);
  SetWindowCaption('Стрелки: вверх и вниз - глубина, лево и право - размер');
  
  //DrawAll(gx, gy);
  OnResize := WindowResize;
  
  OnKeyDown := KeyDown;
  OnKeyDown := WindowResize;
 
  WindowResize;
end.
