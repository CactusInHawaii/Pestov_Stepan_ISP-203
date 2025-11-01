procedure z1();
begin
  var a:= ReadString();
  if Length(a)<6 then 
    for var i:=1 to Length(a) do
    begin
      Write(a[1],' ');
    end
  else
    Writeln(Copy(a,1,3),' ',Copy(a,length(a)-2,Length(a)));
end;

procedure z2();
begin
  var a:=ReadString();
  for var i:=1 to Length(a) do
  begin
    if a[i]='x' then begin Writeln('x'); exit; end;
    if a[i]='w' then begin Writeln('w'); exit; end;
  end;
  Writeln('Таких символов нет')
end;

procedure z3();
begin
  var a:=ReadString();
  if Length(a)>10 then 
    Delete(a,7,Length(a))
  else
  begin
    var n:integer;
    for n:=Length(a)+1 to 12 do
    begin
      var e:='o';
      Insert(e,a,n);
    end;
  end;
  Writeln(a);
end;

begin
  z3();
end.