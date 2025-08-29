extends AnimatedSprite2D
var timer = 0.0
var current_anim_is_left = true

func _process(delta: float) -> void:
	timer += delta
	if timer >= 0.3:
		if current_anim_is_left:
			play("right")
			current_anim_is_left = false
		else:
			play("left")
			current_anim_is_left = true
		timer = 0.0
