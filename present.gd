extends Area2D

@export var reveal_texture: Texture2D
@export var pair_name: String   # Example: "apple", "banana", etc.

@onready var anim_sprite: AnimatedSprite2D = $present
@onready var reveal_sprite: Sprite2D = $"sprite2dpresent"

var is_matched: bool = false
var is_flipped: bool = false
var game_manager: Node = null


func _ready():
	reveal_sprite.texture = reveal_texture
	reveal_sprite.visible = false

	# Walk up the tree to find GameManager (your "level_9Redo" node)
	var node = get_parent()
	while node != null:
		if node.has_method("flip_egg"): # GameManager will have this function
			game_manager = node
			break
		node = node.get_parent()

	if game_manager == null:
		push_error("⚠️ GameManager not found for egg: %s" % name)
	if game_manager:
		print("Egg", name, "found manager:", game_manager.name)
	else:
		print("Egg", name, "did NOT find a manager!")


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Egg clicked:", name)  # DEBUG
		if is_matched or is_flipped:
			return # already matched or flipped
		game_manager.flip_egg(self)


func flip_up():
	is_flipped = true
	anim_sprite.play("broken")
	reveal_sprite.visible = true


func flip_down():
	is_flipped = false
	anim_sprite.play("default")
	reveal_sprite.visible = false


func set_matched():
	is_matched = true
