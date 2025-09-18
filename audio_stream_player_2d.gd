extends AudioStreamPlayer2D

# An array is a great way to handle a sequence of songs.
# You can add as many as you want without adding more 'const' variables.
var playlist = [
	preload("res://Assets/mp3 for banger of a year/Burn from HAMILTON.mp3"),
	preload("res://Assets/mp3 for banger of a year/Calum Scott - Dancing On My Own (Official Video).mp3"),
	preload("res://Assets/mp3 for banger of a year/Ed Sheeran - The A Team [Official Music Video].mp3"),
	preload("res://Assets/mp3 for banger of a year/Rise Above 2.mp3"),
	preload("res://Assets/mp3 for banger of a year/Elephant Love Medley.mp3"),
	preload("res://Assets/mp3 for banger of a year/Snow Patrol - Chasing Cars (Official Video).mp3"),
	preload("res://Assets/mp3 for banger of a year/The Call.mp3"),
	preload("res://Assets/mp3 for banger of a year/Ben Platt - Older [Official Video].mp3"),
	preload("res://Assets/mp3 for banger of a year/Billie Eilish - What Was I Made For (Official Music Video).mp3"),
	preload("res://Assets/mp3 for banger of a year/Dan Stevens - Evermore (From Beauty and the Beast).mp3"),
	preload("res://Assets/mp3 for banger of a year/Ed Sheeran - Lego House [Official Music Video].mp3"),
	preload("res://Assets/mp3 for banger of a year/Who I'd Be (Brian d'Arcy James)  Shrek The Musical  TUNE.mp3"),
	preload("res://Assets/mp3 for banger of a year/John Williams Schindler´s List Theme - Itzhak Perlman.mp3")
	
	]

var current_song_index = 0

# The '_ready' function is a good place to start things,
# as it runs only once when the node is added to the scene.
func _ready():
	# Connect the 'finished' signal to a function that will play the next song.
	self.finished.connect(play_next_song)
	
	# Start the first song!
	play_current_song()

# A dedicated function to play the song at the current index.
func play_current_song():
	if current_song_index < playlist.size():
		self.stream = playlist[current_song_index]
		self.play()
	else:
		# This handles the end of the playlist.
		print("Playlist finished!")
		current_song_index = 0 # Optional: loop the playlist

# This function is called automatically when the previous song finishes.
func play_next_song():
	# Increment the index to move to the next song in the playlist.
	current_song_index += 1
	# Call the function to play the new song.
	play_current_song()
