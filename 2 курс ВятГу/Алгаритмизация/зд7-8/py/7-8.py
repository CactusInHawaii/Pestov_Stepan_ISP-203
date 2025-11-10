def z1():
    a=str(input())
    if len(a)<6:
        for i in range(len(a)):
            print(f"{a[1]} ")
    else:
        print(f"{a[:3]}{a[-3:]}\n")

def z2():
    a=input()
    s=0
    for i in range(len(a)):
        if a[i]=='x':
            print('x')
            s+=1
        if a[i]=='w':
            print('w')
            s+=1
    if s==0:
        print('Таких символов нет')

def z3():
    a=input()
    if len(a)>10:
        a=a[:6]
    else:
        n=len(a)
        for n in range(12):
            a+='o'
    print(a)
z3()
