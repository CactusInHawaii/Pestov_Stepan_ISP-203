procedure z1();
begin
  Randomize;
  var s:integer;
  var arr := new integer[10];
  
  for var i := 0 to arr.Length-1 do
    arr[i] := Random(-10, 10);
  var min:=arr.Min;
  arr.Sort;
  
  for var i:=0 to arr.Length-1 do
    if arr[i]=min then s+=1;
  
  arr.Println;
  Println($'Минимальное число: {min}, Встречаеться раз: {s}');
end;

procedure z2();
begin
  var s:=ReadString('Введите строку ');
  var ps:=ReadString('Введите подстроку');
  Delete(s,Pos(ps,s),Length(ps));
  Delete(s,LastPos(ps,s),Length(ps));
  Print(s);  
end;

procedure z3();
begin
  var s:=ReadString('Введите строку ');
  var ps:=ReadString('Введите подстроку');
  
  var pos:=s.IndexOf(ps);
  s:=s.Remove(pos,ps.Length);
  
  var pos1:=s.LastIndexOf(ps);
  s:=s.Remove(pos1,ps.Length);
  
  Println(s);

end;

begin
z3();
end.