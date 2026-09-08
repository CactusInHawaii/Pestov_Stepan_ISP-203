program Lab13_Compact;

type
  anketa = record fio: string[50]; birth: string[10]; kurs: 1..5 end;
  toy = record name: string[30]; price: real; age: string[10] end;
  t_chs = set of char;

procedure z1;
var s: anketa;
begin writeln('--- z1 ---'); s.fio:='Иванов Иван'; s.birth:='01.01.2000'; s.kurs:=3;
  writeln(s.fio,', ',s.birth,', курс ',s.kurs); end;

procedure z2;
var a:array[1..5]of anketa;i:integer;
begin writeln('--- z2 ---');
  a[1].fio:='Петров П.П.'; a[1].birth:='02.02.2001'; a[1].kurs:=2;
  a[2].fio:='Сидорова А.П.'; a[2].birth:='03.03.2000'; a[2].kurs:=3;
  a[3].fio:='Кузнецов Д.С.'; a[3].birth:='04.04.2002'; a[3].kurs:=1;
  a[4].fio:='Смирнова Е.В.'; a[4].birth:='05.05.1999'; a[4].kurs:=4;
  a[5].fio:='Васильев А.И.'; a[5].birth:='06.06.2003'; a[5].kurs:=1;
  for i:=1 to 5 do writeln(i,'. ',a[i].fio,', ',a[i].birth,', курс ',a[i].kurs);
end;

procedure z3;
var t:array[1..4]of toy;i:integer;
begin writeln('--- z3 ---');
  with t[1] do begin name:='Конструктор'; price:=1500.5; age:='3-10' end;
  with t[2] do begin name:='Кукла'; price:=850; age:='1-5' end;
  with t[3] do begin name:='Машинка'; price:=320.75; age:='2-7' end;
  with t[4] do begin name:='Мяч'; price:=290; age:='0+' end;
  for i:=1 to 4 do with t[i] do writeln(name:12,' | ',price:6:2,' р. | ',age);
end;

procedure z4;
var t:array[1..4]of toy;f:file of toy;i:integer;
begin writeln('--- z4 ---');
  with t[1] do begin name:='Конструктор'; price:=1500.5; age:='3-10' end;
  with t[2] do begin name:='Кукла'; price:=850; age:='1-5' end;
  with t[3] do begin name:='Машинка'; price:=320.75; age:='2-7' end;
  with t[4] do begin name:='Мяч'; price:=290; age:='0+' end;
  assign(f,'toys.dat'); rewrite(f);
  for i:=1 to 4 do write(f,t[i]); close(f);
  reset(f); writeln('Из файла:');
  while not eof(f) do begin read(f,t[1]); with t[1] do writeln(name:12,' | ',price:6:2,' р. | ',age); end;
  close(f);
end;

procedure z5;
var n:integer;
begin writeln('--- z5 ---'); write('Лет: '); readln(n);
  case n mod 100 of 11..14: writeln(n,' лет') else
    case n mod 10 of 1:writeln(n,' год');2..4:writeln(n,' года');else writeln(n,' лет');end;
  end;
end;

procedure z6;
const lett=['a'..'z','A'..'Z','_']; num=['0'..'9'];
var s:string;i:byte;ok:boolean;
begin writeln('--- z6 ---'); write('Строка: '); readln(s); ok:=true;
  if s='' then ok:=false else if not (s[1] in lett) then ok:=false else
    for i:=2 to length(s) do if not (s[i] in lett+num) then ok:=false;
  writeln(ok);
end;

begin
  z1; z2; z3; z4; z5; z6;
end.