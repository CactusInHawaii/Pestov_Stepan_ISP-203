begin
  var n:=ReadInteger('Введите n');
  var p:=1;
  var a:integer;
  while n<>0 do
  begin
    a:=n mod 10;
    p:=p*a;
    n:=n div 10;
  end;
  Println(p)
end.