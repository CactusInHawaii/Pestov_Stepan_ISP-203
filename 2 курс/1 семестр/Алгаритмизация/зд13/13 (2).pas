program FileOperations;

uses
  System.IO; // Для PascalABC.NET

{ Процедура 1: Удаление элементов после последнего пробела }
procedure RemoveAfterLastSpace(const filename: string);
var
  inputFile, tempFile: file of char;
  ch: char;
  spacePos, currentPos: integer;
begin
  { Определяем позицию последнего пробела }
  spacePos := -1;
  currentPos := 0;
  
  Assign(inputFile, filename);
  Reset(inputFile);
  
  while not EOF(inputFile) do
  begin
    Read(inputFile, ch);
    if ch = ' ' then
      spacePos := currentPos;
    Inc(currentPos);
  end;
  
  Close(inputFile);
  
  { Если пробел не найден, ничего не делаем }
  if spacePos = -1 then
    Exit;
    
  { Создаем временный файл }
  Assign(inputFile, filename);
  Reset(inputFile);
  
  Assign(tempFile, 'temp_' + filename);
  Rewrite(tempFile);
  
  { Копируем только символы до последнего пробела }
  currentPos := 0;
  while (currentPos < spacePos) and not EOF(inputFile) do
  begin
    Read(inputFile, ch);
    Write(tempFile, ch);
    Inc(currentPos);
  end;
  
  Close(inputFile);
  Close(tempFile);
  
  { Заменяем исходный файл временным }
  Erase(inputFile);
  Rename(tempFile, filename);
end;

{ Процедура 2: Строки наибольшей длины в обратном порядке }
procedure CreateFileWithLongestStrings(const inputFile, outputFile: string);
var
  input, output: text;
  line: string;
  maxLength: integer;
  lines: array of string;
  i, count: integer;
begin
  { Определяем максимальную длину строк }
  maxLength := 0;
  
  Assign(input, inputFile);
  Reset(input);
  
  while not EOF(input) do
  begin
    ReadLn(input, line);
    if Length(line) > maxLength then
      maxLength := Length(line);
  end;
  
  Close(input);
  
  { Собираем строки максимальной длины }
  SetLength(lines, 0);
  
  Assign(input, inputFile);
  Reset(input);
  
  while not EOF(input) do
  begin
    ReadLn(input, line);
    if Length(line) = maxLength then
    begin
      SetLength(lines, Length(lines) + 1);
      lines[Length(lines) - 1] := line;
    end;
  end;
  
  Close(input);
  
  { Записываем строки в обратном порядке }
  Assign(output, outputFile);
  Rewrite(output);
  
  for i := Length(lines) - 1 downto 0 do
    WriteLn(output, lines[i]);
    
  Close(output);
end;

{ Процедура 3: Разделить файл на четные и нечетные элементы }
procedure SplitFileByIndex(const inputFile, oddFile, evenFile: string);
var
  input, odd, even: file of real;
  value: real;
  index: integer;
begin
  Assign(input, inputFile);
  Reset(input);
  
  Assign(odd, oddFile);
  Rewrite(odd);
  
  Assign(even, evenFile);
  Rewrite(even);
  
  index := 1;
  while not EOF(input) do
  begin
    Read(input, value);
    if index mod 2 = 1 then
      Write(odd, value)
    else
      Write(even, value);
    Inc(index);
  end;
  
  Close(input);
  Close(odd);
  Close(even);
end;

{ Процедура 4: Сумма элементов с четными номерами }
function SumEvenIndexed(const filename: string): real;
var
  f: file of real;
  value: real;
  index: integer;
  sum: real;
begin
  sum := 0;
  index := 1;
  
  Assign(f, filename);
  Reset(f);
  
  while not EOF(f) do
  begin
    Read(f, value);
    if index mod 2 = 0 then
      sum := sum + value;
    Inc(index);
  end;
  
  Close(f);
  Result := sum;
end;

{ Процедура 5: Создать тестовый файл }
procedure CreateTestFile(const filename: string; count: integer);
var
  f: file of real;
  i: integer;
  value: real;
begin
  Randomize;
  Assign(f, filename);
  Rewrite(f);
  
  for i := 1 to count do
  begin
    value := Random * 100;
    Write(f, value);
  end;
  
  Close(f);
end;

{ Основная программа }
begin
  WriteLn('Решение задач по работе с файлами в Pascal');
  WriteLn('==========================================');
  WriteLn;
  
  { Задание 1 }
  WriteLn('Задание 1: Удаление элементов после последнего пробела');
  var charFile: file of char;
  Assign(charFile, 'test1.dat');
  Rewrite(charFile);
  Write(charFile, 'H'); Write(charFile, 'e'); Write(charFile, 'l'); Write(charFile, 'l'); Write(charFile, 'o');
  Write(charFile, ' '); 
  Write(charFile, 'W'); Write(charFile, 'o'); Write(charFile, 'r'); Write(charFile, 'l'); Write(charFile, 'd');
  Write(charFile, ' ');
  Write(charFile, 'T'); Write(charFile, 'e'); Write(charFile, 's'); Write(charFile, 't');
  Close(charFile);
  
  RemoveAfterLastSpace('test1.dat');
  WriteLn('Файл обработан');
  WriteLn;
  
  { Задание 2 }
  WriteLn('Задание 2: Строки наибольшей длины');
  var textFile: text;
  Assign(textFile, 'test2.txt');
  Rewrite(textFile);
  WriteLn(textFile, 'Short');
  WriteLn(textFile, 'Medium line');
  WriteLn(textFile, 'Very very long line');
  WriteLn(textFile, 'Another long line');
  WriteLn(textFile, 'Short again');
  Close(textFile);
  
  CreateFileWithLongestStrings('test2.txt', 'result2.txt');
  WriteLn('Результат записан в result2.txt');
  WriteLn;
  
  { Задание 3 }
  WriteLn('Задание 3: Разделение файла на четные/нечетные');
  CreateTestFile('numbers.dat', 10);
  SplitFileByIndex('numbers.dat', 'odd.dat', 'even.dat');
  WriteLn('Файлы созданы: odd.dat и even.dat');
  WriteLn;
  
  { Задание 4 }
  WriteLn('Задание 4: Сумма элементов с четными номерами');
  var sum := SumEvenIndexed('numbers.dat');
  WriteLn('Сумма = ', sum:0:2);
  
  WriteLn;
  WriteLn('Все задачи выполнены!');
end.