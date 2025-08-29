extends Node2D

var selected_item_1 = null
var selected_item_2 = null
var matches_found = 0

func _ready():
	# Get all the Area2D nodes that need to be clickable.
	var items = get_tree().get_nodes_in_group("clickable_items")
	
	# Iterate through each item and connect its "clicked" signal to this script.
	for item in items:
		if item.has_signal("clicked"):
			item.connect("clicked", _on_item_clicked)
			# This print will confirm that each item's signal is connected.
			print("Connected signal from: ", item.name)

# The parameters here must match the ones emitted by your "clicked" signal.
# These are: item_type, item_id, and area_2d_node.
func _on_item_clicked(item_type, item_id, area_2d_node):
	if selected_item_1 == area_2d_node:
		print("--- Same item clicked twice. Selection reset. ---")
		selected_item_1 = null
		return
	
	if selected_item_1 == null:
		selected_item_1 = area_2d_node
		print("Selected first item: " + str(item_id))
	else:
		var id1 = selected_item_1.item_id
		var id2 = item_id
		
		if id1 == id2 and selected_item_1.item_type != item_type:
			print("--- Match found! ---")
			selected_item_1.hide()
			area_2d_node.hide()
			matches_found += 1
			
			if matches_found == 5:
				print("All pairs have been matched! You win!")
				await get_tree().create_timer(0.5).timeout
				get_tree().change_scene_to_file("res://level_29.tscn")
		else:
			print("--- No match. ---")
		
		
		selected_item_1 = null
