extends Node2D
@export var player_speed: float = 50.0

func get_player_speed() -> float:
	return player_speed

func _ready():
	$leftHandArea2D.hand_touched.connect(_on_hand_touched)

func _on_hand_touched(body: Node):
	if body.name == "RIGHT HAND":
		print("the hand was touched")
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://level_4.tscn")
