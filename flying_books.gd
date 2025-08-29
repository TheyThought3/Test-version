extends Area2D

signal point_scored

var has_scored = false
var speed = 120

func _process(delta):
	position.x += speed * delta
	
	if position.x > 145:
		if not visible:
			emit_signal("point_scored")
			has_scored = true
		visible = true
		position.x = -145
		has_scored = false
