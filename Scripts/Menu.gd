extends Control

var menu_origin_position := Vector2.ZERO
var menu_origin_size := Vector2.ZERO
var menu_transition_time := 0.5

var current_menu
var menu_stack := []


onready var menu_0  = $Menu0
onready var menu_1  = $Menu1
onready var tween = $Tween



func _ready() -> void:
	menu_origin_position = Vector2(0,0)
	menu_origin_size =  get_viewport().size
	current_menu = menu_0
	print("vamoh a ve---------" , tween)
	print("X del vector    ", -menu_origin_size.x)
	
func move_to_next_menu(next_menu_id: String):
	var next_menu = get_menu_from_menu_id(next_menu_id)
	current_menu.rect_global_position = Vector2(-menu_origin_size.x, 0)
	next_menu.rect_global_position = menu_origin_position
	tween.interpolate_property(current_menu, "rect_global_position", current_menu.rect_global_position, 
	Vector2(-menu_origin_size.x, 0), menu_transition_time,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,0)
	tween.interpolate_property(next_menu, "rect_global_position", next_menu.rect_global_position, 
	menu_origin_position, menu_transition_time,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,0)
	tween.start()
	menu_stack.append(current_menu)
	current_menu = next_menu
	
	
func move_to_previous_menu():
	var previous_menu = menu_stack.pop_back()
	if previous_menu != null:
		previous_menu.rect_global_position = menu_origin_position
		current_menu.rect_global_position = Vector2(menu_origin_size.x,0)
		current_menu = previous_menu
		
	
	
func get_menu_from_menu_id(menu_id: String) -> Control:
	match menu_id:
		"menu_0":
			return menu_0
		"menu_1":
			return menu_1
		_:
			return menu_0




func _on_Back_pressed():
	move_to_previous_menu()


func _on_Start_pressed():
	Global.goto_scene("res://Main.tscn")


func _on_Credits_pressed():
	move_to_next_menu("menu_1")
