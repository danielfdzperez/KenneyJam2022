extends GridContainer

var ficha_verde = preload("res://Scripts/Fichas/FichaVerde.gd")
var ficha_marron = preload("res://Scripts/Fichas/FichaMarron.gd")
var ficha_gris = preload("res://Scripts/Fichas/FichaGris.gd")

var rng = RandomNumberGenerator.new()


var PilaSize = 102


var Pilas= []



func pila():
	for i in range(PilaSize):
		rng.randomize()

		var odds = rng.randf_range(0,4)
		if odds < 2:
			Pilas.append(1)
		elif odds>2 && odds <= 3:
			Pilas.append(2)
		else:
			Pilas.append(3)


		
		print(Pilas[i])

func _ready():
	pila()
	for i in range(3):
		print("recibo  el click" , i)
		ManoPlayer(Pilas,i)
		
		
func _process(delta):
	NumeroPila()

func ManoPlayer(Pila,i):
	var tipoFicha = Pila.pop_front()
	
	match i:
		0:
			if tipoFicha == 1:
				$Panel/YSort/Mano/Opcion0.add_child(ficha_verde.new())
				print("recibo  el click")
				#$Panel/YSort/Mano/Opcion0.texture_focused = false
			elif tipoFicha == 2:
				$Panel/YSort/Mano/Opcion0.add_child(ficha_marron.new())
				print("recibo  el click")
				#$Panel/YSort/Mano/Opcion0.texture_focused = false
			elif tipoFicha == 3:
				$Panel/YSort/Mano/Opcion0.add_child(ficha_gris.new())
				print("recibo  el click")
				#$Panel/YSort/Mano/Opcion0.texture_focused = false
			else:
				pass
			
		1:
			if tipoFicha == 1:
				$Panel/YSort/Mano/Opcion1.add_child(ficha_verde.new())
			elif tipoFicha == 2:
				$Panel/YSort/Mano/Opcion1.add_child(ficha_marron.new())
			elif tipoFicha == 3:
				$Panel/YSort/Mano/Opcion1.add_child(ficha_gris.new())
			else:
				pass
		2:
			if tipoFicha == 1:
				$Panel/YSort/Mano/Opcion2.add_child(ficha_verde.new())
			elif tipoFicha == 2:
				$Panel/YSort/Mano/Opcion2.add_child(ficha_marron.new())
			elif tipoFicha == 3:
				$Panel/YSort/Mano/Opcion2.add_child(ficha_gris.new())
			else:
				pass
		
	
	
		

func NumeroPila():
	$Panel/YSort/Pila/numPila.text = str(Pilas.size())
	pass

func ColocaFicha():
	
	pass
