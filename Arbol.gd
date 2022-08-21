extends Sprite


var rng = RandomNumberGenerator.new()

func _ready():
	
	rng.randomize()
	var RNGArbol = rng.randf_range(0,1)
	var RNGx = rng.randf_range(0,35)
	var RNGy = rng.randf_range(0,30)
	
	print("esto qué eh ", self.texture )
	if RNGArbol>0.5:
		self.texture = load("res://recursos/PNG/Objects/treePine_large.png")
#		self.scale = Vector2(10,10)
#		self.position = Vector2(position.x + 60,0)
	else:
		self.texture = load("res://recursos/PNG/Objects/treeRound_large.png")
#		self.scale = Vector2(10,10)
#		self.position = Vector2(position.x + 60,0)
	self.position = Vector2(RNGx,RNGy)
