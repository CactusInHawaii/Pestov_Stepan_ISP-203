from math import sqrt, pi, pow

def z1():
    a = int(input())
    return a%10

def z2():
    a=int(input('введите число '))
    print('всего десятков ')
    return a // 10 % 10

def z3():
    a=int(input('введите 3-х значное число '))
    c= a // 100 %10
    v= a // 10 %10
    b= a % 10
    return print('сумма цифр = ',c+v+b)

def z4():
    a=int(input('введите число '))
    print('следушие чётное число ')
    if a % 2 == 0:
        print(a+2)
    else:
        print(a+1)

def z5():
    a=int(input('введите число '))
    return print('абсолютное значение числа ',abs(a))

def z6():
    a,b,c= [int(input('введите стороны треугольника ')) for i in range(3)]
    p=(a+b+c)/2
    s=sqrt(p*(p-a)*(p-b)*(p-c))
    print(f'{s:.2f}')

def z7():
    r=int(input('введите радиус шара '))
    v=(4/3)*pi*pow(r,3)
    print('обьем шара = ',f'{v:.2f}')

def z8():
     a,b= [int(input('введите конец отезка ')) for i in range(2)]
     c=(a+b)/2
     print('середина отрезка = ',c)

def z9():
  a=int(input())
  b=int(input())
  c=int(input())
  d=int(input())
  x= (d-c)/(a-b)
  y= a*(d-c)/(a-b)+c
  print(x,y);
 
print(z9())    


