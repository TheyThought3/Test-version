extends Node2D

var eaten_count = 0
@onready var label: Label = $"grace timer"
@onready var talk: Label = $"talking"
@onready var timer: Timer = $Timer
@onready var grace: Sprite2D = $Img7015
var timer_check = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if eaten_count > 3:
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file("res://level_27.tscn")
	label.text = str(round(timer.time_left))
	if timer.time_left < 0.5:
		label.visible = false
		grace.visible = true
	
	
	
func _on_fam_dinner_things_eaten() -> void:
	eaten_count += 1
	print("Plates eaten: ", eaten_count)

func _on_fam_dinner_things_2_eaten() -> void:
	eaten_count += 1
	print("Plates eaten: ", eaten_count)

func _on_fam_dinner_things_3_eaten() -> void:
	eaten_count += 1
	print("Plates eaten: ", eaten_count)

func _on_fam_dinner_things_4_eaten() -> void:
	eaten_count += 1
	print("Plates eaten: ", eaten_count)
	



func _on_fam_dinner_things_early() -> void:
	talk.text = "too early wait for grace"
	


func _on_fam_dinner_things_2_early() -> void:
	talk.text = "too early wait for grace"


func _on_fam_dinner_things_3_early() -> void:
	talk.text = "too early wait for grace"


func _on_fam_dinner_things_4_early() -> void:
	talk.text = "too early wait for grace"
