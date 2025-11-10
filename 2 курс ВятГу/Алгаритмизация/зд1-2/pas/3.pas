program z;
var
    a, b: real;
begin
    write('введите 2 числа: ');
    readln(a, b);
    
    if a > b then
        writeln(b)
    else
        writeln(a);
end.