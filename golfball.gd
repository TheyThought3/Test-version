extends RigidBody2D

signal speed_changed(new_speed)
@export var shot_power := 2000.0
@export var ball_damp := 0.6
var doubleclickstopper = 0
@onready var line_2d: Line2D = $Line2D

var drag_start_position := Vector2.ZERO
var dragging := false

func _ready() -> void:
	linear_damp = ball_damp
	line_2d.clear_points()
	await get_tree().create_timer(0.5).timeout
	doubleclickstopper = 1


func _input(event: InputEvent) -> void:
	# We no longer need the `if linear_velocity.length() > 5.0:` check
	# because the player can now shoot while the ball is moving.
	if doubleclickstopper == 1:
		if event.is_action_pressed("left_click"):
			dragging = true
			drag_start_position = get_global_mouse_position()
				
		if event.is_action_released("left_click"):
			dragging = false
			var drag_end_position = get_global_mouse_position()
				
			var direction = (drag_end_position - drag_start_position).normalized()
			var distance = drag_start_position.distance_to(drag_end_position)
				
			apply_central_impulse(direction * distance * shot_power)
				
			line_2d.clear_points()
	else:
		pass

func _process(delta: float) -> void:
	var current_speed = linear_velocity.length()
	speed_changed.emit(current_speed)
	if dragging:
		line_2d.clear_points()
		line_2d.add_point(to_local(get_global_mouse_position()))
		line_2d.add_point(to_local(drag_start_position))
