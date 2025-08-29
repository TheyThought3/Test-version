extends Node2D

func _process(delta):
	# Get the parent's (the Node2D's) global rotation
	var parent_rotation = get_parent().global_rotation
	
	# Counteract the parent's rotation to keep the sprite upright
	rotation = -parent_rotation
