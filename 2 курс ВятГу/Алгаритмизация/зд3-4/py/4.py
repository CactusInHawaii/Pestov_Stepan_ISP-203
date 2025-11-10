n = int(input('Введите кол-во предприятий: '))
pred = [0] * (n + 1)
s = 0
ss = 0
print(pred)

for i in range(1, n + 1):
    pred[i] = int(input(f'Введите мощность {i} предприятия: '))
    s += pred[i]

for i in range(1, n + 1):
    if pred[i - 1] < pred[i]:
        ss = i

print(f'Общая мощность = {s}')
print(f'Средняя мощность = {s / n:.2f}')
print(f'Номер предприятия с наибольшей мощностью = {ss}')