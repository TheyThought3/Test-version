extends Node2D

@onready var liquid: ColorRect = $Cup/Liquid
@onready var cup: ColorRect = $Cup
@export var player_speed: float = 300.0

func get_player_speed() -> float:
	return player_speed


# The final height you want the liquid to reach.
@export var final_height := 136.0

# The duration of the animation in seconds.
@export var fill_duration := 6.0

var liquid_tween: Tween = null

func _ready() -> void:
	# Set the initial size and position of the liquid.
	liquid.size.y = 0.0
	liquid.position.y = cup.size.y
	start_game_over_timer()
	# Call the function to start the animation automatically.
	start_fill()

func start_fill():
	if liquid_tween:
		liquid_tween.kill()

	# Create a new tween.
	liquid_tween = create_tween()
	
	# Set the pivot_offset to the bottom of the liquid.
	# This makes the liquid scale upwards instead of downwards.
	liquid.pivot_offset.y = liquid.size.y
	
	# Animate the liquid's height. It will now grow upwards from the pivot.
	liquid_tween.tween_property(liquid, "size:y", final_height, fill_duration)
func stop_fill():
	if liquid_tween:
		liquid_tween.kill()
		print("Fill stopped.")


@onready var game_over_label: Label = $GameOver

# This is the path to the scene you want to load.
# You can change this path in the Godot editor or here in the code.
@export var redo: String = "res://level_29.tscn"

# This function starts the timer and handles all the logic.
func start_game_over_timer() -> void:
	# Print a message to confirm the timer has started.
	print("Game over timer started for 7 seconds.")
	
	# Create a one-shot timer and wait for it to finish.
	await get_tree().create_timer(fill_duration).timeout
	
	# After the 7 seconds have passed, execute the following code.
	print("Timer finished. Changing scene.")
	
	# 1. Stop the game. This pauses all physics, animations, and scripts.
	get_tree().paused = true
	
	# 2. Make the game over label visible.
	if game_over_label:
		game_over_label.visible = true
	await get_tree().create_timer(1.0).timeout
	get_tree().paused = false

	# 3. Load the next scene.
	get_tree().change_scene_to_file(redo)



func _on_finish_line_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(0.8).timeout
	get_tree().change_scene_to_file("res://level_30.tscn")
