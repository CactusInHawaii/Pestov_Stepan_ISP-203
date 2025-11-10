n=int(input())
i=1
k=0
while i<=n:
    x=1
    c=0
    y=int(input())
    while x<=y:
        if y % x == 0:
            c+=1
        x+=1
    if c==2:
        k+=1
    i+=1
print(k)
