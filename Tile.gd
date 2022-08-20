extends Area2D

onready var map = get_parent()
var last_mouse_position: Vector2

func _ready():
	pass


func _on_Tile_mouse_entered():
	var pos = $Center.global_position
	get_parent().lmp = map.world_to_map(map.to_local(pos))
