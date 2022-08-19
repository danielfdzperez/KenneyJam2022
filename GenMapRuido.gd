extends Node2D



export(int, 40,400) var map_width = 70
export(int, 20,300) var map_height = 50



var available_tiles = {
	"redsand": 0,
	"cristal" : 1,
	"desert" : 2,
	"rocks" : 3,
	"grass" : 4,
	"trees" : 5,
}


var terrain_map: TileMap = null
var perlin_noise: OpenSimplexNoise = null


func _ready()-> void:
	randomize()
		
	set_process(false)
		
	configurate_perlin_noise()
	configurate_tilemaps()
	generate_terrain()
		
func configurate_perlin_noise() -> void:
	perlin_noise = OpenSimplexNoise.new()
	perlin_noise.seed = randi()
	perlin_noise.octaves = 4          #Entre 1 y 6, capas que generan ruido a la par.
	perlin_noise.period = 25          #Periodo 
	perlin_noise.lacunarity = 1.5     #Diferencia entre periodos de cada octavo(cada octvao) 1-4 a mayor, más diferencia
	perlin_noise.persistence = 2      #Diferencia entre cada octavo 0-1
	
	
func configurate_tilemaps() -> void:
	if terrain_map != null:
		return
	terrain_map = load("res://TileMapaRuido.tscn").instance()
	add_child(terrain_map)

func generate_terrain()-> void:
	terrain_map.clear()
	generate_perimeter()

	
	for x  in map_width:
		for y in map_height:
			
			terrain_map.set_cellv(Vector2(x,y), get_title(perlin_noise.get_noise_2d(float(x),float(y))), false, false, true)
			
	#terrain_map.rotation_degrees = 270
		
func get_title(noise: float) ->int:
	if noise <0.0:
		if noise < -0.1:
			return available_tiles.cristal
		return available_tiles.redsand
	if noise <0.1:
		if noise <0.030:
			return available_tiles.desert
		return available_tiles.rocks
	if noise <0.3:
		if noise <0.15:
			return available_tiles.grass
		return available_tiles.trees
	return available_tiles.grass

func generate_perimeter() -> void:
	for x in [-1, map_width]:
		for y in map_width+1:
			terrain_map.set_cellv(Vector2(x,y),6)
			
			
func _input(event) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		configurate_perlin_noise()
		generate_terrain()
		print("la semilla es " ,perlin_noise.seed )
