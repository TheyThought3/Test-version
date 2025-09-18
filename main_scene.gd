extends Node2D

@onready var label : Label = $Label2
@export var player_speed: float = 50.0
@onready var rect : ColorRect = $ColorRect
@onready var toggle_label : Label = $"Label3"

func get_player_speed() -> float:
	return player_speed


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	print("player 2dtriggered the switch")
	get_tree().change_scene_to_file("res://level_2.tscn")
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("swim"):
		print("F button was clicked")
		label.visible = false
		rect.visible = false
	if Input.is_action_just_pressed("toggle"):
		toggle_label.visible = !toggle_label.visible
