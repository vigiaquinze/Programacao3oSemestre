# Manipulação de Strings

# Declare duas strings, nome e sobrenome, e concatene-as para formar o nome completo. Imprima o resultado.

nome = input("Digite um nome: ")
sobrenome = input("Digite um sobrenome: ")
nome_completo = str(nome)+" "+str(sobrenome)
print ("Seu nome completo:",nome_completo)

# Crie uma string que represente uma frase e use métodos de string para:
# Converter todas as letras para maiúsculas.
# Converter todas as letras para minúsculas.
# Substituir uma palavra por outra na frase.

frase = "Alex é o pai solteiro do Youtube"
frase_upper = frase.upper()
frase_lower = frase.lower()
frase_substituida = frase.replace("solteiro","divorciado")
print("Frase:",frase)
print("Frase em uppercase:",frase_upper,"Frase em lowercase:",frase_lower,"Frase substituindo palavras:",frase_substituida)
