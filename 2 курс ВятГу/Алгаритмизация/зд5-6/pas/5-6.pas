procedure z1();
begin
  var arr:array[1..20] of integer;
  for var i:=1 to 20 do
  begin
    Readln(arr[i]);
    if arr[i]>0 then arr[i]:=0;
    if arr[i]<0 then Sqr(arr[i]);
  end;
  for var i:=1 to 20 do
    Write(arr[i],' ');
end;
//////////////////////////////////////////////
procedure z2();
begin
  var c,p,max_c:integer;
  var arr:array of integer;
  var n:=ReadInteger('введите длину массива');
  SetLength(arr,n+1);
  
  for var i:=1 to n do
    begin
    arr[i]:=Random(1,2);
    Write(arr[i],' ');
    end;
    Writeln; 
    p:=arr[1];
    
  for var i:=1 to n do
  begin
    c:=0;
    
    for var j:=1 to n do
      if arr[i]=arr[j] then Inc(c);
    
    if c>max_c then
    begin
      max_c:= c;
      p:= arr[i];
    end;
  end;
  Writeln(p,' встречаеться ',max_c,' раз')
end;
//////////////////////////////////////////////
procedure z3();
begin
  var arr:array[1..20] of integer;
  for var i:=1 to 20 do
    begin
      if (i>1) and (arr[i-1]<0) then
      begin
        arr[i]:=i;
        continue;
      end;
      arr[i]:=Random(-10,10);
      Write(arr[i],' ');
    end;
end;
begin
  z3();
end.