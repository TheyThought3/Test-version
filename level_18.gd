extends Node2D

@export var player_speed: float = 300.0

func get_player_speed() -> float:
	return player_speed

var flipped_eggs: Array = []
var matched_count: int = 0
@export var total_pairs: int = 4   # you can update this depending on your level size


func flip_egg(egg: Area2D) -> void:
	if flipped_eggs.size() >= 2:
		return # ignore clicks while two are already flipped

	egg.flip_up()
	flipped_eggs.append(egg)
	print("Flipped eggs now:", flipped_eggs)

	if flipped_eggs.size() == 2:
		_check_match()


func _check_match():
	var egg1 = flipped_eggs[0]
	var egg2 = flipped_eggs[1]

	# Derive the "pair name" from the node name
	# Example: "egg_car1" -> "car"
	var pair1 = _get_pair_name(egg1.name)
	var pair2 = _get_pair_name(egg2.name)

	print("Checking match:", egg1.name, "=>", pair1, "vs", egg2.name, "=>", pair2)

	if pair1 == pair2:
		print("✅ Match found:", pair1)
		egg1.set_matched()
		egg2.set_matched()
		matched_count += 1
		flipped_eggs.clear()

		if matched_count == total_pairs:
			print("🎉 All pairs matched!")
			get_tree().change_scene_to_file("res://level_19.tscn")
	else:
		print("❌ Not a match, flipping back")
		await get_tree().create_timer(0.7).timeout
		egg1.flip_down()
		egg2.flip_down()
		flipped_eggs.clear()


func _get_pair_name(node_name: String) -> String:
	# Expecting names like "egg_car1"
	# -> split("_") gives ["egg", "car1"]
	# -> strip the number at the end
	var parts = node_name.split("_")
	if parts.size() > 1:
		var raw = parts[1] # e.g. "car1"
		# remove last character (assuming it’s the "1" or "2")
		return raw.substr(0, raw.length() - 1)
	return node_name
