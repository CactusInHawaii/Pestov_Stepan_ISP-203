program z;
var
    a, c, r: real;
    b, d, e, f: integer;
begin
    write('введите стоимость товара "a" руб. через "." коп.: ');
    readln(a);
    
    write('сколько вы заплотили за товар "a" руб. через "." коп.: ');
    readln(c);
    
    if c < a then
    begin
        writeln('недостаточно средств');
        exit;
    end;
    
    r := c - a;
    e := trunc(r);
    
    f := round(frac(r) * 100);
    writeln(a:0:2, ' ', c:0:2);
    writeln(e, ' ', f);
end.