a=list(map(float, input('введите 2 числа \n').split()))
if len(a)!= 2:
    print('введите 2 числа')
    exit()
    
if a[0]>a[1]:
    print(a[1])
else:
    print(a)




