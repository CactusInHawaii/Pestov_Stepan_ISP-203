unit Kochh;

interface
uses GraphABC;
procedure Koch(x, y, len, angle: real; Depth: integer);
implementation


procedure Koch(x, y, len, angle: real; Depth: integer);//ПАРАМЕТРИЗАЦИЯ
    begin
      if Depth = 0 then //БАЗА РЕКУРСИИ
        Line(Round(x), Round(y), Round(x + len * cos(angle)), Round(y - len * sin(angle)))
      else
        begin//ДЕКОМПОЗИЦИЯ
        var l := len / 3;
        foreach var a in |0.0, pi / 3, -pi / 3, 0.0| do
        begin
          
          Koch(x, y, l, angle + a, Depth - 1);
          x += l * cos(angle + a);
          y -= l * sin(angle + a);
        end;
      end;
    end;
end. 