begin
  var n:=ReadInteger('Введите n');
  var x:=1;
  var k:=0;
  while x<=n do
  begin
  if n mod x =0 then k+=1;
  x+=1;
  end;
  Println(k)
end.