extends Node2D


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
			
