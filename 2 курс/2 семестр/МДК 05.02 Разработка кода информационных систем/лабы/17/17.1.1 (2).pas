procedure z1();
begin
  var arr := ArrRandom(10);
  Println(arr);
  Println(arr[::-1]);
end;

function z2(n: integer): array of integer;
begin
  if n mod 2 = 0 then 
  begin
    var arr := ArrRandom(n);
    Result := arr[::2]; 
  end
  else 
    Result := []; 
end;

function z3(n: integer): integer;
begin
  var arr := ArrRandom(n)[::2];
  Print(arr);
  if arr.Length = 0 then
    Result := 0
  else
    Result := arr.Min; 
end;

procedure z4();
begin
  var arr := ArrRandom(10);         
  Writeln('Исходный массив: ', arr);
  var maxElem := arr.Max;                        
  var indexMax := arr.IndexOf(maxElem);         
  var newArr := arr[:indexMax] + arr[indexMax+1:];
  Writeln('Массив после удаления первого максимального элемента: ', newArr);
end;

procedure z5();
begin
  var arr := ArrRandom(10);
  Writeln('Исходный массив: ', arr);
  var n := ReadInteger('Введите число n: ');
  var minElem := arr.Min;
  var indexMin := arr.IndexOf(minElem);
  var newArr := arr[:indexMin] + [n] + arr[indexMin:];
  Writeln('Массив после вставки n перед минимальным элементом: ', newArr);
end;

begin
  var v := ReadInteger('Выберите задание (1-5): ');
  case v of
    1: z1();
    2:
    begin
      var Arr := z2(5); 
      Arr.Print;
    end;
    3:
    begin
      var m := z3(10);
      Print(m);
    end;
    4: z4();
    5: z5();
  end;
end.