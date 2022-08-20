extends Area2D

onready var map = get_parent()

func _ready():
	pass


func _on_Tile_mouse_entered():
	var pos = $Center.global_position
	get_parent().cmp = map.world_to_map(map.to_local(pos))
#	print(get_parent().lmp)
