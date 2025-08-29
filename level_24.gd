extends Node2D
@onready var ball : RigidBody2D = $golfball
@export var player_speed: float = 300.0
var current_ball_speed: float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hole_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if current_ball_speed <350:
		visible = false
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://level_25.tscn")


#add a blue filler background


func _on_golfball_speed_changed(new_speed: Variant) -> void:
	print("Ball's speed: ", new_speed)
	current_ball_speed = float(new_speed)
