procedure z1;
begin
var a:=readinteger('введите число');
writeln(a mod 10,' последняя цифра');
end;

procedure z2;
begin
var a:=readinteger('введите число');
writeln('всего десятков ',a div 10 mod 10);
end;

procedure z3;
begin
var c,v,b:integer;
var a:=readinteger('введите 3-х значное число ');
    c:= a div 100 mod 10;
    v:= a div 10 mod 10;
    b:= a mod 10;
    print('сумма цифр = ',c+v+b);
end;

procedure z4;
begin
var a:=readinteger('введите число');
writeln('следушие чётное число ');
if a mod 2 =0 then writeln(a+2) 
else writeln(a+1);
end;

procedure z5;
begin
var a:=readinteger('введите число');
print('абсолютное значение числа ',abs(a));
end;

procedure z6;
begin
  var p,s:real;
  var a:=readinteger('введите 1 сторону треугольника ');
  var b:=readinteger('введите 2 сторону треугольника ');
  var c:=readinteger('введите 3 сторону треугольника ');
  p:=(a+b+c)/2;
  s:=sqrt(p*(p-a)*(p-b)*(p-c));
  writeln(s:0:2);
end;

procedure z7;
begin
    var v:real;
    var r:=readinteger('введите радиус шара ');
    v:=(4/3)*pi*power(r,3);
    writeln('обьем шара = ',v:0:2);
end;

procedure z8;
begin
  var c:real;
  var a:=readinteger('введите конец отезка ');
  var b:=readinteger('введите конец отезка ');
  c:=(a+b)/2;
  writeln('середина отрезка = ',c:0:2);
end;

procedure z9;
begin
  var a:=readinteger();
  var b:=readinteger();
  var c:=readinteger();
  var d:=readinteger();
  
  var x:= (d-c)/(a-b);
  var y:= a*(d-c)/(a-b)+c;
  
  print(x,y);
end;

begin
  var e:= readinteger('введите номер задачи');
  case e of
    1:z1;
    2:z2;
    3:z3;
    4:z4;
    5:z5;
    6:z6;
    7:z7;
    8:z8;
    9:z9;
  end;
end.