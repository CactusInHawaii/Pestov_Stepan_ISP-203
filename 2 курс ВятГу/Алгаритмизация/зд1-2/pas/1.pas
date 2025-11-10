program z;
var
    s: string;
    x, c: integer;
    p: real;
begin
    write('фамилия ученика: ');
    readln(s);
    
    write('кол-во часов по предмету: ');
    readln(x);
    
    write('кол-во пропущенных занятий: ');
    readln(c);
    
    if c > x then
    begin
        writeln('число пропусков не может быть больше занятий');
        exit;
    end;
    
    p := (c / x) * 100;
    writeln('процент посещаемости ', s, ' = ', p:0:2, '%');
end.