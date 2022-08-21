extends TileMap

onready var tile = preload("res://Tile.tscn")
onready var HUD = get_parent().get_child(2)


var arbol = preload("res://Scenes/EscenaArbol.tscn")
var floating_text = preload("res://Scenes/FloatingText.tscn")


export var map_size: Vector2 = Vector2 (10,8)
var cmp
var tiles = [] 
var selected_tile: int



func _ready():
	clear()
	for i in map_size.x:
		for j in map_size.y:
			self.set_cell(i+1, j+1, 0)
	set_cellv(map_size/2, 1)
	for i in get_used_cells():
		if tiles.count(i) == 0:
			tiles.append(i)
			var t = tile.instance()
			t.position = map_to_world(i)
			add_child(t)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.get_button_index() == 1 and !event.is_echo():

		put_card(cmp, selected_tile)

func get_neighbours(pos: Vector2) -> Array:
	if int(pos.y) % 2 != 0:
		var n = [Vector2(0, -1) + pos,
			Vector2(1, -1) + pos,
			Vector2(1, 0) + pos,
			Vector2(1, 1) + pos,
			Vector2(0, 1) + pos,
			Vector2(-1, 0) + pos,]
		return n
	
	else:
		var n = [Vector2(-1, -1) + pos,
			Vector2(0, -1) + pos,
			Vector2(1, 0) + pos,
			Vector2(0, 1) + pos,
			Vector2(-1, 1) + pos,
			Vector2(-1, 0) + pos,]
		return n

func put_card(coord, tipo):
	if get_cellv(coord) == 0:
			for i in get_neighbours(coord):
				if get_cellv(i) > 0:
					set_cellv(coord, tipo)
					calculate_points(coord, tipo)
					
					var lvl: int = 0 
			for j in get_neighbours(coord):
				if get_cellv(j) == tipo:
					if tipo == 1:
						instance_arbol(coord)
						instance_arbol(coord)
	

					if HUD.hand.get_child(HUD.button_pressed).get_child(0) != null:
						HUD.hand.get_child(HUD.button_pressed).get_child(0).queue_free()

func instance_arbol(coord):
	var arbolnuevo = arbol.instance()
	arbolnuevo.position = map_to_world(coord)
	get_child(0).add_child(arbolnuevo)

func calculate_points(coord, tipo):
	var text = floating_text.instance()
	text.position = map_to_world(coord)
	text.position += Vector2(60, 70)
	var p = 0 #points
	if tipo == 1:
		p = 100
		text.type = "Verde"
	elif tipo == 2:
		p = 50
	elif tipo == 3:
		p = 0
		text.type = "Gris"
	elif tipo == 4:
		p = 10
	else:
		return
	text.amount = p#calculaPuntos()
	add_child(text)
	HUD.points = str(int(HUD.points) + p)


