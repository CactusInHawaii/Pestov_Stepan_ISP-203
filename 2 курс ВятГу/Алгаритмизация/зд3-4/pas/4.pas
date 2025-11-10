var pred:array of integer;
var s,ss:integer;
begin
var n:=readinteger('введите кол-во предприятий ');
SetLengtH(pred,n+1);
writeln(pred);

for var i:=1 to n do
  begin
    writeln('введите мошь ',i,' предприятия ');
    read(pred[i]);
    s:=s+pred[i];
  end;
  
for var i:=1 to n do
if pred[i-1]<pred[i] then ss:=i; 
  
 writeln('общая мошь = ',s);
 writeln('средняя мошь = ',(s/n):0:2);
 writeln('номер предприятия с наибольшей мошьностью = ',ss);
end.