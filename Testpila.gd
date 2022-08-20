extends Node2D
#extends "res://GenMapRuido.gd"


var PilaSize = 15
var PruebaPila = {
	
}
	
var rng = RandomNumberGenerator.new()
	



var casillasColindantes: PoolVector2Array
var vectorAux = Vector2()

		
func pila():
	for i in range(PilaSize):
#		print("ENTRO AL FOR Y ", odds)
		rng.randomize()
		var RNGMarron =  rng.randf_range(35,45)
		var RNGVerde = rng.randf_range(0,20)
		var RNGGris = rng.randf_range(20,35)
		var odds = rng.randf_range(0,3)
		odds = int(round(odds))
		if int(round(odds)) == 1 || int(round(odds)) == 0:
			PruebaPila[i] = RNGVerde
			print("VERDE")
#			print("Este es el valor de la casilla verde ", RNGVerde , "Y esta es la posición en la pila " , i)
		elif int(round(odds)) == 2:
			PruebaPila[i] = RNGMarron
			print("MARRON")
#			print("Este es el valor de la casilla marron ", RNGMarron , "Y esta es la posición en la pila " , i)
		elif int(round(odds)) == 3:
			PruebaPila[i] = RNGGris
			print("GRIS")
#			print("Este es el valor de la casilla gris ", RNGGris , "Y esta es la posición en la pila " , i)
		pass
	print("Salgo del for y odds vale   ???" )


func CasillasColindantes(posicion: Vector2):
		vectorAux.x = posicion.x -1
		vectorAux.y = posicion.y
		casillasColindantes.append(vectorAux)
		vectorAux.x = posicion.x +1
		vectorAux.y = posicion.y 
		casillasColindantes.append(vectorAux)
		vectorAux.x = posicion.x 
		vectorAux.y = posicion.y -1
		casillasColindantes.append(vectorAux)
		vectorAux.x = posicion.x -1
		vectorAux.y = posicion.y +1
		casillasColindantes.append(vectorAux)
		vectorAux.x = posicion.x 
		vectorAux.y = posicion.y +1
		casillasColindantes.append(vectorAux)
		vectorAux.x = posicion.x -1
		vectorAux.y = posicion.y -1
		casillasColindantes.append(vectorAux)
		print("Esto son las colindantes " , casillasColindantes)
	
	
func canvasAjustable():
	
	pass
	
