str_letters= ["a", "b", "c", "d", "e", "f", "g", "h"]
t=str(input('введие букву и цифру(без пробела) \n'))
Letter=t[0]
Number=int(t[1])

if Number>8 or Number<=0:
    print('нет такой цифры на шахматной доске')
    exit()

if Letter in str_letters:
    Letter_index = str_letters.index(Letter)+1    
else:
    print('Такой буквы нет на шахматной доске') 
    exit()
    
print(Letter_index)
if Letter_index % 2 == 0:
    if Number % 2 == 0:
        print('Black')
    else:
        print('White')
else:
    if Number % 2 == 0:
        print('White')
    else:
        print('Black')