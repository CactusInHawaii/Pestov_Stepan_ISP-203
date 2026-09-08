t=int(input())
for q in range(t):
    n, k = map(int, input().split())
    a = list(map(int, input().split()))
    b = list(map(int, input().split()))
 
    a.sort()
    b.sort()
 
    t = sum(a)
    id = n
 
    for i in range(k):
        id -= b[i]
        if id >= 0:
            t -= a[id]
    print(t)