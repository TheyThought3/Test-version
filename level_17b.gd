extends Node2D


func _on_go_on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	get_tree().change_scene_to_file("res://level_18.tscn")


func _on_go_back_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	get_tree().change_scene_to_file("res://level_17.tscn")
