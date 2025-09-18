extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var toggle_label : Label = $"Label"
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle"):
		toggle_label.visible = !toggle_label.visible
