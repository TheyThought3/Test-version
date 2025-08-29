extends RigidBody2D

func _ready():
	# Set the initial velocity. The body will maintain this speed until acted upon by a force.
	linear_velocity = Vector2(0, -45)
