extends Node2D
@export var player_speed: float = 300.0
@onready var toggle_label : Label = $"Label2"

func get_player_speed() -> float:
	return player_speed


func _on_chair_a_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://level_4.tscn")
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle"):
		toggle_label.visible = !toggle_label.visible
