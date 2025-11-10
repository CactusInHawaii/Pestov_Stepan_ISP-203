import random
def z1():
    arr = [random.randint(-10, 10) for _ in range(10)]
    min = min(arr)
    s=0
    arr = sorted(arr)
    for i in range(len(arr)):
        if arr[i] == min:
            s+=1
    print(arr)
    print(f'Минимальное число: {min}, Встречаеться раз: {s}')

def z2_z3():
    s=input('Введите строку ')
    ps=input('Введите подстроку ')

    pos = s.find(ps)
    s = s[:pos] + s[pos+len(ps):]

    pos1 = s.rfind(ps)
    s = s[:pos1] + s[pos1+len(ps):]

    print(s)
z2_z3()