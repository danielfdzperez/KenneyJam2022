extends GridContainer

var PiezaVerde = preload("res://recursos/PNG/Tiles/Terrain/Grass/grass_08.png")
var PiezaMarron = preload("res://recursos/PNG/Tiles/Terrain/Dirt/dirt_06.png")
var PiezaGris = preload("res://recursos/PNG/Tiles/Terrain/Stone/stone_07.png")

var rng = RandomNumberGenerator.new()


var PilaSize = 15

var Pilas= []


func pila():
	for i in range(PilaSize):
		rng.randomize()
		var odds = rng.randf_range(0,4)
		if odds < 2:
			Pilas.append("Verde")
		elif odds>2 && odds <= 3:
			Pilas.append("Marron")
		else:
			Pilas.append("Gris")

		
		print(Pilas[i])

func _ready():
	pila()
	ManoPlayer(Pilas)


func ManoPlayer(Pila):
	var tipoFicha = Pila.pop_front()
	if tipoFicha == "Verde":
		$Panel/Opcion0.texture_normal = PiezaVerde
	elif tipoFicha == "Marron":
		$Panel/Opcion0.texture_normal = PiezaMarron
	elif tipoFicha == "Gris":
		$Panel/Opcion0.texture_normal = PiezaGris
	else:
		pass
		
		

