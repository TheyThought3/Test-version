extends Node2D

@onready var warning: Label = $tsk
@onready var timer: Timer = $mtimer
@onready var toggle: Sprite2D = $Awake
@onready var fail: Label = $fail
@onready var pointc: Label = $points # points label
var points = 0
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	timer.wait_time = rng.randf_range(1.0, 5.0)
	timer.start()
	update_points_display()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		if toggle.visible:
			warning.visible = true
			fail.visible = true
			await get_tree().create_timer(2.5).timeout
			get_tree().change_scene_to_file("res://level_25.tscn")
		else:
			points += 1
			update_points_display()
			toggle.visible = true
			if points > 20:
				get_tree().change_scene_to_file("res://level_26.tscn")

func _on_timer_timeout():
	if toggle.visible:
		toggle.visible = false
		var new_random_time = rng.randf_range(0.4, 2.0)
		print("New random time: ", new_random_time)
		timer.wait_time = new_random_time
	else:
		# This is where the player failed to click in time.
		fail.visible = true
		await get_tree().create_timer(2.5).timeout
		get_tree().change_scene_to_file("res://level_25.tcsn")


func update_points_display():
	pointc.text = str(points) + "/20"
