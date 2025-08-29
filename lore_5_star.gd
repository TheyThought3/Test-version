extends Area2D

var fall_speed: float = 200.0

func set_fall_speed(speed: float):
	fall_speed = speed

func _process(delta):
	position.y += fall_speed * delta

	# Remove shape if it goes off screen
	if position.y > ProjectSettings.get_setting("display/window/size/height") + 50:
		queue_free()
