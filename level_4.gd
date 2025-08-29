extends Node2D
@export var player_speed: float = 50.0

func get_player_speed() -> float:
	return player_speed

var password: String = "6136186367"
var input: String = ""
var input_locked: bool = false

@onready var label = $Label
@onready var buttons := [
	$Button1,
	$Button2,
	$Button3,
	$Button4,
	$Button5,
	$Button6,
	$Button7,
	$Button8,
	$Button9,
	$Button0,
]

@onready var backspace_button = $BackspaceButton

func _ready():
	for i in buttons.size():
		buttons[i].pressed.connect(_on_button_pressed.bind(str(i + 1)))
	
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
	
	if input.length() == 10:
		input_locked = true
		if input == password:
			$Label.text = "Access Granted!"
			await get_tree().create_timer(1.0).timeout
			get_tree().change_scene_to_file("res://level_5.tscn")
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
