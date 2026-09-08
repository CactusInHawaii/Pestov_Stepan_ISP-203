program Lab5_SortingAlgorithms;

type
  TArray = array of integer;
  TComparator = function(a, b: integer): boolean;

var
  arr: TArray;
  filename: string;

function Ascending(a, b: integer): boolean;
begin
  result := a > b;
end;

function Descending(a, b: integer): boolean;
begin
  result := a < b;
end;

procedure InsertionSort(var arr: TArray; comparator: TComparator);
var
  i, j, key: integer;
begin
  for i := 1 to length(arr) - 1 do
  begin
    key := arr[i];
    j := i - 1;
    while (j >= 0) and comparator(arr[j], key) do
    begin
      arr[j + 1] := arr[j];
      j := j - 1;
    end;
    arr[j + 1] := key;
  end;
end;

function GetMax(arr: TArray): integer;
var
  i, max: integer;
begin
  max := arr[0];
  for i := 1 to length(arr) - 1 do
    if arr[i] > max then
      max := arr[i];
  result := max;
end;

procedure CountingSort(var arr: TArray; exp: integer);
var
  output: array of integer;
  count: array[0..9] of integer;
  i: integer;
begin
  SetLength(output, length(arr));
  for i := 0 to 9 do
    count[i] := 0;
  for i := 0 to length(arr) - 1 do
    count[(arr[i] div exp) mod 10] := count[(arr[i] div exp) mod 10] + 1;
  for i := 1 to 9 do
    count[i] := count[i] + count[i - 1];
  for i := length(arr) - 1 downto 0 do
  begin
    output[count[(arr[i] div exp) mod 10] - 1] := arr[i];
    count[(arr[i] div exp) mod 10] := count[(arr[i] div exp) mod 10] - 1;
  end;
  for i := 0 to length(arr) - 1 do
    arr[i] := output[i];
end;

procedure RadixSort(var arr: TArray; comparator: TComparator);
var
  max, exp: integer;
  temp: TArray;
  i: integer;
  isDescending: boolean;
begin
  for i := 0 to length(arr) - 1 do
    if arr[i] < 0 then
    begin
      writeln('Поразрядная сортировка работает только с неотрицательными числами!');
      exit;
    end;
  
  isDescending := comparator(5, 3);
  
  max := GetMax(arr);
  exp := 1;
  while max div exp > 0 do
  begin
    CountingSort(arr, exp);
    exp := exp * 10;
  end;
  
  if isDescending then
  begin
    SetLength(temp, length(arr));
    for i := 0 to length(arr) - 1 do
      temp[i] := arr[length(arr) - 1 - i];
    arr := temp;
  end;
end;

procedure ReadArrayFromFile(var arr: TArray; filename: string);
var
  f: text;
  n, i: integer;
begin
  assign(f, filename);
  reset(f);
  readln(f, n);
  SetLength(arr, n);
  for i := 0 to n - 1 do
    read(f, arr[i]);
  close(f);
end;

procedure WriteArrayToFile(arr: TArray; filename: string);
var
  f: text;
  i: integer;
begin
  assign(f, filename);
  rewrite(f);
  writeln(f, length(arr));
  for i := 0 to length(arr) - 1 do
    write(f, arr[i], ' ');
  close(f);
end;

procedure PrintArray(arr: TArray);
var
  i: integer;
begin
  if length(arr) > 20 then
  begin
    writeln('Первые 20 элементов из ', length(arr), ':');
    for i := 0 to 19 do
      write(arr[i], ' ');
    writeln('...');
  end
  else
  begin
    for i := 0 to length(arr) - 1 do
      write(arr[i], ' ');
    writeln;
  end;
end;

procedure TestSort(sortName: string; sortProc: procedure(var arr: TArray; comparator: TComparator); 
                   arr: TArray; comparator: TComparator; orderName: string);
var
  tempArr: TArray;
  startTime, endTime: System.DateTime;
  i: integer;
begin
  writeln;
  writeln('=== ', sortName, ' (', orderName, ') ===');
  SetLength(tempArr, length(arr));
  for i := 0 to length(arr) - 1 do
    tempArr[i] := arr[i];
  writeln('Исходный массив:');
  PrintArray(tempArr);
  startTime := System.DateTime.Now;
  sortProc(tempArr, comparator);
  endTime := System.DateTime.Now;
  writeln('Отсортированный массив:');
  PrintArray(tempArr);
  writeln('Время выполнения: ', (endTime - startTime).TotalMilliseconds:0:3, ' мс');
end;

procedure CreateTestFile(filename: string; size: integer);
var
  f: text;
  i: integer;
begin
  assign(f, filename);
  rewrite(f);
  writeln(f, size);
  Randomize;
  for i := 1 to size do
    write(f, Random(10000), ' ');
  close(f);
  writeln('Создан тестовый файл ', filename, ' с ', size, ' элементами');
end;

begin
  writeln('Лабораторная работа №5: Исследование алгоритмов сортировки');
  writeln('Фамилия: Пестов');
  writeln('Вариант: 12');
  writeln('========================================');
  
  // Создаем тестовые файлы в текущей директории
  CreateTestFile('test_small.txt', 20);
  CreateTestFile('test_medium.txt', 1000);
  CreateTestFile('test_large.txt', 10000);
  
  filename := 'test_small.txt';
  ReadArrayFromFile(arr, filename);
  
  TestSort('Сортировка вставками', InsertionSort, arr, Ascending, 'по возрастанию');
  TestSort('Сортировка вставками', InsertionSort, arr, Descending, 'по убыванию');
  TestSort('Поразрядная сортировка', RadixSort, arr, Ascending, 'по возрастанию');
  TestSort('Поразрядная сортировка', RadixSort, arr, Descending, 'по убыванию');
  
  writeln;
  writeln('========================================');
  
  filename := 'test_medium.txt';
  ReadArrayFromFile(arr, filename);
  
  writeln('Тестирование на массиве из 1000 элементов:');
  
  var startTime := System.DateTime.Now;
  InsertionSort(arr, Ascending);
  var endTime := System.DateTime.Now;
  writeln('Сортировка вставками: ', (endTime - startTime).TotalMilliseconds:0:3, ' мс');
  
  ReadArrayFromFile(arr, filename);
  
  startTime := System.DateTime.Now;
  RadixSort(arr, Ascending);
  endTime := System.DateTime.Now;
  writeln('Поразрядная сортировка: ', (endTime - startTime).TotalMilliseconds:0:3, ' мс');
  
  writeln;
  writeln('Хотите отсортировать свой файл? (y/n)');
  var answer := ReadChar;
  
  if (answer = 'y') or (answer = 'Y') then
  begin
    writeln('Введите имя файла:');
    var customFile := ReadString;
    
    if FileExists(customFile) then
    begin
      ReadArrayFromFile(arr, customFile);
      
      writeln('Выберите сортировку:');
      writeln('1 - Сортировка вставками');
      writeln('2 - Поразрядная сортировка');
      var choice := ReadInteger;
      
      writeln('Выберите порядок:');
      writeln('1 - По возрастанию');
      writeln('2 - По убыванию');
      var order := ReadInteger;
      
      var comparator: TComparator;
      if order = 1 then
        comparator := Ascending
      else
        comparator := Descending;
      
      startTime := System.DateTime.Now;
      if choice = 1 then
        InsertionSort(arr, comparator)
      else
        RadixSort(arr, comparator);
      endTime := System.DateTime.Now;
      
      writeln('Сортировка завершена за ', (endTime - startTime).TotalMilliseconds:0:3, ' мс');
      
      writeln('Введите имя файла для сохранения результата:');
      var outFile := ReadString;
      WriteArrayToFile(arr, outFile);
      
      writeln('Результат сохранен в файл ', outFile);
    end
    else
      writeln('Файл не найден!');
  end;
  
  writeln;
  writeln('Нажмите Enter для выхода...');
  ReadLn;
end.
