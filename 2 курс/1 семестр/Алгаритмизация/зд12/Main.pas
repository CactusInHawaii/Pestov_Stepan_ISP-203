procedure task1;
begin  
     var filetext: text;
     var a: string;
     
     assign(filetext,'D:\2 курс ВятГу\Алгаритмизация\зд12\text1.txt');
     rewrite(filetext);
     for var i:=1 to 10 do
         Writeln(filetext, i);
     close(filetext); 
     
     reset(filetext);
     for var i:=1 to 10 do 
     begin
         Readln(filetext, a);
         Writeln(a);
     end;
     close(filetext);
end;


procedure task2(n, k:integer);
begin
   var filetext: text;
 
  assign(filetext,'D:\2 курс ВятГу\Алгаритмизация\зд12\text2.txt');
  rewrite(filetext);
  for var i:=1 to n do begin
    for var j:=1 to k do
      write(filetext, '*');
    writeln(filetext, '');
  end;
  close(filetext);
end;


procedure task3(ss:string);
begin
  var filetext: text;
  assign(filetext,'D:\2 курс ВятГу\Алгаритмизация\зд12\text3.txt');
  append(filetext);
  write(filetext, ' ',ss);
  close(filetext);
  
  reset(filetext);
   while not eof(filetext) do 
  begin
    var temp:='';
    readln(filetext, temp);
    write(temp);
  end;
  Close(filetext);
end;

procedure task4(s: string);
begin
  var filetext, tempfile: text;
  var lines: array of string;
  
  assign(filetext, 'D:\2 курс ВятГу\Алгаритмизация\зд12\text4.txt');

  reset(filetext);
  var count := 0;
  while not eof(filetext) do 
  begin
    var temp: string;
    readln(filetext, temp);
    count += 1;
  end;
  
  SetLength(lines, count);
  reset(filetext);
  for var i := 0 to count - 1 do
    readln(filetext, lines[i]);
  close(filetext);

  assign(tempfile, 'D:\2 курс ВятГу\Алгаритмизация\зд12\text4_temp.txt');
  rewrite(tempfile);

  writeln(tempfile, s);

  for var i := 0 to count - 1 do
    writeln(tempfile, lines[i]);
  
  close(tempfile);

  erase(filetext);
  rename(tempfile, 'D:\2 курс ВятГу\Алгаритмизация\зд12\text4.txt');
end;

procedure task5;
begin
  var filetext, inputtext: text;
  var lines: array of integer;
  
  assign(inputtext,'D:\2 курс ВятГу\Алгаритмизация\зд12\input5.txt');
  
  reset(inputtext);
  var count := 0;
  while not eof(inputtext) do 
  begin
    var temp: string; 
    readln(inputtext, temp);
    count += 1;
  end;
  Close(inputtext);
  
  SetLength(lines, count);
  
  reset(inputtext);
  var i := 0; 
  while not eof(inputtext) do 
  begin
    readln(inputtext, lines[i]);
    i := i + 1;
  end;
  close(inputtext);
  
  Print(lines);
  
  assign(filetext,'D:\2 курс ВятГу\Алгаритмизация\зд12\text5.txt');
  rewrite(filetext);
  write(filetext, lines.Min);
  write(filetext,' ',lines.Max);
  Close(filetext);
  Writeln;
  
  Reset(filetext);
  var l:='';
  while not Eof do
  begin
    Readln(filetext,l);
    Write(l);
  end;
  close(filetext);
end;


procedure task6;
begin
  var file_6:='D:\2 курс ВятГу\Алгаритмизация\зд12\text6.txt';
  var text:=ReadAllText(file_6);
  text:=text.Replace(' ','');
  Writealltext('D:\2 курс ВятГу\Алгаритмизация\зд12\text6.txt', text);
  
  
end;

procedure task7;
begin 
  
  var filetext, inputtext: text;
  var n: integer;
  assign(inputtext,'D:\2 курс ВятГу\Алгаритмизация\зд12\z3.in.txt');
  reset(inputtext);
  read(inputtext, n);
  close(inputtext);
  
  var sum := 0;
  for var i := 1 to n do begin
    var count := 0;
    for var j:=1 to i do begin
      if i mod j = 0 then
        count := count + 1;
    end;
    if count = 5 then
      sum := sum + i;
  end;
  var sum_str:string;
  Str(sum,sum_str);
  
  WriteAllText('D:\2 курс ВятГу\Алгаритмизация\зд12\z3.out.txt',sum_str);
end;

begin
  var v:=ReadInteger('Введите № задачи: ');
  case v of
    1:task1();
    2:task2(5, 9);
    3:begin 
      //var s:=ReadString();
      task3('33');
    end;
    4:task4('fg');
    5:task5();
    6:task6();
    7:task7();
  end;
end.