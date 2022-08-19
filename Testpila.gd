extends "res://GenMapRuido.gd"


var PilaSize =15
var PruebaPila = {
	
}
	
var rng = RandomNumberGenerator.new()
	#rng.randomize()
var myRNG =  rng.randf_range(0,20)

func _ready():
	for i in range(PilaSize):
		rng.randomize()
		PruebaPila[i] = myRNG
		print("Este es el valor ", myRNG , "Y esta es la posición en la pila " , i)
