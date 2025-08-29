extends Node2D
@onready var check1: Sprite2D = $Check
@onready var check2: Sprite2D = $Check2
@onready var check3: Sprite2D = $Check3
@onready var check4: Sprite2D = $Check4
var checker = 0
var checker1 = 0
var checker2 = 0
var checker3 = 0
var checker4 = 0

@export var player_speed: float = 150.0

func get_player_speed() -> float:
	return player_speed


func _on_box_1_body_entered(body: Node2D) -> void:
	check1.visible = true
	if checker1 < 1:
		checker+=1
		checker1 = 1

func _on_box_2_body_entered(body: Node2D) -> void:
	check2.visible = true
	if checker2 < 1:
		checker+=1
		checker2 = 1
	

func _on_box_4_body_entered(body: Node2D) -> void:
	check4.visible = true
	if checker4 < 1:
		checker+=1
		checker4 = 1

func _process(delta: float) -> void:
	if checker > 3:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://level_31.tscn")


func _on_box_3_body_entered(body: Node2D) -> void:
	check3.visible = true
	if checker3 < 1:
		checker+=1
		checker3 = 1
	
