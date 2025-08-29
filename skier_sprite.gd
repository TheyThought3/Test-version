extends Sprite2D

func _process(delta):
	var parent = get_parent()
	
	# Check if the parent is a CharacterBody2D and if it's on a floor
	if parent is CharacterBody2D and parent.is_on_floor():
		var floor_normal = parent.get_floor_normal()
		
		# Ensure the normal is always pointing up to prevent flipping
		if floor_normal.y < 0:
			floor_normal = -floor_normal

		# Calculate the target rotation from the floor normal and smoothly set it
		var target_rotation = floor_normal.angle() - (PI / 2)
		rotation = lerp_angle(rotation, target_rotation, 5.0 * delta)
	else:
		# If not on a floor (e.g., in the air), handle player rotation
		var input_direction = Input.get_axis("rotate_left", "rotate_right")
		rotation += input_direction * 2.0 * delta
