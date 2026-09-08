t = int(input())
for _ in range(t):
    n = int(input())
    a = list(map(int, input().split()))
    arr = []
    
    for i in range(n):
        s = 0
        pos = i
        
        for _ in range(n):
            if pos >= n:
                break
            s += a[pos]
            pos += a[pos]
        
        arr.append(s)
    print(max(arr))