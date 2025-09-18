extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


@onready var toggle_label : Label = $"Label2"
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle"):
		toggle_label.visible = !toggle_label.visible


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://level_13.tscn")
