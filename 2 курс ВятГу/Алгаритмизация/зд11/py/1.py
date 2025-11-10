n=int(input())
p=1
while n!=0:
    a=n%10
    p=p*a
    n=n // 10
print(p)
