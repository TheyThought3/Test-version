extends Node2D

@export var player_speed: float = 50.0

func get_player_speed() -> float:
	return player_speed

func _on_left_hand_area_2d_body_entered(body: Node2D) -> void:
	print("connected!")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://level_4.tscn")
