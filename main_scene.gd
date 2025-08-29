extends Node2D

@export var player_speed: float = 50.0

func get_player_speed() -> float:
	return player_speed


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	print("player 2dtriggered the switch")
	get_tree().change_scene_to_file("res://level_2.tscn")
	
