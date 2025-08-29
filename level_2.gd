extends Node2D

var total_score = 0
@export var player_speed: float = 50.0

func get_player_speed() -> float:
	return player_speed

func _ready():
	$"flying books".point_scored.connect( self._on_point_scored)
	$"flying books2".point_scored.connect( self._on_point_scored)
	$"flying books3".point_scored.connect( self._on_point_scored)
	
func _on_point_scored():
	total_score +=1
	print("total score", total_score)
	if total_score > 14:
		load_next_scene()

func load_next_scene():
	get_tree().change_scene_to_file("res://level_3.tscn")
	
func _process(delta):
	var bookOnex_pos = $"flying books".position.x
	var secret_tile_visible = get_node("secret0tile").visible
	
	if secret_tile_visible and bookOnex_pos > 33 and bookOnex_pos < 75:
		$"flying books".visible = false
	
	if secret_tile_visible and bookOnex_pos > 122.1 and bookOnex_pos < -125.9:
		$"flying books2".visible = false
	
	if secret_tile_visible and bookOnex_pos > -87 and bookOnex_pos < -44.9:
		$"flying books3".visible = false
	
func _on_level_2_pp_body_entered(body: Node2D) -> void:
	get_node("secret0tile").visible = true
	
	await get_tree().create_timer(0.7).timeout
	
	get_node("secret0tile").visible = false
