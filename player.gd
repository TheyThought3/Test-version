extends CharacterBody2D

var speed: float = 0
var main_node: Node2D = null

@export var speed_multiplier: float = 1.0
@export var acceleration_factor: float = 4.0
@export var friction_factor: float = 3.0

var main_speed: float = 0.0
var acceleration: float = 0.0
var friction: float = 0.0

var input_direction: Vector2 = Vector2.ZERO
var facing_direction: Vector2 = Vector2.DOWN
var is_moving: bool = false
var current_state: String = "down_idle"

func _ready() -> void:
	# Walk up to find parent with player_speed
	var node = get_parent()
	while node != null:
		if node.has_method("get_player_speed") or node.has_variable("player_speed"):
			main_node = node
			break
		node = node.get_parent()

	if main_node == null:
		push_error("⚠️ No main node with player_speed found for player: %s" % name)
	else:
		_update_speed()

func _process(delta: float) -> void:
	if main_node:
		_update_speed()

func _update_speed() -> void:
	if main_node.has_method("get_player_speed"):
		speed = main_node.get_player_speed()
	elif "player_speed" in main_node:
		speed = main_node.player_speed

	# Now update derived values
	main_speed = speed * speed_multiplier
	acceleration = acceleration_factor * speed
	friction = friction_factor * speed

func _physics_process(delta: float) -> void:
	# --- Input ---
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
		velocity = velocity.move_toward(input_direction * main_speed, acceleration * delta)
		facing_direction = input_direction
		is_moving = true
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		is_moving = false

	move_and_slide()
	update_state()

func update_state() -> void:
	var angle = facing_direction.angle()
	var direction_name := ""

	if angle >= -PI * 1/8 and angle < PI * 1/8:
		direction_name = "right"
	elif angle >= PI * 1/8 and angle < PI * 3/8:
		direction_name = "down_right"
	elif angle >= PI * 3/8 and angle < PI * 5/8:
		direction_name = "down"
	elif angle >= PI * 5/8 and angle < PI * 7/8:
		direction_name = "down_left"
	elif angle >= PI * 7/8 or angle < -PI * 7/8:
		direction_name = "left"
	elif angle >= -PI * 7/8 and angle < -PI * 5/8:
		direction_name = "up_left"
	elif angle >= -PI * 5/8 and angle < -PI * 3/8:
		direction_name = "up"
	elif angle >= -PI * 3/8 and angle < -PI * 1/8:
		direction_name = "up_right"

	var state_suffix = "walk" if is_moving else "idle"
	current_state = direction_name + "_" + state_suffix

	$Player_animations.play(current_state)
