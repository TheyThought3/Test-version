extends Node2D
@export var player_speed: float = 30.0

func get_player_speed() -> float:
	return player_speed

var safe_position: Vector2 = Vector2(-36, -98)
var erased_tiles: Array = []

func _process(_delta):
	var disappearing_layer = $"eExtra layer"
	var correct_layer = $"the correct path"

	var local_pos_dis = disappearing_layer.to_local($Player.global_position)
	var tile_pos_dis = disappearing_layer.local_to_map(local_pos_dis)

	var local_pos_corr = correct_layer.to_local($Player.global_position)
	var tile_pos_corr = correct_layer.local_to_map(local_pos_corr)

	# --- Handle disappearing + deadly layer ---
	if disappearing_layer.get_cell_source_id(tile_pos_dis) != -1:
		disappearing_layer.erase_cell(tile_pos_dis)
		if tile_pos_dis not in erased_tiles:
			erased_tiles.append(tile_pos_dis)
	elif tile_pos_dis in erased_tiles:
		$Player.global_position = safe_position

	# --- Handle disappearing but safe layer ---
	if correct_layer.get_cell_source_id(tile_pos_corr) != -1:
		correct_layer.erase_cell(tile_pos_corr)



func _on_area_2d_2_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://level_7.tscn")
