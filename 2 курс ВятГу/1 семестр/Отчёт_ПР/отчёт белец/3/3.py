t = int(input())
for _ in range(t):
    n, k = map(int, input().split())
    a = list(map(int, input().split()))
    b = list(map(int, input().split()))
    sum=0

    for i in range(len(b)):
        for _ in range(b[i]):
            if a:
                arr = []
                max_index = a.index(max(a))
                arr.append(max(a))
            else:
                break
        
        min_index = a.index(min(arr))
        del a[min_index]

    for i in range(len(a)):
        sum+=a[i]
    print(sum)