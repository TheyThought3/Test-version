extends Node2D

@onready var toggle_label : Label = $"Label"

func _on_area_2_dyes_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		# Check if the left mouse button was pressed
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Area2D was clicked!")
			get_tree().change_scene_to_file("res://level_16b.tscn")
			



func _on_area_2_dno_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		# Check if the left mouse button was pressed
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Area2D was clicked!")
			get_node("Lore(star)").visible = true
			

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle"):
		toggle_label.visible = !toggle_label.visible
