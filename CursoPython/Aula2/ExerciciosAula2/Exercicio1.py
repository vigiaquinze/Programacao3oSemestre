a = input("Digite o primeiro número: ")
b = input("Digite o segundo número: ")
raio = input("Digite um raio de um círculo para descobrir sua área: ")
pi = 3.14

soma = int(a) + int(b)
subtracao = int(a) - int(b)
multiplicacao = int(a) * int(b)
if int(b) == 0:
    print("Não é possível dividir por zero!")
else:
    divisao = int(a) / int(b)
if int(b) == 0:
    print("Não é possível dividir por zero!")
else:
    divisao_inteira = int(a) // int(b)
if int(b) == 0:
    print("Não é possível dividir por zero!")
else:
    resto = int(a) % int(b)
potencia = int(a) ** int(b)
area = pi * (int(raio)**2)

print ("Soma:",soma)
print ("Subtração:",subtracao)
print ("Multiplicação:",multiplicacao)
if int(b) == 0:
    print ("Divisão:","Não há divisão pois o segundo número é zero.")
else:
    print ("Divisão:",divisao)
if int(b) == 0:
    print ("Divisão Inteira:","Não há divisão inteira pois o segundo número é zero.")
else:
    print ("Divisão Inteira:",divisao_inteira)
if int(b) == 0:
    print ("Resto da Divisão:","Não há resto da divisão pois o segundo número é zero.")
else:
    print ("Resto da Divisão:",resto)
print ("Potência:",potencia)
print ("Área:",area)