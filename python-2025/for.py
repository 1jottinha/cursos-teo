#for percorre os elementos do objeto


nome = "Junior"

for letra in nome:
    print(letra) #substitui letra por i

# %%

numero = 2
max_num = 100

for i in range(1, max_num+1):
    print(numero,"x", i, "=", numero * i)

# %%

for i in range(4, 101):
    if i % 4 == 0:
        print(i)

# %%

soma = 0
entradas = 4

for i in range(entradas): #range (0, 4) ou (0, entradas)
    altura = input("Entre com a altura: ")
    altura = float(altura)
    soma += altura

print("Soma das alturas:", soma)