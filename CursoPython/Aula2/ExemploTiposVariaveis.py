# 1. Números Inteiros e de Ponto Flutuante:

# Números inteiros
idade = 25
quantidade_produtos = 100

# Números de ponto flutuante
preco_unitario = 29.99
pi = 3.14159

# 2. Strings (Cadeias de Caracteres):

# Strings simples
nome = "Alice"
mensagem = 'Olá, seja bem-vindo!'

# Concatenação de strings
nome_completo = nome + " Wonderland"

# Formatação de strings
mensagem_formatada = f"Olá, {nome}! Você tem {idade} anos."

print (mensagem_formatada)

# 3. Listas e Tuplas:

# Listas (mutáveis)
frutas = ["maçã", "banana", "uva"]
numeros = [1, 2, 3, 4, 5]

# Adicionando elementos a uma lista
frutas.append("laranja")
frutas.append("bananinha")

print (frutas[4])

# Tuplas (imutáveis)
coordenadas = (4, 5)
cores_rgb = (255, 0, 0)

# 4. Dicionários:

# Dicionário chave-valor
pessoa = {
    "nome": "Alex",
    "idade": 36,
    "profissao": "pai solteiro"
}

# Acessando valores
print("Nome:",pessoa["nome"])
print("Idade:",pessoa.get("idade"))
print("Profissão:",pessoa["profissao"])

# Adicionando novo par chave-valor
pessoa["cidade"] = "São Paulo"

# 5. Booleans:


# Variáveis booleanas
tem_cafe = True
tem_cha = False

# Expressões booleanas
tem_bebida_quente = tem_cafe or tem_cha
tem_os_dois = tem_cafe and tem_cha

print(tem_bebida_quente)
print(tem_os_dois)

# Exemplos Práticos de Cada Tipo de Dado:

# Operações Matemáticas:
# Números
a = 10
b = 3

# Soma
soma = a + b

# Subtração
subtracao = a - b

# Multiplicação
multiplicacao = a * b

# Divisão
divisao = a / b

# Resultados
print(soma, subtracao, multiplicacao, divisao)


