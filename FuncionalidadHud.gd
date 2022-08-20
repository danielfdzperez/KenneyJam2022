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
	for i in range(3):
		ManoPlayer(Pilas,i)
		
func _process(delta):
	NumeroPila()

func ManoPlayer(Pila,i):
	var tipoFicha = Pila.pop_front()
	
	match i:
		0:
			if tipoFicha == 1:
				$Panel/Opcion0.texture_normal = PiezaVerde
			elif tipoFicha == 2:
				$Panel/Opcion0.texture_normal = PiezaMarron
			elif tipoFicha == 3:
				$Panel/Opcion0.texture_normal = PiezaGris
			else:
				pass
		1:
			if tipoFicha == 1:
				$Panel/Opcion1.texture_normal = PiezaVerde
			elif tipoFicha == 2:
				$Panel/Opcion1.texture_normal = PiezaMarron
			elif tipoFicha == 3:
				$Panel/Opcion1.texture_normal = PiezaGris
			else:
				pass
		2:
			if tipoFicha == 1:
				$Panel/Opcion2.texture_normal = PiezaVerde
			elif tipoFicha == 2:
				$Panel/Opcion2.texture_normal = PiezaMarron
			elif tipoFicha == 3:
				$Panel/Opcion2.texture_normal = PiezaGris
			else:
				pass
		
	
	
		

func NumeroPila():
	$Panel/YSort/Pila/numPila.text = str(Pilas.size())
	pass

func ColocaFicha():
	
	pass
