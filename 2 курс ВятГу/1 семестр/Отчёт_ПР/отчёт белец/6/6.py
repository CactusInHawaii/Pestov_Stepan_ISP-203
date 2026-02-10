t = int(input())
for _ in range(t):
    n = int(input())
    a = list(map(int, input().split()))
    dp = [0] * n
     
    for i in range(n-1, -1, -1):
        dp[i] = a[i]
        next_pos = i + a[i]
        if next_pos < n:
            dp[i] += dp[next_pos]
        
    print(max(dp))

    