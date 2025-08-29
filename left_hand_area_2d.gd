extends Area2D

var handspeed = 200
var direction = 1
var camera : Camera2D
signal hand_touched(body: Node)

func _ready():
	randomize()
	_set_random_direction_loop()
	self.body_entered.connect(_on_body_entered)

func _process(delta):
	position.y += direction * handspeed * delta

func _on_body_entered(body: Node) -> void:
	print("touched", body.name)
	emit_signal("hand_touched", body)

# This is the corrected line.
func _set_random_direction_loop() -> void:
	await get_tree().create_timer(0.1).timeout
	var randomvar = randf_range(0.2, 1)
	while true:
		if position.y > 85:
			direction = -1
		elif position.y < -85:
			direction = 1
		elif randf() > 0.5:
			direction = 1
		else:
			direction = -1
		
		await get_tree().create_timer(randomvar).timeout
