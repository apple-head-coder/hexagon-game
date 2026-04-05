extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fill_all_tiles(get_child(1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_all_screen_coordinates() -> Array[Vector2]:
	var coordinates: Array[Vector2] = []
	var screen_size = get_viewport().get_visible_rect().size
	for x in range(int(screen_size.x)):
		for y in range(int(screen_size.y)):
			coordinates.append(Vector2(x-screen_size.x/2, y-screen_size.y/2))
	return coordinates


func fill_all_tiles(target_layer: TileMapLayer):
	for cell in get_all_screen_coordinates():
		# Set all to source_id 0, atlass coords 0,0
		target_layer.set_cell(cell, 0, Vector2i(0, 0), 0)
