n=int(input())
x=1
s=0
while x<=n:
    if n % x == 0:
        s+=x
    x+=1
if s==n:
    print('ДА')
else:
    print('НЕТ')
