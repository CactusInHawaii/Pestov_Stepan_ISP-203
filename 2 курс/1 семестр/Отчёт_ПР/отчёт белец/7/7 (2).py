r = int(input())
     
for _ in range(r):
    xA, yA = map(int, input().split())
    xB, yB = map(int, input().split())
    xC, yC = map(int, input().split())
     
    dAB = abs(xA - xB) + abs(yA - yB)
    dAC = abs(xA - xC) + abs(yA - yC)
    dBC = abs(xB - xC) + abs(yB - yC)
     
    max_t = (dAB + dAC - dBC) // 2 + 1
     
    print(max_t)