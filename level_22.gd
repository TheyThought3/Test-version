extends Node2D
@onready var jump1 = $Jump1
@onready var jump2 = $Jump2
@onready var jump3 = $Jump3
@onready var jump1cs1 = $Jump1/Jump1cs2d
@onready var jump2cs1 = $Jump2/Jump2cs2d
@onready var jump2cs2 = $Jump2/Jump2cs2d2
@onready var jump3cs1 = $Jump3/Jump3cs2d
@onready var jump3cs2 = $Jump3/Jump3cs2d2
@onready var ava = $"skiern/skier sprite"
@onready var erik = $"skiern/skier sprite2"
var costumechecker = 0

func _ready() -> void:
	jump1.visible = false
	jump2.visible = false
	jump3.visible = false
	jump1cs1.disabled = true
	jump2cs1.disabled = true
	jump2cs2.disabled = true
	jump3cs1.disabled = true
	jump3cs2.disabled = true

func _on_jump_1_but_pressed() -> void:
	jump1.visible = true
	jump2.visible = false
	jump3.visible = false
	jump1cs1.disabled = false
	jump2cs1.disabled = true
	jump2cs2.disabled = true
	jump3cs1.disabled = true
	jump3cs2.disabled = true
	
func _on_jump_2_but_pressed() -> void:
	jump1.visible = false
	jump2.visible = true
	jump3.visible = false
	jump1cs1.disabled = true
	jump2cs1.disabled = false
	jump2cs2.disabled = false
	jump3cs1.disabled = true
	jump3cs2.disabled = true
func _on_jump_3_but_pressed() -> void:
	jump1.visible = false
	jump2.visible = false
	jump3.visible = true
	jump1cs1.disabled = true
	jump2cs1.disabled = true
	jump2cs2.disabled = true
	jump3cs1.disabled = false
	jump3cs2.disabled = false


func _on_switch_pressed() -> void:
	if costumechecker < 1:
		erik.visible = true
		ava.visible = false
		costumechecker = 1
	else:
		erik.visible = false
		ava.visible = true
		costumechecker = 0


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://level_23.tscn")
