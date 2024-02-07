# 3 - Utilização de Listas e Tuplas

# Crie uma lista com três cores diferentes. Adicione mais duas cores a essa lista e imprima-a.
cores_rgb=[(255,0,0),(255,255,0),(255,255,255)]
cores_rgb.append((255,122,0))
cores_rgb.append((255,122,122))
print("Cores:",cores_rgb)

# Declare uma tupla com as coordenadas (latitude, longitude) de um local e imprima cada valor separadamente.
coordenadas_botion=(-22.5645,-47.4004)
print("Latitude:",coordenadas_botion[0])
print("Longitude:",coordenadas_botion[1])
