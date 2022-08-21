extends Position2D


onready var label = get_node("Label")
onready var tween = get_node("Tween")

var amount = 0
var type = ""


func _ready():
	label.set_text(str(amount))
	match type:
		"Verde":
			label.set("custom_color/font_color",Color("68a546"))
		"Griss":
			label.set("custom_color/font_color",Color("636362"))
		
					
			
	tween.interpolate_property(self, 'scale',scale,Vector2(1,1),0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property(self, 'scale',Vector2(1,1),Vector2(0.1,0.1),0.7, Tween.TRANS_LINEAR, Tween.EASE_OUT,0.3)
	tween.start()


func _on_Tween_tween_all_completed():
	self.queue_free()
