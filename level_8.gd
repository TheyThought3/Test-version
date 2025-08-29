extends Node2D
@export var player_speed: float = 300.0

func get_player_speed() -> float:
	return player_speed

var password: String = "canijusttellpeoplewearedating"
var input: String = ""
var input_locked: bool = false

@onready var label = $Label
@onready var buttons := [
	$Button_A,
	$Button_C,
	$Button_D,
	$Button_E,
	$Button_G,
	$Button_I,
	$Button_R,
	$Button_P,
	$Button_O,
	$Button_N,
	$Button_L,
	$Button_J,
	$Button_S,
	$Button_T,
	$Button_U,
	$Button_W,
	
	
]

@onready var backspace_button = $Button_backspace

func _ready():
	for b in buttons:
		var letter = b.name.replace("Button_", "").to_lower()
		b.pressed.connect(_on_button_pressed.bind(letter))
	
	backspace_button.pressed.connect(_on_backspace_pressed)

func _wait_until_input_length(target_length: int) -> void:
	while input.length() < target_length:
		await get_tree().process_frame 

func _on_button_pressed(number: String):
	if input_locked:
		return
	
	input += number
	$Label.text = input
	print("Input so far:", input)
	
	if input.length() == 29:
		input_locked = true
		if input == password:
			$Label.text = "Access Granted!"
			await get_tree().create_timer(1.0).timeout
			get_tree().change_scene_to_file("res://level_9_redo.tscn")
		else:
			$Label.text = "Wrong Code!"
			await get_tree().create_timer(1.0).timeout
			input = ""
			$Label.text = ""
			input_locked = false

func _on_backspace_pressed():
	if input_locked:
		return
	
	if input.length() > 0:
		input = input.left(input.length() - 1)
		$Label.text = input
