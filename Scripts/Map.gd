extends TileMap

onready var tile = preload("res://Tile.tscn")
var lmp
var tiles = []

func _ready():
	clear()
	self.set_cellv(Vector2.ZERO, 1)
	for i in get_neighbours(Vector2.ZERO):
		set_cellv(i, 0)
	update_map()

func _unhandled_input(event):
	if event is InputEventMouseButton and event.get_button_index() == 1 and !event.is_echo():
		if get_cellv(lmp) == 0:
			set_cellv(lmp, 1)
			for i in get_neighbours(lmp):
				if get_cellv(i) == -1:
					set_cellv(i, 0)
			update_map()
#		print(lmp)
		
func update_map():
	for i in get_used_cells():
		if tiles.count(i) == 0:
			tiles.append(i)
			var t = tile.instance()
			t.position = map_to_world(i)
			add_child(t)

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

