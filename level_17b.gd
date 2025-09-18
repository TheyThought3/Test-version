extends Node2D
@onready var toggle_label : Label = $"Label"
@onready var label : Label = $Label4

func _on_go_on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		# Check if the left mouse button was pressed
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			get_tree().change_scene_to_file("res://level_8.tscn")


func _on_go_back_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		# Check if the left mouse button was pressed
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			label.visible = true
			await get_tree().create_timer(4.0).timeout
			get_tree().change_scene_to_file("res://level_8.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle"):
		toggle_label.visible = !toggle_label.visible
