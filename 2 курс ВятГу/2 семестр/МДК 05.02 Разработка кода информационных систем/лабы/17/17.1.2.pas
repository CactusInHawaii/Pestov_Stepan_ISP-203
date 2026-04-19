procedure z1();
begin
  var l1 := new List<integer>;
  var l2 := new List<integer>;
  var arr := ArrRandom(10, -5, 20);
  foreach var i in arr do
  begin
    (i >= 0 ? l1 : l2).Add(i);
  end;
  
  writeln('Исходный массив: ', arr);
  writeln('Положительные: ', l1);
  writeln('Отрицательные: ', l2);
end;

procedure z2();
begin
  var L := ArrRandom(10).ToList();
  L.Println('Исходный список:'); 
  L.RemoveAt(L.IndexOf(L.Max));   
  L.Println('После удаления максимума:'); 
end;

begin
  z2();
end.