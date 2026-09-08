import random
w = int(input('Введите кол-во девочек: '))
wr = 0
for i in range(w):
    wr += random.randint(130, 170)

m = int(input('Введите кол-во мальчиков: '))
mr = 0
for i in range(m):
    mr += random.randint(150, 190)

print(f'Средний рост девочек = {wr/w:.2f}')
print(f'Средний рост мальчиков = {mr/m:.2f}')