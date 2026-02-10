uses Kochh;
uses GraphABC;
type
  prog = class
  private
    fx, fy, fSize, fDepth: real;
  public
    constructor Create(Size, Depth: real);
    begin
      fSize := Size;
      fx := (WindowWidth / 2) - (fSize / 2);
      fy := (WindowHeight / 2) - (fSize / 3);
      fDepth := Depth;
      SetWindowCaption('Стрелки: вверх и вниз - глубина, лево и право - размер');
      WindowResize;
      OnResize := WindowResize;
      OnKeyDown := KeyDown;
    
      end;
    
    procedure DrawAll(x: real; y: real);
    begin
      LockDrawing;
      ClearWindow;
      foreach var angle in |0.0, -2 * pi / 3, 2 * pi / 3| do
      begin
        Koch(x, y, fSize, angle, Round(fDepth));
        x += fSize * cos(angle);
        y -= fSize * sin(angle); 
      end;
      Redraw;
    end;
    
    procedure KeyDown(key: integer);
    begin
      case key of
        VK_Up: fDepth += 1; 
        VK_Down: if fDepth > 0 then fDepth -= 1;
        VK_Right: fSize += 10;
        VK_Left: if fSize > 0 then fSize -= 10;
      end;
      WindowResize();
    end;
    
    procedure WindowResize();
    begin
      fx := (WindowWidth / 2) - (fSize / 2);
      fy := (WindowHeight / 2) - (fSize / 3); 
      DrawAll(fx, fy);
    end;
  end;

begin
  var (Size, Depth) := ReadReal2('введите размер и глубину ');
  var start := new prog(Size, Depth);
end.
