begin
  var n:=ReadInteger();
  var i:=1;
  var k:=0;
  while i<=n do
  begin
    var x:=1;
    var c:=0;
    var y:=ReadInteger();
    while x<=y do
    begin
      if y mod x = 0 then c+=1;
      x+=1;
    end;
    if c=2 then k+=1;
    i+=1;
  end;
  Println(k);
end.