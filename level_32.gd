extends Node2D
@onready var image1a : Sprite2D = $Im
@onready var image1b : Sprite2D = $Im2
@onready var image2  : Sprite2D = $Mom1
@onready var image3  : Sprite2D = $Mom2
@onready var image4  : Sprite2D = $Mom3
@onready var image5  : Sprite2D = $Mom4
@onready var image6  : Sprite2D = $Errrr
@onready var image7  : Sprite2D = $Errrr___
@onready var image8  : Sprite2D = $Kim

var click_counter = 1

@onready var label : Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		if click_counter == 1:
			label.visible = false
			image1b.visible =false
		if click_counter ==2:
			image2.visible = true
		if click_counter ==3:
			image3.visible = true
		if click_counter ==4:
			image4.visible = true
		if click_counter ==5:
			image5.visible = true
		if click_counter ==6:
			image6.visible = true
		if click_counter ==7:
			image7.visible = true
		if click_counter ==8:
			image8.visible = true
		if click_counter == 9:
			get_tree().change_scene_to_file("res://level_33.tscn")


		click_counter += 1
