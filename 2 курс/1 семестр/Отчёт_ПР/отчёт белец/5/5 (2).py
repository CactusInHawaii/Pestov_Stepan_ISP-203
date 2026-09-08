t = int(input())

for _ in range(t):
    n = int(input())
    a = input()
    b = input()
    
    bd = False
    
    for i in range(n):
        if a[i] == '1' and b[i] == '1':
            bd = True
            break
    
    if bd:
        print('NO')
    else:
        print('YES')