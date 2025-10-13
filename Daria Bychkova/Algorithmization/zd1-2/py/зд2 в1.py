a=int(input('введите 3-х значное число '))
a1= a // 100
a2= a // 10 % 10
a3= a % 10
d="".join([str(a3),str(a2),str(a1)])
print(d)



