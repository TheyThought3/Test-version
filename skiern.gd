extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
const ROTATION_SPEED = 6.0 # Adjust this value to change how fast it rotates
var has_jumped = false
var has_straightened_out = false
var starting_position: Vector2

func _ready():
	starting_position = global_position # Saves the character's initial position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if global_position.x > 80 and not has_jumped:
		velocity.y = JUMP_VELOCITY
		has_jumped = true

	# Straighten out the character after it lands
	if is_on_floor() and has_jumped and not has_straightened_out:
		rotation = 0.0
		has_straightened_out = true

	# Get the input direction for rotation.
	var rotation_direction = Input.get_axis("rotate_left", "rotate_right")
	
	# Apply rotation directly without smoothing.
	rotation += rotation_direction * ROTATION_SPEED * delta

	# Set horizontal velocity to a constant value for automatic rightward movement.
	velocity.x = SPEED

	move_and_slide()


func _on_reset_pressed() -> void:

	global_position = starting_position  # Move the character back to its start
	
	# You may need to reset other variables to their initial state, such as:
	velocity = Vector2.ZERO  # Stop all movement
	has_jumped = false
	has_straightened_out = false
	# Add any other variables you need to reset here
