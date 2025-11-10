n=int(input())
x=1
k=0
while x<=n:
    if n % x == 0:
        k+=1
    x+=1
print(k)
