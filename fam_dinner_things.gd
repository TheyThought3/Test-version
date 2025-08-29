extends Area2D

var timer_check = 0
@export var reveal_texture: Texture2D
@export var starting_texture: Texture2D
@onready var reveal_sprite: Sprite2D = $"eatenSprite"
@onready var fullPlate: Sprite2D = $"fullSprite"

signal eaten
signal early

var eatcounter = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reveal_sprite.texture = reveal_texture
	reveal_sprite.visible = false
	fullPlate.texture = starting_texture
	fullPlate.visible = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		if timer_check < 1:
			emit_signal("early")
		else:
			fullPlate.visible = false
			reveal_sprite.visible = true
			emit_signal("eaten")
	


func _on_timer_timeout() -> void:
	timer_check = 1
