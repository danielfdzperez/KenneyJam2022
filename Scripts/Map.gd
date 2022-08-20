extends TileMap

onready var tile = preload("res://Tile.tscn")
onready var HUD = get_parent().get_child(2)

export var map_size: Vector2 = Vector2 (10,10)
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
		print("hola")
		if get_cellv(cmp) == 0:
			for i in get_neighbours(cmp):
				if get_cellv(i) > 0:
					print(i)
					set_cellv(cmp, selected_tile)
					print(selected_tile)
					if HUD.hand.get_child(HUD.button_pressed).get_child(0) != null:
						HUD.hand.get_child(HUD.button_pressed).get_child(0).queue_free()

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


			

