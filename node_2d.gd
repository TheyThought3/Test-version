extends Node2D

var song_counter = 0

const song_1 = preload("res://Assets/mp3 for banger of a year/Burn from HAMILTON.mp3")

func _process(delta: float) -> void:
	if song_counter == 0:
		play_music_1()

func _play_music_1(music: Audiostream,)

#play the first song
#set timer for the second
# repeat repeat repeat
