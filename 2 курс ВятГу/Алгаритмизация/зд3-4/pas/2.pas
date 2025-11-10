var r,c:integer;
begin
var a:= readreal('введите кол-во км в 1 день');
var x:= readreal('введите кол-во км > 1 дня');

while a<x do
begin
a:=a*1.1;
inc(c);
  end;
  
  writeln(c,' дней что бы преодолеть');
end.