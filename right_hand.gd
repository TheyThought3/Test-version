extends CharacterBody2D
var control_speed: float = 50
@export var speed: float = control_speed
@export var acceleration: float = 4 * control_speed
@export var friction: float = 3 * control_speed

var input_direction: Vector2 = Vector2.ZERO
var facing_direction: Vector2 = Vector2.DOWN  # Default facing down
var is_moving: bool = false
var current_state: String = "down_idle"

func _physics_process(delta: float) -> void:
	# --- Handle Input ---
	input_direction = Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		input_direction.y -= 1
	if Input.is_action_pressed("move_down"):
		input_direction.y += 1
	if Input.is_action_pressed("move_left"):
		input_direction.x -= 1
	if Input.is_action_pressed("move_right"):
		input_direction.x += 1

	input_direction = input_direction.normalized()

	# --- Smooth Movement ---
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * speed, acceleration * delta)
		facing_direction = input_direction
		is_moving = true
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		is_moving = false

	move_and_slide()
