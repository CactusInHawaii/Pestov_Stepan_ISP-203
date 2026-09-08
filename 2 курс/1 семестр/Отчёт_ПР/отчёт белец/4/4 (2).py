t = int(input())
for _ in range(t):
    n = int(input())
    if n % 4 == 0:
        s = n // 4
    else:
        s = n // 4 + 1
    print(s)