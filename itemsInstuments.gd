extends Area2D

@export var item_id: int
@export var item_type: String

signal clicked(item_type, item_id, area_2d_node)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# This print confirms the function is running.

	
	if event.is_action_pressed("left_click"):
		# This print confirms the click was detected and the signal will be emitted.
		print("Emitting 'clicked' signal from: ", self.name)
		clicked.emit(item_type, item_id, self)
