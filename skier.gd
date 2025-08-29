extends CharacterBody2D

# Movement and Physics Constants
@export var movement_speed: float = 300.0
@export var rotation_speed: float = 2.0
@export var rotation_smoothing: float = 5.0

# Gravity Variables
@export var initial_gravity: float = 2000.0
@export var weak_gravity: float = 150.0
var current_gravity: float = 0.0

# Position for gravity change
@export var gravity_change_x_position: float = -200.0

# References to child nodes
@onready var ray_cast = $RayCast2D

var player_rotation_input: float = 0.0

func _ready():
	current_gravity = initial_gravity

func _physics_process(delta: float):
	# Change gravity based on x-position
	if global_position.x > gravity_change_x_position:
		current_gravity = weak_gravity
	else:
		current_gravity = initial_gravity

	# Apply Gravity
	velocity.y += current_gravity * delta
	
	# --- The Fix: Add constant horizontal velocity ---
	# This line ensures the character always moves forward regardless of the slope.
	velocity.x = movement_speed

	# Get player input for left and right rotation
	player_rotation_input = Input.get_axis("rotate_left", "rotate_right")

	# --- Core Change: Calculate Vertical Velocity from Slope Angle ---
	# This block now only adjusts the vertical velocity and rotation
	if ray_cast.is_colliding():
		var floor_normal = ray_cast.get_collision_normal()
		
		# Ensure the normal points up
		if floor_normal.y < 0:
			floor_normal = -floor_normal

		# Apply a downward force perpendicular to the slope to "stick" the character to it
		velocity.y = floor_normal.y * -movement_speed * 1.5

		# The base target is the slope's angle
		var target_rotation = floor_normal.angle() - (PI / 2)
		
		# Smoothly interpolate the rotation to match the slope
		rotation = lerp_angle(rotation, target_rotation, rotation_smoothing * delta)
	else:
		# If in the air, the character rotates based on player input only
		rotation += player_rotation_input * rotation_speed * delta

	move_and_slide()
