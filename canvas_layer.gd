extends CanvasLayer


@onready var password_field: LineEdit = $LineEdit
@onready var submit_button: Button = $Button
@onready var message_label: Label = $Label

var correct_password = "(4,-5)" # Set your correct password here

func _ready():
	# Connect the button's "pressed" signal to a function
	submit_button.pressed.connect(_on_submit_button_pressed)

func _on_submit_button_pressed():
	var entered_password = password_field.text
	
	# Check if the entered password matches the correct one
	if entered_password == correct_password:
		print("Correct awnser! Access granted.")
		message_label.text = "Access Granted!"
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://level_20.tscn")
		# Add code here to proceed to the next part of the game.
	else:
		print("Incorrect awnser. Try again.")
		message_label.text = "Incorrect Password."
		password_field.clear() # Clear the field for the next attempt
