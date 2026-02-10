var 
str_letters:array[1..8] of string;
t,letter,numb1:string;
letter_index,numb:integer;
begin
str_letters[1]:='a';
str_letters[2]:='b';
str_letters[3]:='c';
str_letters[4]:='d';
str_letters[5]:='e';
str_letters[6]:='f';
str_letters[7]:='g';
str_letters[8]:='h';
  
  t:=readstring('введие букву и цифру(без пробела) ');
  letter:= t[1];
  numb1:= t[2];
  numb:=StrToInt(numb1);
  
if letter in str_letters then
  begin
  for var i:=1 to 8 do
    begin
    if str_letters[i]=letter then
      begin
      letter_index:=i;
      break;
      end;
    end;
end;

if letter_index mod 2 = 0 then
    if Numb mod 2 = 0 then
        print('Black')
    else
        print('White')
else
    if Numb mod 2 = 0 then
        print('White')
    else
        print('Black')
end.