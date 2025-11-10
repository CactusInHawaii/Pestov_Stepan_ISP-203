begin
  var a:=ReadInteger();
  var s:=0;
  var i:=1;
  while i<=a do
  begin
    if a=s then break;
    if a mod i = 0 then s+=i;
    Inc(i);
  end;
  Println(s)
end.