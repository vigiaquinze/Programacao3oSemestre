# Operações com variáveis:

moeda="R$"
salario=500
bonus=300
salario_total=salario+bonus
formatacao=moeda+str(salario_total)
print(formatacao)

# Atualização de variáveis:

contador = 0
contador += 1
print (contador)

# Variáveis em estruturas de controle:

idade = 21
if idade>=18:
    pode_Votar = True
else:
    pode_Votar = False
print (pode_Votar)

#Tipagem:

numero = 42
texto = "Python"
resultado = str(numero) + texto
print (resultado)

