extends Camera2D

export var speed: float = 10.0
var velocity: Vector2
var input_vector: Vector2
var zoom_level: Vector2 = self.zoom
var zoom_velocity: Vector2 = self.zoom

func _ready():
	pass

func _process(delta):
	velocity = lerp(velocity, input_vector * speed, speed * delta)
	self.position += velocity
	zoom_velocity = lerp(zoom_velocity, zoom_level, speed * delta)
	self.zoom = zoom_velocity
	
func _input(event):
	
	#Movimiento con Teclado
	if event is InputEvent:
		input_vector = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
								Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
		input_vector = input_vector.normalized()
		
	#Zoom
	if event is InputEventMouseButton:
		if event.get_button_index() == 4:
			zoom_level = Vector2(clamp(self.zoom.x + 0.25, 0.5, 2), clamp(self.zoom.y + 0.25, 0.5, 2))
		elif event.get_button_index() == 5:
			zoom_level = Vector2(clamp(self.zoom.x - 0.25, 0.5, 2), clamp(self.zoom.y - 0.25, 0.5, 2))
		
	
