begin
  var n:=ReadInteger();
  var x:=1;
  var s:=0;
  while x<=n do
  begin
    if n mod x = 0 then s+=x;
    x+=1;
  end;
  if s=n then Print('ДА')
  else Print('НЕТ');
end.