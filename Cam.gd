extends Camera2D

export var speed: float = 10.0
var velocity: Vector2
var input_vector: Vector2

func _ready():
	pass

func _process(delta):
	velocity = lerp(velocity, input_vector*speed, speed * delta)
	self.position += velocity
	
func _input(event):
	if event is InputEvent:
		input_vector = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
								Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
		input_vector = input_vector.normalized()
