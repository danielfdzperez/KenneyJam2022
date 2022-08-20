extends GridContainer

var PiezaVerde = load("res://recursos/PNG/Tiles/Terrain/Grass/grass_08.png")
var PiezaMarron = load("res://recursos/PNG/Tiles/Terrain/Dirt/dirt_06.png")
var PiezaGris = load("res://recursos/PNG/Tiles/Terrain/Stone/stone_07.png")

var rng = RandomNumberGenerator.new()


var PilaSize = 15

var PruebaPila: PoolStringArray = [""]


func pila():
	for i in range(PilaSize):
		rng.randomize()
		var odds = rng.randf_range(0,3)
		if odds <= 1:
			PruebaPila.append("Verde")
		elif odds>1 && odds<2:
			PruebaPila.append("Marron")
		elif odds<2:
			PruebaPila.append("Gris")

		
	print(Pilas)

func _ready():
	pila()
	ManoPlayer(Pilas)


func ManoPlayer(Pila):
	var tipoFicha = Pila.pop_front()
	if tipoFicha == "Verde":
		$Opcion0.texture_normal = PiezaVerde
	elif tipoFicha == "Marron":
		$Opcion0.texture_normal = PiezaMarron
	elif tipoFicha == "Gris":
		$Opcion0.texture_normal = PiezaGris
	elif tipoFicha == "" or tipoFicha == null:
		pass
		
		

