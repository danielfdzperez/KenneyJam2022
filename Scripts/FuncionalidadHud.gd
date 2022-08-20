extends GridContainer

var ficha_verde = preload("res://Scripts/Fichas/FichaVerde.gd")
var ficha_marron = preload("res://Scripts/Fichas/FichaMarron.gd")
var ficha_gris = preload("res://Scripts/Fichas/FichaGris.gd")

onready var map = get_parent().get_child(1)
onready var hand = get_child(0).get_child(0).get_child(0)

var button_pressed:int
#var selected_tile: int
var rng = RandomNumberGenerator.new()


var max_stack_size = 102
var stack = []


func _ready():
	for _i in range(max_stack_size):
		rng.randomize()

		var odds = rng.randf_range(0,4)
		if odds < 2:
			stack.append(1)
		elif odds>2 && odds <= 3:
			stack.append(2)
		else:
			stack.append(3)
		
	for i in range(3):
		draw_card(i)

func _process(_delta):
	NumeroPila()

func NumeroPila():
	$Panel/YSort/Pila/numPila.text = str(stack.size())



func _on_Opcion0_pressed():
	map.selected_tile = hand.get_child(0).get_child(0).tilemap_index
	print(map.selected_tile)
	button_pressed = 0

	
func _on_Opcion1_pressed():
	map.selected_tile = hand.get_child(1).get_child(0).tilemap_index
	print(map.selected_tile)
	button_pressed = 1

func _on_Opcion2_pressed():
	map.selected_tile = hand.get_child(2).get_child(0).tilemap_index
	print(map.selected_tile)
	button_pressed = 2

func draw_card(opcion):
	var c = stack.pop_back()
	match c:
		0:
			pass
		1:
			hand.get_child(opcion).call_deferred("add_child", ficha_verde.new())

		2:
			hand.get_child(opcion).call_deferred("add_child", ficha_marron.new())
		
		3:
			hand.get_child(opcion).call_deferred("add_child", ficha_gris.new())
	
	return c

func _on_Opcion0_child_exiting_tree(_node):
	map.selected_tile = draw_card(0)

func _on_Opcion1_child_exiting_tree(_node):

	map.selected_tile = draw_card(1)

func _on_Opcion2_child_exiting_tree(_node):
	map.selected_tile = draw_card(2)
