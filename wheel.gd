extends Sprite2D

@export var rotation_speed: float = 0.4
var rotating: bool = false

func _process(delta):
	if Input.is_action_just_pressed("rotate"):
		rotating = !rotating
	if rotating:
		rotation += rotation_speed * delta
