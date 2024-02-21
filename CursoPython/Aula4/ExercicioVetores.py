print("Exercício com vetores")
# 1:
print("Exercício 1")
numeros = [15,30,45,60,75]
print(numeros)

# 2:
print("Exercício 2")
numeros2 = [-75,-60,-45,-30,-15,15,30,45,60,75]
numeros2.reverse()
print(numeros2)

# 3:
print("Exercício 3")
notas = [10.0, 9.5, 5.0, 6.5]
mediaNotas = (notas[0] + notas[1] + notas[2] + notas[3]) / 4
print(notas)
print("Média:", mediaNotas)

# 4:
print("Exercício 4")
caracteres = ["a","b","c","d","e","f","g","h","i","j"]
vogais = 0
consoantes = 0
listaConsoantes = []
for i in caracteres:
    if i == "a" or i== "e" or i== "i" or i=="o" or i=="u":
        vogais = vogais+1
    else:
        consoantes = consoantes + 1
        listaConsoantes.append(i)
print("Quantidade de consoantes:",consoantes)
print(listaConsoantes)

# 5:
print("Exercício 5")
numeros5 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
impares = 0
pares = 0
numerosImpares = []
numerosPares = []
for i in numeros5:
    if int(i)%2==0:
        pares = pares+1
        numerosPares.append(i)
    else:
        impares = impares+1
        numerosImpares.append(i)
print(numeros5)
print("Números pares:",numerosPares)
print("Números ímpares",numerosImpares)

# 6: