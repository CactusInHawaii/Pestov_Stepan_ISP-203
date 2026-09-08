a = float(input('введите стоимость товара "a" руб. через "." коп. \n'))
b = round((a%1)*100)
c = float(input('сколько вы заплотили за товар "a" руб. через "." коп. \n'))
d = round((c%1)*100)
if c<a:
    print('недостаточно средств')
    exit()
r = c-a
print(a,c)
e = int(r//1)
f= round((r%1)*100)
print(e,f)
