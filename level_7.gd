extends Node2D
@onready var toggle_label : Label = $"Label2"
@export var player_speed: float = 50.0

func get_player_speed() -> float:
	return player_speed


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://level_6.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle"):
		toggle_label.visible = !toggle_label.visible
