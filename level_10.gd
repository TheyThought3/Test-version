extends Node2D

@export var player_speed: float = 300.0

func get_player_speed() -> float:
	return player_speed

@onready var last_one: Area2D = $LastOne  # child Area2D node
var last_y: float = 0.0

func _process(_delta: float) -> void:
	if last_one:  # safety check in case it's missing
		last_y = last_one.global_position.y
		print("📍 LastOne Y =", last_y)
		if last_y > 320:
			get_tree().change_scene_to_file("res://level_11.tscn")

var total_score := 0

func on_shape_collected(shape: Area2D, player: Node) -> void:
	total_score += 1
	print("[Main] Collected:", shape.name, "by", player.name, " score=", total_score)
	get_tree().change_scene_to_file("res://level_10.tscn")
