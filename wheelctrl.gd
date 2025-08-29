extends Node2D

@export var rotation_speed: float = 1.0  # radians/sec
var rotating: bool = false

func _process(delta):
	if Input.is_action_just_pressed("rotate"):
		rotating = !rotating

	if rotating:
		var cars_container = get_node("CarsContainer")
		for car_point in cars_container.get_children():
			if car_point is Node2D:
				# Rotate pivot around wheel center
				car_point.rotation += rotation_speed * delta

				# Keep the car sprite upright
				for child in car_point.get_children():
					if child is Sprite2D:
						child.rotation = 0
