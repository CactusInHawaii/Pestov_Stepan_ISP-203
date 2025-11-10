program z;
var
    a, a1, a2, a3: integer;
begin
    write('введите 3-х значное число ');
    readln(a);
    
    a1 := a div 100;
    a2 := (a div 10) mod 10;
    a3 := a mod 10;
    
    writeln(a3, a2, a1);
end.