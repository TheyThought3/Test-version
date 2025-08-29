extends Node2D

@onready var move_on : Area2D = $"moveoner"
@onready var instLabel : Label = $"instructions"
var cookies_collected: int = 0
var total_cookies: int = 0

func _ready():
	# Count the total number of cookies at the start of the scene
	total_cookies = get_tree().get_nodes_in_group("cookies").size()
	
	# Connect the signal from each cookie in the scene
	for cookie in get_tree().get_nodes_in_group("cookies"):
		cookie.cookie_collected.connect(self._on_cookie_collected)
		
	print("Total cookies in scene: ", total_cookies)
	
	
func _on_cookie_collected():
	cookies_collected += 1
	print("Cookies collected: ", cookies_collected)
	if cookies_collected > 14:
		move_on.visible = true
		instLabel.visible = true


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().change_scene_to_file("res://level_22.tscn")
