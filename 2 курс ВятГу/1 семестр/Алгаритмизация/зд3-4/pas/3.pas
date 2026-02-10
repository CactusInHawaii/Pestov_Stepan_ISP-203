var r,c,wr,mr:integer;
begin
  Randomize;
var w:= readinteger('введите кол-во девочек');
for var i:=1 to w do
  begin
  wr:=wr+random(130,170);
  end;

var m:= readinteger('введите кол-во мальчиков');
for var i:=1 to m do
  begin
  mr:=mr+random(150,190);
  end;
  
writeln('средни рост девочек = ',(wr/w):0:2);
writeln('средни рост мальчиков = ',(mr/m):0:2);

end.