extends Area2D

signal cookie_collected
@onready var byecookie: Sprite2D = $"Sprite2D"

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		cookie_collected.emit()
		queue_free()
