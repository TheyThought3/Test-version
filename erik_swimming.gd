extends RigidBody2D

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
var last_played_left = false

func _process(delta: float) -> void:
	# Check if the "swim" action was just pressed.
	if Input.is_action_just_pressed("swim"):
		var impulse_power = 1.0
		apply_central_impulse(Vector2.UP * impulse_power)
		
		if last_played_left:
			anim_sprite.play("right")
			last_played_left = false
		else:
			anim_sprite.play("left")
			last_played_left = true
